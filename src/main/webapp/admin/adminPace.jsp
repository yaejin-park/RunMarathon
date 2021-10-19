<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="data.dto.AdminApplyDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");
	
	int finishcourse = Integer.parseInt(request.getParameter("finishcourse"));
	int finishhour = Integer.parseInt(request.getParameter("finishhour"));
	int finishminute = Integer.parseInt(request.getParameter("finishminute"));
	String recordid = request.getParameter("recordid");
	System.out.println(finishcourse+finishhour+finishminute+recordid);
	// 숫자형으로 잘 들어옴

 	// 데이터 읽어서 dto에 넣기
	AdminApplyDTO dto = new AdminApplyDTO();
	dto.setRecordid(recordid);
	dto.setFinishcourse(finishcourse);
	dto.setFinishhour(finishhour);
	dto.setFinishminute(finishminute);
	
	AdminApplyDAO dao = new AdminApplyDAO();
	dao.getPace(recordid);
%>
<script type="text/javascript">
	alert(<%=dao.getPace(recordid)%>);
</script>




