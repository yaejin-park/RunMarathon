<%@page import="data.dao.MenuDAO"%>
<%@page import="data.dto.ContestDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>

<%
	String menu_one = request.getParameter("menu_one");
	String menu_two = request.getParameter("menu_two");
	MenuDAO menudao = new MenuDAO();
	menudao.getOneDepth(menu_one);
%>
<div class="admin-area">
	<p class="title">관리자-대회</p>
	<div class="contest-list">
		<div class="btn-wrap">
			<a href="./index.jsp?go=admin/contest/addContest.jsp&menu_one=<%=menu_one%>&menu_two=<%= menu_two%>" class="btn btn-info add-btn">추가</a>
			<a href="javascript:" class="btn btn-info delete-btn">삭제</a>
		</div>
		<table class="table table-bordered">
			<colgroup>
				<col width="50px">
				<col width="*">
				<col width="250px">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>대회명</th>
					<th>대회기간</th>
				</tr>
			</thead>
			<tbody>
				<%
					ContestDAO dao = new ContestDAO();
					List<ContestDTO> list = dao.getAllList();
					int cnt = 0;
					for(ContestDTO dto:list){
						String contestName = URLEncoder.encode(dto.getName(), "UTF-8");
				%>	
					<tr>
					    <td><input type="checkbox" class="delcheck" value="<%=dto.getName() %>"></td>
						<td><%= ++cnt %></td>
						<td><a href="./index.jsp?go=admin/contest/contestView.jsp&menu_one=<%=menu_one%>&menu_two=<%= menu_two%>&contest_name=<%= contestName %>"><%= dto.getName() %></a></td>
						<td><%= dto.getContest_start() %> ~ <%= dto.getContest_end() %></td>
					</tr>	
				<% } %>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
$(".delete-btn").click(function(){
	var ck=$(".delcheck:checked");
	//alert(ck.length);
	
	var s="";
	$.each(ck,function(i,item){
		//alert($(item).val());
		s+=$(item).val()+"|";		
	});
	s=s.substring(0,s.length-1);
	//alert(s);
	
	
});
</script>