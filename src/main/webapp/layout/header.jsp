<%@page import="data.dao.MemberDAO"%>
<%@page import="data.dto.MenuDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="inner">
	<a href="index.jsp" class="logo"></a>
	<%
		String sessionId = (String)session.getAttribute("sessionId");
		String sessionLogin = (String)session.getAttribute("sessionLogin");
		System.out.println(sessionId + "," + sessionLogin);
	%>
	<div class="menu-div">
		<a href="javascript:" class="menu-btn">
			<span></span>
			<span></span>
			<span></span>
		</a>
		<ul class="menu <%=sessionId.equals("admin")&&sessionLogin!=null?"admin":""%>">
			<%
				MenuDAO dao = new MenuDAO();
				List<MenuDTO> oneDepthList = dao.getAllOneDepth();
				
				if(sessionId == null || !sessionId.equals("admin") || sessionLogin == null){
					for(MenuDTO oneDto:oneDepthList) {
						String parent_idx = oneDto.getMenu_idx(); 
						List<MenuDTO> twoDepthList = dao.getTwoDepth(parent_idx);
						if(!oneDto.getMenu_name().equals("관리자") && !oneDto.getMenu_name().equals("로그인") && !oneDto.getMenu_name().equals("회원가입") && !oneDto.getMenu_name().equals("마이페이지")){
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
					}
				}else{
					for(MenuDTO oneDto:oneDepthList) {
						String parent_idx = oneDto.getMenu_idx(); 
						List<MenuDTO> twoDepthList = dao.getTwoDepth(parent_idx);
						if(!oneDto.getMenu_name().equals("로그인") && !oneDto.getMenu_name().equals("회원가입") && !oneDto.getMenu_name().equals("마이페이지")){
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
					}
				}
			%>
		</ul>
	</div>
	<% if(session.getAttribute("sessionLogin")==null){
	%>
		<div class="util">
			<a href="index.jsp?go=login/loginMain.jsp&menu_one=21">로그인</a>
			<a href="index.jsp?go=join/joinForm.jsp&menu_one=24">회원가입</a>
		</div>
	<%
	} else{
	%>
		<div class="util">
			<a href="login/logoutAction.jsp">로그아웃</a>
			<a href="index.jsp?go=login/loginMain.jsp&menu_one=21">마이페이지</a>
		</div>
	<%} %>
</div>