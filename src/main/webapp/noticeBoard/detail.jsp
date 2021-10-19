<%@page import="java.util.List"%>
<%@page import="data.dto.NoticeDTO"%>
<%@page import="data.dao.NoticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#sub{
		font-size: 20pt;
	}

	#sub2{
		font-size: 10pt;
		float: right;
		margin-right: 10px;
	}
	
	#th{
		padding: 25px 0px 10px 20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".btn-del").click(function(){
			var del = confirm("삭제하시겠습니까?");
			var idxVal = $(this).find("#idx").val();
			var pageVal = $(this).find("#page").val();
			if(!del){
				return;
			}else{
				location.href = "noticeBoard/delete.jsp?&menu_one=12&menu_two=18&idx=" + idxVal + "&currentPage=" + pageVal;
			}
		});
	});
</script>
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
	
	//idx에 해당하는 dto 얻기
	NoticeDTO dto = dao.getData(idx);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<p class="title">공지사항</p>
	<!-- detail table -->
	<table class="table table-bordered">
		<caption><b>내용보기</b></caption>
		<tr>
			<th id="th">
				<span id="sub"><%=dto.getSubject() %></span>
				<br>
				<span id="sub2">
					<%=sdf.format(dto.getWriteDay()) %>&nbsp;&nbsp;&nbsp;
					조회 <%=dto.getReadCount() %>
				</span>
			</th>
		</tr>
		<tr>
			<td height="500px">
				<%=dto.getContent() %>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-add" 
					onclick="location.href='index.jsp?go=noticeBoard/noticeList.jsp?&menu_one=12&menu_two=18&currentPage=<%=currentPage%>'">목록</button>
			</td>
		</tr>
	</table>
	
	<!-- 이전글, 다음글 -->
	<table class="table table-bordered">
		<colgroup>
			<col width="150px">
			<col width="*">
		</colgroup>
<%		
		List<NoticeDTO> list = dao.nextList(idx);
		int cnt =0;
		for(NoticeDTO ssdto:list){
	     cnt++;
%>
	     <tr>
	     <%
	     	if(list.size()==3){
	     		if(cnt==2){
	     			continue;
	     		}
	     %>
	        <th>
	       		<%=cnt==1?"▲ 다음글":cnt==3?"▼ 이전글":""%>
	        </th>
	        <td>
				<a style="color: black"
					href="index.jsp?go=noticeBoard/detail.jsp?&menu_one=12&menu_two=18&idx=<%=ssdto.getIdx()%>&currentPage=<%=currentPage%>&key=list">
					<%=ssdto.getSubject() %></a>
			</td>
	     <%		
	     	}else if(list.size()==2){
	     %>
     		<th>
       			<%=cnt==1?"▲ 다음글":cnt==2?"▼ 이전글":""%>
			</th>
			<td>
			<%if(cnt==1){%>
				등록된 글이 없습니다.
			<%}
			if(cnt==2){%>
				<a style="color: black"
				href="index.jsp?go=noticeBoard/detail.jsp?&menu_one=12&menu_two=18&idx=<%=ssdto.getIdx()%>&currentPage=<%=currentPage%>&key=list">
				<%=ssdto.getSubject() %></a>
			<%}%>
			</td>
	     <%	
	     	}
	     %>
	     </tr>
<%
		}
%>
	</table>

	<!-- 관리자 글쓰기, 수정,삭제 -->
<%
	/*로그인 세션 처리에 필요한 변수 선언*/
	String sessionLogin = (String)session.getAttribute("sessionLogin");
	
	String id = (String)session.getAttribute("sessionId");
	if(sessionLogin!=null && id.equals("admin")){
%>
	<button type="button" class="btn btn-add" 
		onclick="location.href='index.jsp?go=noticeBoard/noticeForm.jsp&menu_one=12&menu_two=18'">글쓰기</button>
	<button type="button" class="btn btn-update" 
		onclick="location.href='index.jsp?go=noticeBoard/updateForm.jsp?&menu_one=12&menu_two=18&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">수정</button>
	<button type="button" class="btn btn-del">삭제
		<input type="hidden" id="idx" value="<%=dto.getIdx()%>"/>
		<input type="hidden" id="page" value="<%=currentPage%>"/>
	</button>
<%
	}
%>