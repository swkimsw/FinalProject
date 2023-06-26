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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- Bootstrap bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<!-- awesome font -icon -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
	
<style>
* {
	font-family: NanumSquareNeo;
	box-sizing: border-box;
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

label {
	font-size: small;
	font-family: 'NanumSquareNeoBold';
}

.btn {
	font-size: small;
}

.good .bi-x {
	display: none;
}

.valid-feedback, .invalid-feedback {
	font-size: small;
}

.alert {
	font-family: 'NanumSquareNeoBold';
	text-color: black;
}

.row .insert {
	justify-content: center;
}
</style>
</head>

<body>
	<c:import url="../commons/gnb.jsp">
	</c:import>
	
	<div class="container login_container align-self-center">
		<div class="wrapper mx-auto position-relative">
		
		<!-- 본인인증 확인하기 위한 폼 -->
			<div class="wrapper_find_member" id="find_member_fadeIn">
				<div class="row d-flex justify-content-center mx-auto p-0">
					<div class="col-md-8 align-center">
						<div class="text-center d-md-block mb-4">
							<h3 class="mb-5">본인 인증</h3>
							<p class="body_font mb-5">비밀번호를 입력해주세요.</p>
						</div>
						<div class="row text-center">
							<div class="col-9"><input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요..."/></div>
							<div class="col-3 text-center"><input type="button" class="site_login form-control" value="입력" id="btn"/></div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 회원정보 -->
			<div class="row justify-content-center" id="info" style="display: none;">
				<div class="col-12 col-md-8">
					<div class="header text-center">
						<h3>⚽CookCook</h3>
					</div>

					<!-- 이름 -->
					<div class="row insert">
						<div class="col-10">
							<!-- 이름 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="name">이름</label>
								</div>
							</div>
							<!-- 이름 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="name" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 사업장명 -->
					<div class="row insert">
						<div class="col-10 ">
							<!-- 사업장명 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="companyName">사업장명</label>
								</div>
							</div>
							<!-- 사업장명 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="companyName" disabled>
								</div>
							</div>

						</div>
					</div>
					<br>
					
					<!-- 전화번호 -->
					<div class="row insert" id="pAuth">
						<div class="col-10">
							<!-- 전화번호 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="phone">전화번호</label>
								</div>
							</div>
							<!-- 전화번호 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="phone" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 생년월일 -->
					<div class="row insert">
						<div class="col-10">
							<!-- 생년월일 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="birth">생년월일</label>
								</div>
							</div>
							<!-- 생년월일 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="birth" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 이메일 -->
					<div class="row insert">
						<div class="col-10">
							<!-- 이메일 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="email">E-mail</label>
								</div>
							</div>
							<!-- 이메일 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="email" class="form-control" id="email" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 주소 -->
					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label for="zipcode">우편번호</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="zipcode" class="col-35 form-control" disabled>
								</div>
							</div>		
						</div>
					</div>
					<br>

					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label for="address1">주소1</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="address1" class="col-10 form-control" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label for="address2">주소2</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="address2" class="col-10 form-control" disabled>
								</div>
							</div>
						</div>
					</div>
					<hr>

					<!-- 수정하러가기 버튼 & 탈퇴하기 버튼 & 돌아가기 버튼 -->
					<br>
					<div class="row justify-content-center">
						<div class="col-auto d-flex justify-content-end">
							<a href="/businessMember/goUpdateInfo?id=${sessionScope.id}">
								<button class="btn btn-secondary" type="button" id="goUpdateBtn" style="background-color: #76b852;">수정하기</button>
							</a>
						</div>
						<div class="col-auto d-flex justify-content-end">
							<button class="btn btn-secondary resignBtn" type="button" style="background-color: #76b852;">탈퇴하기</button>
						</div>
						<div class="col-auto d-flex justify-content-start">
							<a href="/">
								<button class="btn btn-secondary" type="button" id="back" style="background-color: #76b852;">뒤로가기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			
		<!-- 이 부분은 수정하기 완료 후 바뀐 정보보기 -->
		<c:if test="${status=='complete'}">
		<script>
			$("#find_member_fadeIn").css("display", "none");
			$(".container").css("margin-top", "100px");
			$(".container").css("margin-bottom", "20px");
		</script>
			<div class="row justify-content-center" id="info">
				<div class="col-12 col-md-8">
					<div class="header text-center">
						<h3>⚽CookCook</h3>
					</div>

					<!-- 이름 -->
					<div class="row insert">
						<div class="col-10">
							<!-- 이름 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="updateName">이름</label>
								</div>
							</div>
							<!-- 이름 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="updateName" value="${dto.name}" disabled >
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 사업장명 -->
					<div class="row insert">
						<div class="col-10 ">
							<!-- 닉네임 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="updateComPanyName">사업장명</label>
								</div>
							</div>
							<!-- 사업장명 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="updateCompanyName" value="${dto.companyName}" disabled>
								</div>
							</div>

						</div>
					</div>
					<br>
					
					<!-- 전화번호 -->
					<div class="row insert" id="pAuth">
						<div class="col-10">
							<!-- 전화번호 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="updatePhone">전화번호</label>
								</div>
							</div>
							<!-- 전화번호 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="updatePhone" value="${dto.phone}"disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 생년월일 -->
					<div class="row insert">
						<div class="col-10">
							<!-- 생년월일 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="updateBirth">생년월일</label>
								</div>
							</div>
							<!-- 생년월일 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="updateBirth" value="${dto.birthDate}" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 이메일 -->
					<div class="row insert">
						<div class="col-10">
							<!-- 이메일 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="updateEmail">E-mail</label>
								</div>
							</div>
							<!-- 이메일 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="email" class="form-control" id="updateEmail" value="${dto.eMail}" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<!-- 주소 -->
					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label for="updateZipcode">우편번호</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="updateZipcode" class="col-35 form-control" value="${dto.zipcode}" disabled>
								</div>
							</div>		
						</div>
					</div>
					<br>

					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label for="updateAddress1">주소1</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="updateAddress1" class="col-10 form-control" value="${dto.address1}" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label for="updateAddress2">주소2</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="updateAddress2" class="col-10 form-control" value="${dto.address2}" disabled>
								</div>
							</div>
						</div>
					</div>
					<hr>

					<!-- 수정하러가기 버튼 & 탈퇴하기 버튼 & 돌아가기 버튼 -->
					<br>
					<div class="row justify-content-center">
						<div class="col-auto d-flex justify-content-end">
							<a href="/businessMember/goUpdateInfo?id=${sessionScope.id}">
								<button class="btn btn-secondary" type="button" id="goUpdateBtn" style="background-color: #76b852;">수정하기</button>
							</a>
						</div>
						<div class="col-auto d-flex justify-content-end">
							<button class="btn btn-secondary resignBtn" type="button" style="background-color: #76b852;">탈퇴하기</button>
						</div>
						<div class="col-auto d-flex justify-content-start">
							<a href="/">
								<button class="btn btn-secondary" type="button" id="back" style="background-color: #76b852;">뒤로가기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		</div>
	</div>
	
	
			
		

	
	
	
	<script>
	// 마이페이지로 이동 전 비밀번호로 본인인증
		$("#btn").on("click", function() {
			if($("#pw").val().trim() == "") {
				alert("비밀번호를 입력해주세요.");
			}
			else {
				$.ajax({
					url : "/businessMember/checkPw",
					type : "post",
					dataType : "json",
					data : {
						pw : $("#pw").val()
					}
				}).done(function (resp) {
					if(resp) {
						$("#find_member_fadeIn").hide();
						$("#info").fadeIn();
						$(".container").css("margin-top", "100px");
						$(".container").css("margin-bottom", "20px");
						
						$.ajax({
							url : "/businessMember/selectBusinessMemberInfo",
							type : "post",
							dataType : "json",
							data : {
								id : "${sessionScope.id}"
							}
						}).done(function (resp) {
							$("#name").val(resp.name)
							$("#companyName").val(resp.companyName)
							$("#phone").val(resp.phone)
							$("#birth").val(resp.birthDate)
							$("#email").val(resp.eMail)
							$("#zipcode").val(resp.zipcode)
							$("#address1").val(resp.address1)
							$("#address2").val(resp.address2)
						})
					}
					else {
						alert("비밀번호가 일치하지 않습니다.");
						$("#pw").val("");
						$("#pw").focus();
					}
				})
			}
		})

	</script>
</body>
</html>