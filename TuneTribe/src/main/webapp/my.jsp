<%@page import="com.smhrd.model.FestivalsVO"%>
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
<title>Mypage</title>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="assets/css/styles.css" rel="stylesheet" />

<!-- MyPage 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />




<script>
$(document).ready(function (){
	var user_id = "${login_vo.user_id}"
	console.log(user_id)
	var imgroute = "./img/"
	$.ajax({
		url : 'MyReviewListCon',
		type : 'get',
		data: {'user_id': user_id}, // JSON 문자열로 변환
        dataType: 'json', // 응답 데이터 타입
        success: function(res){
        	console.log(res); //json
			// 태그 내용 담을 변수
			let data="";
			for(let i=0;i<res.length;i++){
				data += "<div class=\"container px-4 px-lg-5 bg-light\" style='padding-top: 20px;'>"; // 게시물 감쌀 공간
				
				data += "<p style=\"display: none;\">" + res[i].b_idx + "</p>";
				data += "<p class=\"text-black mb-3\" align=\"left\">작성자: " + res[i].user_id + "</p>";
				data += "<div style='border: 1px solid darkgray; border-radius: 5px; padding-top: 15px;'><p class=\"text-black mb-3\" align=\"center\">" + res[i].b_content + "</p></div>";
				data += "<p class=\"text-black mb-3\" align=\"right\" style='font-size: 15px;'>" + res[i].b_likes + " likes</p>";
				
				var imgPath = imgroute + res[i].b_file;
				// img-fluid 클래스: 반응형
				data += '<img src="' + imgPath + '" alt="" class="img-fluid"><br><br>';

				data += "<button class=\"cmt_pop_btn\" data-post-id=\"" + res[i].b_idx + "\" style=\"color: #fff; background-color: #64a19d; border-color: #64a19d;\">Comments</button>";
				data += '&nbsp;<button class="like_btn" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Likes</button>'; // 좋아요 버튼(구현 전)
 
				data += "<br><br><hr><br><br></div>"; // 게시물 구분선

			} // for 끝
			$("#postbox").empty();
            $("#postbox").append(data);
        } // reviewlist success 끝
		
	}); // reviewlist ajax 끝
	
}) // function 끝

</script>









</head>


