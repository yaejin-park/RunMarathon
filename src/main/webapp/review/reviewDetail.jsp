<%@page import="data.dao.MemberDAO"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ReviewDTO"%>
<%@page import="data.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function() {
		$("span.adel").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			$.ajax({
				type:"get",
				dataType:"html",
				url:"community/replyDelete.jsp",
				data:{"idx":idx},
				success:function(){
					//새로고침
					location.reload();
					/* $(this).parent().find("div.answer").show(); */
				}
			});
			
		});
	});
</script>
<style>
.table thead th {
	text-align: left;
}
</style>
<%
String idx = request.getParameter("idx");

String currentPage = request.getParameter("currentPage");
if (currentPage == null)
	currentPage = "1";
//key는 목록에서만 값이 넘어오고 그 이외는 null값
String key = request.getParameter("key");

ReviewDAO dao = new ReviewDAO();
//idx 에 해당하는 dto 얻기
ReviewDTO dto = dao.getData(idx);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//세션
MemberDTO mdto = new MemberDTO();
MemberDAO mdao = new MemberDAO();
String id = (String)session.getAttribute("sessionId");
String nickname = mdao.getIdNick(id);
String sessionLogin = (String)session.getAttribute("sessionLogin");
%>
<body>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th><span style="font-size: 1.7em;"><%=dto.getSubject()%></span>
					<span style="color: black; font-size: 12pt; margin-left: 30px;">
					<%=dto.getNickname()%></span><br> 
					<span style="color: gray; font-size: 10pt; margin-left: 30px;"> <%=sdf.format(dto.getWrite_day())%>
						&nbsp;&nbsp;&nbsp;
				</span></th>
			</tr>
		</thead>
		<tdody>
		<tr>
			<td style="max-witth: 300px; max-height: 300px;"><img src="save/<%=dto.getPhoto()%>">
			</td>
		</tr>
		<tr>
			<td style="max-witth: 300px; max-height: 500px;"><%=dto.getContent()%>
			</td>
		</tr>
		<tr>
			<td align="center">

				<button type="button" class="btn btn-sm btn-add"
					style="width: 80px;"
					onclick="location.href='index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28?currentPage=<%=currentPage%>'">목록</button>
				<%
				if(sessionLogin!=null && dto.getNickname().equals(nickname)){
				%>
				<button type="button" class="btn btn-sm btn-update"
					style="width: 80px;"
					onclick="location.href='index.jsp?go=review/reviewUpdateForm.jsp&menu_one=11&menu_two=28&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">수정</button>
				<%
				//System.out.println("idx="+dto.getIdx());
				} 
				%>

				<%
				if(sessionLogin!=null && dto.getNickname().equals(nickname)){
				%>
				<button type="button" class="btn btn-sm btn-del"
					style="width: 80px;"
					onclick="location.href='review/reviewDelete.jsp?idx=<%=dto.getIdx()%>'">삭제</button>
				<%
				} 
				%>
			</td>
		</tr>
		</tdody>
	</table>
</body>
</html>