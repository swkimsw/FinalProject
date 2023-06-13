<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
<style>
* {
	font-family: NanumSquareNeoBold;
}

.container {
	margin-top: 100px;
}
</style>
</head>
<body>

	<!-- gnb -->
	<c:import url="commons/gnb.jsp">
	</c:import>
	<!-- main -->
	<div class="container" style="margin-top: 100px;">
		<div class="spinner-border text-dark" style="display:none;" role="status">
 		  <span class="visually-hidden">Loading...</span>
		</div>
		<div clss="main">
			<!-- 아침, 점심, 저녁 -->
			<div class="btn-group" role="group">
				<input type="checkbox" class="btn-check" id="breakfast" name="time"
					value="아침" autocomplete="off"> <label
					class="btn btn-outline-primary" for="breakfast">아침</label> <input
					type="checkbox" class="btn-check" id="lunch" name="time" value="점심"
					autocomplete="off"> <label class="btn btn-outline-primary"
					for="lunch">점심</label> <input type="checkbox" class="btn-check"
					id="dinner" name="time" value="저녁" autocomplete="off"> <label
					class="btn btn-outline-primary" for="dinner">저녁</label>
			</div>

			<!-- 비건, 다이어트 -->
			<div class="btn-group" role="group">
				<input type="checkbox" class="btn-check" name="special" id="vigan"
					value="비건" autocomplete="off"> <label
					class="btn btn-outline-primary" for="vigan">비건</label> <input
					type="checkbox" class="btn-check" name="special" id="diet"
					value="다이어트" autocomplete="off"> <label
					class="btn btn-outline-primary" for="diet">다이어트</label>
			</div>

			<!-- 당일 ~ 7일 -->
			<select class="form-select" name="day">
				<option value="1" selected>당일</option>
				<option value="2">1일</option>
				<option value="3">2일</option>
				<option value="4">3일</option>
				<option value="5">4일</option>
				<option value="6">5일</option>
				<option value="7">6일</option>
				<option value="8">7일</option>
			</select>

			<button id="sendBtn">보내기</button>

			<div id="getMsg">응답 메세지</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var timeArr = [];
	var specialArr = []
	var day;
	var sendMsg = "";
	$("#sendBtn").on("click",function() {
				timeArr = [];
				$("input[type=checkbox][name=time]:checked").each(function(i) {
					timeArr.push($(this).val());
				});
				specialArr = [];
				$("input[type=checkbox][name=special]:checked").each(
						function(i) {
							specialArr.push($(this).val());
						});
				day = $("select[name=day]").val();
				console.log(timeArr.join(','));
				console.log(specialArr.join(','));
				console.log(day);

				sendMsg = day + "일치 " + specialArr.join(',') + " 식단 "
						+ timeArr.join(',') + "만 JSON데이터로 짜줘";
				console.log(sendMsg);
				
				$.ajax({
					url:"/meal/aiMeal",
					type:"post",
					data:{sendMsg:sendMsg},
					beforeSend: function(){ $(".spinner-border").css({"display":"block"}); $(".main").css({"display":"none"}); },
					complete: function(){ $(".spinner-border").css({"display":"none"}); $(".main").css({"display":"block"}); }
				});
			});
</script>
</html>