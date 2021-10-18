<%@page import="java.util.List"%>
<%@page import="data.dto.GiftDTO"%>
<%@page import="data.dao.GiftDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.gift-area .img-div img {
	width:100%;
}
.gift-area .txt-div {
	width:50%;
	margin:20px auto 50px;
	text-align:center;
}
.gift-area .txt-div .txt1 {
	margin-bottom:20px;
	font-size:25px;
	font-weight:bold;
	color:#6a1c52;
}
.gift-area .txt-div .txt2 {
	font-size:16px;
}
</style>
<%
	GiftDAO dao = new GiftDAO();
	String name = dao.getNewGift().trim();
	List<GiftDTO> list = dao.getGiftList(name);
%>
<div class="gift-area">
	<p class="title">기념품</p>
	<ul class="gift-list">
		<%
			for(GiftDTO dto:list){
		%>	
			<li>
				<div class="img-div"><img src="save/<%=dto.getPhoto()%>" alt="" /></div>
				<div class="txt-div">
					<p class="txt1"><%= dto.getName() %></p>
					<p class="txt2"><%= dto.getContent() %></p>
				</div>
			</li>
		<% } %>
	</ul>
</div>