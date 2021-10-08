<%@page import="data.dto.NoticeDTO"%>
<%@page import="data.dao.NoticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String idx = request.getParameter("idx");
	String currentPage = request.getParameter("currentPage");
	if(currentPage==null){
		currentPage="1";
	}
	
	String key = request.getParameter("key");
	
	NoticeDAO dao = new NoticeDAO();
	
	//목록에서 올 경우에만 조회수 1 증가한다.
	if(key!=null){
		dao.updateReadCount(idx);
	}
	
	//num에 해당하는 dto 얻기
	NoticeDTO dto = dao.getData(idx);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
	<table class="table table-bordered">
		<caption><b>내용보기</b></caption>
		<tr>
			<th>
				<span style="font-size: 1.7em;"><%=dto.getSubject() %></span>
				<br>
				<span style="color: black; font-size: 10pt; margin-left: 30px;">
					<%=dto.getWriter() %></span><br>
				<span style="color: gray; font-size: 10pt; margin-left: 30px;">
					<%=sdf.format(dto.getWriteDay()) %>
					&nbsp;&nbsp;&nbsp;
					조회 <%=dto.getReadCount() %>
				</span>
			</th>
		</tr>
		<tr>
			<td>
				<%=dto.getContent() %>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-info" style="width: 80px;" 
					onclick="location.href='index.jsp?go=notice/smartform.jsp'">글쓰기</button>
				
				<button type="button" class="btn btn-info" style="width: 80px;" 
					onclick="location.href='index.jsp?go=notice/noticeList.jsp?currentPage=<%=currentPage%>'">목록</button>
				
				<button type="button" class="btn btn-info" style="width: 80px;" 
					onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-info" style="width: 80px;" 
					onclick="location.href=''">삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>