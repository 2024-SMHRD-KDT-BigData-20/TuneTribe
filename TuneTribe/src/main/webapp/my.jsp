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

<style type="text/css">
	input[type="submit"],
	input[type="reset"],
	input[type="button"],
	button,
	.button {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		background-color: transparent;
		border-radius: 4px;
		border: 0;
		box-shadow: inset 0 0 0 1px #ffffff;
		color: #ffffff !important;
		cursor: pointer;
		display: inline-block;
		font-size: 0.8rem;
		font-weight: 300;
		height: 2.75rem;
		letter-spacing: 0.2rem;
		line-height: 2.75rem;
		outline: 0;
		padding: 0 1.25rem 0 1.35rem;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
	}
	label {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		background-color: transparent;
		border-radius: 4px;
		border: 0;
		box-shadow: inset 0 0 0 1px #ffffff;
		color: #ffffff;
		cursor: pointer;
		display: inline-block;
		font-size: 0.8rem;
		font-weight: 300;
		height: 2.75rem;
		letter-spacing: 0.2rem;
		line-height: 2.75rem;
		outline: 0;
		padding: 0 1.25rem 0 1.35rem;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
		position : relative;
	}

		input[type="submit"]:hover,
		input[type="reset"]:hover,
		input[type="button"]:hover,
		button:hover,
		.button:hover {
			background-color: rgba(255, 255, 255, 0.075);
		}
		label:hover,
		.label:hover {
			background-color: rgba(255, 255, 255, 0.075);
		}

		input[type="submit"]:active,
		input[type="reset"]:active,
		input[type="button"]:active,
		button:active,
		.button:active {
			background-color: rgba(255, 255, 255, 0.175);
		}
		label:active,
		.label:active {
			background-color: rgba(255, 255, 255, 0.175);
		}

		input[type="submit"].icon:before,
		input[type="reset"].icon:before,
		input[type="button"].icon:before,
		button.icon:before,
		.button.icon:before {
			margin-right: 0.5em;
		}

		input[type="submit"].fit,
		input[type="reset"].fit,
		input[type="button"].fit,
		button.fit,
		.button.fit {
			width: 100%;
		}
		label.fit,
		.label.fit {
			width: 100%;
		}

		input[type="submit"].small,
		input[type="reset"].small,
		input[type="button"].small,
		button.small,
		.button.small {
			font-size: 0.6rem;
			height: 2.0625rem;
			line-height: 2.0625rem;
		}
		label.small,
		.label.small {
			font-size: 0.6rem;
			height: 2.0625rem;
			line-height: 2.0625rem;
		}

		input[type="submit"].primary,
		input[type="reset"].primary,
		input[type="button"].primary,
		button.primary,
		.button.primary {
			background-color: #ffffff;
			color: #1b1f22 !important;
			font-weight: 600;
		}

		input[type="submit"].disabled, input[type="submit"]:disabled,
		input[type="reset"].disabled,
		input[type="reset"]:disabled,
		input[type="button"].disabled,
		input[type="button"]:disabled,
		button.disabled,
		button:disabled,
		.button.disabled,
		.button:disabled {
			pointer-events: none;
			cursor: default;
			opacity: 0.25;
		}

	input[type="submit"],
	input[type="reset"],
	input[type="button"],
	button {
		line-height: calc(2.75rem - 2px);
	}
	label {
		line-height: calc(2.75rem - 2px);
	}

	input{
		color: #ffffff;
		font-family: "Source Sans Pro", sans-serif;
		font-weight: 300;
		font-size: 1rem;
		line-height: 1.65;
	}
	
	tempbtn {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;	
	}

