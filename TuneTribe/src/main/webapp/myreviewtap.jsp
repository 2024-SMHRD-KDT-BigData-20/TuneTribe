<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
<title>myreviewtap</title>


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
	var imgroute = "/tomcatImg/"
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
				data +="<p style='display:none'>" + res[i].fes_idx+"<p>";
                var imgPath = imgroute + res[i].b_file;
                data += '<br><img src="' + imgPath + '" alt="">';
				data += "<p>" + res[i].b_content + "</p>";
                data += "<p>" + res[i].user_id + "</p>";
                data += "<p>" + res[i].b_likes + "</p>";

			} // for 끝
			$("#postbox").empty();
            $("#postbox").append(data);
        } // reviewlist success 끝
		
	}); // reviewlist ajax 끝
	
}) // function 끝

</script>









</head>


<body id="page-top">

	<nav class="search-section navbar navbar-expand-lg bg-black">
		<div class="container-fluid">
			<!-- navbar 안에 container 3개 넣기! -->



			<!-- feed start -->
			<div class="feed"  style="width: 600px;" id="feed">

				<div class="container-fluid bg-black">
					<h5 class="text-white mb-5" align="center">${login_vo.user_id}</h5>
					<section class="search-section bg-black">
						<!-- 위 3줄 건들지 말기 -->

						<!-- 리뷰적는 곳 시작 -->
						<div class="text-center">
							<div class="reviewbox">
								<form id="uploadForm" enctype="multipart/form-data">
									<input type="hidden" value="${login_vo.user_id }" id="user_id">
									<input type="hidden" value="999" id="fes_idx">

									<div style="display: flex; justify-content: center;">
										<input type="text" id="reviewtext"
											style="width: 300px; height: 150px;"> <input
											type="file" id="file" class="btn btn-primary"
											style="width: 100px; margin: 0 auto; display: block;">

										<button type="button" id="reviewbtn" value="upload"
											class="btn btn-primary">작성</button>
									</div>
								</form>
							</div>
							<!-- 리뷰적는 곳 끝 -->


			<br>

							<!-- 리뷰목록 시작 -->
							<div class="postbox" id="postbox"></div>
							
							
							
							<!-- 리뷰목록 끝 -->
						</div>
					</section>
				</div>
			</div>
			<!-- feed ends -->
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
            	var imgroute = "/tomcatImg/"
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
                            var imgPath = imgroute + res[i].b_file;
                            data += '<br><img src="' + imgPath + '" alt="">';
            				data += "<p>" + res[i].b_content + "</p>";
                            data += "<p>" + res[i].user_id + "</p>";
                            data += "<p>" + res[i].b_likes + "</p>";

            			} // for 끝
            			$("#postbox").empty();
                        $("#postbox").append(data);
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