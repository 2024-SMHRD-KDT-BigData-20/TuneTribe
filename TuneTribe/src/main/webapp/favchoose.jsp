<%@page import="com.smhrd.model.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
UsersVO login_vo = (UsersVO) session.getAttribute("login_vo");

System.out.println("[favchoose]");
// 수정한 척 커밋
%>

<html>
<head>
<meta charset="UTF-8">
<title>favchoose</title>

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

<!--wrapper-->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com"> <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <link href="https: //fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

.wrapper {
	width: 100%;
	margin: 20px auto 0;
}

.select, .options li {
	display: flex;
	cursor: pointer;
	align-items: center;
}

.select {
	height: 60px;
	padding: 0 20px;
	background: black; /* #4285f4 */
	border-radius: 10px;
	color: #ffffff;
	justify-content: space-between;
}

.content {
	display: none;
	background: #ffffff;
	margin-top: 5px;
	padding: 15px;
	border-radius: 10px;
}

.active .content {
	display: block;
}

.content .search-box {
	position: relative;
}

.search-box .material-icons {
	left: 15px;
	line-height: 53px;
	position: absolute;
}

.search-box input {
	height: 53px;
	width: 100%;
	outline: none;
	font-size: 17px;
	padding: 0 10px 0 43px;
	border: 1px solid #aabb;
	border-radius: 10px;
}

.content .options {
	margin-top: 10px;
	max-height: 250px;
	overflow-y: auto;
}

.options::-webkit-scrollbar-track {
	backgound: #f1f1f1;
	border-radius: 25px;
}

.options::-webkit-scrollbar-thumb {
	backgound: #ccc;
	border-radius: 25px;
}

.options li {
	height: 50px;
	padding: 0 13px;
	border-radius: 7px;
}

.options li:hover {
	background: #f2f2f2;
}

	/* 그리드 레이아웃 설정 */
      .grid-container {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(4, 1fr);
        height: 90vh;
        margin: 0;
        padding: 0;
      }
      
      /* 각 영역 스타일 설정 */
      .grid-item {
        border: 1px solid black;
        width: 100%;
        height: 100%;
      }
      
      /* 각 영역 ID 설정 */
      #item1, #item2, #item3, #item4 {
        overflow: auto;
      }
      
      #item1 {
        grid-row: 1 / 2;
        grid-column: 1 / 2;
      }
      
      #item2 {
        grid-row: 1 / 2;
        grid-column: 2 / 3;
      }
      
      #item3 {
        grid-row-start: 2;
        grid-row-end: 5;
        grid-column: 1 / 2;
      }
      
      #item4 {
        grid-row-start: 2;
        grid-row-end: 5;
        grid-column: 2 / 3;
      }
      
      
</style>

<!-- 가수리스트 -->
<script>
var singers =[];
        $(document).ready(function() {
            $.ajax({
                url: 'OptionlistCon',
                type: 'GET',
                dataType: 'json',
                success: function(res) {
                	for(let i=0;i<res.length;i++){
                		singers.push(res[i]);
                		console.log(res[i]);
                	} // for문 끝
                } // success 끝    
             }); //ajax 끝
        });
        
        
var genres =[];
        $(document).ready(function() {
            $.ajax({
                url: 'OptionlistCon2',
                type: 'GET',
                dataType: 'json',
                success: function(res_2) {
                	for(let i=0;i<res_2.length;i++){
                		genres.push(res_2[i]);
                		console.log(res_2[i]);
                	} // for문 끝
                } // success 끝    
             }); //ajax 끝
        });
        
        
        
        function addLi() {
        	singers.forEach(singer => {
        		let li = `<li onclick="changeClickedName(this)">${singer}</li>`;
        		options.insertAdjacentHTML("beforeend", li);
        	})
        }

        function addgenreLi() {
        	genres.forEach(genre => {
        		let gli = `<li onclick="changeClickedGenreName(this)">${genre}</li>`;
        		optionsgenre.insertAdjacentHTML("beforeend", gli);
        	})
        }       
 
