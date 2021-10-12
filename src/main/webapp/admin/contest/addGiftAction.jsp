<%@page import="data.dao.GiftDAO"%>
<%@page import="data.dto.GiftDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이미지가 업로드될 실제 경로 구하기(톰캣에 업로드될 실제 경로 / 워크페이지 파일 경로는 아니다.)
	String realPath = getServletContext().getRealPath("/save");
	System.out.println(realPath);

	int uploadSize = 1024*1024*2; // 2mb
	MultipartRequest multi = null;
	
	try {
		multi = new MultipartRequest(request,realPath,uploadSize, "utf-8", new DefaultFileRenamePolicy());
		// (주의) request 가 아닌 multi 변수로 모든 폼데이타를 읽어야한다.
		String name = multi.getParameter("name");
		String content = multi.getParameter("content");
		String contestName = multi.getParameter("contest_name");
		String photo = multi.getFilesystemName("photo"); // 실제 업로드된 파일명
		// dto 에 저장
		GiftDTO dto = new GiftDTO();
		dto.setName(name);
		dto.setContent(content);
		dto.setContest_name(contestName);
		dto.setPhoto(photo);
		
		
		// dao 선언
		GiftDAO dao = new GiftDAO();
		// insert 
		dao.insertGift(dto);

		response.sendRedirect("../../index.jsp?go=admin/contest/contestList.jsp&menu_one=13&menu_two=20");
	} catch(Exception e){
		System.out.println("업로드오류 : " + e.getMessage());
	}
%>