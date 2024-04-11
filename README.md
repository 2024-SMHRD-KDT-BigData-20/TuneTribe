# 🎇 TuneTribe (팀명: 정시퇴근)
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/5360b19d-80f8-4578-9f7d-ff747a7356ee)
<br><br>
## 📌 서비스 소개
뮤직 페스티벌 추천 및 특화 SNS
<br><br>
## 📅 프로젝트 기간
2024.03.08. ~ 2024.03.29. (3주)
<br><br>
## 🔧 주요 기능
* 개인 선호 가수 및 장르에 따른 페스티벌 추천
* 페스티벌 관련 정보 제공 및 위치 정보(지도) 제공
* 각 페스티벌마다 리뷰 게시글 작성 및 댓글 작성
* 마이페이지에서 제공하는 나만의 리뷰 게시판
<br><br>
## ⛏ 기술스택
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
            <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/> 
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/BootStrap-7952B3?style=for-the-badge&logo=BootStrap&logoColor=white"/>
            <img src="https://img.shields.io/badge/KakaoMap-FFCD00?style=for-the-badge&logo=Kakao&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/> 
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
        </td>
    </tr>
</table>
<br><br>

## 서비스 흐름도<br>
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/9c2f4d34-ce00-4713-bb3a-19f27ce5dc72)
<br><br>

## 메뉴 구성<br>
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/cc07162b-e2ea-4bdf-9445-cb74d6ddcb66)
<br><br>

## ER 다이어그램<br>
![20240329 ERD](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/ccfb5679-37eb-4ccd-9786-4e60fa695696)
<br><br>

## 유스케이스 다이어그램<br>
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/cb900851-f56b-4baa-b27d-cc235d8c07c8)
<br><br><br>

## 🖥 화면 구성

### 로그인/회원가입
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/7f0d693e-f7eb-4583-adaf-dbe4aef1851e)<br><br>
*웹사이트 접속 시 가장 먼저 보이는 모습<br>
① SIGN IN을 통해 로그인<br>
② SIGN UP을 통해 회원가입<br>

### 메인 페이지
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/4eb2613a-0b5e-4bed-ba55-c23cc5aeed3a)<br><br>
 ✔️ 추천 페스티벌 보여주기<br>
 ✔️ 상단에 고정 바 활용<br>
 ✔️ 다른 페이지로 이동 기능<br><br>
① 로고 : 클릭 시 현재 메인 화면으로 이동<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어느 페이지에서 클릭해도 이동<br>
② 마이페이지 : 마이페이지로 이동<br>
③ 검색 : 검색 화면으로 이동<br>
④ 로그아웃 : 로그아웃 기능 구현<br> 
⑤ 추천 페스티벌 : 추천하는 페스티벌 보여줌<br><br>

![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/97d6dd89-c097-4d36-be99-753f9a0e6e75)<br><br>
 ✔️ 다가오는 페스티벌 보여주기<br>
 ✔️ 검색 기능<br>
 ✔️ 상단 고정바<br>
 ✔️ 다른 페이지로 이동 기능<br><br>
① 상단바 : 고정된 상단바로 스크롤을 내려도 상단바의 기능 이용 가능<br>
② 추천 페스티벌에서 스크롤을 내릴 시, 다가오는 순서대로 페스티벌 보여줌<br><br>

### 페스티벌 페이지
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/ea628d39-bc44-4f3f-8c5d-904481f85dc7)<br><br>
 ✔️ 상단 고정바<br>
 ✔️ 비동기 방식의 탭 기능으로 각종 페이지 화면 띄우기<br><br>
① 상단바 : 고정된 상단바로 스크롤을 내려도 상단바의 기능 이용 가능<br>
② 탭 기능으로 화면을 움직여도 사이드 탭은 고정, 가운데 페이지만 변경<br>
③ 게시글과 이미지파일을 선택하여 게시물 작성 가능<br>
④ 작성된 게시물들의 게시글 내용과 이미지 파일, 작성자, 좋아요 수 확인 가능<br>
⑤ 게시글의 댓글과, 좋아요, 게시글 삭제 기능<br>
⑥ 댓글 작성, 댓글 조회 기능<br><br>

![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/9d48d971-09e5-4bc5-b45f-1ff8c45aa79c)<br><br>
① 페스티벌 탭 : 페스티벌의 기본 포스터 이미지, 페스티벌 장소 및 일정을 텍스트로 보여줌<br>
② 라인업 탭 : 페스티벌의 라인업 리스트를 보여줌<br>
③ 지도 탭 : 페스티벌 장소를 지도 API로 자동 검색하여 위치를 보여줌<br><br>