</style>


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
				data += "<span class=\"text-black mb-3\" align=\"left\">작성자: " + res[i].user_id + "</span>";
				data += "<div style='border: 1px solid darkgray; border-radius: 5px; padding-top: 15px;'><span class=\"text-black mb-3\" align=\"center\">" + res[i].b_content + "</span></div>";
				data += "<p class=\"text-black mb-3\" align=\"right\" style='font-size: 15px;'>" + res[i].b_likes + " likes</p>";
				
				var imgPath = imgroute + res[i].b_file;
				// img-fluid 클래스: 반응형
				data += '<img src="' + imgPath + '" alt="" class="img-fluid"><br><br>';

				data += "<button class=\"cmt_pop_btn\" data-post-id=\"" + res[i].b_idx + "\" style=\"color: #fff; background-color: #64a19d; border-color: #64a19d;\">Comments</button>";
				data += '&nbsp;<button class="like_btn" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Likes</button>'; // 좋아요 버튼(구현 전)
				data += '&nbsp;<button class="delete_btn" data-post-id=\"' + res[i].b_idx + '\" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Delete</button>'; // 삭제 버튼
 
				data += "<br><br><hr><br><br></div>"; // 게시물 구분선

			} // for 끝
			$("#postbox").empty();
            $("#postbox").append(data);
        } // reviewlist success 끝
		
	}); // reviewlist ajax 끝
	
	    // 댓글 로딩 함수
	    function loadComments(postId) {
	    	// var postId = $(this).data('post-id');
	    	$.ajax({
	            url: 'CommentListCon',
	            type: 'GET',
	            data: { 'b_idx': postId },
	            dataType: 'json',
	            success: function(res_cmt) {
	                var modalContent = '';
	                
	                $.ajax({ // 모달창에서 해당 게시물만 가져오는 통신
	                	url: 'EachPostForComment',
	                	type: 'get',
	                	data: {'b_idx': postId},
	                	dataType: 'json',
	                	success: function(res_each_post) {
	                		// 작성자
	                		modalContent += '<table><tr><td colspan=2><span class=\"text-black mb-3\" align=\"left\">작성자:' + res_each_post.user_id + '</span><br>';
	                		// 내용
	                		modalContent += "<div style='border: 1px solid darkgray; border-radius: 5px; padding-top: 15px;'><span class=\"text-black mb-3\" align=\"center\">" + res_each_post.b_content + "</span></div>";
	                		// 이미지
	        				var imgPath = imgroute + res_each_post.b_file;
	        				modalContent += '<img src="' + imgPath + '" alt="" class="img-fluid"></td></tr>';
	        				
	                // 댓글들 보이기
		            for(let j=0; j<res_cmt.length; j++){
    				modalContent +="<td><p style=\"display:none\">" + res_cmt[j].b_idx + "</p>";
    				modalContent +="<p style=\"display:none\">" + res_cmt[j].cmt_idx + "</p>";
    				modalContent += "<table><tr><td>&nbsp;&nbsp;&nbsp;<span class=\"text-black mb-3\" align=\"center\">" + res_cmt[j].user_id + "</span></td>";
    				modalContent += "<td><span class=\"text-black mb-3\" align=\"center\">&nbsp;&nbsp;&nbsp;" + res_cmt[j].cmt_content + "</span></td></tr></table> </td></tr></table>";
    				} // data_cmt 꺼내는 for문 끝
    				
    				// 참고용: 이것도 댓글 모두 출력 가능한 문법인 듯
    				/* res_cmt.forEach(function(cmt) {
    	                modalContent += "<p class=\"text-black mb-3\" align=\"center\">" + cmt.user_id + ": " + cmt.cmt_content + "</p>";
    	            }); */
    				
	                <!-- 댓글 입력 div 시작 -->
   					modalContent += '<form id="commentForm">'
   					modalContent +=	'<div style="display: flex; justify-content: center;">'
   					modalContent +=	'<input type="hidden" value="${login_vo.user_id }" id="user_id_cmt">'
   					modalContent +=	'<input type="text" class="commenttext"'
   					modalContent += 'style="width: 300px; height: 100px; color:black;!important">'
					<!-- 댓글 작성 버튼 -->
   					modalContent += '<button type="button" class="comment_upload_btn" data-post-id="' + postId + '" value="upload" style="height: 50px; width: 100px; color: #fff; background-color: #64a19d; border-color: #64a19d;">Upload</button>'
					<!-- 댓글 입력 div 끝 -->
   					modalContent += '</div>'
    				modalContent += '</form>'
					<!-- 댓글창 닫기 버튼 -->
    				modalContent += '<button class="close_btn" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Close</button>'
    				
    				$('#modalBox').html(modalContent);
    				
	                // 모달 박스와 배경을 표시
	                $('#modalBox').fadeIn(1000);
	                $('#modalBg').fadeIn(1000);
	                	},
	                	error: function(xhr, status, error){
	    	                console.error(error);
	    	            }
	                	
	                });
	            }
	        });
	    }
	    
	    // 'Comments' 버튼 클릭 이벤트: 모달창
	    $(document).on('click', '.cmt_pop_btn', function() {
	        var postId = $(this).data('post-id');
	        loadComments(postId); // 댓글 로딩 함수 호출
	    });
	    
		// 'Upload' 버튼 클릭 이벤트: 댓글 업로드
	    $(document).on('click', '.comment_upload_btn', function() {
	    	var postId = $(this).data('post-id'); // 이 방식으로 postId 값을 가져옴
	        var user_id = $('#user_id_cmt').val(); // hidden input 필드의 값
 			var commentText = $('.commenttext').val();
	        
 			$.ajax({
	            url: 'CommentCon',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify({
	                'b_idx': postId,
	                'user_id': user_id,
	                'cmt_content': commentText
	            }),
	            success: function(res_cmt){
                	loadComments(postId);
	            },
	            error: function(xhr, status, error){
	                console.error(error);
	            }
	        });
	    });
		
	 	// 모달 닫기 버튼 클릭 이벤트
	    $(document).on('click', '.close_btn', function() {
	        $('#modalBox').fadeOut();
	        $('#modalBg').fadeOut();
	    });
	    
		/* // 동적으로 생성된 버튼 스타일: 마우스 올리면 동작
		/* document.getElementById('button').onmouseover = function() {
			this.style.backgroundColor = '#558985';
			this.style.borderColor = '#50817e';
		};
		document.getElementById('button').onmouseout = function() {
			this.style.backgroundColor = '#64a19d';
			this.style.borderColor = '#64a19d';
		}; */
	
	
	 $(document).on('click', '.delete_btn', function() {
 		var postId= $(this).data('post-id');
 		console.log(postId);
 		$.ajax({
 			url:"DeleteCon",
 			type: 'GET',
	            data: {'b_idx': postId, 'user_id': user_id},
	            success:function(){
	            	console.log("삭제완료");
	            	myreviewlist();
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
	            }		
 		}); // ajax 끝
	    });
		
	
	 $(document).on('click', '.like_btn', function() {
			var b_idx= $(this).data('post-id');
			var user_id="${login_vo.user_id}"
			console.log(user_id);
			$.ajax({
				url:"LikesCon",
				type:'GET',
				data:{'b_idx':b_idx, 'user_id':user_id},
				success:function(){
					var fes_idx = $('#fes_idx').val();
	                var imgroute = "./img/";
	                $.ajax({
	                    url: 'ReviewListCon',
	                    type: 'GET',
	                    data: { 'fes_idx': fes_idx },
	                    dataType: 'json',
	                    success: function(res) {
	                        let data = "";
	                        for(let i = 0; i < res.length; i++) {
	                        	data += "<div class=\"container px-4 px-lg-5 bg-light\" style='padding-top: 20px;'>"; // 게시물 감쌀 공간
	        					
	            				data += "<p style=\"display: none;\">" + res[i].b_idx + "</p>";
	            				data += "<p class=\"text-black mb-3\" align=\"left\">작성자: " + res[i].user_id + "</p>";
	            				data += "<div style='border: 1px solid darkgray; border-radius: 5px; padding-top: 15px;'><span class=\"text-black mb-3\" align=\"center\">" + res[i].b_content + "</span></div>";
	            				data += "<p class=\"text-black mb-3\" align=\"right\" style='font-size: 15px;'>" + res[i].b_likes + " likes</p>";
	            				
	            				var imgPath = imgroute + res[i].b_file;
	            				// img-fluid 클래스: 반응형
	            				data += '<img src="' + imgPath + '" alt="" class="img-fluid"><br><br>';

	            				data += "<button class=\"cmt_pop_btn\" data-post-id=\"" + res[i].b_idx + "\" style=\"color: #fff; background-color: #64a19d; border-color: #64a19d;\">Comments</button>";
	            				data += '&nbsp;<button class="like_btn" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Likes</button>'; // 좋아요 버튼(구현 전)
	            				data += '&nbsp;<button class="delete_btn" data-post-id=\"' + res[i].b_idx + '\" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Delete</button>'; // 삭제 버튼
	            				
	            				data += "<br><br><hr><br><br></div>"; // 게시물 구분선
	                        }
	                        $("#postbox").empty().append(data);
	                        $("#reviewtext").val(""); // 텍스트 필드 초기화
	                        $("#file").val(""); // 파일 입력 필드 초기화
	                    }
	                });
				},
				error: function(jqXHR, textStatus, errorThrown) {
	                console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
	            }
			}); //ajax 끝
		});
	
}) // function 끝

