<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String fes_idx = (String) session.getAttribute("fesIdx");
String fes_Name = (String) session.getAttribute("fesName");
%>

<html>
<head>
<meta charset="UTF-8">
<title>lineuptap</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<script>
$(document).ready(function (){
	var fes_idx = <%=fes_idx %>
	$.ajax({
		url : 'LineupCon',
		type : 'get',
		data: {'fes_idx': fes_idx}, // JSON 문자열로 변환
        dataType: 'json', // 응답 데이터 타입
        success: function(res){
			let data="";
			for(let i=0;i<res.length;i++){
				data += "<p class=\"text-white mb-3\" align=\"center\">" + res[i] + "</p>";
			}
            $("#feed").append(data);
        },
		error: function(jqXHR, textStatus, errorThrown) {
            console.log('failed: ' + textStatus + ' ' + errorThrown);
        }
	}); // ajax 끝
	
}) // function 끝

</script>


</head>
<body>
	<div class="container-fluid bg-black" style="padding-top:300px;" align="center">
	<h5 class="text-white mb-3" align="center"><%= fes_Name %></h5>
	<h5 class="text-white mb-3" align="center">LINE-UP</h5>
	<br>
	<hr style="color: lightgray;">
	<div id="feed" style="padding-top: 40px;">
	
	</div>
	</div>
</body>
</html>