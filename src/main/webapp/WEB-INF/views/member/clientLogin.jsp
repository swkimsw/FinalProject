<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<!--Popper Development version -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- 카카오 스크립트 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
<script>
            Kakao.init('ec820c4eea48288ba6533946b92c5965'); //발급받은 키 중 javascript키를 사용해준다.
         </script>
<!-- gnb css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/member/clientLogin.css">

<script>
// 일반인 로그인 실패 시 alert창 출력
window.onload = function(){
	
if(${status=="false"}) {
	alert("아이디와 비밀번호를 확인해주세요.");
}
// 사업자 로그인 실패 시 alert창 출력
else if(${status=="false2"}){
	alert("아이디와 비밀번호를 확인해주세요.");
	register(); // 사업자 로그인 폼으로 바로 이동
}
}
</script>
</head>

<body>



	<div class="container login_container align-self-center">

		<div class="row button-wrap">
			<div id="btn"></div>
			<div class="col-6">
				<button class="togglebtn" onclick="login()">일반 로그인</button>
			</div>
			<div class="col-6">
				<button class="togglebtn" onclick="register()">판매자 로그인</button>
			</div>
		</div>



		<div class="wrapper mx-auto position-relative" id="full1">
			<div class="position-absolute top-10 end-0 me-5">
				<button type="button" class="btn-close visually-hidden"
					id="btn_close" aria-label="Close" onclick="location.reload();"></button>
			</div>
			<div class="wrapper_login" id="login_view_fadeOut">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class=" col-md-6 login-form-1">
						<!-- 로그인 창1 미디어 사이즈 xs이하되면 예만 남음-->
						<div class="KickKick_logo text-center d-md-block d-none">
							<a href="/" class="nav_a">
								<h1 style="font-family: 'NanumSquareNeoHeavy';">🍽CookCook</h1>
							</a>
							<h3>일반 로그인에 돌아오신걸 환영해요!</h3>
						</div>
						<div class="d-md-none d-block d-flex justify-content-end">
							<button type="button" class="btn-close" id="btn_to_back"
								aria-label="Close" onclick="location.href='/';"></button>
						</div>
						<form action="/clientMember/login" method="post" id="form_login">
							<div class="form-group mb-4">
								<label class="control-label font-weight-bold font-size-7pt">아이디</label>
								<span>*</span>
								<div class="form-check float-end">
									<input class="form-check-input" type="checkbox" value="save_id"
										id="save_id"> <label class="form-check-label"
										for="save_id" style="font-size: x-small;">아이디 저장</label>
								</div>
								<input type="text" class="form-control" id="id" name="id"
									required />
							</div>
							<div class="form-group">
								<label class="control-label font-weight-bold font-size-7pt">비밀번호</label>
								<span>*</span> <input type="password" class="form-control m-0"
									id="pw" name="pw" required />
							</div>
							<div class="form-group mb-4">
								<a class="btn_forget_pwd" id="btn_forget_pwd">아이디 / 비밀번호를
									잊으셨나요?</a>
							</div>
							<div class="form-group mb-4">
								<input type="submit" class="site_login form-control"
									value="Login" />
							</div>
						</form>

						<div class="form-group join_form">
							아직 계정이 없으신가요? <a href="/clientMember/sign_form" class="btnJoin">가입하기</a>
						</div>
					</div>
					<!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
					<div
						class="d-none d-md-block col-md-6 login-form-2 align-self-center"
						id="hidden">

						<!-- 11111111 -->
						<div class="form-group text-center mb-4">
							<!-- 							<div id="tooltip" role="tooltip" class="mb-3">
                        메인으로!
                        <div id="arrow" class="data-popper-arrow"></div>
                     </div> -->
							<img src="/resources/img/foodWithPlate.png"
								class="mx-auto d-block" id="to_main_ball_img" alt="메인으로"
								onclick="location.href = '/'" style="height: 80%; width: 80%;">
						</div>

					</div>
				</div>
			</div>
			<!-- id/pw 찾기 누르면 fadeIn -->
			<div class="wrapper_find_member" id="find_member_fadeIn"
				style="display: none">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class="col-md-6 login-form-1 align-center">
						<div class="KickKick_logo text-center d-md-block mb-4">
							<h3 class="mb-5">계정 찾기</h3>
							<p class="body_font mb-5">휴대폰 인증을 통해 아이디를 확인합니다.</p>
						</div>
						<div class="text-center">
							<input type="checkbox" class="btn-check" id="btn-check-outlined"
								autocomplete="off"> <label
								class="btn btn-outline-success" for="btn-check-outlined">휴대폰
								인증하기</label>
						</div>
						<hr>
						<div>
							<p class="footer_font">가입했던 계정이 기억나지 않으신가요?</p>
							<p class="footer_font">걱정마세요!</p>
							<p class="footer_font">customer@CookCook.co.kr로 문의하시길 바랍니다.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 휴대폰 인증하기 누르면 fadeIn -->
			<div class="wrapper_phone_Certification justify-content-center"
				id="to_phone_authentication_fadeIn" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">🍽CookCook</h1>
					<h3>이제 얼마 안남았습니다!</h3>
				</div>
				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label for="phone" class="col-form-label">전화번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="phone" name="phone" class="form-control"
							placeholder="(-) 제외">
					</div>
					<div class="col-12 col-md-4">
						<button type="submit" class="btn btn-outline-success"
							id="phone_auth">인증번호 받기</button>
					</div>

				</div>
				<br>
				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label class="col-form-label">인증번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="phone_auth_code" class="form-control">
					</div>
					<div class="col-12 col-md-4">
						<button type="button" class="btn btn-outline-success"
							id="phone_auth_ok">인증</button>
					</div>
					<div class="row g-3 m-0 p-0  justify-content-center">
						<div class="col-12 col-md-4">
							<div class="timer">
								<div id="timeLimit"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 인증하기 누르면 fadeIn -->
			<div class="wrapper_change_pw justify-content-center"
				id="to_change_pw_fadeIn" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">🍽CookCook</h1>
					<h3 id="search_id"></h3>
					<h3>이제 진짜 진짜 얼마 안남았어요!</h3>
				</div>
				<div class="text-center">
					<p id="search_id2"></p>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 mb-1">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1"
								placeholder="새 비밀번호" aria-label="password"
								aria-describedby="password" id="password" class="password" />
							<div class="valid-feedback" style="font-size: x-small;">Good</div>
							<div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
						</div>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 mt-1">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1"
								placeholder="새 비밀번호" aria-label="password"
								aria-describedby="password_check" id="password_check"
								class="password_check" />
							<div class="valid-feedback" style="font-size: x-small;">Good</div>
							<div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
						</div>
					</div>
					<br>
					<div class="row d-flex justify-content-center">
						<div class="col-6 mt-4 mt-xxl-0 w-auto h-auto">
							<div class="alert px-4 py-3 mb-0 alert-warning d-none"
								role="alert" data-mdb-color="warning" id="password-alert">
								<ul class="list-unstyled mb-0">
									<li class="requirements leng"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호는 8자 이상이어야 합니다</li>
									<li class="requirements big-letter"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호에 하나 이상의 알파벳 대문자를 포함해야
										합니다.</li>
									<li class="requirements num"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호에 숫자가 하나 이상 포함되어야 합니다.
									</li>
									<li class="requirements special-char"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호에 특수문자가 하나 이상 포함되어야
										합니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 d-flex justify-content-center">
						<button type="button" class="btn btn-outline-success"
							id="btn_change_pw">비밀번호 변경하기</button>
					</div>
				</div>
			</div>
		</div>


		<div class="wrapper mx-auto position-relative" id="full2">
			<div class="position-absolute top-10 end-0 me-5">
				<button type="button" class="btn-close visually-hidden"
					id="btn_close2" aria-label="Close" onclick="location.reload();"></button>
			</div>
			<div class="wrapper_login" id="login_view_fadeOut2">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class=" col-md-6 login-form-1">
						<!-- 로그인 창1 미디어 사이즈 xs이하되면 예만 남음-->
						<div class="KickKick_logo text-center d-md-block d-none">
							<a href="/" class="nav_a">
								<h1 style="font-family: 'NanumSquareNeoHeavy';">🍽CookCook</h1>
							</a>
							<h3>판매자 로그인에 돌아오신걸 환영해요!</h3>
						</div>
						<div class="d-md-none d-block d-flex justify-content-end">
							<button type="button" class="btn-close" id="btn_to_back"
								aria-label="Close" onclick="location.href='/';"></button>
						</div>
						<form action="/businessMember/login" method="post" id="form_login">
							<div class="form-group mb-4">
								<label class="control-label font-weight-bold font-size-7pt">사업자
									등록 번호</label> <span>*</span>
								<div class="form-check float-end">
									<input class="form-check-input" type="checkbox" value="save_id"
										id="save_id"> <label class="form-check-label"
										for="save_id" style="font-size: x-small;">사업자 등록 번호 저장</label>
								</div>
								<input type="text" class="form-control" id="id"
									name="businessId" maxlength="10"
									placeholder="사업자등록번호 10자리(숫자)를 입력하세요."
									oninput="validateInput(event)" required />

							</div>
							<div class="form-group">
								<label class="control-label font-weight-bold font-size-7pt">비밀번호</label>
								<span>*</span> <input type="password" class="form-control m-0"
									id="pw" name="pw" required />
							</div>
							<div class="form-group mb-4">
								<a class="btn_forget_pwd" id="btn_forget_pwd2">아이디 / 비밀번호를
									잊으셨나요?</a>
							</div>
							<div class="form-group mb-4">
								<input type="submit" class="site_login form-control"
									value="Login" />
							</div>
						</form>

						<div class="form-group join_form">
							아직 계정이 없으신가요? <a href="/businessMember/sign_form" class="btnJoin">가입하기</a>
						</div>
					</div>
					<!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
					<div
						class="d-none d-md-block col-md-6 login-form-2 align-self-center"
						id="hidden">

						<!-- 11111111 -->
						<div class="form-group text-center mb-4">
							<!-- 							<div id="tooltip" role="tooltip" class="mb-3">
                        메인으로!
                        <div id="arrow" class="data-popper-arrow"></div>
                     </div> -->
							<img src="/resources/img/foodWithPlate.png"
								class="mx-auto d-block" id="to_main_ball_img" alt="메인으로"
								onclick="location.href = '/'" style="height: 80%; width: 80%;">
						</div>

					</div>
				</div>
			</div>
			<!-- id/pw 찾기 누르면 fadeIn -->
			<div class="wrapper_find_member" id="find_member_fadeIn2"
				style="display: none">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class="col-md-6 login-form-1 align-center">
						<div class="KickKick_logo text-center d-md-block mb-4">
							<h3 class="mb-5">계정 찾기</h3>
							<p class="body_font mb-5">휴대폰 인증을 통해 아이디를 확인합니다.</p>
						</div>
						<div class="text-center">
							<input type="checkbox" class="btn-check" id="btn-check-outlined2"
								autocomplete="off"> <label
								class="btn btn-outline-success" for="btn-check-outlined2">휴대폰
								인증하기</label>
						</div>
						<hr>
						<div>
							<p class="footer_font">가입했던 계정이 기억나지 않으신가요?</p>
							<p class="footer_font">걱정마세요!</p>
							<p class="footer_font">customer@KickKick.co.kr로 문의하시길 바랍니다.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 휴대폰 인증하기 누르면 fadeIn -->
			<div class="wrapper_phone_Certification justify-content-center"
				id="to_phone_authentication_fadeIn2" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">🍽CookCook</h1>
					<h3>이제 얼마 안남았습니다!</h3>
				</div>
				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label for="phone" class="col-form-label">전화번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="businessPhone" name="businessPhone"
							class="form-control" placeholder="(-) 제외">
					</div>
					<div class="col-12 col-md-4">
						<button type="submit" class="btn btn-outline-success"
							id="businessPhoneOk2">인증번호 받기</button>
					</div>
				</div>

				<br>

				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label class="col-form-label">인증번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="businessPhoneCode" class="form-control">
					</div>
					<div class="col-12 col-md-4">
						<button type="button" class="btn btn-outline-success"
							id="businessPhoneOk">인증</button>
					</div>
					<div class="row g-3 m-0 p-0  justify-content-center">
						<div class="col-12 col-md-4">
							<div class="timer">
								<div id="timeLimit2"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 인증하기 누르면 fadeIn -->
			<div class="wrapper_change_pw justify-content-center"
				id="to_change_pw_fadeIn2" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">🍽CookCook</h1>
					<h3 id="businessScId"></h3>
					<h3>이제 진짜 진짜 얼마 안남았어요!</h3>
				</div>
				<div class="text-center">
					<p id="bSearch_id2"></p>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 mb-1">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1"
								placeholder="새 비밀번호" aria-label="password"
								aria-describedby="password" id="businessPw" class="password" />
							<div class="valid-feedback" style="font-size: x-small;">Good</div>
							<div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
						</div>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 mt-1">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1"
								placeholder="새 비밀번호" aria-label="password"
								aria-describedby="password_check" id="businessPw_check"
								class="password_check" />
							<div class="valid-feedback" style="font-size: x-small;">Good</div>
							<div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
						</div>
					</div>
					<br>
					<div class="row d-flex justify-content-center">
						<div class="col-6 mt-4 mt-xxl-0 w-auto h-auto">
							<div class="alert px-4 py-3 mb-0 alert-warning d-none"
								role="alert" data-mdb-color="warning" id="businessPw-alert">
								<ul class="list-unstyled mb-0">
									<li class="requirements leng"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호는 8자 이상이어야 합니다</li>
									<li class="requirements big-letter"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호에 하나 이상의 알파벳 대문자를 포함해야
										합니다.</li>
									<li class="requirements num"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호에 숫자가 하나 이상 포함되어야 합니다.
									</li>
									<li class="requirements special-char"><i
										class="bi bi-check text-success me-2"></i> <i
										class="bi bi-x text-danger me-3"></i> 암호에 특수문자가 하나 이상 포함되어야
										합니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 d-flex justify-content-center">
						<button type="button" class="btn btn-outline-success"
							id="businessBtnChangePw">비밀번호 변경하기</button>
					</div>
				</div>
			</div>
		</div>
<script src="${path}/resources/js/clientMember/clientLogin.js" />

</body>

</html>