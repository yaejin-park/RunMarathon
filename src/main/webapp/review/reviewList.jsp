<%@page import="data.dao.MemberDAO"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.ReviewDAO"%>
<%@page import="data.dto.ReviewDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(function(){
	$(".camera").click(function(){
		$("#photo").trigger("click");//이벤트 강제호출
	});
	

	$(window).on("load", function(){
        $(".review-area .img-div").each(function(){
            if($(this).find("img").width() > $(this).find("img").height()){
                $(this).find("img").width("auto");
                $(this).find("img").height("100%");
            }else{
                $(this).find("img").width("100%");
                $(this).find("img").height("auto");
            }
        });
    });
});
//이미지 미리보기 할 함수
function readUrl(input){
	if(input.files[0]){
		var reader=new FileReader();
		reader.onload=function(e){
			$("#showimg").attr("src",e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<style>
.search-div>* {
	vertical-align: top;
}

#selsearch {
	width: 100px;
	height: 30px;
}

#textSearch {
	width: 350px;
	height: 30px;
}

img.mainimg {
	width: 120px;
	height: 160px;
	border: 1px solid #aaa;
}

img.mainimg:hover {
	cursor: pointer;
	width: 200px;
	height: 270px;
	border: 5px solid orange;
}

table.maintd {
	width: 700px;
}

table.maintd tr {
	height: 180px;
}

#modalNick {
	text-align: right;
}

span.camera {
	cursor: pointer;
	color: skyblue;
}
.review-area .review-list:after {
	content:"";
	display:block;
	clear:both;
}
.review-area .review-list > a {
	position:relative;
	float:left;
    display:block;
    width:263px;
    margin:50px 55px 0 0;
    border-radius:20px;
    overflow:hidden;
}
.review-area .review-list > a:nth-child(-n+3) {
	margin-top:0;
}
.review-area .review-list > a:nth-child(3n) {
	margin-right:0;
}
.review-area .review-list .img-div {
    position:relative;
    width:263px;
    height:263px;
}
.review-area .review-list .img-div img {
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%, -50%);
}
.review-area .review-list .txt-div .tit {
	position:absolute;
	bottom:0;
	left:0;
	width:100%;
	padding:15px;
	background:rgba(0,0,0,0.6);
}
.review-area .review-list .txt-div .tit {
	color:#fff;
	text-overflow:ellipsis;
	white-space:nowrap;
	overflow:hidden;
}
.review-area .btn-wrap {
	margin-bottom:20px;
	text-align:right;
}
</style>
<%
ReviewDAO dao = new ReviewDAO();
int perPage = 9;//한페이지에 보여질 갯수
int totalCount;//총갯수글
int currentPage;//현재 페이지 번호
int totalPage;//총 페이지 갯수
int start;//각페이지에서 불러올 db의 시작번호
int perBlock = 5;//몇개의 페이지 번호씩 표현할것인가
int startPage;//각블럭에 표시할 시작페이지
int endPage;//각 블럭에 표시할 마지막 페이지

//세션
MemberDTO mdto = new MemberDTO();
MemberDAO mdao = new MemberDAO();
String id = (String)session.getAttribute("sessionId");
String nickname = mdao.getIdNick(id);
String sessionLogin = (String)session.getAttribute("sessionLogin");

//총 갯수
totalCount = dao.getTotalCount();
//현재페이지 번호 읽기 (단 null 일경우는 1페이지로 설정)
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 갯수 구하기
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
//각 블럭의 시작페이지
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;
if (endPage > totalPage)
	endPage = totalPage;
//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;
//각페이지에서 필요한 게시글 가져오기
List<ReviewDTO> list = dao.getList(start, perPage);

String idx = request.getParameter("idx");
ReviewDTO dto = dao.getData(idx);

if (list.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
	location.href="reviewList.jsp?currentPage=<%=currentPage - 1%>
	";
</script>
<%
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//각페이지에 출력할 시작번호
int no = totalCount - (currentPage - 1) * perPage;
%>

<div class="review-area">
	<p class="title">후기</p>
	
	<%
	if(sessionLogin!=null){
	%>
	<div class="btn-wrap">
		<button type="button" class="btn btn-add btn-sm" data-toggle="modal" data-target="#myModal">
			<span class="glyphicon glyphicon-pencil"></span>후기작성하기
		</button>
	</div>
	<%
	}
	%>
	
	<%
		if (totalCount == 0) {
		%>
		<div class="no-data"><b>등록된 게시글이 없습니다</b></div>
		<%
		} else {
		%>
			<div class="review-list">
				<%
				for (ReviewDTO adto : list) {
				%>
					<a id="photoChul" href="index.jsp?go=review/reviewDetail.jsp?idx=<%=adto.getIdx()%>&currentPage=<%=currentPage%>&key=list&menu_one=11&menu_two=28">
						<div class="img-div"><img src="save/<%=adto.getPhoto()%>"></div>
						<div class="txt-div">
							<p class="tit"><%=adto.getSubject() %></p>
						</div>
					</a>
				<%}%>
			</div>
		<%
		}
		%>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<form action="review/reviewInsert.jsp" method="post"
				enctype="multipart/form-data">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">후기 작성하기</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name="nickname" value="<%=nickname%>">
					<input type="hidden" name="write_day" value="<%=dto.getWrite_day()%>"> 
					<input type="hidden" name="currentPage" value="<%=currentPage%>">
					<table class="table table-bordered">
						<colgroup>
							<col width="70px">
							<col width="*">
						</colgroup>
						
						<tr>
							<td><b>제목</b></td>
							<td><textarea class="form-control" name="subject" required="required"></textarea>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: middle;"><span
								class="glyphicon glyphicon-camera camera"><b>사진</b></span> <input
								type="file" name="photo" id="photo"
								style="visibility: hidden;" onchange="readUrl(this)">
							</td>
							<td>
								<div style="min-height:300px;">
									<img id="showimg" style="max-width: 300px;">
								</div>
							</td>
						</tr>

						<tr>
							<td><b>내용</b></td>
							<td><textarea class="form-control" name="content" required="required"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-add">저장하기</button>
				</div>
			</form>
		</div>

	</div>
</div>

<!-- 페이징 -->
<div style="width: 900px; text-align: center;">
	<ul class="pagination">
		<%
		//이전
		if (startPage > 1) {
		%>
		<li><a href="index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28?currentPage=<%=startPage - 1%>">이전</a>
		</li>
		<%
		}

		for (int pp = startPage; pp <= endPage; pp++) {
		if (pp == currentPage)//현재페이지일때  active
		{
		%>
		<li class="active"><a
			href="index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28&currentPage=<%=pp%>"><%=pp%></a></li>
		<%
		} else {
		%>
		<li><a href="index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28&currentPage=<%=pp%>"><%=pp%></a></li>
		<%
		}
		}

		//다음
		if (endPage < totalPage) {
		%>
		<li><a href="index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28&currentPage=<%=endPage + 1%>">다음</a>
		</li>
		<%
		}
		%>
	</ul>
</div>