</script>



</head>
<body>

	<div class="grid-container">
		<div class="grid-item" id="item1">
        	<h3 class="text-white mb-5">선호 가수 목록</h3>
			<p class="text-white mb-5" id="singerlist"></p>
      	</div>
    	<div class="grid-item" id="item2">
        	<h3 class="text-white mb-5">선호 장르 목록</h3>
			<p class="text-white mb-5" id="genrelist"></p>
      	</div>
      	<div class="grid-item" id="item3">
        	<div class="wrapper" id="wrapper" style="float:left;">
				<div class="select" id="select">
					<span>선호가수를 선택해주세요</span>
					<span class="material-icons">expand_more</span>
				</div>
				<div class="content">
					<div class="search-box">
						<span class="material-icons">search</span>
						<input class="filter" id="filter" type="text" placeholder="검색" style="color:black;!important">
					</div>
					<ul class="options" id="options">
					</ul>
				</div>
			</div>
		</div>
      	<div class="grid-item" id="item4">
        	<div class="wrapper" id="wrappergenre" style="float:left;">
				<div class="select" id="selectgenre">
					<span>선호장르를 선택해주세요</span>
					<span class="material-icons">expand_more</span>
				</div>
				<div class="content">
					<div class="search-box">
						<span class="material-icons">search</span>
						<input class="filter" id="filtergenre" type="text" placeholder="검색" style="color:black;!important">
					</div>
					<ul class="options" id="optionsgenre">
					</ul>
				</div>
			</div>
      	</div>
    </div>


	<hr style="color:white;!important">
	<br>
	
	<div style="float:center;">
	<button id="favbtn">저장</button>
	</div>








	<script>
var wrapper = document.querySelector('#wrapper');
var select = document.querySelector('#select');
var options = document.querySelector('#options');
var input = document.querySelector('#filter');

var wrappergenre = document.querySelector('#wrappergenre');
var selectgenre = document.querySelector('#selectgenre');
var optionsgenre = document.querySelector('#optionsgenre');
var inputgenre = document.querySelector('#filtergenre');

//전역 변수 선언
var selectedSingers = []; // 선택된 가수 이름을 저장할 배열 선언
	
function changeClickedName(li) {
	input.value = ""; // input 초기화.
	options.innerHTML = ""
 	addLi();  // 모든 가수 보여주기
	wrapper.classList.remove('active'); // classList 사용해서 active 클래스명 삭제.
	select.firstElementChild.innerText = li.innerText; // 선택된 옵션 값이 선택영역에 적용되도록 함

	// 선택된 가수 이름을 전역 변수에 저장
	var singerName = li.innerText;

	var index = selectedSingers.indexOf(singerName);

	if (index === -1) {
		// 가수가 배열에 없다면 추가
		selectedSingers.push(singerName);
	} else {
		// 가수가 이미 배열에 있다면 제거
		selectedSingers.splice(index, 1);

	}
	$("#singerlist").empty();
	for (let i = 0; i < selectedSingers.length; i++) {
		$("#singerlist").append(selectedSingers[i] + "<br>");
	}
}


//전역 변수 선언
var selectedGenre = []; // 선택된 가수 이름을 저장할 배열 선언

function changeClickedGenreName(gli) {
	inputgenre.value = ""; // input 초기화.
	optionsgenre.innerHTML = ""
 	addgenreLi(); 
	wrappergenre.classList.remove('active'); // classList 사용해서 active 클래스명 삭제.
	selectgenre.firstElementChild.innerText = gli.innerText; // 선택된 옵션 값이 선택영역에 적용되도록 함

	// 선택된 가수 이름을 전역 변수에 저장
	var genreName = gli.innerText;

	var index = selectedGenre.indexOf(genreName);

	if (index === -1) {
		// 가수가 배열에 없다면 추가
		selectedGenre.push(genreName);
	} else {
		// 가수가 이미 배열에 있다면 제거
		selectedGenre.splice(index, 1);
	}
	$("#genrelist").empty();
	for (let i = 0; i < selectedGenre.length; i++) {
		$("#genrelist").append(selectedGenre[i] + "<br>");
	}
	
}

