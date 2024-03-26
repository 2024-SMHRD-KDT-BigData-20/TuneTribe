<%@page import="com.smhrd.model.ReviewVO"%>
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
String fes_Name = (String) session.getAttribute("fesName");
System.out.print("fes_idx =" + fes_idx);
%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Festival Information</title>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7fbefea330e06321fdff2b98d636e834&libraries=services"></script>

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

/* 첫 페이지에 자동 시작 */

$(document).ready(function (){
	var fes_idx = $('#fes_idx').val();
	var imgroute = "./img/"
	$.ajax({
		url : 'ReviewListCon',
		type : 'get',
		data: {'fes_idx': fes_idx}, // JSON 문자열로 변환
        dataType: 'json', // 응답 데이터 타입
        success: function(res){
        	console.log(res); // json
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
	
	
	$(document).ready(function (){
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
	                
	                // 댓글들 보이기
		            for(let j=0; j<res_cmt.length; j++){
    				modalContent +="<p style=\"display:none\">" + res_cmt[j].b_idx + "</p>";
    				modalContent +="<p style=\"display:none\">" + res_cmt[j].cmt_idx + "</p>";
    				modalContent += "<p class=\"text-black mb-3\" align=\"center\">" + res_cmt[j].user_id + "</p>";
    				modalContent += "<p class=\"text-black mb-3\" align=\"center\">" + res_cmt[j].cmt_content + "</p>";
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
   					modalContent += 'style="width: 300px; height: 100px;">'
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

}); // function 끝


</script>

</head>


<body id="page-top">


	<!-- header -->

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
						<span class="material-symbols-outlined">post</span>
						<h5 data-tab="reviewtap" class="tabmenu text-white mb-3">REVIEW</h5>
					</div>
					<br>
					<div class="sidebarOption" align="center">
						<span class="material-symbols-outlined">info</span>
						<h5 data-tab="fesinfotap" class="tabmenu text-white mb-3">FESTIVAL</h5>
					</div>
					<br>
					<div class="sidebarOption" align="center">
						<span class="material-symbols-outlined">speaker</span>
						<h5 data-tab="lineuptap" class="tabmenu text-white mb-3">LINE-UP</h5>
					</div>
					<br>
					<div class="sidebarOption" align="center">
						<span class="material-symbols-outlined">location_on</span>
						<h5 data-tab="maptap" class="tabmenu text-white mb-3">MAPS</h5>
					</div>
				</div>
			</div>
			<!-- sidebar ends -->

			<!-- feed start -->
			<div class="feed"  style="width: 600px;" id="feed">

				<div class="container-fluid bg-black" style="padding-top:300px;" align="center">
					<h5 class="text-white mb-5" align="center"><%=fes_Name%></h5>
					<section class="search-section bg-black">
						<!-- 위 3줄 건들지 말기 -->

						<!-- 리뷰적는 곳 시작 -->
						<div class="text-center">
							<div class="reviewbox">
								<form id="uploadForm" enctype="multipart/form-data">
									<input type="hidden" value="${login_vo.user_id }" id="user_id">
									<input type="hidden" value=<%=fes_idx%> id="fes_idx">

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

		<!-- widgets ends -->
	</nav>

	<!-- 모달 박스 -->
	<div id="modalBox" class="modal_box"
		style="border-radius: 10px; background: #fff; z-index: 99; display: none;">

		<!-- 모달 박스 끝 -->
	</div>

	<!-- 모달창 열릴 때 배경 -->
	<div class="modal_bg"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 98; background-color: rgba(120, 120, 120, 0.7); display: none;"></div>








	<script>
	
	// 리뷰 작성
	$(document).ready(function() {
    $("#reviewbtn").click(function() {
        var formData = new FormData();
        var b_content = $('#reviewtext').val();
        var b_file = $('#file')[0].files[0];
        var user_id = $('#user_id').val();
        var fes_idx = $('#fes_idx').val();

        formData.append("b_content", b_content);
        formData.append("b_file", b_file);
        formData.append("user_id", user_id);
        formData.append("fes_idx", fes_idx);

        $.ajax({
            url: 'ReviewCon',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function() {
                // 성공적으로 리뷰가 작성된 후 처리
                refreshReviews(); // 댓글 목록 새로고침 함수 호출
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
            }
        });
    });

    // 리뷰 목록 새로고침 함수
    function refreshReviews() {
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
                    data += "<p>" + res[i].b_content + "</p>";
                    data += "<p>" + res[i].user_id + "</p>";
                    data += "<p>" + res[i].b_likes + " likes</p>";
                    var imgPath = imgroute + res[i].b_file;
                    data += '<img src="' + imgPath + '" alt="">';
                }
                $("#postbox").empty().append(data);
                $("#reviewtext").val(""); // 텍스트 필드 초기화
                $("#file").val(""); // 파일 입력 필드 초기화
            }
        });
    }
});

	
	
	
	/* var Button = document.getElementById("reviewbtn");
    Button.addEventListener('click', () => {
    	var formData = new FormData();
    	var b_content = $('#reviewtext').val();
    	var b_file = $('#file')[0].files[0];
    	var user_id = $('#user_id').val();
    	var fes_idx = $('#fes_idx').val();
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
            success: function reviewlist(){
               	var fes_idx = $('#fes_idx').val();
           		var imgroute = "/tomcatImg/"
           		$.ajax({
           			url : 'ReviewListCon',
           			type : 'get',
           			data: {'fes_idx': fes_idx}, // JSON 문자열로 변환
           	        dataType: 'json', // 응답 데이터 타입
           	        success: function(res){
          	        	console.log(res); //json
   						let data="";
       					for(let i=0;i<res.length;i++){
       						// 태그 내용 담을 변수
       						data += "<p>" + res[i].b_content + "</p>";
       		                data += "<p>" + res[i].user_id + "</p>";
       		                data += "<p>" + res[i].b_likes + "</p>";
       		                var imgPath = imgroute + res[i].b_file;
       		                data += '<img src="' + imgPath + '" alt="">';
       					} // for 끝
       					$("#postbox").empty();
   		                $("#postbox").append(data);
   		                $("#reviewtext").val(""); 
   		                $("#file").val("");
   		                
           	        } // reviewlist success 끝
           			
           		}); // reviewlist ajax 끝
               	
            }, // reviewlist success 끝
            error: function(jqXHR, textStatus, errorThrown) {
                console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
            } // reviewlist error 끝
 		}); // reviewbtn ajax 끝
  	}); // 버튼클릭 끝 */
	
	
/* 	// 댓글 작성
	$(document).ready(function(){
	    // 댓글 작성 버튼 클릭 이벤트 핸들러
	    $('.comment_upload_btn').click(function(e){
	        // 기본 form submit 동작 방지
	        e.preventDefault();

	        // 사용자 입력 데이터 수집
	        var user_id = $('#user_id').val(); // 가정: 사용자 ID를 저장하는 hidden input 필드의 값
	        var commentText = $('.commenttext').val();
	        var b_idx = $('.b_idx').val();

	        // AJAX 요청 설정
	        $.ajax({
	            url: '/CommentCon',
	            type: 'POST',
	            contentType: 'application/json', // 요청의 Content-Type
	            data: JSON.stringify({
	                b_idx: b_idx,
	                user_id: user_id,
	                cmt_content: commentText
	            }),
	            success: function(response){
	                // 성공 시 로직, 예: 모달 닫기, 댓글 목록 새로고침 등
	                console.log(response); // 개발자 콘솔에 성공 메시지 출력
	                // 여기에 모달을 닫거나, 댓글 목록을 새로고침하는 코드를 추가할 수 있습니다.
	            },
	            error: function(xhr, status, error){
	                // 오류 처리 로직
	                console.error(error); // 개발자 콘솔에 오류 메시지 출력
	            }
	        });
	    });
	}); */

	
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