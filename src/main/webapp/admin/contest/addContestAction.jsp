<%@page import="java.util.Enumeration"%>
<%@page import="data.dao.GiftDAO"%>
<%@page import="data.dto.GiftDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.ContestDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.ContestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String realPath = getServletContext().getRealPath("/save");
	System.out.println(realPath);

	int uploadSize = 1024*1024*2; // 2mb
	MultipartRequest multi = null;
	
	try {
		multi = new MultipartRequest(request,realPath,uploadSize, "utf-8", new DefaultFileRenamePolicy());

		// 대회	
		String name = multi.getParameter("name");
		String content = multi.getParameter("content");
		String contest_start = multi.getParameter("contest_start");
		String contest_end = multi.getParameter("contest_end");
		String apply_start = multi.getParameter("apply_start");
		String apply_end = multi.getParameter("apply_end"); 
		String money = multi.getParameter("money");
	
		String gift_check = multi.getParameter("gift_check");
		if(multi.getParameter("gift_check") == null) {
			gift_check = "0";	
		}else{
			gift_check = "1";
		}
		String gift_start = multi.getParameter("gift_start");
		if(multi.getParameter("gift_start") == "" || gift_check.equals("0")) {
			gift_start = "2000-01-01";
		} 
		
		String gift_end = multi.getParameter("gift_end");
		if(multi.getParameter("gift_end") == "" || gift_check.equals("0")) {
			gift_end = "2000-01-01";
		}
		
		ContestDTO contest = new ContestDTO();
		contest.setName(name.trim());
		contest.setContent(content);
		contest.setContest_start(contest_start.trim());
		contest.setContest_end(contest_end.trim());
		contest.setApply_start(apply_start.trim());
		contest.setApply_end(apply_end.trim());
		contest.setGift_check(gift_check.trim());
		contest.setGift_start(gift_start.trim());
		contest.setGift_end(gift_end.trim());
		contest.setMoney(money.trim());
		
		ContestDAO dao = new ContestDAO();
		dao.insertContest(contest);

		// 기념품
		if(gift_check.equals("1")) {		
			int giftCnt = Integer.parseInt(multi.getParameter("giftCnt"));

			GiftDAO giftDao = new GiftDAO();
			for(int i=1; i<=giftCnt; i++){
				System.out.println(i);
				String giftName = multi.getParameter("giftName" + i);
				String giftContent = multi.getParameter("giftContent" + i);
				String photo = multi.getFilesystemName("photo" + i);
				System.out.println(giftContent);
				GiftDTO gift = new GiftDTO();
				gift.setName(giftName);
				gift.setContent(giftContent);
				gift.setContest_name(name);
				gift.setPhoto(photo);
				
				
				giftDao.insertGift(gift);
			}
		}

		response.sendRedirect("../../index.jsp?go=admin/contest/contestList.jsp&menu_one=13&menu_two=20");
	} catch(Exception e){
		System.out.println("업로드오류 : " + e.getMessage());
	}
%>