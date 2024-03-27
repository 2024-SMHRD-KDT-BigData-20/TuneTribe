<%@page import="com.smhrd.model.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%
// 로그인 정보 가져오기
UsersVO login_vo = (UsersVO) session.getAttribute("login_vo");

%>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myinfotap</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="assets/css/styles.css" rel="stylesheet" />

</head>
<body>
	<article id="signin">
		<h1 class="major">SIGN IN</h1>
		<form method="post" id="logincheck">
			<div class="fields">
				<div class="field">
					<p>${login_vo.user_id}</p>
					<input type="hidden" value="${login_vo.user_id}" id="user_id" />
				</div>
				<div class="field">
					<label for="user_pw">PW</label>
					<input type="text" name="user_pw" id="user_pw" style="color:black;!important"/>
				</div>
			</div>
			<ul class="actions">
				<li><input type="button" id="logincheckbtn" value="로그인"></li>
			</ul>
		</form>
	</article>

	<!-- signup -->
	<article id="signup" style = display:none>
		<h1 class="major">SIGN UPDATE</h1>
		<form method="post" action="JoinCon">
			<div class="fields">
				<div class="field">
					<label for="user_pw">PW</label> <input type="password" name="user_pw1"
						id="user_pw1" style="color:black;!important"/>
				</div>
				<div class="field">
					<label for="user_pw">PW확인</label> <input type="password" name="user_pw2"
						id="user_pw2" style="color:black;!important"/>
				</div>
				<div class="field">
					<label for="user_nick">NICKNAME</label> <input type="text"
						name="user_nick" id="user_nick" style="color:black;!important"/>
				</div>
				<div class="field">
					<label for="user_birthdate">BIRTHDATE</label> <input type="date"
						name="user_birthdate" id="user_birthdate" style="color:black;!important" />
				</div>
				<div class="field">
					<select name="user_gender" id="user_gender">
						<option value="">GENDER</option>
						<option value="1">MALE</option>
						<option value="2">FEMALE</option>
						<option value="3">OTHER</option>
					</select>
				</div>
			</div>
			<ul class="actions">
				<li><input type="button" id="updatebtn" value="수정"></li>
				<li><input type="reset" value="Reset" /></li>
			</ul>
		</form>
	</article>

<script>
$("#logincheckbtn").click(function(){
	var logindata = JSON.stringify({
        user_id: $("#user_id").val(),
        user_pw: $("#user_pw").val(),
    });
	console.log(logindata);
	$.ajax({
		url:"LoginCheckCon",
		type:"post",
		data:logindata,
		contentType: 'application/json',
		dataType: 'json',
		success:function(login_vo){
			if(login_vo != null){
			$("#signup").show();
			console.log("로그인확인!");
			console.log(login_vo);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('Error: ' + textStatus + ' ' + errorThrown);
		    console.log(jqXHR.responseText); // 서버 응답 텍스트를 로그로 출력
		    alert("로그인 확인 실패!");
        }
	});
});



$("#updatebtn").click(function(){
	var dataset={
		user_id : $("#user_id").val(),
		user_pw1 : $("#user_pw1").val(),
		user_pw2 : $("#user_pw2").val(),
		user_nick : $("#user_nick").val(),
		user_birthdate : $("#user_birthdate").val(),
		user_gender : $("#user_gender").val()
	};
	console.log(dataset);
	$.ajax({
		url:"MyInfoUpdateCon",
		type:"post",
		data:dataset,
		success:function(){
			console.log("수정완료");
		},
		error: function(jqXHR, textStatus, errorThrown) {
            console.log('tab failed: ' + textStatus + ' ' + errorThrown);
            alert("수정실패");
        }
	});
	
	
});
</script>

</body>
</html>