# 🏃RunMarathon 마라톤 예약 사이트
 정기적으로 마라톤을 개최하여 **마라톤 예약**이 가능하며, **마라톤 커뮤니티**로도 활용되는 사이트<br><br>
 ![image](https://user-images.githubusercontent.com/80744051/175223433-e8063e71-6b0a-4b11-bc82-80efa5ca100d.png)
 
 ## 📜 사용자요구사항
<img src="https://user-images.githubusercontent.com/80744051/175319942-d4b105ab-26d6-4da5-8b2b-083e5d2caa80.jpg" width="600px">

<!--![image](https://user-images.githubusercontent.com/80744051/175223634-ff43c583-c48a-4702-92d9-b952519e2721.png)-->


## :two_men_holding_hands:팀프로젝트
 - **개발기간** : 2021.9.29 - 2021.10.15 <br>
 - **개발인원** : 5명<br>
 - **역할분담**<br>
   - **박예진(본인)** : 조장, 회원가입/로그인, 참가신청, 마이페이지, AWS
   - 김민지 : 공지사항, QnA, 관리자, git
   - 윤인정 : 회원관리, 마이페이지
   - 한희규 : 메인/소개/일정, 위치/코스/기념품, 유의사항, 대회관리
   - 박규민 : 커뮤니티, 후기
 - **협업tool**
 
	<details>
		<summary><b>Git</b></summary>
	
	- 각자의 브랜치 만들어서, 정해진 GIT규칙에 따라 PUSH, PULL
		<img src="https://user-images.githubusercontent.com/80744051/175343694-f36c565f-f054-444f-ae5c-a2f6035f18b4.png" width="600px">
	</details>
	
	<details>
		<summary><b>Notion</b></summary>

	- 노션을 활용해 정보 공유 및 일정 공유
	
		<img src="https://user-images.githubusercontent.com/80744051/175228448-c5c904f4-234a-4153-9ebd-dc21def2592e.png"  width="500px"> 
	</details>

## 🛠 기술스택
<img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat-square&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/html5-E34F26?style=flat-square&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=flat-square&logo=css3&logoColor=white">  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/jquery-0769AD?style=flat-square&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=flat-square&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=Amazon%20AWS&logoColor=white"/> ![image](https://user-images.githubusercontent.com/80744051/175230762-90ecaf7e-2303-44f0-9cf3-d0a275e858e5.png)


## 📚 ERD   
![ERD](https://user-images.githubusercontent.com/80744051/175222667-a779da53-6213-4b59-961b-8d72f8d03f08.PNG)

## :star2: 기여부분
:point_right:[전체 PPT](https://drive.google.com/file/d/1o9VqOp-oanydnokMEkRB5zQ-EGHtbwqd/view)
:point_right:[영상ver PPT](https://docs.google.com/presentation/d/1B89wq9jjWCuInfGlFyc1sqVZEbJv4Ii_/edit?usp=sharing&ouid=108125837232154027289&rtpof=true&sd=true)<br>
<details>
 <summary><b>로그인</b></summary>
    <img src="https://user-images.githubusercontent.com/80744051/175223797-5693ec59-a67b-4427-a78b-4a6eb3ce220f.jpg">
    <img src="https://user-images.githubusercontent.com/80744051/175223807-15081967-c798-4661-a5dc-c21f6d7b81d9.jpg">
</details>
<details>
  <summary><b>회원가입</b></summary>
    <img src="https://user-images.githubusercontent.com/80744051/175223822-892903fa-e51f-4a3f-b251-9cfeffe826b6.jpg">  
    <img src="https://user-images.githubusercontent.com/80744051/175223936-b6aefa6b-edbb-4620-a53e-5ac0094d032a.jpg">     
    <img src="https://user-images.githubusercontent.com/80744051/175223954-d68c9237-305d-445a-a4a1-0867ab5af532.jpg">
</details>
<details>
  <summary><b>참가신청</b></summary>
    <img src="https://user-images.githubusercontent.com/80744051/175223988-4f2085f1-adbb-43b7-96bd-74b2df5b2379.jpg">  
    <img src="https://user-images.githubusercontent.com/80744051/175223999-485cab0f-746c-4313-9e55-eaf94cb67ea9.jpg">     
    <img src="https://user-images.githubusercontent.com/80744051/175230198-faf46d85-a71c-4cff-9fc8-0d071664e858.png">
</details>
<details>
  <summary><b>마이페이지</b></summary>
    <img src="https://user-images.githubusercontent.com/80744051/175224062-2cddb171-42de-4981-9528-27cbf74d7c98.jpg">  
</details>

## :triangular_ruler: 주요 로직
<details>
    <summary><b>개인참가, 단체참가 신청서폼을 하나로!</b></summary>

1. 개인참가는 value 1로, 단체참가는 value 2로 구분 [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/apply/applyMain.jsp#L167)
 ```html
<button type="submit" class="btn btn-add apply-type" id="soloApply" value="1">개인 참가</button>
<button type="submit" class="btn btn-add apply-type" id="groupApply" value="2">단체 참가</button>
```

2. 참가 버튼 클릭시, 아이디가 type인 input에 클릭이벤트 발생시킨 value의 값을 주입 [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/apply/applyMain.jsp#L67)
```javascript
 $(".apply-type").click(function() {
   $("#type").val($(this).val());
	});
 ```
 
3. 버튼 클릭으로 인해, form이 post형태로 applyAction.jsp 호출시키며 hidden input의 value값을 type이라는 이름으로 전송 [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/apply/applyMain.jsp#L106)
 ```html
 <form action="apply/applyAction.jsp" method="post" class="form-inline" onsubmit="return check()">
   <input type="hidden" id="type" name="type" value="">
 ```
 
4. applyAction.jsp 에서 type과 함께 리다이렉트 [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/apply/applyAction.jsp#L10)
```jav
if(type.equals("1")){
		response.sendRedirect("../index.jsp?go=apply/applyForm.jsp&menu_one=8&menu_two=9&type=1");
	}else{
		response.sendRedirect("../index.jsp?go=apply/applyForm.jsp&menu_one=8&menu_two=9&type=2");
	}
```
5. type 값에 따라, Form 입력창 다르게 보여줌 [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/apply/applyForm.jsp#L192)
```html
<%if(type.equals("2")){%>
 <tr>
  <th>총 인원수</th>
  <td>
   <input type="number" name="person" id="person" class="form-control" required="required" max="50" min="2" value="2">명
  </td>
 </tr>
 <%} else{%>
  <input type="hidden" name="person" value="1">
 <%
 }%>
```
</details>

<details>
    <summary><b>전체동의 체크박스</b></summary> 
 
 - 전체동의 클릭시, 모든 체크박스 체크  
 ![image](https://user-images.githubusercontent.com/80744051/175328159-70be368d-a986-4abb-b27a-78670b005371.png)
 - 체크박스 하나라도 해제 시, 전체동의 체크 해제
![image](https://user-images.githubusercontent.com/80744051/175327870-e51f8bdb-ed10-4c2e-a10a-2cc04b9213f3.png)
 
 [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/join/joinForm.jsp#L42)
 ```javascript
 //약관 전체동의
	$("#optAll").click(function() {
		//체크 true
		 if($("#optAll").prop("checked")){
			$(this).parent().parent().siblings().find(".opt").prop("checked",true);
		} else{
			$(this).parent().parent().siblings().find(".opt").prop("checked",false);
		}
	});
	
	//하위 체크 해제
	$(".opt").click(function() {
		if(!$(this).prop("checked")){
			$("#optAll").prop("checked",false);
		}
	});
 ```
</details>

<details>
    <summary><b>비밀번호 유효성 검사</b></summary>

- **정규식 활용** [:link:](https://github.com/yaejin-park/RunMarathon/blob/f6a064e1eda0ee5523556738e612680e6fe1ad8f/src/main/webapp/join/joinForm.jsp#L123)
    ```javascript
     $("#pass1, pass2").change(function() {
      var pw = $(this).val();
      var num = pw.search(/[0-9]/g);
      var eng = pw.search(/[a-z]/g);
      var engB = pw.search(/[A-Z]/g);
      var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
      if(pw.length < 8 || pw.length > 20){
       alert("8자리 ~ 20자리 이내로 입력해주세요.");
       return false;
       }else if(pw.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
        return false;
       }else if(num < 0 || eng < 0 || engB < 0 || spe < 0 ){
        alert("영문 대소문자+숫자+특수문자를 포함하여 입력해주세요.");
        return false;
       }else {
       console.log("통과"); 
          return true;
       }
     });
    ```

</details>
	
<details>
    <summary><b>참가 신청시, 고려사항</b></summary>
	
- **로그인 여부 체크**
- **신청내역 존재 여부 체크**
- **약관 동의 여부 체크**

[:link:](https://github.com/yaejin-park/RunMarathon/blob/6fc5f3a24e1a4ec91becf1ec2cb8067bcbacac74/src/main/webapp/apply/applyMain.jsp#L73)

```javascript
function check() {
	//로그인 경고
	<%String sessionLogin = (String)session.getAttribute("sessionLogin");
	if(sessionLogin==null){%>
		alert("로그인 이후, 이용가능합니다");
		return true;
		<%} else{
			//이미 신청한 아이디일 경우,
			ApplyDAO dao = new ApplyDAO();
			String id = (String)session.getAttribute("sessionId");
			boolean doubleApply = dao.isDoubleApply(id);
			if(doubleApply){
				%>
				alert("이미 신청한 내역이 존재합니다");
				return false;
				<%
			}else{
			%>
			//약관 동의 경고
			if($("#opt1").is(":checked") && $("#opt2").is(":checked")){
				return true;
			} else{
				alert("약관에 동의해주세요");
				return false;
			}
		<%}
	}%>  
}
```
	
</details>


## :unlock: 트러블슈팅
<details>
  <summary><b>컬럼을 하나로 통합? 혹은 분리?</b></summary>
 
- **문제상황**
	- 처음에는 전화번호, 주소를 insert시, 분리된 input의 데이터를 구분자를 통해 합쳐서 한 컬럼에 insert하였다.
	하지만, 후에 정보수정을 위해 다시 분리된 input으로 가져올 때, 무엇을 기준으로 데이터를 분리해서 가져와야하는 것인지에 대한 문제점이 생겼다.
- **해결방법**
	- 전화번호는 컬럼 하나로
	why? 각 데이터마다 "-"라는 정해진 구분자로 구분이 가능.
	따라서 데이터를 가져올 때, "-"로 split하여 분리된 input에 데이터를 넣을 수 있다.
	- 주소는 컬럼 분리
	why? 정해진 구분자가 없으므로, 한 컬럼에 기본주소와 상세주소를 합쳐서 insert시, 다시 분리할 때 구분기준이 모호함.
	그래서 addr1, addr2로 컬럼을 구분하여 주소를 각각 저장하는 편이 더 편리하다고 생각했음.
- **느낀점**
	- 테이블 구조를 미리 치밀하게 계획해야 개발의 효율성을 높일 수 있다는 것을 깨달았다.
	- 다시 생각하니, 컬럼을 다 분리하는 게 제일 효 방법일 것이라는 생각이 든다. 
</details>

<details>
  <summary><b>DB백업파일 없이, RDS 삭제</b></summary>
 
- **문제상황**
    - DB로 아마존의 RDS를 활용했다. RDS 연결을 끊어도 로컬DB에서는 데이터가 살아있을 줄 알고, 무료 이용기간이 끝나기 전 백업과정없이 RDS를 삭제했다. 그 결과, DB가 쥐도새도 없이 통째로 날아가버리는 참사가 벌어졌다.
- **해결방법**
    - 노션에 정리해뒀던 테이블 생성 SQL로 DB틀 복원
    - 혹시나 하는 마음에 테이블 생성 SQL은 노션에 업로드 하기로 팀규칙을 세웠는데, 그로 인해 테이블 틀정도는 복원할 수 있었다.
- **느낀점**
    - 프로젝트 시, DB 더미파일은 꼭 백업해둬야겠다.
    - 코드를 중간중간 백업해두는 것의 중요성을 깨달았다.
</details>

	
## 🏸 회고
### 잘한 점
- **사용자 중심**으로 생각하며 세세한 기능 하나하나도 놓치지 않기
   - 마라톤 신청폼 작성 시, 로그인된 사용자 정보를 불러오기 체크박스 만들기
   - 개인참가로 신청해도 참가 수정시, 인원수정 폼을 나타나게 하여 단체참가로도 빠르게 전환 가능
   - 전화번호 입력시, 입력 끝나면 다른 입력폼으로 포커스 이동
   - 참가신청 시, 로그안하지 않았을 시, 로그인 페이지로 바로 이동
					
- **AWS** 에 도전
    - 사이트배포 및 RDS사용을 위해 AWS에 도전하였다. AWS개념을 익히기 위해 여러 유튜브 강의도 듣고, 사용법을 찾기 위해 구글링도 꼬박 3일은 한 것 같다. 구글링하는 곳마다 정보도 제각각이고, 친절하게 처음부터 끝까지 알려주는 곳이 없어 애를 많이 먹었다. 그래도 여러 군데의 구글링을 통합한 결과, 팀원들에게 RDS 설정도 직접 다 해줄 수 있을 정도로 AWS를 익힐 수 있었다. 이 경험으로 구글링만으로도 새로운 기술을 스스로 익일 수 있다는 것을 깨닫게 되었다.

- 조장으로서 **솔선수범**
    - 조장으로서 그리고 힘들어도 다 살이되고 피가된다는 마인드로 매번 '제가 할게요'를 외쳤다.
    - 기획회의 시간 전에 미리 스토리보드를 작성해와서 기획 회의 시간을 2시간으로 단축시켰다.	
    - 다들 엄두를 못내는 AWS공부에 솔선수범하여, 몇날며칠을 구글링하고 강의를 찾아본 끝에 결국 RDS를 활용할 수 있게 되었다.
    - 발표 당일, 급하게 사이트 시연이 필요하게 되었다. 이번에도 조장으로서 '제가 할게요'를 외쳤다. 20분 남짓한 시간동안 효율적인 동선으로 사이트 시연을 할 수 있는 방법을 연구하여 프로젝트의 기능을 세세하게 다 보여줄 수 있는 시연발표를 진행할 수 있었다.
					
- 하나부터 열까지 **기획**
    - 미리 수십개의 마라톤 사이트를 찾아보며, 필요한 기능, UI/UX 등을 참고하였다.
    - 단순한 사이트 하나에도 세세하게 기획을 하다보니, 오히려 개발보다 더 복잡하다는 생각이 들었다.
					

### 아쉬웠던 점
- **테이블 구조**를 미리 치밀하게 계획할 것
   -  개발과정에서 테이블 구조를 변경해야하는 일이 많이 발생했다. 
   -  테이블 구조를 변경하면, dto, dao, jsp를 다~ 변경해야해서 

- **비밀번호 보안**의 부족함
    - 비밀번호 분실시, 본인인증 질문을 통해 이전 비밀번호를 알려주는 형태로 기능을 구현
       -> 메일인증을 통해 비밀번호 재설정했다면  비밀번호 노출 없이 
    - 비밀번호를 DB에 저장시, 암호화시키지 않았다. 다음에는 SpringSecurity나 JWT token을 사용해보고 싶다.

- **테스트** 과정의 중요성을 깨닫다
    - 테스트에 큰 시간이 소요되지 않을 것이라 생각하고 마감 이틀 전에 테스트와 유지보수를 하기로 계획을 했는데 생각보다 많은 오류들과 마주하게 되었다.
    - 입력을 다 하지 않고 신청을 눌러도 신청이 된다거나, 숫자만 들어가야하는 칸에 문자도 들어간다거나 등등..
    - 테스트, 유지보수에 시간을 넉넉히 투자해야겠다는 생각과 테스트케이스를 미리 작성해놓으면 더 효율적이겠다는 생각을 했다.
	
- **Dummy 파일** 꼭 만들어 놓기
    - RDS로 DB를 활용한 후, 유료 전환이 되기 전에 RDS를 끊는다는 게 DB를 다 날리는 상황으로 이어졌다.
    - 그나마 다행히, 혹시나 해서 테이블을 만들 때, SQL을 노션에 정리해둬서 어느정도 복원은 가능했지만, 프로젝트가 끝날 때는 Dummy로 DB파일을 정리해두면 포폴 관리에 도움이 많이 될 것이라고 생각이 든다.
