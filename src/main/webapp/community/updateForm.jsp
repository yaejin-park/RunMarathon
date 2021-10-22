<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDTO"%>
<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");
//페이지 번호 읽기
String currentPage = request.getParameter("currentPage");
//db에서 idx에 해당하는 dto 얻기
SmartDAO dao = new SmartDAO();
SmartDTO dto = dao.getData(idx);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<form action="community/comUpdate.jsp" method="post">
		<input type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="currentPage" value="<%=currentPage%>">
		<table class="table table-bordered"
			style="width: 800px; margin-left: 100px;">
			<caption>
				<h3>작성글 수정하기</h3>
			</caption>
			<thead>
				<tr>
					<th bgcolor="skyblue" width="100">작성자</th>
					<td><input type="hidden" name="nickname" class="form-control"
						value="<%=dto.getNickname()%>" required="required"
						style="width: 130px;"><%=dto.getNickname()%></td>
				</tr>
				<tr>
					<th bgcolor="skyblue" width="100" height="43">제 목</th>
					<td height="43"><input type="text" name="subject"
						class="form-control" required="required"
						value="<%=dto.getSubject()%>" style="width: 350px;" /></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2" width="300" height="300"><input type="text"
						name="content" class="form-control" required="required"
						value="<%=dto.getContent()%>" style="width: 100%; height: 300px;" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-update" style="width: 120px;">수정하기</button>

						<button type="button" class="btn btn-basic" style="width: 120px;"
							onclick="location.href='index.jsp?go=community/detail.jsp?idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>&key=list&menu_one=11&menu_two=27'">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>