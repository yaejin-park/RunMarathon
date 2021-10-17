<%@page import="data.dao.MemberDAO"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dto.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReplyDAO"%>
<%@page import="data.dto.SmartDTO"%>
<%@page import="data.dao.SmartDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("button.like").click(function() {
			/* alert($(this).attr("chu_count")); */
			var idx=$(this).attr("idx");
			 $.ajax({
				type:"get",
				dataType:"json",
				url:"community/ajaxChu.jsp",
				data :{"idx":idx},
				success:function(data){
					location.reload();
				}
			}); 
		});
		$("span.adel").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			$.ajax({
				type:"get",
				dataType:"html",
				url:"community/replyDelete.jsp",
				data:{"idx":idx},
				success:function(){
					//새로고침
					location.reload();
					/* $(this).parent().find("div.answer").show(); */
				}
			});
			
		});
	});
</script>
<%
	String idx=request.getParameter("idx");
	
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
		currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 이외는 null값
	String key=request.getParameter("key");
	
	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = new MemberDAO();
	String id = (String)session.getAttribute("sessionId");
	String nickname = mdao.getIdNick(id);
	String sessionLogin = (String)session.getAttribute("sessionLogin");
	SmartDAO dao=new SmartDAO();
	//목록에서 올경우에만 조회수 1 증가한다
	if(key!=null)
		dao.updateReadcount(idx);
	
	//idx 에 해당하는 dto 얻기
	SmartDTO dto=dao.getData(idx);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<table class="table table-bordered" style="width: 600px;">
		<thead>
			<tr>
				<th><span style="font-size: 1.7em;"><%=dto.getSubject()%></span>
					<span style="color: black; font-size: 12pt; margin-left: 30px;">
						<%=dto.getNickname()%></span><br> <span
					style="color: gray; font-size: 10pt; margin-left: 30px;"> <%=sdf.format(dto.getWrite_day())%>
						&nbsp;&nbsp;&nbsp; 조회 <%=dto.getRead_count() %> 추천 <%=dto.getChu_count() %>
				</span></th>
			</tr>
		</thead>
		<tdody>
		<tr>
			<td style="max-witth: 300px; max-height: 500px;"><%=dto.getContent()%>
			</td>
		</tr>
		<%
			//각 방명록에 달린 댓글 목록 가져오기
			ReplyDAO adao=new ReplyDAO();
			//System.out.println(idx);
			List<ReplyDTO> alist=adao.getAllAnswer(idx);
		%> <!-- 댓글 & 추천 -->
		<tr>
			<td><span>댓글 <%=alist.size() %></span>
				<div style="margin-left: 30px;">
					<%
					 		if(sessionLogin!=null){//입력폼은 로그인한 경우에만 보이게하기
					 		%>
					<div>
						<form action="community/replyInsert.jsp" method="post">
							<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
							<input type="hidden" name="nickname" value="<%=nickname%>">
							<input type="hidden" name="currentPage" value="<%=currentPage%>">
							
							<table>
								<tr>
									<td width="480"><textarea
											style="width: 470px; height: 70px;" name="content"
											required="required" class="form-control"></textarea></td>
									<td>
										<button type="submit" class="btn btn-info"
											style="width: 70px; hieght: 70px;" id="listAdd">등록</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<%} %>
					<div>
						<table style="width: 500px;">
							<%
					 			for(ReplyDTO adto:alist)
					 			{%>
							<tr>
								<td width="60" align="right"><span
									class="glyphicon glyphicon-user" style="font-size: 20px;"></span>
								</td>
								<td>
									<%
					 				
					 						%> <br> <b><%=adto.getNickname()%></b> &nbsp; <%
					 						//글 작성자와 댓글쓴 작성자가 같을경우
					 						if(dto.getNickname().equals(adto.getNickname())){%> 
					 			<span style="color: red;">작성자</span> 
					 			<%
					 			}
					 			%> 
					 			<span style="font-size: 9pt; color: gray; margin-left: 20px;">
										<%=sdf.format(adto.getWrite_day())%>
								</span> <%
					 						//댓글삭제는 로그인 중이면서 로그인한 아이디와 같을 경우에만
					 						//삭제 아이콘 보이게 하기
					 						if(sessionLogin!=null && adto.getNickname().equals(nickname)){%>
									<span class="adel glyphicon glyphicon-remove" idx="<%=adto.getIdx()%>"
									style="font-size: 12pt; cursor: pointer; margin-left: 10px;"></span>
									<%
									}
					 				%> <br> <span style="font-size: 10pt;"> <%=adto.getContent().replace("\n", "<br>")%>
											</span> <br>
								</td>
							</tr>
							<%
							}
					 		%>
						</table>
					</div>
				</div>
					<tr>
						<td align="center">
							<button type="button" class="like btn btn-info" style="width: 80px;"
							idx="<%=dto.getIdx()%>">추천</button>

							<button type="button" class="btn btn-sm btn-info"
								style="width: 80px;"
								onclick="location.href='index.jsp?go=community/communityList.jsp&menu_one=11&menu_two=27&currentPage=<%=currentPage%>'">목록</button>

							<%
							if(sessionLogin!=null && dto.getNickname().equals(nickname)){
							%>
							<button type="button" class="btn btn-sm btn-info"
								style="width: 80px;" onclick="location.href='index.jsp?go=community/updateForm.jsp&menu_one=11&menu_two=27&idx=<%=dto.getIdx()%>&currentPage=<%=currentPage%>'">수정</button>
							<button type="button" class="btn btn-sm btn-info"
								style="width: 80px;" onclick="location.href='index.jsp?go=community/comDelete.jsp&menu_one=11&menu_two=27&idx=<%=dto.getIdx()%>'">삭제</button>
							<%
							} 
							%>
						</td>
					</tr>
		</tdody>
	</table>
</body>
</html>