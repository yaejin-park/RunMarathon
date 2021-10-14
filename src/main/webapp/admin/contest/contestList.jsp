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
<style>
	.chk {
		text-align:center;
	}
</style>
<script type="text/javascript">
$(function(){
	$(".all-check").change(function(){
		if($(this).prop("checked") == true){
			$(".del-check").prop("checked", true);
		}else{
			$(".del-check").prop("checked", false);
		}
	});
	
	var s="";
	$(".del-check").change(function(){
		var n = 0;
		var len = $(".del-check").length;
		var ck=$(".delcheck:checked");
		
		$.each($(".del-check"), function(i, elt) {
			var chk = $(elt).prop("checked");
			
			if(chk == true){
				n++;
				s+=$(elt).val().trim()+"-";	
			}
			
			if(n == len){
				$(".all-check").prop("checked", true);
			}else{
				$(".all-check").prop("checked", false);
			}
		});
		
		s=s.substring(0, s.length-1);
	});
	
	$(".delete-btn").click(function(){
		$.ajax({
			type:"get",
			url:"./admin/contest/deleteContestAction.jsp",
			dataType:"html",
			data:{name:s},
			success:function(){
				location.reload(true);
			},
		});
	});
});
</script>
<div class="admin-area">
	<p class="title">관리자-대회</p>
	<div class="contest-list">
		<div class="btn-wrap">
			<a href="./index.jsp?go=admin/contest/addContest.jsp&menu_one=<%=menu_one%>&menu_two=<%= menu_two%>" class="btn btn-info add-btn">추가</a>
			<a href="javascript:" class="btn btn-info delete-btn">삭제</a>
		</div>
		<table class="table table-bordered">
			<colgroup>
				<col width="40px">
				<col width="50px">
				<col width="*">
				<col width="250px">
			</colgroup>
			<thead>
				<tr>
					<th class="chk"><input type="checkbox" class="all-check"></th>
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
					    <td class="chk"><input type="checkbox" class="del-check" value="<%=dto.getName() %>"></td>
						<td><%= ++cnt %></td>
						<td><a href="./index.jsp?go=admin/contest/contestView.jsp&menu_one=<%=menu_one%>&menu_two=<%= menu_two%>&contest_name=<%= contestName %>"><%= dto.getName() %></a></td>
						<td><%= dto.getContest_start() %> ~ <%= dto.getContest_end() %></td>
					</tr>	
				<% } %>
			</tbody>
		</table>
	</div>
</div>