<body id="page-top">


	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container-fluid" style="display: flex; width: 80%; padding-left: 50px; padding-right: 50px;">
			<a class="navbar-brand" href="main.jsp"><h2>TuneTribe Logo</h2></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation" style="align-self: flex-start;">
				Menu <i class="fas fa-bars"></i>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarResponsive" style="justify-content: flex-end;">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="my.jsp"> <span
							class="material-symbols-outlined">person</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="searchResult.jsp"> <span
							class="material-symbols-outlined">search</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutCon"> <span
							class="material-symbols-outlined"> logout </span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>






	<nav class="search-section navbar navbar-expand-lg bg-black">
		<div class="container-fluid">
			<!-- navbar 안에 container 3개 넣기! -->


			<!-- sidebar starts -->

			<div class="container-px-1 px-lg-2 navbar-inverse"
				style="width: 300px;">
				<div class="sidebar" style="width: 300px;">

					<div class="sidebarOption active" align="center">
						<span class="material-icons text-white mb-3"> home </span>
						<h5 data-tab="myreviewtap" class="tabmenu text-white mb-3">HOME</h5>
					</div>
					<br>
					<div class="sidebarOption" align="center">
						<span class="material-icons text-white mb-3"> search </span>
						<h5 data-tab="myinfotap" class="tabmenu text-white mb-3">회원정보수정</h5>
					</div>
					<br>
					<div class="sidebarOption" align="center">
						<span class="material-icons text-white mb-3">
							notifications_none </span>
						<h5 data-tab="favchoose" class="tabmenu text-white mb-3">선호도선택</h5>
					</div>
				</div>
			</div>
			<!-- sidebar ends -->

			<!-- feed start -->
			<div class="feed"  style="width: 600px;" id="feed">

				<div class="container-fluid bg-black" style="padding-top:300px;" align="center">
					<h5 class="text-white mb-5" align="center">${login_vo.user_id}</h5>
					<section class="search-section bg-black">
						<!-- 위 3줄 건들지 말기 -->

						<div class="text-center">
						<!-- 리뷰적는 곳 시작 -->
							<div class="reviewbox">
								<form id="uploadForm" enctype="multipart/form-data">
									<input type="hidden" value="${login_vo.user_id }" id="user_id">
									<input type="hidden" value="999" id="fes_idx">

									<div style="display: flex; justify-content: center;">
										<input type="text" id="reviewtext"
											style="width: 400px; height: 150px;">
									</div>
									<div>		
										<input type="file" id="file" class="btn btn-primary"
											style="height: 50px; width: 100px; margin: 0 auto; display: block;">

										<button type="button" id="reviewbtn" value="upload"
											class="btn btn-primary" style="height: 50px; width: 100px;">작성</button>
									</div>
								</form>
							</div>
						<!-- 리뷰적는 곳 끝 -->


							<p>
								<br> <br>
							</p>


							<!-- 리뷰목록 시작 -->
							<div class="container-fluid bg-dark postbox" id="postbox">
							
							</div>			
							<!-- 리뷰목록 끝 -->
						</div>
					</section>
				</div>
			</div>
			<!-- feed ends -->



			<!-- 채팅창 넣는 자리 -->
			<div class="container-px-1 px-lg-2"
				style="width: 300px; align-content: right;">

				<div class="widgets__widgetContainer">
					<h2>채팅창 넣는 자리입니다.</h2>
				</div>
			</div>
		</div>
	</nav>
	
	



	<script>
	var Button = document.getElementById("reviewbtn");
	
	Button.addEventListener('click', () => {
		var formData = new FormData();
		var b_content = $('#reviewtext').val();
		var b_file = $('#file')[0].files[0];
		var user_id = $('#user_id').val();
		var fes_idx = "999";
		
		formData.append("b_content",b_content);
		formData.append("b_file",b_file);
		formData.append("user_id",user_id);
		formData.append("fes_idx",fes_idx);
		
		$.ajax({
			url : 'ReviewCon',
			type : 'Post',
			data : formData,
			contentType: false,
            processData: false,
            success: function myreviewlist(){
            	var user_id = "${login_vo.user_id}"
            	var imgroute = "./img/"
            	$.ajax({
            		url : 'MyReviewListCon',
            		type : 'get',
            		data: {'user_id': user_id}, // JSON 문자열로 변환
                    dataType: 'json', // 응답 데이터 타입
                    success: function(res){
                    	console.log(res); //json
            			let data="";
            			for(let i=0;i<res.length;i++){
            				// 태그 내용 담을 변수
                            data += "<div class=\"container px-4 px-lg-5 bg-light\" style='padding-top: 20px;'>"; // 게시물 감쌀 공간
							
            				data += "<p style=\"display: none;\">" + res[i].b_idx + "</p>";
            				data += "<p class=\"text-black mb-3\" align=\"left\">작성자: " + res[i].user_id + "</p>";
            				data += "<div style='border: 1px solid darkgray; border-radius: 5px; padding-top: 15px;'><p class=\"text-black mb-3\" align=\"center\">" + res[i].b_content + "</p></div>";
            				data += "<p class=\"text-black mb-3\" align=\"right\" style='font-size: 15px;'>" + res[i].b_likes + " likes</p>";
            				
            				var imgPath = imgroute + res[i].b_file;
            				// img-fluid 클래스: 반응형
            				data += '<img src="' + imgPath + '" alt="" class="img-fluid"><br><br>';

            				data += "<button class=\"cmt_pop_btn\" data-post-id=\"" + res[i].b_idx + "\" style=\"color: #fff; background-color: #64a19d; border-color: #64a19d;\">Comments</button>";
            				data += '&nbsp;<button class="like_btn" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Likes</button>'; // 좋아요 버튼(구현 전)
             
            				data += "<br><br><hr><br><br></div>"; // 게시물 구분선

            			} // for 끝
            			$("#postbox").empty();
                        $("#postbox").append(data);
                        $("#reviewtext").val(""); // 텍스트 필드 초기화
                        $("#file").val(""); // 파일 입력 필드 초기화
                    } // reviewlist success 끝
            		
            	}); // myreviewlist ajax 끝
            	
            }, // myreviewlist success 끝
            error: function(jqXHR, textStatus, errorThrown) {
                console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
            } // reviewlist error 끝
		}); // reviewbtn ajax 끝
	}); // 버튼클릭 끝
	
	
	
	
    	// tab operation
    	 $('.tabmenu.text-white.mb-3').click(function() {
    		var activeTab = $(this).attr('data-tab');	
    		$.ajax({
    		    type : 'GET',                 //get방식으로 통신
    		    url : activeTab + ".jsp",    //탭의 data-tab속성의 값으로 된 html파일로 통신
    		    //dataType : "html",            //html형식으로 값 읽기
    		    success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
    		      	$('#feed').html(data);
    		    }, // success 끝
    		    error: function(jqXHR, textStatus, errorThrown) {
                    console.log('tab failed: ' + textStatus + ' ' + errorThrown);
                }
			});	// ajax 끝
    	}); // tab operation 끝
    </script>


	<!-- footer -->
	<footer class="footer bg-black small text-center text-white-50">
		<a href="#page-top"><span class="material-symbols-outlined">arrow_upward</span></a>
		<br> <br>
		<div class="container px-4 px-lg-5">Copyright &copy; TuneTribe
			2024</div>
	</footer>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="assets/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>