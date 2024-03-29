<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>TuneTribe</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<link href="https://fonts.googleapis.com/css?family=Russo+One&display=swap" rel="stylesheet">


<style type="text/css">
.russo-one-regular {
  font-family: "Russo One", sans-serif;
  font-weight: 400;
  font-style: normal;
}


.inner {
font-family: "Russo One", sans-serif;
}

.image-box {
width: 60%;
height: 60%;
overflow: hidden;
margin: 0 auto;
}
.image-thumbnail {
width: width: 100%;
height: 100%;
object-fit: cover;
}

#wrapper {
width: 100%;
height: 100%;
postion: relative;
}
#wrapper::before {
width: 100%;
height: 100%;
content: "";
background: url("./assets/img/index_festival.jpeg");
background-size: cover;
position: absolute;
top:0px;
left:0px;
z-index: -1;
opacity: 0.5;
}
</style>


</head>
<body class="is-preload">

	<!-- <수정한 척> -->
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo">
				<i class="fas fa-music"></i>
			</div>
			<div class="content">
				<div class="inner">
					<h1>TuneTribe</h1>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#signin">SIGN IN</a></li>
					<li><a href="#signup">SIGN UP</a></li>
				</ul>
			</nav>
		</header>
		<!-- </div> -->

		<!-- Main -->
		<div id="main">
			<!-- signin -->
			<article id="signin">
				<h1 class="major">SIGN IN</h1>
				<form method="post" action="LoginCon" id="login_form">
					<div class="fields">
						<div class="field">
							<label for="user_id">ID</label> <input type="text" name="user_id" />
						</div>
						<div class="field">
							<label for="user_pw">PW</label> <input type="text" name="user_pw" />
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="SIGN IN" class="primary" /></li>
						<li id="is_login_success"></li>
					</ul>
				</form>
			</article>

			<!-- signup -->
			<article id="signup">
				<h1 class="major">SIGN UP</h1>
				<form method="post" action="JoinCon" id="join_form">
					<div class="fields">
						<div class="field">
							<label for="user_id">ID</label> <input type="text" name="user_id"
								id="user_id" oninput="checkId()" />
							<!-- id ajax 중복체크 -->
							<span class="id_ok" style="display: none;">사용 가능한 아이디입니다.</span>
							<span class="id_already" style="display: none;">누군가 이 아이디를
								사용하고 있어요.</span>
						</div>
						<div class="field">
							<label for="user_pw">PW</label> <input type="password"
								name="user_pw" id="user_pw" />
						</div>
						<div class="field">
							<label for="user_pw_confirm">CONFIRM PW</label> <input
								type="password" name="user_pw_confirm" id="user_pw_confirm" />
						</div>
						<div class="field">
							<label for="user_nick">NICKNAME</label> <input type="text"
								name="user_nick" id="user_nick" />
						</div>
						<div class="field">
							<label for="user_birthdate">BIRTHDATE</label> <input type="date"
								name="user_birthdate" id="user_birthdate" />
						</div>
						<div class="field">
							<select name="user_gender">
								<option value="">GENDER</option>
								<option value="1">MALE</option>
								<option value="2">FEMALE</option>
								<option value="3">OTHER</option>
							</select>
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="SUBMIT" class="primary" /></li>
						<li><input type="reset" value="Reset" /></li>
						<li id="is_password_same"></li>
					</ul>
				</form>
			</article>

		</div>

		<!-- Footer -->
		<footer id="footer"> </footer>

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		// 로그인 시 아이디와 비밀번호가 맞는지 확인
		$(document).ready(function() {
			// 폼 제출 시 실행
			$("#join_form").submit(function(event) {
				// user_pw 및 user_pw_confirm 필드의 값을 가져옴
				var password = $("#user_pw").val();
				var confirmPassword = $("#user_pw_confirm").val();

				// 두 비밀번호가 일치하는지 확인
				if (password != confirmPassword) {
					// 일치하지 않으면 사용자에게 알림
					alert("Passwords do not match.");
					// 폼 제출 방지
					event.preventDefault();
				}
			});
		});

		// 회원가입 시 아이디 중복확인
		function checkId() {
			var user_id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
			$.ajax({
				url : 'IdConfirmCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					user_id : user_id
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
					} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
						alert("아이디를 다시 입력해주세요");
						$('#user_id').val();
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};

		// 회원가입 시 비밀번호 확인
		
	</script>


</body>
</html>
