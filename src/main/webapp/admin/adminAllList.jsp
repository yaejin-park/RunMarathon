<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
	#tbl{
		margin-top: 50px;
	}
	
	#tbl *, #recordTable *{
		text-align: center;
		font-family: Gugi;
	}
	
	#tbl th{
		background-color: skyblue;
	}
	
	button{
		font-family: Gugi;
	}
</style>
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	List<AdminApplyDTO> list = dao.getAllMembers();
%>
<table id="tbl" class="table table-bordered" style="width:1200px" align="center">
	<caption style="font-size:25pt"><b>전체 회원 목록</b></caption>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>핸드폰</th>
			<th>주소</th>
			<th>본인인증문구</th>
			<th>참가현황(신청/배송/기록)</th>
			<th>회원관리(수정/삭제)</th>
		</tr>
	</thead>
	<tbody>
<%	for(AdminApplyDTO adt:list) {
		adt.getIdx();
		adt.getName();
		adt.getNick();
		adt.getId();
		adt.getPass();
		adt.getHp();
		adt.getAddr();
		adt.getAuth2();
%>
		<tr>
			<td><%=adt.getIdx()%></td>
			<td><%=adt.getName()%></td>
			<td><%=adt.getNick()%></td>
			<td><%=adt.getId()%></td>
			<td><%=adt.getPass()%></td>
			<td><%=adt.getHp()%></td>
			<td><%=adt.getAddr()%></td>
			<td><%=adt.getAuth2()%></td>
			<td>
				<button type="button" class="btn btn-info btn-sm">신청</button>
				<button type="button" class="btn btn-primary btn-sm">배송</button>
				<button type="button" class="btn btn-success btn-sm"
				 onclick="recordFunc('<%=adt.getName()%>')">기록</button>
			</td>
			<td>
				<button type="button" class="btn btn-warning btn-sm">수정</button>
				<button type="button" class="btn btn-danger btn-sm">삭제</button>
			</td>
		</tr>
	<% } %>
	</tbody>	
</table>

<!-- 기록 Modal -->
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      대회 완주 기록
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">참가한 대회 선택</h4>
	          <select id="selcontest" style="width: 250px;">
					<option disabled="disabled" selected="selected">참가 대회 목록</option>
					<option value="이봉주"><%=dao.getMarathon(dto.getName())%></option>
			  </select>
        </div>
        <div class="modal-body form-inline">
          <table id="recordTable" align="center">
          	<thead>
	          	<tr>
	          		<th><b>시</b></th>
		            <th><b>분</b></th>
		            <th><b>초</b></th>
	          	</tr>
          	</thead>
			<tbody>
				<tr>
					<td><input type="text" id="hour" style="width:50px" class="form-control"> : </td>
					<td><input type="text" id="minute" style="width:50px" class="form-control"> : </td>
					<td><input type="text" id="second" style="width:50px" class="form-control"></td>
				</tr>
			</tbody>
          </table>
        </div>
        <div class="modal-footer">
        	<span id="recodeName"><%=dto.getName()%></span> 님
            <button type="button" class="btn btn-success recordbtn" data-dismiss="modal">기록</button>
        </div>
      </div>
      
    </div>
   </div>
  
   <script type="text/javascript">
  	function recordFunc(recname) {
  		alert(recname);
  		$("#recodeName").val(recname);
  		$("#myModal").modal();
  		
  		// 기록 버튼 이벤트
  		$("button.recordbtn").click(function(){
  			// name 읽기
  			var name = $("#recodeName").val();
  			
  			// 기록파일 호출
  			location.href = "admin_record.jsp?name="+name;
  		});
  	}
  </script>
</body>
</html>