<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.ReviewDAO"%>
<%@page import="data.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션으로부터 db에 저장할 아이디 얻기
	//String nickname=(String)session.getAttribute("nickname");
	//이미지 업로드될 실제 경로 구하기
	String realPath=getServletContext().getRealPath("/save");
	//System.out.println(realPath);
	
	int uploadSize=1024*1024*2;//2mb
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
				new DefaultFileRenamePolicy());
		//(주의)request가 아닌 multi 변수로 모든폼데이터를 읽어야한다
		String nickname=multi.getParameter("nickname");
		String subject=multi.getParameter("subject");
		String photo=multi.getFilesystemName("photo");//실제업로드된 파일명
		String content=multi.getParameter("content");
		
		
		ReviewDTO dto=new ReviewDTO();
		
		dto.setNickname(nickname);
		dto.setSubject(subject);
		dto.setPhoto(photo);
		dto.setContent(content);
		
		//dao 선언후 insert 메서드 호출
		ReviewDAO dao=new ReviewDAO();
		dao.insertReview(dto);
		//페이지 번호읽기
		String currentPage=multi.getParameter("currentPage");
		
		String path="../index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28?currentPage="+currentPage;
		response.sendRedirect(path);
	}catch(Exception e){
		System.out.println("업로드오류:"+e.getMessage());
	}
%>