$("#wrapper").click(function(event) {
    // 오직 #select 요소 또는 그 자식 요소들이 클릭되었을 때만 실행
    	options.innerHTML = ""
    if (event.target === select || select.contains(event.target)) {
        wrapper.classList.toggle('active');
        addLi();   // 목록을 다시 로드
    }
});

$("#filter").keyup(function(){
	let arr = [];//사용자가 적은 값과 일치하는 가수명을 집어넣을 새로운 배열.
	let searchWord = input.value;//사용자 입력값

	if (searchWord.length > 0) {//사용자 입력값이 존재하는 경우

		arr = singers.filter(data => { //filter메서드를 사용해서 arr로 보내는데 
			return data.startsWith(searchWord);
		}).map(data => `<li onclick="changeClickedName(this)">${data}</li>`).join("");
		//map을 사용해서 데이터를 <li>태그로 감싼 것처럼 처리함.
		//join함수를 사용해서 새배열(arr)에서 출력되는','를 없앰
		options.innerHTML = arr ? arr : '<p>조회된 가수가 없습니다.</p>';
		//조회되는 아이템이 없는 경우 보여주는 글귀 설정.
	} else {
		//사용자 입력값이 존재하지않는 경우
		options.innerHTML = "";//조회아이템이 없는 경우 보여주는 태그 비워주고
 		addLi(); 
	}
});


$("#wrappergenre").click(function(event){
	optionsgenre.innerHTML = ""
		if (event.target === selectgenre || selectgenre.contains(event.target)) {
		wrappergenre.classList.toggle('active');
 		addgenreLi(); 
		}
});



$("#filtergenre").keyup(function(){
	let arrg = [];//사용자가 적은 값과 일치하는 가수명을 집어넣을 새로운 배열.
	let searchWordg = inputgenre.value;//사용자 입력값

	if (searchWordg.length > 0) {//사용자 입력값이 존재하는 경우

		arrg = genres.filter(data => { 
			return data.startsWith(searchWordg);
		}).map(data => `<li onclick="changeClickedGenreName(this)">${data}</li>`).join("");
		//map을 사용해서 데이터를 <li>태그로 감싼 것처럼 처리함.
		//join함수를 사용해서 새배열(arr)에서 출력되는','를 없앰
		optionsgenre.innerHTML = arrg ? arrg : '<p>조회된 장르가 없습니다.</p>';
		//조회되는 아이템이 없는 경우 보여주는 글귀 설정.
	} else {
		//사용자 입력값이 존재하지않는 경우
		optionsgenre.innerHTML = "";//조회아이템이 없는 경우 보여주는 태그 비워주고
 		addgenreLi(); 
	}
});

$("#favbtn").click(function(){
	var user_id = "${login_vo.user_id}"
	$.ajax({
		method: 'get',
		url: 'FavchooseCon',
		traditional: true,
		data: {
			'fav_singer': selectedSingers,
			'fav_genre': selectedGenre
			},
		success: function(){
			console.log('선호선택');

			$.ajax({
				method: 'get',
				url: 'RecommendCon',
				data: { 'user_id': user_id },
				success: function(){
					console.log('메인 추천 페스티벌 업뎃됨');
					location.href="main.jsp";
				},
				error: function(jqXHR, textStatus, errorThrown) {
		            console.log('tab failed: ' + textStatus + ' ' + errorThrown);}
			}); // ajax 끝
		},
		error: function(jqXHR, textStatus, errorThrown) {
            console.log('tab failed: ' + textStatus + ' ' + errorThrown);}
	}); // ajax 끝

	

});

	
</script>

</body>
</html>