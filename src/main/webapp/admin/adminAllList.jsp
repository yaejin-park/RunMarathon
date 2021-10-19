<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>

<style type="text/css">
.search_bar_top {
	display: inline-block;
}

th, td {
	font-size: 12pt;
}

button.btn-danger {
	font-size: 10pt;
}
</style>
</head>
<body>
	<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	int idx = 1;

    
	//페이징
	int perPage=5;//한페이지에 보여질 글의 개수
	int totalCount;//총 글의 수
	int totalPage;//총 페이지수
	int currentPage;//현재 페이지 번호
	int perBlock=3;//몇개의 페이지번호씩 표현할지
	int start;//각 페이지에서 불러올 db의 시작번호
	int startPage;//각 블럭에 표시할 시작페이지
	int endPage;//각 블럭에 표시할 마지막페이지
	
	//총 갯수
	totalCount=dao.getTotalCount();
	//현재 페이지 번호 읽기(단 null일 경우는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
	  currentPage=1;
	else
	  currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	
	//총 페이지 갯수 구하기
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	//각 블럭 시작페이지
	startPage=(currentPage-1)/perBlock*perBlock+1;
	//끝 페이지
	endPage=startPage+perBlock-1;
	if(endPage>totalPage)
	  endPage=totalPage;
	//각 페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage;
	//각 페이지에서 필요한 게시글 가져오기
	

	List<AdminApplyDTO> list2 =dao.getNotice(start, perPage);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
	if(list2.size()==0 && totalCount>0)
	{%>
	  <script type="text/javascript">
	  	location.href="index.jsp?go=admin/adminAllList.jsp?currentPage=<%=currentPage-1%>";
	  </script>
	<%}
	//각 페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>
<p class="title">회원정보관리</p>
<!-- 	<form class="serachform" action="adminMemberSearch.jsp">
		<div align="center" style="margin-top: 10px">
			<div class="search_bar_top">
				<select id="selopt" style="width: 100px; height: 30px">
					<option disabled="disabled" selected="selected">검색옵션</option>
					<option value="name">이름</option>
					<option value="nink">닉네임</option>
					<option value="id">아이디</option>
				</select>
			</div>
			<div class="search_bar_top">
				<input type="text" id="stext" style="width: 200px; height: 30px"
					class="form-control">
			</div>
			<div class="search_bar_top">
				<button type="submit" style="height: 30px">검색</button>
			</div>
		</div>
	</form> -->
	<div>
		<table class="table table-bordered">
		<colgroup>
			<col width="30">
			<col width="50">
			<col width="70">
			<col width="80">
			<col width="80">
			<col width="150">
			<col width="60">
			<col width="60">
			<col width="60">
		</colgroup>
			<thead>
				<tr>
					<th style="width:50px">번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>아이디</th>
					<th>핸드폰</th>
					<th>주소</th>
					<th>본인인증질문</th>
					<th>본인인증답변</th>
					<th>회원관리</th>
				</tr>
			</thead>
			<tbody>
				<%	for(AdminApplyDTO adt:list2) { %>
				<tr>
					<td><%=idx%></td>
					<td><%=adt.getName()%></td>
					<td><%=adt.getNick()%></td>
					<td><%=adt.getId()%></td>
					<td><%=adt.getHp()%></td>
					<td><%=adt.getAddr1()%> <%=adt.getAddr2()%></td>
					<td><%=adt.getAuth1()%></td>
					<td><%=adt.getAuth2()%></td>
					<td>
						<!-- <button type="button" class="btn btn-warning btn-sm">수정</button> -->
						<button type="button" class="btn btn-danger btn-sm btn-del" value="<%=adt.getId()%>">
						 삭제</button>
					</td>
				</tr>
				<% idx++; } %>
			</tbody>
		</table>
	</div>
	
	
	
<!-- 페이징 처리-->
<div style="width: 900px; text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1){
		%>
			<li><a href="index.jsp?go=admin/adminAllList.jsp?currentPage=<%=startPage-1%>">◀</a>
		<%
		}
		for(int pp = startPage; pp<=endPage; pp++){
			if(pp==currentPage){//만약에 현재페이지면 액티브를 주겠다.%>
				<li class="active"><a href="index.jsp?go=admin/adminAllList.jsp?&menu_one=13&menu_two=30&currentPage=<%=pp%>"><%=pp %></a></li>
			<%} else{
			%>
				<li><a href="index.jsp?go=admin/adminAllList.jsp?&menu_one=13&menu_two=30&currentPage=<%=pp%>"><%=pp %></a></li>
			<%}
		}
		//다음
		if(endPage<totalPage){
		%>
			<li><a href="index.jsp?go=admin/adminAllList.jsp?&menu_one=13&menu_two=30&currentPage=<%=endPage+1%>">▶</a>
		<%}
		%>
	</ul>
</div>
	

<script type="text/javascript">
$(function(){	
	$(".btn-del").click(function() {
		var id = $(this).val();
		alert("회원정보를 삭제합니다.");
		//location.href = "./index.jsp?go=admin/adminMemberDelete.jsp&delid="+id;
		location.href = "./index.jsp?go=admin/adminMemberDelete.jsp&menu_one=13&menu_two=30&delid="+id;
	});
});
</script>
</body>
</html>