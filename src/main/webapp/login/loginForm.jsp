<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style type="text/css">
	.sns-login{
		line-height: 45px;
	    height: 50px;
	    text-align: center;
	    border: 2px solid #E4E4E4;
	    color: gray;
	    border-radius: 5px;
	}
	
	.form-control{
		height: 45px;
	}
</style>
<script>
$(function() {
	//네이버 로그인
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "BtFFIIUnARGFlP5yMKjc", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:9000/callback", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				callbackHandle: true
			}
		);	
	
	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
	    		
				console.log(naverLogin.user); 
	    		
	            if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	
	
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
	}
	
	//카카오 로그인
	Kakao.init('55f3a8bfd821a05532bad2af715bca03'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
});
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
</script>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionSave = (String)session.getAttribute("sessionSave");
	
	String idValue="";
	
	//아이디저장시,
	if(sessionSave=="yes"){
		idValue = sessionId;
	%>
	<script type="text/javascript">
		$("#idSave").prop("checked", true);
	</script>
	<% 
}
%>
</head>

<body>
<div style="margin-left: 130px;">
<form action="login/loginAction.jsp" method="post">
<table class="table" style="width: 410px; padding: 30px; margin: 30px; font-size: 0.85em;">
	<caption>로그인</caption>
	
	<tbody>
		<tr>
			<td colspan="2">
				<input type="text" name="id" id="id" class="form-control" required="required" maxlength="15" placeholder="아이디" value=<%= idValue%>>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="password" name="pass" id="pass" class="form-control" required="required"  maxlength="15" placeholder="비밀번호">
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="idSave" id="idSave">아이디 저장
			</td>
			<td>
				<div align="right">
					<a href="javascript:">아이디/비밀번호 찾기</a>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn btn-info" style="width: 400px; font-size: 1.2em; font-weight: bold;">로그인</button>
			</td>
		</tr>
		<tr>
			<td>
			<ul>
				<li class="sns-login">
			      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
				      <img alt="naverlogin" src="./common/image/sns-naver.png" width="27px;" style="margin-top: 9px;">
			          네이버 로그인
			      </a>
				</li>
			</ul>
			</td>
			<td>
				<ul>
					<li onclick="kakaoLogin();" class="sns-login">
				      <a href="javascript:void(0)">
				      	<img alt="kakaologin" src="./common/image/sns-kakao.png" width="18px;" style="margin: 14px 2px;">
				         카카오 로그인
				      </a>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td style="line-height: 40px;">
				아직 회원이 아니신가요?			
			</td>
			<td>
				<div align="right">
					<button type="button" class="btn btn-info" style="width: 100px; height: 40px;">회원가입</button>
				</div>				
			</td>
		</tr>
	</tbody>
</table>
</form>
</div>
</body>
</html>