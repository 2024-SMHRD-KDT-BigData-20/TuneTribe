<%@page import="java.io.IOException"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.FestivalsDAO"%>
<%@page import="com.smhrd.model.FestivalsVO"%>
<%@page import="com.smhrd.model.RecommendDAO"%>
<%@page import="com.smhrd.model.RecommendVO"%>
<%@page import="com.smhrd.model.UsersVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TuneTribe - main</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />

<!-- MyPage, Search 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="assets/css/styles.css" rel="stylesheet" />

</head>
<body id="page-top">
	<!-- Navigation-->

	<%@ include file="header.jsp"%>

	<%
	UsersVO login_vo = (UsersVO) session.getAttribute("login_vo");
		
	RecommendDAO reco_dao = new RecommendDAO();
	FestivalsDAO fes_dao = new FestivalsDAO();
	
	// 추천 결과
	List<FestivalsVO> fes_main_reco = reco_dao.loadRecoResult(login_vo.getUser_id());
	System.out.println("추천 페스티벌 3개: " + fes_main_reco);

	if (login_vo != null && !fes_main_reco.isEmpty()) {
	%>



	<section class="search-section bg-black" style="padding-top: 200px; padding-bottop: 400px">
		<div class="container px-4 px-lg-5">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5">
					<h1 style="font-size: 26px; margin-bottom: 50px; color: white;" align="center"><%=login_vo.getUser_nick()%>님
						취향의 페스티벌
					</h1>

					<%
					for (FestivalsVO f : fes_main_reco) {
					%>
					<div class="col-md-4 mb-3 mb-md-0">
						<div class="card py-4 h-100">
							<a href="ResultToFestivalCon"
								onclick="setCookieAndSendData('<%=f.getFes_name()%>', '<%=f.getFes_idx()%>', '<%=f.getFes_location()%>', '<%=f.getFes_st_dt()%>', '<%=f.getFes_ed_dt()%>', 7); return false;"
								style="text-decoration: none;">
								<div class="card-body text-center">
									<img alt="" src="./assets/fes_poster/<%=f.getFes_poster()%>"
										class=poster-image style="width: 70%; height: 250px;">
									<hr class="my-4 mx-auto" />
									<h6><%=f.getFes_name()%></h6>
									<br>
									<div class="small text-black-50"><%=f.getFes_location()%></div>
									<br>
									<div class="small text-black-50"><%=f.getFes_st_dt()%>
										~
										<%=f.getFes_ed_dt()%></div>
								</div>
							</a>
						</div>
					</div>
					<%
					}
					%>

				</div>

			</div>
		</div>


		<div
			class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
			<div class="d-flex justify-content-center">
				<div class="text-center"
					style="margin-top: 50px; margin-bottom: 5px;">
					<a class="btn btn-primary" href="#more">More</a>
				</div>
			</div>
		</div>

	</section>

	<%
	} else {
	List<FestivalsVO> fes_main_random = fes_dao.fesRandom();
	System.out.println("랜덤 페스티벌 3개: " + fes_main_random);
	%>
	<section class="search-section bg-black" style="padding-top: 200px; padding-bottop: 400px">
		<div class="container px-4 px-lg-5">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5">
					<h1 style="font-size: 30px; color: white;" align="center">회원님의
						취향을 알려주세요!</h1>
					<p>
						<br>
					</p>

					<%
					for (FestivalsVO f : fes_main_random) {
					%>
					<div class="col-md-4 mb-3 mb-md-0">
						<div class="card py-4 h-100">
							<a href="ResultToFestivalCon"
								onclick="setCookieAndSendData('<%=f.getFes_name()%>', '<%=f.getFes_idx()%>', '<%=f.getFes_location()%>', '<%=f.getFes_st_dt()%>', '<%=f.getFes_ed_dt()%>', 7); return false;"
								style="text-decoration: none;">
								<div class="card-body text-center">
									<img alt="" src="./assets/fes_poster/<%=f.getFes_poster()%>"
										class=poster-image style="width: 70%; height: 250px;">
									<hr class="my-4 mx-auto" />
									<h6><%=f.getFes_name()%></h6>
									<br>
									<div class="small text-black-50"><%=f.getFes_location()%></div>
									<br>
									<div class="small text-black-50"><%=f.getFes_st_dt()%>
										~
										<%=f.getFes_ed_dt()%></div>
								</div>
							</a>
						</div>

					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>

		<div
			class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
			<div class="d-flex justify-content-center">
				<div class="text-center" style="margin-top: 50px;">
					<a class="btn btn-primary" href="#more">More</a>
				</div>
			</div>
		</div>
	</section>
	<%
	}
	%>





	<!-- more-->
	<section class="projects-section bg-black">
		<br id="more">
		<h1 align="center" style="color:white;">More Festivals</h1>

		<!-- 페스티벌 임박순 정렬 div - 1행 -->
		<br>

		<%
		// 오늘 이후, 가까운 날짜 순으로 공연 정렬(9개)
		List<FestivalsVO> fesOrderAscList = fes_dao.fesOrderAsc();
		System.out.println("[fesOrderAsc: ]" + fesOrderAscList);
		%>


		<!-- Festivals 검색 결과 div -->

		<div class="container px-4 px-lg-5">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5">
					<%
					int i = 0;
					for (FestivalsVO f : fesOrderAscList) {
						i++;
					%>
					<div class="col-md-4 mb-3 mb-md-0">
						<div class="card py-4 h-100">
							<a href="ResultToFestivalCon"
								onclick="setCookieAndSendData('<%=f.getFes_name()%>', '<%=f.getFes_idx()%>', '<%=f.getFes_location()%>', '<%=f.getFes_st_dt()%>', '<%=f.getFes_ed_dt()%>', 7); return false;"
								style="text-decoration: none;">
								<div class="card-body text-center">
									<img alt="" src="./assets/fes_poster/<%=f.getFes_poster()%>"
										class=poster-image style="width: 70%; height: 250px;">
									<hr class="my-4 mx-auto" />
									<!-- JSP와 JavaScript를 결합하여 사용할 때는
								서버 사이드 코드(JSP)가 클라이언트 사이드 코드(JavaScript)에
								값을 제공하는 방식에 주의해야 한다.
								특히, 문자열 데이터를 JavaScript 함수에 인자로 전달할 때는
								항상 따옴표로 감싸서 문자열임을 명시해야 한다. -->
									<h6><%=f.getFes_name()%></h6>
									<br>
									<div class="small text-black-50"><%=f.getFes_location()%></div>
									<br>
									<div class="small text-black-50"><%=f.getFes_st_dt()%>
										~
										<%=f.getFes_ed_dt()%></div>
								</div>
							</a>
						</div>
					</div>
					<%
					if (i % 3 == 0) {
					%>
					<p>
						<br> <br>
					</p>
					<%
					}
					}
					%>
				</div>
			</div>
		</div>


		<br> <br>
	</section>
	<!-- search-->
	<section class="search-section bg-black" id="search">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5">
				<div class="col-md-10 col-lg-8 mx-auto text-center">
					<span class="material-symbols-outlined">search</span>
					<h3 class="text-white mb-5">SEARCH</h3>

					<form method="get" action="SearchCon" class="form-search"
						id="searchForm" data-sb-form-api-token="API_TOKEN">
						<!-- 검색어 입력 칸 -->
						<div class="row input-group-newsletter">
							<table>
								<tr>
									<td>
										<div class="col">
											<input class="form-control" name="searchText"
												id="emailAddress" type="text"
												placeholder="Please enter a search term"
												aria-label="Please enter a search term" />
										</div>
									</td>
									<td><input type="submit" id="submitButton"
										class="btn btn-primary" value="GO"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- 자바스크립트 -->
	<script type="text/javascript">
		// 쿠키 설정 함수
		function setCookie(name, value1, value2, value3, value4, days) {
			var expires = "";
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				expires = "; expires=" + date.toUTCString();
			}
			var value = value1 + "|" + value2 + "|" + value3 + "|" + value4; // 파이프(|)를 사용하여 값을 구분
			document.cookie = name + "=" + value + expires + "; path=/"
		}

		function setCookieAndSendData(fesName, fesIdx, fesLocation, fesStDt,
				fesEdDt, days) {
			// 쿠키 설정
			setCookie(fesName, fesIdx, fesLocation, fesStDt, fesEdDt, days);
			console.log(fesName, fesIdx, fesLocation, fesStDt, fesEdDt, days);

			// jQuery를 사용하여 서블릿에 데이터 전송
			$.ajax({
				type : "GET",
				url : "ResultToFestivalCon",
				data : {
					"fesName" : fesName,
					"fesIdx" : fesIdx,
					"fesLocation" : fesLocation,
					"fesStDt" : fesStDt,
					"fesEdDt" : fesEdDt
				},
				success : function(response) {
					console.log("Data sent to servlet successfully", response);
					location.href = "festival.jsp";
				},
				error : function(xhr, status, error) {
					console.error("Error sending data to servlet", error);
				}
			});
		}
	</script>

	<!-- Footer-->
	<%@ include file="footer.jsp"%>
	

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
