<%@page import="data.dto.NoticeDTO"%>
<%@page import="data.dao.NoticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<span><%=dto.getSubject() %></span>
			<br>
			<span>
				<%=dto.getWriter() %></span><br>
			<span>
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
				onclick="location.href='index.jsp?go=noticeBoard/noticeList.jsp?&menu_one=12&menu_two=18&currentPage=<%=currentPage%>'">목록</button>
		</td>
	</tr>
</table>
<%
	/*로그인 세션 처리에 필요한 변수 선언*/
	String sessionLogin = (String)session.getAttribute("sessionLogin");
	
	String id = (String)session.getAttribute("sessionId");
	if(sessionLogin!=null && id.equals("admin")){
%>
<button type="button" class="btn btn-info" style="width: 80px;" 
	onclick="location.href='index.jsp?go=noticeBoard/writeForm.jsp&menu_one=12&menu_two=18'">글쓰기</button>
<button type="button" class="btn btn-info" style="width: 80px;" 
	onclick="location.href='index.jsp?go=noticeBoard/updateForm.jsp?&menu_one=12&menu_two=18&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">수정</button>
<button type="button" class="btn btn-info" style="width: 80px;" 
	onclick="location.href='noticeBoard/delete.jsp?idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">삭제</button>
<%
	}
%>