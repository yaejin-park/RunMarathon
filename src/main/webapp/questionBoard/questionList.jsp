<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.MemberDAO"%>
<%@page import="data.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.QuestionDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.qna-title{
		display: table;
		width: 100%;
		table-layout: fixed;
		border-top: 1px solid gray;
	}
	.qna-title > * {
		display:table-cell;	
	}
	
	.qna-no{
		width: 75px;
		height: 40px;
		text-align: center;
	}
	
	.qna-subject{
		width: 380px;
	}
	
	.qna-writer{
		width: 75px;
	}
	
	.qna-day{
		width: 160px;
		text-align: center;
	}
</style>

<%
	QuestionDAO dao = new QuestionDAO();

	//페이징 처리에 필요한 변수 선언
	int perPage = 10; //한페이지에 보여질 글의 갯수
	int totalCount; //총 글의 수
	int currentPage; //현재 페이지 번호
	int totalPage; //총 페이지 수
	int start; //각 페이지에서 불러올 시작번호
	int perBlock = 5; //몇개의 페이지 번호씩 표시할 것인가
	int startPage; //각 블럭에 표시할 시작 페이지
	int endPage; //각 블럭에 표시할 마지막 페이지
	
	//총 데이터 갯수
	totalCount = dao.getTotalCount();
	
	//현재 페이지 번호 읽기.(null일 경우 1페이지로 설정)
	if(request.getParameter("currentPage")==null){
		currentPage = 1;
	} else{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//총 페이지 갯수 구하기
	totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);
	
	//각 블럭의 시작 페이지
	startPage = (currentPage-1)/perBlock * perBlock +1;
	endPage = startPage + perBlock - 1;
	if(endPage>totalPage){
		 endPage = totalPage;
	}
	
	//각 페이지에서 불러올 시작 번호
	start = (currentPage-1)*perPage;
	
	//각 페이지에서 필요한 게시글 가져오기
	List<QuestionDTO> list = dao.getList(start, perPage);
	
	//현재 페이지의 리스트가 더 이상 없을 경우(삭제해서) 이전 페이지로 이동한다
	if(list.size()==0 && totalCount>0){%>
	<script type="text/javascript">
			location.href = "index.jsp?go=questionBoard/questionList.jsp?currentPage=<%=currentPage-1%>";
	</script>
<%}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//각 페이지에 출력한 시작 번호
	int no = totalCount - (currentPage-1) * perPage;
	
	/*로그인 세션 처리에 필요한 변수 선언*/
	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = new MemberDAO();
	String id = (String)session.getAttribute("sessionId");
	String nick = mdao.getNick(id);
	
	String sessionLogin = (String)session.getAttribute("sessionLogin");
	if(sessionLogin!=null){
	%>	
		<button type="button" class="btn btn-success" style="width: 100px; margin-top: 10px; margin-bottom: 10px;"
			onclick="location.href='index.jsp?go=questionBoard/questionForm.jsp&menu_one=12&menu_two=19'">
			<span class="glyphicon glyphicon-pencil"></span>글추가
		</button>
	<%
	}
%>


<div class="accor-all">
	<div class="qna-title">
		<div class="qna-no">
			번호
		</div>
		<div class="qna-subject" style="text-align: center;">
			제목
		</div>
		<div class="qna-writer">
			작성자
		</div>
		<div class="qna-day">
			날짜
		</div>
	</div>
	<%if(totalCount==0){%>
	<div>
		<b>등록된 글이 없습니다.</b>
	</div>
	<%
	}else{
		for(QuestionDTO dto:list){
	%>
	<div class="accor-div">
		<div class="qna-title">
			<div class="qna-no">
				<%=no-- %>
			</div>
			<div class="qna-subject accor-title">
				<%=dto.getSubject() %>
			</div>
			<div class="qna-writer">
				<%=dto.getWriter() %>
			</div>
			<div class="qna-day">
				<%=sdf.format(dto.getWriteDay()) %>
			</div>
		</div>
		<div class="accor-content">
			<%=dto.getContent() %>
			<%
			if(sessionLogin!=null && nick.equals(dto.getWriter())){%>
				<button type="button" onclick="location.href='index.jsp?go=questionBoard/updateForm.jsp?&menu_one=12&menu_two=19&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">수정</button>
				<button type="button" 
				onclick="
				<%
				if(dto.getStep()==0){%>
					location.href='questionBoard/questionDelete.jsp?&menu_one=12&menu_two=19&ref=<%=dto.getRef()%>&currentPage=<%=currentPage%>'
				<%} else{%>
					location.href='questionBoard/answerDelete.jsp?&menu_one=12&menu_two=19&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'
				<%}%>
				">삭제
				</button>
			<%}
			
			if(sessionLogin!=null && id.equals("admin")){
			%>
				<button type="button" onclick="location.href='index.jsp?go=questionBoard/answerForm.jsp?&menu_one=12&menu_two=19&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">답변</button>
			<%
			}
			%>
		</div>
	</div>
		<%}
	}
	%>
</div>

<!-- 페이징 처리-->
<div style="width: 900px; text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1){
		%>
			<li><a href="index.jsp?go=questionBoard/questionList.jsp?&menu_one=12&menu_two=19&currentPage=<%=startPage-1%>">◀</a>
		<%
		}
		for(int pp = startPage; pp<=endPage; pp++){
			if(pp==currentPage){//만약에 현재페이지면 액티브를 주겠다.%>
				<li class="active"><a href="index.jsp?go=questionBoard/questionList.jsp?&menu_one=12&menu_two=19&currentPage=<%=pp%>"><%=pp %></a></li>
			<%} else{%>
				<li><a href="index.jsp?go=questionBoard/questionList.jsp?&menu_one=12&menu_two=19&currentPage=<%=pp%>"><%=pp %></a></li>
			<%}
		}
		//다음
		if(endPage<totalPage){%>
			<li><a href="index.jsp?go=questionBoard/questionList.jsp?&menu_one=12&menu_two=19&currentPage=<%=endPage+1%>">▶</a>
		<%}%>
	</ul>
</div>