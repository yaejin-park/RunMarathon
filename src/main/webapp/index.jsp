<%@page import="java.util.List"%>
<%@page import="data.dto.MenuDTO"%>
<%@page import="data.dao.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String goPage = "layout/main.jsp";
   String menu_pt = request.getParameter("menu_one");
   String menu_idx = request.getParameter("menu_two");
   MenuDAO dao = new MenuDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% if(request.getParameter("go") != null){ %>
	<title><%=dao.getOneDepth(menu_pt)%> | <%=dao.getTwoDepth(menu_idx)%></title>
<% }else{%>
	<title>Run&Fun 2021</title>
<%}%>
<link rel="icon" href="./common/image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./common/css/swiper.min.css">
<link rel="stylesheet" href="./common/css/common.css">
<script type="text/javascript" src="./common/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./common/js/gsap.min.js"></script>
<!-- Green Sock (모션) -->
<script type="text/javascript" src="./common/js/swiper.min.js"></script>
<!-- Swiper (롤링) -->
<script type="text/javascript" src="./common/js/script.js"></script>
<!-- Script (공통) -->
</head>
<%
   if(request.getParameter("go") != null){
      goPage = request.getParameter("go");
   }else{
%>
<script type="text/javascript" src="./common/js/main.js"></script>
<!-- Script (메인) -->
<%}%>
<body>
	<!-- wrap -->
	<div id="wrap">
		<header>
			<!-- header -->
			<jsp:include page="./layout/header.jsp"></jsp:include>
		</header>
		<!--// header -->
		<div id="cBody">
			<% if(request.getParameter("go") != null){ %>
			<div class="inner">
				<div class="sub-content">
					<div class="nav-area">
						<%
                        String oneDepth = dao.getOneDepth(menu_pt);
                     %>
						<p><%= oneDepth %></p>
						<div class="two-depth">
							<%
                           List<MenuDTO> twoDepthList = dao.getTwoDepthList(menu_pt);
                           for(MenuDTO twoD:twoDepthList){
                           %>
							<a
								href="index.jsp?go=<%= twoD.getMenu_url() %>&menu_one=<%= twoD.getParent_idx() %>&menu_two=<%= twoD.getMenu_idx() %>"
								class="<%= twoD.getMenu_idx().equals(menu_idx)?"active":""%>"><%= twoD.getMenu_name() %></a>
							<% }
                        %>
						</div>
					</div>
					<div class="content-area">
						<jsp:include page="<%= goPage %>"></jsp:include>
					</div>
				</div>
			</div>
			<% } else{ %>
			<jsp:include page="<%= goPage %>"></jsp:include>
			<% } %>
		</div>
		<footer>
			<jsp:include page="./layout/footer.jsp"></jsp:include>
		</footer>
	</div>
	<!--// wrap -->
</body>
</html>