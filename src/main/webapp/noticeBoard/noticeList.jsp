<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	NoticeDAO dao = new NoticeDAO();

	//페이징 처리에 필요한 변수 선언
	int perPage = 10; //한페이지에 보여질 글의 갯수
	int totalCount; //총 글의 수
	int currentPage; //현재 페이지 번호
	int totalPage; //총 페이지 수
	int start; //각 페이지에서 불러올 시작번호
	int perBlock = 5; //몇개의 페이지 번호씩 표시할 것인가
	int startPage; //각 블럭에 표시할 시작 페이지
	int endPage; //각 블럭에 표시할 마지막 페이지
	
	//총 데이터 갯수
	totalCount = dao.getTotalCount();
	
	//현재 페이지 번호 읽기.(null일 경우 1페이지로 설정)
	if(request.getParameter("currentPage")==null){
		currentPage = 1;
	} else{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//총 페이지 갯수 구하기
	totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);
	
	//각 블럭의 시작 페이지
	startPage = (currentPage-1)/perBlock * perBlock +1;
	endPage = startPage + perBlock - 1;
	if(endPage>totalPage){
		 endPage = totalPage;
	}
	
	//각 페이지에서 불러올 시작 번호
	start = (currentPage-1)*perPage;
	
	//각 페이지에서 필요한 게시글 가져오기
	List<NoticeDTO> list = dao.getList(start, perPage);
	
	//현재 페이지의 리스트가 더 이상 없을 경우(삭제해서) 이전 페이지로 이동한다
	if(list.size()==0 && totalCount>0){%>
	<script type="text/javascript">
			location.href = "index.jsp?go=noticeBoard/noticeList.jsp?currentPage=<%=currentPage-1%>";
	</script>
<%}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//각 페이지에 출력한 시작 번호
	int no = totalCount - (currentPage-1) * perPage;
%>

<!-- noticeList -->
<button type="button" class="btn btn-success"
	style="width: 100px; margin-top: 10px; margin-bottom: 10px;"
	onclick="location.href='index.jsp?go=noticeBoard/writeForm.jsp'">
	<span class="glyphicon glyphicon-pencil"></span>글추가
</button>
<table class="table table-bordered" style="width: 900px;">
	<caption>
		<b>공지사항</b>
	</caption>
	<tr bgcolor="#dda0dd">
		<th width="50px">번호</th>
		<th width="350px">제목</th>
		<th width="100px">작성자</th>
		<th width="150px">작성일</th>
		<th width="70px">조회</th>
	</tr>
	<%
		if(totalCount==0){%>
	<tr height="40">
		<td colspan="5" align="center"><b>등록된 글이 없습니다.</b></td>
	</tr>
	<%}else{
			for(NoticeDTO dto:list){%>
	<tr>
		<td align="center"><%=no-- %></td>
		<td>
			<a style="color: black"
				href="index.jsp?go=noticeBoard/detail.jsp?idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>&key=list">
					<%=dto.getSubject() %>
			</a>
		</td>
		<td><%=dto.getWriter() %></td>
		<td><%=sdf.format(dto.getWriteDay()) %></td>
		<td><%=dto.getReadCount() %></td>
	</tr>
	<%}
		}
		%>
</table>
<!-- 페이징 처리-->
<div style="width: 900px; text-align: center;">
	<ul class="pagination">
		<%
				//이전
				if(startPage>1){%>
		<li><a
			href="index.jsp?go=noticeBoard/noticeList.jsp?currentPage=<%=startPage-1%>">◀</a>
			<%}
			
					for(int pp = startPage; pp<=endPage; pp++){
					if(pp==currentPage){//만약에 현재페이지면 액티브를 주겠다.%>
		<li class="active"><a
			href="index.jsp?go=noticeBoard/noticeList.jsp?currentPage=<%=pp%>"><%=pp %></a></li>
		<%} else{%>
		<li><a
			href="index.jsp?go=noticeBoard/noticeList.jsp?currentPage=<%=pp%>"><%=pp %></a></li>
		<%}
				}
				
				//다음
				if(endPage<totalPage){%>
		<li><a
			href="index.jsp?go=noticeBoard/noticeList.jsp?currentPage=<%=endPage+1%>">▶</a>
			<%}
			%>
	</ul>
</div>
