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

</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo">
				<span class="icon fa-gem"> </span>
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
							<label for="user_pw">PW</label> <input type="text" name="user_pw"/>
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
								id="user_id" />
						</div>
						<div class="field">
							<label for="user_pw">PW</label> <input type="password"
								name="user_pw" id="user_pw" />
						</div>
						<div class="field">
							<label for="user_pw_confirm">CONFIRM PW</label> <input type="password"
								name="user_pw_confirm" id="user_pw_confirm" />
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
	$(document).ready(function() {
	    // 폼 제출 시 실행
	    $("#join_form").submit(function(event) {
	        // user_pw 및 user_pw_confirm 필드의 값을 가져옴
	        var password = $("#user_pw").val();
	        var confirmPassword = $("#user_pw_confirm").val();

	        // 두 비밀번호가 일치하는지 확인
	        if(password != confirmPassword) {
	            // 일치하지 않으면 사용자에게 알림
	            alert("Passwords do not match.");
	            // 폼 제출 방지
	            event.preventDefault();
	        }
	    });
	});
	</script>


</body>
</html>
