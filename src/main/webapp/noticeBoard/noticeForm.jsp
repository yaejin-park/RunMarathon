<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//프로젝트의 경로
	String root=request.getContextPath();

	String id = (String)session.getAttribute("sessionId");
	MemberDAO mdao = new MemberDAO();
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<body>
<form action="noticeBoard/noticeAction.jsp" method="post">
	<table class="table table-bordered" style="width: 800px;">
		<caption><h3>스마트 포토 게시판</h3></caption>
		<tr>
			<th bgcolor="#dda0dd">작성자</th>
			<td>
				<input type="text" name="writer" class="form-control" required="required" style="width: 130px;" value="<%=mdao.getIdNick(id)%>">
			</td>
		</tr>
		<tr>
			<th bgcolor="#dda0dd">제  목</th>
			<td>
				<input type="text" name="subject" class="form-control" required="required" style="width: 300px;">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" id="content" required="required" style="width: 100%;height: 300px;display: none;"></textarea>		
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-add" style="width: 120px;" onclick="submitContents(this)">저장</button>
				<button type="button" class="btn btn-add" style="width: 120px;" onclick="location.href='index.jsp?go=noticeBoard/noticeList.jsp'">목록</button>
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