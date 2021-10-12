<%@page import="data.dto.MenuDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="inner">
	<a href="index.jsp" class="logo"></a>
	<div class="menu-div">
		<a href="javascript:" class="menu-btn">
			<span></span>
			<span></span>
			<span></span>
		</a>
		<ul class="menu">
			<%
				MenuDAO dao = new MenuDAO();
				List<MenuDTO> oneDepthList = dao.getAllOneDepth();
				
				for(MenuDTO oneDto:oneDepthList) {
					String parent_idx = oneDto.getMenu_idx(); 
					List<MenuDTO> twoDepthList = dao.getTwoDepth(parent_idx);
				%>
					<li>
						<a href="javascript:" class="one-depth"><%= oneDto.getMenu_name() %></a>
						<ul class="two-depth">
							<%
								for(MenuDTO twoDto:twoDepthList){
							%>	
								<li><a href="index.jsp?go=<%= twoDto.getMenu_url() %>&menu_one=<%= twoDto.getParent_idx()%>&menu_two=<%=twoDto.getMenu_idx()%>"><%= twoDto.getMenu_name() %></a></li>
							<%
								}
							%>
						</ul>
					</li>
				<%}
			%>
		</ul>
	</div>
	<% if(session.getAttribute("sessionLogin")!="yes"){
	%>
		<div class="util">
			<a href="index.jsp?go=login/loginMain.jsp">로그인</a>
			<a href="index.jsp?go=join/joinForm.jsp">회원가입</a>
		</div>
	<%
	} else{
	%>
		<div class="util">
			<a href="index.jsp?go=login/loginMain.jsp">로그인 중</a>
			<a href="index.jsp?go=login/logoutAction.jsp">로그아웃</a>
		</div>
	<%} %>
</div>