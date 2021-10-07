<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./common/css/swiper.min.css">
<link rel="stylesheet" href="./common/css/common.css">
<script type="text/javascript" src="./common/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./common/js/gsap.min.js"></script><!-- Green Sock (모션) -->
<script type="text/javascript" src="./common/js/swiper.min.js"></script><!-- Swiper (롤링) -->
<script type="text/javascript" src="./common/js/script.js"></script><!-- Script (공통) -->
</head>
<%
	String goPage = "layout/main.jsp";
	
	if(request.getParameter("go") != null){
		goPage = request.getParameter("go");
	}
%>
<body>
	<!-- wrap -->
	<div id="wrap">
		<header><!-- header -->
			<jsp:include page="./layout/header.jsp"></jsp:include>
		</header><!--// header -->
		<div id="cBody">
			<% if(request.getParameter("go") != null){ %>
				<div class="inner">
					<div class="sub-content">
						<div class="nav-area">
							<p>one-depth 메뉴명</p>
							<div class="two-depth">
								<a href="javascript:">two-depth 메뉴명</a>
							</div>	
						</div>
						<div class="content-area">
							<jsp:include page="<%= goPage %>"></jsp:include>
						</div>
					</div>	
				</div>
			<% } else{%>
				<jsp:include page="<%= goPage %>"></jsp:include>
			<% } %>
		</div>
		<footer>
			<jsp:include page="./layout/footer.jsp"></jsp:include>
		</footer>
	</div><!--// wrap -->
</body>
</html>