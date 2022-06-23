# 🏃RunMarathon 마라톤 예약 사이트
 마라톤 예약사이트이자 커뮤니티 사이트<br><br>
![image](https://user-images.githubusercontent.com/80744051/175223634-ff43c583-c48a-4702-92d9-b952519e2721.png)
![image](https://user-images.githubusercontent.com/80744051/175223433-e8063e71-6b0a-4b11-bc82-80efa5ca100d.png)

## :two_men_holding_hands:팀프로젝트
 - **개발기간** : 2021.9.29 - 2021.10.15 <br>
 - **개발인원** : 5명<br>
 - **역할분담**<br>
   - **박예진(본인)** : 조장, 회원가입/로그인, 참가신청, 마이페이지, AWS
   - 김민지 : 공지사항, QnA, 관리자, git
   - 윤인정 : 회원관리, 마이페이지
   - 한희규 : 메인/소개/일정, 위치/코스/기념품, 유의사항, 대회관리
   - 박규민 : 커뮤니티, 후기
 - **협업tool**<br>
      <details>
        <summary><h4>Git</h4></summary>
        <pre>
          각자의 branch 만들어서, 매일 자신의 브랜치, dev  push
          <img src="https://user-images.githubusercontent.com/80744051/175228550-0a333aaf-5329-4b89-997f-2817c81b7d7a.png" width="500px">       
        </pre>
      </details>
      <details>
        <summary><h4>Notion</h4></summary>
        <pre>
          노션을 활용해 정보 공유 및 일정 공유
          <img src="https://user-images.githubusercontent.com/80744051/175228448-c5c904f4-234a-4153-9ebd-dc21def2592e.png"  width="500px">   
        </pre>
      </details>


## 기술스택
<img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat-square&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/html5-E34F26?style=flat-square&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=flat-square&logo=css3&logoColor=white">  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/jquery-0769AD?style=flat-square&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=flat-square&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=Amazon%20AWS&logoColor=white"/> 

## ERD   
![ERD](https://user-images.githubusercontent.com/80744051/175222667-a779da53-6213-4b59-961b-8d72f8d03f08.PNG)

## 기여부분
:point_right:[전체 PPT](https://drive.google.com/file/d/1o9VqOp-oanydnokMEkRB5zQ-EGHtbwqd/view)
:point_right:[영상ver PPT](https://docs.google.com/presentation/d/1B89wq9jjWCuInfGlFyc1sqVZEbJv4Ii_/edit?usp=sharing&ouid=108125837232154027289&rtpof=true&sd=true)<br>
<details>
  <summary>로그인</summary>
  <pre>  
    <img src="https://user-images.githubusercontent.com/80744051/175223797-5693ec59-a67b-4427-a78b-4a6eb3ce220f.jpg">
    <img src="https://user-images.githubusercontent.com/80744051/175223807-15081967-c798-4661-a5dc-c21f6d7b81d9.jpg">
  </pre>
</details>
<details>
  <summary>회원가입</summary>
  <pre>      
    <img src="https://user-images.githubusercontent.com/80744051/175223822-892903fa-e51f-4a3f-b251-9cfeffe826b6.jpg">  
    <img src="https://user-images.githubusercontent.com/80744051/175223936-b6aefa6b-edbb-4620-a53e-5ac0094d032a.jpg">     
    <img src="https://user-images.githubusercontent.com/80744051/175223954-d68c9237-305d-445a-a4a1-0867ab5af532.jpg">
  </pre>
</details>
<details>
  <summary>참가신청</summary>
  <pre>      
    <img src="https://user-images.githubusercontent.com/80744051/175223988-4f2085f1-adbb-43b7-96bd-74b2df5b2379.jpg">  
    <img src="https://user-images.githubusercontent.com/80744051/175223999-485cab0f-746c-4313-9e55-eaf94cb67ea9.jpg">     
    <img src="https://user-images.githubusercontent.com/80744051/175223954-d68c9237-305d-445a-a4a1-0867ab5af532.jpg">
  </pre>
</details>
<details>
  <summary>마이페이지</summary>
  <pre>      
    <img src="https://user-images.githubusercontent.com/80744051/175224062-2cddb171-42de-4981-9528-27cbf74d7c98.jpg">  
  </pre>
</details>

## 주요 로직
- 전체동의 클릭 체크박스
  ![image](https://user-images.githubusercontent.com/80744051/175226485-45167d7a-1690-4609-8fc2-98e49a76b053.png)
  - 전체동의 클릭시, 전체 

- 참가신청
<details>
  <summary>개인참가/단체참가 클릭시, 하나의 input을 활용해서</summary>
  <div markdown="1">       
    {토글리스트의 content}
  </div>
  <div markdown="1">       
    {토글리스트의 content}
  </div>
</details>

## 트러블슈팅
<details>
  <summary>회원가입 시, 전화번호 입력 Form</summary>
  <div markdown="1">       
     당시, 
  </div>
</details>


## 회고
- 회원가입, 로그인 시 비밀번호 암호화를 하지 않아 아쉬웠다. 다음에는 SpringSecurity, JWT-Token 사용해보고 싶다.
- 테스트 과정에서 전화번호에 숫자가 아닌 글자도 들어간다거나,
