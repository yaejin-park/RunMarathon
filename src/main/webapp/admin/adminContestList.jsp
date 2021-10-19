<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
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
h2 {
	white-space: normal;
}

#nemo {
	width: 400px;
	height: 300px;
	border: 1px solid skyblue;
	display: inline-block;
	margin: 20px;
	padding: 20px 20px;
}

button {
	width: 200px;
}
</style>
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
/* 	List<AdminApplyDTO> list = dao.getContestName(); */
	
	//페이징
		int perPage=4;//한페이지에 보여질 글의 개수
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
		

		List<AdminApplyDTO> list =dao.getNotice2(start, perPage);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
		if(list.size()==0 && totalCount>0)
		{%>
		  <script type="text/javascript">
		  	location.href="index.jsp?go=admin/adminContestList.jsp?currentPage=<%=currentPage-1%>";
		  </script>
		<%}
		//각 페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;
%>
<p class="title">참가현황관리</p>
<div align="center" style="margin-top: 50px;">
<%	for(AdminApplyDTO adt:list) { %>
		<div id="nemo">
			<h2><%=adt.getContestName()%></h2><br>
			<p>대회 시작일자: <%=adt.getContestStart()%></p>
			<p>대회 종료일자: <%=adt.getContestEnd()%></p>
			<p>접수 시작일자: <%=adt.getApplyStart()%></p>
			<p>접수 마감일자: <%=adt.getApplyEnd()%></p>
			<p>접수비: <%=adt.getMoney()%></p><br>
			<button type="button" name="marathon" value="<%=adt.getContestName()%>" class="btn-add marathon">
			 참가 현황</button><br>
		</div>
<%  }  %>
</div>




<!-- 페이징 처리-->
<div style="width: 900px; text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1){
		%>
			<li><a href="index.jsp?go=admin/adminContestList.jsp?currentPage=<%=startPage-1%>">◀</a>
		<%
		}
		for(int pp = startPage; pp<=endPage; pp++){
			if(pp==currentPage){//만약에 현재페이지면 액티브를 주겠다.%>
				<li class="active"><a href="index.jsp?go=admin/adminContestList.jsp?&menu_one=13&menu_two=31&currentPage=<%=pp%>"><%=pp %></a></li>
			<%} else{
			%>
				<li><a href="index.jsp?go=admin/adminContestList.jsp?&menu_one=13&menu_two=31&currentPage=<%=pp%>"><%=pp %></a></li>
			<%}
		}
		//다음
		if(endPage<totalPage){
		%>
			<li><a href="index.jsp?go=admin/adminContestList.jsp?&menu_one=13&menu_two=31&currentPage=<%=endPage+1%>">▶</a>
		<%}
		%>
	</ul>
</div>

<script type="text/javascript">
	$("button.marathon").click(function(){
		var marathon=$(this).val();
		//alert(tname);
		location.href='./index.jsp?go=admin/adminSelectListMember.jsp&menu_one=13&menu_two=31&marathon='+marathon;
	});
</script>
</body>
</html>