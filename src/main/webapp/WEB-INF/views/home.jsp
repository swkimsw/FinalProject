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
    box-sizing: border-box;
}

.container {
	margin-top: 100px;
}

.logoImg {
    animation: rotate_image 20s ease-in-out infinite;transform-origin: 50% 50%;
	width: 256px;
	height: 256px;
}
/* @keyframes rotate_image{
    100% {
        transform: rotate(360deg);
    }
} */
.selectBox{
	padding: 2rem;
	background-color: #fdeeb39a;
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
		<div class="main">
            <div class="row d-flex justify-content-center mb-3 align-items-center">
                <div class="logoImg d-inline-flex col-12 col-md-4">
                    <img src="foodWithPlate2" alt="logo" class="img">
                </div>
                <div class="title col-12 col-md-4 text-center  ">
                    <h1>쉽고 직관적인 식단관리</h1>
                    <h3> AI 식단추천</h3>
                    <h5>COOKCOOK</h5>
                </div>
            </div>
            
			<div class="selectBox">
            <!-- 당일 ~ 7일 -->
			<div class="row d-flex justify-content-center">
				<div class="d-flex justify-content-center col-8">
					<select class="form-select mb-3" name="day">
						<option value="1" selected>당일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
					</select>
				</div>
			</div>


			<!-- 아침, 점심, 저녁 -->
			<div class="d-flex justify-content-center">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="breakfast" value="아침">
					<label class="form-check-label" for="breakfast">아침</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="lunch" value="점심">
					<label class="form-check-label" for="lunch">점심</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="dinner" value="저녁">
					<label class="form-check-label" for="dinner">저녁</label>
				</div>
			</div>
            <br>
			<!-- 비건, 다이어트 -->
			<div class="d-flex justify-content-center">
				<p class="mx-3">식단 유형 :</p>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="vigan" value="비건">
					<label class="form-check-label" for="vigan">비건</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="diet" value="다이어트">
					<label class="form-check-label" for="diet">다이어트</label>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-center">
					<button type="button" class="btn btn-success btn-rounded">식단생성</button>
				</div>
			</div>
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