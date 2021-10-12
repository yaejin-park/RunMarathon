<%@page import="data.dao.ReviewDAO"%>
<%@page import="data.dto.ReviewDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.search-div>* {
	vertical-align: top;
}

#selsearch {
	width: 100px;
	height: 30px;
}

#textSearch {
	width: 350px;
	height: 30px;
}

img.mainimg {
	width: 120px;
	height: 160px;
	border: 1px solid #aaa;
}

img.mainimg:hover {
	cursor: pointer;
	width: 200px;
	height: 270px;
	border: 5px solid orange;
}

table.maintd {
	width: 700px;
}

table.maintd tr {
	height: 180px;
}
</style>
<%
	ReviewDAO dao=new ReviewDAO();
	int perPage=12;//한페이지에 보여질 갯수
	int totalCount;//총갯수글
	int currentPage;//현재 페이지 번호
	int totalPage;//총 페이지 갯수
	int start;//각페이지에서 불러올 db의 시작번호
	int perBlock=5;//몇개의 페이지 번호씩 표현할것인가
	int startPage;//각블럭에 표시할 시작페이지
	int endPage;//각 블럭에 표시할 마지막 페이지
	
	//총 갯수
	totalCount=dao.getTotalCount();
	//현재페이지 번호 읽기 (단 null 일경우는 1페이지로 설정)
	if (request.getParameter("currentPage") == null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	//총 페이지 갯수 구하기
	totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	//각 블럭의 시작페이지
	startPage = (currentPage - 1) / perBlock * perBlock + 1;
	endPage = startPage + perBlock - 1;
	if (endPage > totalPage)
		endPage = totalPage;
	//각페이지에서 불러올 시작번호
	start = (currentPage - 1) * perPage;
	//각페이지에서 필요한 게시글 가져오기
	List<ReviewDTO> list = dao.getList(start, perPage);
	
	if (list.size() == 0 && totalCount>0) 
	{%>
<script type="text/javascript">
				location.href="reviewList.jsp?currentPage=<%=currentPage - 1%>";
	</script>
<%}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//각페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
	%>

<body>
	<table class="maintd">
	<tbody>
			<%
			if(totalCount==0)
			{%>
				<tr height="40">
					<td colspan="5" align="center">
						<b>등록된 게시글이 없습니다</b>
					</td>
				</tr>
			<%}else{
				for(int row=1;row<=4;row++)
				{%>
					<tr>
					<%for(ReviewDTO dto:list)
					{
					%>
						<td>
							<img src="<%=dto.getPhoto()%>" >
						</td>
					<%}%>
					</tr>
				<%}
			}
				%>
		</tbody>
	</table>
	<button type="button" class="btn btn-info"
	style="width: 130px;margin-left: 800px;"
	onclick="location.href=''">
	<span class="glyphicon glyphicon-pencil"></span>후기작성하기</button>

	<!-- 페이징 -->
	<div style="width: 900px; text-align: center;">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li><a href="communityList.jsp?currentPage=<%=startPage - 1%>">이전</a>
			</li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {
			if (pp == currentPage)//현재페이지일때  active
			{
			%>
			<li class="active"><a
				href="communityList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			} else {
			%>
			<li><a href="communityList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			}
			}

			//다음
			if (endPage < totalPage) {
			%>
			<li><a href="communityList.jsp?currentPage=<%=endPage + 1%>">다음</a>
			</li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>