<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.FestivalsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.FestivalsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TuneTribe - search</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- MyPage 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="assets/css/styles.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body id="page-top">
	<!-- Navigation-->
	<%@ include file="header.jsp"%>

	<!-- search-->
	<section class="search-section" id="search">
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

	<section class="projects-section bg-light">
		<h1 align="center">Festivals</h1>
		<div class="container px-4 px-lg-5">
			<br>

			<%
			System.out.println("[SearchResult]");

			FestivalsDAO dao = new FestivalsDAO();
			List<FestivalsVO> fesList = dao.festivalSearch(request.getParameter("searchText"));
			%>


			<!-- Festivals 검색 결과 div -->






			<div class="container px-4 px-lg-5">

				<div class="container px-4 px-lg-5">
					<div class="row gx-4 gx-lg-5">
						<%
						int i = 0;

						if (fesList != null) {

							for (FestivalsVO f : fesList) {
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
							</div>
							</a>
						</div>
						<%
						if (i % 3 == 0) {
						%>
						<p>
							<br> <br>
						</p>
					</div>
					<%
					}
					}
					} else {
					// 출력 안되니 자바스크립트로 어떻게 해보기!!!!!!!!!!!!
					out.print("Results not found");
					}
					%>




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
