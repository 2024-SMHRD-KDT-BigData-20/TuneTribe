<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.FestivalsVO"%>
<%@page import="com.smhrd.model.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%
// 로그인 정보 가져오기
UsersVO login_vo = (UsersVO) session.getAttribute("login_vo");
// 선택한 페스티벌 정보 가져오기
String fes_idx = (String) session.getAttribute("fesIdx");
System.out.print("fes_idx =" + fes_idx);
%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>fesinfotap</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<script>
	$(document).ready(
			function() {
				var fes_idx = <%=fes_idx%>
		var imgroute = "./assets/fes_poster/" // 포스터 이미지 경로
				$.ajax({
					url : 'FesinfoCon',
					type : 'get',
					data : {
						'fes_idx' : fes_idx
					}, // JSON 문자열로 변환
					dataType : 'json', // 응답 데이터 타입
					success : function(res) {
						let data = "";
						data += "<h5 class=\"text-white mb-3\" align=\"center\">" + res.fes_name + "</h5>";
						data += "<h5 class=\"text-white mb-3\" align=\"center\">INFO</h5>";
						data += '<br>'
						data += '<hr style="color: lightgray; margin-bottom: 55px;">'
						data += "<p class=\"text-white mb-3\" align=\"center\">" + res.fes_location + "</p>";
						data += "<p class=\"text-white mb-3\" align=\"center\">" + res.fes_st_dt + " ~ ";
						data += res.fes_ed_dt + "</p>";
						var imgPath = imgroute + res.fes_poster;
						data += '<img src="' + imgPath + '" alt="" width="400" height="600" style="display: block; margin-left: auto; margin-right: auto;" align="center">';
						$("#feed").append(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
					}
				}); // ajax 끝

			}) // function 끝
</script>

</head>
<body>

		<!-- feed start -->
		<div class="container-fluid bg-black" style="padding-top:300px;" align="center">

			<div class="feed"  style="width: 600px;" id="feed"></div>
		</div>
		<!-- feed ends -->

</body>
</html>