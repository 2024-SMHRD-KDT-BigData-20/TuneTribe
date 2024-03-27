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
System.out.print("리뷰탭fesidx =" + fes_idx);
%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>reviewtap</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<script src="assets/js/scripts.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->

<script>
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
				data += '&nbsp;<button class="delete_btn" data-post-id=\"' + res[i].b_idx + '\" style="color: #fff; background-color: #64a19d; border-color: #64a19d;">Delete</button>'; // 삭제 버튼
				
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
		
}); // function 끝


</script>

</head>
<body>

	<%
	String fes_Name = (String) session.getAttribute("fesName");
	%>
	<!-- feed start -->
	<div class="feed" id="feed">

		<div class="container-fluid bg-black" align="center">
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
					<div class="container-fluid bg-dark postbox" id="postbox"></div>
					<!-- 리뷰목록 끝 -->




				</div>
			</section>
		</div>
	</div>
	<!-- feed ends -->
	
	<!-- 모달 박스 -->
	<div id="modalBox" class="modal_box white"
		style="border-radius: 10px; background: #fff; z-index: 99; display: none;
		height: 50vh; overflow-y: auto; width: 40%;">

		<!-- 모달 박스 끝 -->
	</div>

	<!-- 모달창 열릴 때 배경 -->
	<div class="modal_bg"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 98; background-color: rgba(120, 120, 120, 0.7); display: none;"></div>

	<script>
    	var Button = document.getElementById("reviewbtn");
    	Button.addEventListener('click', () => {
    		console.log("버튼클릭");
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
                success: function(){
                	refreshReviews();
                }, // reviewlist success 끝
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log('Upload failed: ' + textStatus + ' ' + errorThrown);
                } // reviewlist error 끝
    		}); // reviewbtn ajax 끝
    	}); // 버튼클릭 끝
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
                    }
                    $("#postbox").empty().append(data);
                    $("#reviewtext").val(""); // 텍스트 필드 초기화
                    $("#file").val(""); // 파일 입력 필드 초기화
                }
            });
        }
    </script>



</body>
</html>