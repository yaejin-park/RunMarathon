<%@page import="data.dao.NoticeDAO"%>
<%@page import="data.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	NoticeDTO dto = new NoticeDTO();
	NoticeDAO dao = new NoticeDAO();
	String idx = request.getParameter("idx");
	dto = dao.getData(idx);
	//프로젝트의 경로
	String root=request.getContextPath();
%>

<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>	
</head>
<body>
<form action="noticeBoard/updateAction.jsp" method="post">
	<input type="hidden" name="idx" value="<%=idx%>">
	<table class="table table-bordered" style="width: 800px;">
		<caption>Update Form</caption>
		<tr>
			<th bgcolor="orange" width="100">작성자</th>
			<td>
				<input type="text" name="writer" class="form-control" required="required" style="width: 130px;" value="<%=dto.getWriter() %>">
			</td>
		</tr>
		<tr>
			<th bgcolor="orange" width="100">제  목</th>
			<td>
				<input type="text" name="subject" class="form-control" required="required" style="width: 300px;" value="<%=dto.getSubject() %>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" id="content" required="required" style="width: 100%;height: 300px;display: none;"><%=dto.getContent()%></textarea>		
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-warning" style="width: 120px;" onclick="submitContents(this)">저장</button>
				<button type="button" class="btn btn-warning" style="width: 120px;" onclick="location.href='index.jsp?go=noticeBoard/noticeList.jsp&menu_one=12&menu_two=18'">목록</button>
			</td>
		</tr>
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	
	    oAppRef: oEditors,
	
	    elPlaceHolder: "content",
	
	    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
	
	    fCreator: "createSEditor2"
	
	}); 
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
	
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	    try {
	        elClickedObj.form.submit();
	    } catch(e) { 
	
	    }
	}
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
	    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 
	}
</script>