</script>









</head>


<body id="page-top">


	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container-fluid" style="display: flex; width: 80%; padding-left: 50px; padding-right: 50px;">
			<a class="navbar-brand" href="main.jsp"><img src="./assets/logo.png" alt="" style="width: 200px; height: 50px;"></a>
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
						<h5 data-tab="myinfotap" class="tabmenu text-white mb-3">MODIFY<br>USER INFO</h5>
					</div>
					<br>
					<div class="sidebarOption" align="center">
						<span class="material-icons text-white mb-3">
							notifications_none </span>
						<h5 data-tab="favchoose" class="tabmenu text-white mb-3">MUSIC PREFERENCE</h5>
					</div>
				</div>
			</div>
			<!-- sidebar ends -->

			<!-- feed start -->
			<div class="feed"  style="width: 600px; padding-top: 150px;" id="feed">

				<div class="container-fluid bg-black" align="center">
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
											style="width: 400px; height: 150px; color:black;">
									</div>
									<div>
										<label for="file" style="height: 50px; width: 100px;" align="center" class="tempbtn">
											<div color="white" style="height: 50px; padding-top: 4px;">Image</div>
										</label>
										<input type="file" id="file" style=display:none>
										<button type="button" id="reviewbtn" value="upload"
											class="tempbtn" style="height: 50px; width: 100px;" align="center">작성</button>

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
	
	<!-- 모달 박스 -->
	<div id="modalBox" class="modal_box white"
		style="border-radius: 10px; background: #fff; z-index: 99; display: none;
		height: 70%; overflow-y: auto; width: 40%;">

		<!-- 모달 박스 끝 -->
	</div>

	<!-- 모달창 열릴 때 배경 -->
	<div class="modal_bg"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 98; background-color: rgba(120, 120, 120, 0.7); display: none;"></div>

	



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
            success: function(){
            	myreviewlist();
            }, 
            error: function(jqXHR, textStatus, errorThrown) {
                console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
            } // reviewlist error 끝
		}); // reviewbtn ajax 끝
	}); // 버튼클릭 끝
	
	function myreviewlist(){
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
    				data += "<span class=\"text-black mb-3\" align=\"left\">작성자: " + res[i].user_id + "</span>";
    				data += "<div style='border: 1px solid darkgray; border-radius: 5px; padding-top: 15px;'><span class=\"text-black mb-3\" align=\"center\">" + res[i].b_content + "</span></div>";
    				data += "<p class=\"text-black mb-3\" align=\"right\" style='font-size: 15px;'>" + res[i].b_likes + " likes</p>";
    				
    				var imgPath = imgroute + res[i].b_file;
    				// img-fluid 클래스: 반응형
    				data += '<img src="' + imgPath + '" alt="" class="img-fluid"><br><br>';

    				data += "<button class=\"cmt_pop_btn\" data-post-id=\"" + res[i].b_idx + "\" style=\"color: #fff; background-color: #64a19d; border-color: #64a19d;\">Comments</button>";
    				data += '&nbsp;<button class="like_btn" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Likes</button>'; // 좋아요 버튼(구현 전)
    				data += '&nbsp;<button class="delete_btn" data-post-id=\"' + res[i].b_idx + '\" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Delete</button>'; // 삭제 버튼
     
    				data += "<br><br><hr><br><br></div>"; // 게시물 구분선

    			} // for 끝
    			$("#postbox").empty();
                $("#postbox").append(data);
                $("#reviewtext").val(""); // 텍스트 필드 초기화
                $("#file").val(""); // 파일 입력 필드 초기화
            } // reviewlist success 끝
    		
    	}); // myreviewlist ajax 끝
    	
    };
	
	
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