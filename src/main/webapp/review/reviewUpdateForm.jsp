<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ReviewDTO"%>
<%@page import="data.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$(".cameraUp").click(function() {
			$("#photoUp").trigger("click");//이벤트 강제호출
		});
	});
	//이미지 미리보기 할 함수
	function readUrl(input) {
		if (input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#showimgUp").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style>
span.cameraUp {
	cursor: pointer;
	color: skyblue;
}
</style>
<%
String idx = request.getParameter("idx");
//System.out.println("idx="+idx);
//페이지 번호 읽기
String currentPage = request.getParameter("currentPage");
//db에서 idx에 해당하는 dto 얻기
ReviewDAO dao = new ReviewDAO();
ReviewDTO dto = dao.getData(idx);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<form action="review/reviewUpdate.jsp" method="post">
		<input type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="currentPage" value="<%=currentPage%>">
		<table class="table table-bordered"
			style="width: 500px; margin-left: 100px;">
			<caption>
				<h3>작성리뷰 수정하기</h3>
			</caption>
			<thead>
				<tr>
					<th bgcolor="skyblue" width="100">작성자</th>
					<td><input type="hidden" name="nickname" class="form-control"
						value="<%=dto.getNickname()%>" required="required"
						style="width: 130px;"><%=dto.getNickname()%>
					</td>
				</tr>
				<tr>
					<th bgcolor="skyblue" width="100" height="43">제 목</th>
					<td height="43">
						<input type="text" name="subject"
						class="form-control" required="required"
						value="<%=dto.getSubject()%>" style="width: 350px;"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<span class="glyphicon glyphicon-camera cameraUp"><b>사진첨부</b></span> 
						<input type="file" name="photo" id="photoUp" style="visibility: hidden;"
						onchange="readUrl(this)">
					</td>
					<td>
						<div style="width: 400px; height: 300px; border: 1px solid skyblue;">
							<img id="showimgUp" style="position: absolute; left: 750px; top: 250px; max-width: 300px;">
						</div>
					</td>
				</tr>	
				<tr>
					<td colspan="2" width="150" height="150"><input type="text"
						name="content" class="form-control" required="required"
						value="<%=dto.getContent()%>" style="width: 100%; height: 100%;" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" style="width: 120px;">수정하기</button>

						<button type="button" class="btn btn-info" style="width: 120px;"
							onclick="location.href='index.jsp?go=review/reviewDetail.jsp?idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>&key=list&menu_one=11&menu_two=28'">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>