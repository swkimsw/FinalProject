<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- awesome font -icon -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
	
<style>
* {
	font-family: NanumSquareNeo;
}

body {
	background-color: rgba(255,255,194,0.75);
}

.container {
	margin-top: 18%;
}

.wrapper {
	width: 80%;
	padding: 32px;
	background: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
	animation-duration: 5s;
}

</style>
</head>
<body>
	<c:import url="../commons/gnb.jsp">
	</c:import>
	
	<!-- 로그인한 회원의 아이디를 담을 공간 -->
	<input type="text" value="${sessionScope.id}" id="id" hidden>
	
	<div class="container login_container align-self-center">
		<div class="wrapper mx-auto position-relative">
			<div class="wrapper_find_member" id="find_member_fadeIn">
				<div class="row d-flex justify-content-center mx-auto p-0">
					<div class="col-md-8 align-center">
						<div class="text-center d-md-block mb-4">
							<h3 class="mb-5">본인 인증</h3>
							<p class="body_font mb-5">비밀번호를 입력해주세요.</p>
						</div>
						<div class="row text-center">
							<div class="col-9"><input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요..."/></div>
							<div class="col-3 text-center"><input type="button" class="site_login form-control" value="입력" id="btn"/></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#btn").on("click", function() {
			if($("#pw").val().trim() == "") {
				alert("비밀번호를 입력해주세요.")
			}
			else {
				$.ajax({
					url : "/clientMyPage/checkPw",
					type : "post",
					dataType : "json",
					data : {
						id : $("#id"),
						pw : $("#pw")
					}
				})
			}
		})
	</script>
</body>
</html>