### 마이 페이지
![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/b1395229-56d8-4b4f-a0f8-01ffc42a3e22)<br><br>
 ✔️ 상단 고정바<br>
 ✔️ 비동기 방식의 탭 기능으로 각종 페이지 화면 띄우기<br><br>
① 상단바 : 고정된 상단바로 스크롤을 내려도 상단바의 기능 이용 가능<br>
② 탭 기능으로 화면을 움직여도 사이드 탭은 고정, 가운데 페이지만 변경<br>
③ 게시글과 이미지파일을 선택하여 게시물 작성 가능<br>
④ 작성된 게시물들의 게시글 내용과 이미지 파일, 작성자, 좋아요 수 확인 가능<br>
⑤ 게시글의 댓글과, 좋아요, 게시글 삭제 기능<br>
⑥ 댓글 작성, 댓글 조회 기능<br><br>

![image](https://github.com/2024-SMHRD-KDT-BigData-20/TuneTribe/assets/148893093/6cfaa486-1ea2-42af-b80e-c092a00ac1c3)<br><br>
① 회원정보수정 : 패스워드가 확인 완료되면 패스워드, 닉네임, 생년월일, 성별 정보 업데이트<br>
② 선호도선택 : 선호 가수, 선호 장르를 선택할 수 있음<br>
③ DB에 저장된 가수와 장르를 누를 수 있음<br>
④ DB에 저장된 가수와 장르를 검색할 수 있음<br>
⑤ 가수, 장르를 선택하면 내가 선택한 가수와 장르를 여러 개 볼 수 있음<br>
⑥ 선택한 가수와 장르를 데이터에 저장<br><br>


## 👨‍👩‍👦‍👦 팀원 역할

<table>
  <tr>
    <td align="center"><img src="https://item.kakaocdn.net/do/fd49574de6581aa2a91d82ff6adb6c0115b3f4e3c2033bfd702a321ec6eda72c" width="100" height="100"/></td>
    <td align="center"><img src="https://mb.ntdtv.kr/assets/uploads/2019/01/Screen-Shot-2019-01-08-at-4.31.55-PM-e1546932545978.png" width="100" height="100"/></td>
    <td align="center"><img src="https://i.pinimg.com/236x/ed/bb/53/edbb53d4f6dd710431c1140551404af9.jpg" width="100" height="100"/></td>
    <td align="center"><img src="https://pbs.twimg.com/media/B-n6uPYUUAAZSUx.png" width="100" height="100"/></td>
  </tr>
  <tr>
    <td align="center"><strong>김어진</strong></td>
    <td align="center"><strong>이정주</strong></td>
    <td align="center"><strong>이종명</strong></td>
    <td align="center"><strong>정희헌</strong></td>
  </tr>
  <tr>
    <td align="center"><b>Frontend/Backend</b></td>
    <td align="center"><b>Frontend/Backend</b></td>
    <td align="center"><b>Database</b></td>
    <td align="center"><b>Backend</b></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/naomi-kim9" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/lliillllI" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/yeejongmyung" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/HUI-HEON" target='_blank'>github</a></td>
  </tr>
</table>

<br><br>
## 🤾‍♂️ 트러블슈팅
<p>문제 해결을 위해 문제의 원인을 논리적이고 체계적으로 찾는 일이며 제품이나 프로세스의 운영을 재개<br>
프로젝트 진행하는 동안 발생했던 이슈 중 가장 기억에 남았던 문제와 해결 프로세스 나열</p>
<br><br>

<strong><문제 1></strong><br>
<p> : 페스티벌 추천 알고리즘 적용 시 테이블 분리의 필요성</p>
  (1) 사용자의 가수, 장르 선호를 입력받아 각각 점수 계산을 해야 했음<br>
  (2) 초기 DB 설계에서 가수, 장르를 사용자 선호 테이블에 한꺼번에 입력받았더니, 쿼리문이 더욱 복잡해지는 문제가 발생<br>
  (3) 사용자가 선호하는 가수 테이블, 사용자가 선호하는 장르 테이블로 분리했더니 편리한 점수 계산이 가능해짐<br><br>

<strong><문제 1></strong><br>
<p> : 게시판 페이지 접속 시 4가지 일(게시글 로딩, 게시글 입력 창 로딩, 댓글 로딩, 댓글 입력 창 로딩) 비동기식으로 동시 가능하게 해야 했음</p>
  (1) AJAX 성공 콜백 함수 안에 성공 콜백 함수를 연속으로 작성하다 보니 너무 복잡해짐<br>
  (2) 함수를 따로 분리하여 코드를 간결하게 <br>
  (3) 동적으로 생성되는 요소에는 인라인 방식으로 스타일 적용<br><br>
