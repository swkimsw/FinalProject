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
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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

.essential {
	font-size: small;
	font-family: 'NanumSquareNeoBold';
	color: red;
}

.condition {
	font-size: 11px;
}

.btn {
	font-size: small;
}

#password-alert * {
	font-size: x-small;
}

.wrong .bi-check {
	display: none;
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

#member_birth_day {
	padding: 0.375rem 0 0.375rem 0;
	font-size: 0.75rem;
}

.form-select {
	padding: 0.375rem 0 0.375rem 0;
	background-size: 8px 8px;
	font-size: 0.75rem;
}

.form-select::-webkit-scrollbar {
	display: none;
}

@media ( min-width :@screen-sm-min) {
	.form-select {
		padding: 0.375rem 0 0.375rem 0;
		background-size: 8px 8px;
		font-size: 0.75rem;
	}
}


</style>
</head>
<body>
	<c:import url="../commons/gnb.jsp">
	</c:import>
	
	<input id="id" type="hidden" value="${sessionScope.id}">
	
	
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
					
					<!-- 닉네임 -->
					<div class="row insert">
						<div class="col-10 ">
							<!-- 닉네임 타이틀 -->
							<div class="row label">
								<div class="col-12">
									<label for="nickName">닉네임</label>
								</div>
							</div>
							<!-- 닉네임 출력 -->
							<div class="row input">
								<div class="col-12">
									<input type="text" class="form-control" id="nickName" disabled>
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
								<div class="col-8">
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
								<div class="col-4">
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
									<label>우편번호</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-9">
									<input type="text" id="add1" class="col-35 form-control" disabled>
								</div>
							</div>		
						</div>
					</div>
					<br>

					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label>주소1</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="add2" class="col-10 form-control" disabled>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					<div class="row insert">
						<div class="col-10">
							<div class="row label">
								<div class="col-12">
									<label>주소2</label>
								</div>
							</div>
							<div class="row input">
								<div class="col-12">
									<input type="text" id="add3" class="col-10 form-control" disabled>
								</div>
							</div>
						</div>
					</div>
					<hr>

					<!-- 가입버튼 & 돌아가기 버튼 -->
					<br>
					<div class="row justify-content-center">
						<div class="col-auto d-flex justify-content-end">
							<button class="btn btn-secondary" type="button" id="join" style="background-color: #76b852;">수정하기</button>
						</div>
						<div class="col-auto d-flex justify-content-start">
							<a href="/">
								<button class="btn btn-secondary" type="button" id="back" style="background-color: #76b852;">뒤로가기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 회원정보 수정하기 -->
			<form action="/clientMember/signup" method="post" id="frm" style="display:none;">
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
										<span class="essential">*&nbsp;</span>
										<label for="member_name">이름</label>
									</div>
								</div>
								<!-- 이름 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" class="form-control" id="member_name" name="name" onkeyup="checksum(this, 'R');" pattern="^[가-힣]{2,5}$" title="2자 이상 5자 이내의 한글" minlength="2" maxlength="4" required>
									</div>
								</div>
								<!-- 이름 정규식 확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_name_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
							</div>
						</div>
						<!-- 닉네임 -->
						<div class="row insert">
							<div class="col-10 ">
								<!-- 닉네임 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_nickname">닉네임</label>
									</div>
								</div>
								<!-- 닉네임 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" class="form-control" id="member_nickname" name="nickName" onkeyup="checksum(this, 'A');" pattern="^[가-힣a-zA-Z0-9]{2,10}$" title="2자 이상 10자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " minlength="2" maxlength="10" required>
									</div>
								</div>
								<!-- 닉네임 중복 & 정규식 확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_nickname_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
							</div>
						</div>
						<!-- 전화번호 -->
						<div class="row insert" id="pAuth">
							<div class="col-10">
								<!-- 전화번호 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_phone">전화번호</label>
									</div>
								</div>
								<!-- 전화번호 입력창 & 인증번호 받기 버튼 -->
								<div class="row input">
									<div class="col-8">
										<input type="text" class="form-control" id="member_phone" name="phone" onkeyup="checksum(this, 'A');" pattern="^010[0-9]{8}$" title="010으로 시작하는 11자리 번화번호" maxlength="11" placeholder="(-) 제외" required>
									</div>
									<div class="col-4 mt-1 d-flex justify-content-center">
										<button type="button" class="btn btn-outline-success text-wrap" id="phone_auth" disabled="disabled">인증번호 받기</button>
									</div>
								</div>
								<!-- 전화번호 중복 & 정규식 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_phone_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
								<br>
								<!-- 인증번호 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" id="phone_auth_code" class="form-control" readonly="readonly" required>
									</div>
								</div>
								<!-- 인증 시간 & 인증 버튼 -->
								<div class="row justify-content-end">
									<div class="col-auto timer mx-3 mt-1 p-">
										<div id="timeLimit">03분00초</div>
									</div>
									<div class="col-auto mt-1">
										<button type="button" class="btn btn-outline-success" id="phone_auth_ok" disabled="disabled">인증</button>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 생년월일 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 생년월일 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_birth">생년월일</label>
									</div>
								</div>
								<!-- 생년월일 입력창 -->
								<div class="row input">
									<div class="col-4 d-flex align-items-center">
										<select class="form-select m-1 ps-1" id="member_birth_year" name="member_birth_year"></select>
										년
									</div>
									<div class="col-4 d-flex align-items-center">
										<select class="form-select m-1 ps-1" id="member_birth_month" name="member_birth_month"></select>
										월
									</div>
									<div class="col-4 d-flex align-items-center">
										<select class="form-select m-1 ps-1" id="member_birth_day" name="member_birth_day">
											<option>01</option>
										</select>
										일
									</div>
								</div>
							</div>
						</div>
						
						<!-- 이메일 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 이메일 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_email">E-mail</label>
									</div>
								</div>
								<!-- 이메일 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="email" class="form-control" id="member_email" name="eMail" onkeyup="checksum(this, 'A');" pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$" title="abc@abc.com 형식으로 입력" required>
									</div>
								</div>
								<!-- 이메일 중복 & 정규식 확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_email_checking" style="font-size:x-small;"></h9>
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
										<span class="essential">*&nbsp;</span>
										<label>우편번호</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-9">
										<input type="text" id="sample6_postcode" placeholder="우편번호" class="col-35 form-control" name="zipcode" required>
									</div>
									<div class="col-3">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success text-wrap" style="margin-left: 3px;">
									</div>
								</div>		
							</div>
							<br>
						</div>
		
						<div class="row insert">
							<div class="col-10">
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label>주소1</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-12">
										<input type="text" id="sample6_address" placeholder="주소" class="col-10 form-control" name="address1" required>
									</div>
								</div>
							</div>
		
						</div>
						<div class="row insert">
							<div class="col-10">
								<div class="row label">
										<div class="col-12">
											<span class="essential">*&nbsp;</span>
											<label>주소2</label>
										</div>
								</div>
								<div class="row input">
									<div class="col-12">
										<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="col-10 form-control" name="address2" required>
									</div>
								</div>
							</div>
						</div>
						<hr>

						<!-- 가입버튼 & 돌아가기 버튼 -->
						<br>
						<div class="row justify-content-center">
							<div class="col-auto d-flex justify-content-end">
								<button class="btn btn-secondary" id="joinBtn" style="background-color: #76b852;">수정완료</button>
							</div>
							<div class="col-auto d-flex justify-content-start">
								<button class="btn btn-secondary" type="button" id="backBtn" style="background-color: #76b852;">뒤로가기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
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
					url : "/clientMyPage/checkPw",
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
							url : "/clientMyPage/selectClientMemberInfo",
							type : "post",
							dataType : "json",
							data : {
								id : $("#id").val()
							}
						}).done(function (resp) {
							$("#name").val(resp.name)
							$("#nickName").val(resp.nickName)
							$("#phone").val(resp.phone)
							$("#birth").val(resp.birthDate)
							$("#email").val(resp.eMail)
							$("#add1").val(resp.zipcode)
							$("#add2").val(resp.address1)
							$("#add3").val(resp.address2)
						})
					}
					else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				})
			}
		})
		
		// 마이페이지에서 수정하기 버튼 입력 시 수정가능한 폼으로 이동
		$("#join").on("click", function() {
			$("#info").hide();
			$("#frm").fadeIn();
			$.ajax({
				url : "/clientMyPage/selectClientMemberInfo",
				type : "post",
				dataType : "json",
				data : {
					id : $("#id").val()
				}
			}).done(function (resp) {
				$("#member_name").val(resp.name)
				$("#member_nickname").val(resp.nickName)
				$("#member_phone").val(resp.phone)
				$("#member_birth_year").val(resp.birthDate.substr(0,4))
				$("#member_birth_month").val(resp.birthDate.substr(4,2))
				$("#member_birth_day").val(resp.birthDate.substr(6,2))
				$("#member_email").val(resp.eMail)
				$("#sample6_postcode").val(resp.zipcode)
				$("#sample6_address").val(resp.address1)
				$("#sample6_detailAddress").val(resp.address2)
			})
		})
		
		// 여기부터 회원수정할 때 정규식, 중복체크
		$("#member_phone").on("keydown", function () {
			$("#phone_auth").attr("disabled", true);
			$("#phone_auth_code").attr("readonly", true);
			$("#phone_auth_ok").attr("disabled", true);
		});
		// 정규식 & 중복 체크 - 아이디 & 닉네임 & 이메일 ...
		let valid = new Map();
		let setValid;
		function checksum(evt, type) {
			let id = $(evt).attr("id");
			let regex = new RegExp($(evt).attr("pattern"));
			let value = $(evt).val();
			// MAP(valid)에 KEY(value)가 없으면 flase 추가
			if (valid.get(id) != true || valid.get(id) != false) {
				valid.set(id, false);
			}
			// 정규식 체크
			if (!regex.exec(value)) {
				if (value == "")
					$("#" + id + "_checking").html("");
				else
					$("#" + id + "_checking").html($(evt).attr("title")).css("color", "red");
				valid.set(id, false);
				return false;
			} else {
				$("#" + id + "_checking").html("사용가능").css("color", "#198754");
				valid.set(id, true);
			}
			// 중복체크 여부 확인
			if (type != "A") return false;
			// 중복 체크
			$.ajax({
				url : "/clientMember/checkSum",
				type : "post",
				dataType : "json",
				data : {
					key: id.split("_")[1].toUpperCase(),
					value: value
				},
				error : function() {
					alert("서버 요청 실패");
				}
			}).done(function(resp) {
				if (resp) {
					$("#" + id + "_checking").html("중복된 " + id.split("_")[1].toUpperCase()).css("color", "red");
					setValid = valid.set(id, false);

				} else {
					$("#" + id + "_checking").html("사용가능한 " + id.split("_")[1].toUpperCase()).css("color", "#198754");
					valid.set(id, true);
					if (id == "member_phone") {
						$("#phone_auth").attr("disabled", false);
						$("#phone_auth_ok").attr("disabled", false);
						valid.set("auth", false);
					}
				}
			});
			
			$("#joinBtn").on("click", function() {
				if(setValid.get(id) == false) {
					$("#" + id).focus();
					return false;
				}
			})
		}
		
		// PW 유효성 검사
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("member_pw");
			const passwordAlert = document.getElementById("password-alert");
			const requirements = document.querySelectorAll(".requirements");
			let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
			let leng = document.querySelector(".leng");
			let bigLetter = document.querySelector(".big-letter");
			let num = document.querySelector(".num");
			let specialChar = document.querySelector(".special-char");
			const specialChars = "!@#$%^&*()-_=+[{]}\\|;:'\,./?`~";
			const numbers = "0123456789";
			
			requirements.forEach((element) => element.classList.add("wrong"));
			
			
			password.addEventListener("focus", () => {
				passwordAlert.classList.remove("d-none");
				if (!password.classList.contains("is-valid")) {
					password.classList.add("is-invalid");
				}
			});
			
			password.addEventListener("input", () => {
				let value = password.value;
				
				if (value.length < 8) {
				    lengBoolean = false;
				} else if (value.length > 7) {
				    lengBoolean = true;
				}
				
				if (value.toLowerCase() == value) {
				    bigLetterBoolean = false;
				} else {
				    bigLetterBoolean = true;
				}
				
				numBoolean = false;
				for (let i = 0; i < value.length; i++) {
				    for (let j = 0; j < numbers.length; j++) {
				        if (value[i] == numbers[j]) {
				            numBoolean = true;
				        }
				    }
				}
				
				specialCharBoolean = false;
				for (let i = 0; i < value.length; i++) {
				    for (let j = 0; j < specialChars.length; j++) {
				        if (value[i] == specialChars[j]) {
				            specialCharBoolean = true;
				        }
				    }
				}
				
				if (lengBoolean == true && bigLetterBoolean == true && numBoolean == true && specialCharBoolean == true) {
					password.classList.remove("is-invalid");
					password.classList.add("is-valid");
					
					requirements.forEach((element) => {
						element.classList.remove("wrong");
						element.classList.add("good");
					});
					passwordAlert.classList.remove("alert-warning");
					passwordAlert.classList.add("alert-success");
				} else {
					password.classList.remove("is-valid");
					password.classList.add("is-invalid");
					
					passwordAlert.classList.add("alert-warning");
					passwordAlert.classList.remove("alert-success");
					
					if (lengBoolean == false) {
						leng.classList.add("wrong");
						leng.classList.remove("good");
					} else {
						leng.classList.add("good");
						leng.classList.remove("wrong");
					}
					
					if (bigLetterBoolean == false) {
						bigLetter.classList.add("wrong");
						bigLetter.classList.remove("good");
					} else {
						bigLetter.classList.add("good");
						bigLetter.classList.remove("wrong");
					}
					
					if (numBoolean == false) {
						num.classList.add("wrong");
						num.classList.remove("good");
					} else {
						num.classList.add("good");
						num.classList.remove("wrong");
					}
					
					if (specialCharBoolean == false) {
						specialChar.classList.add("wrong");
						specialChar.classList.remove("good");
					} else {
						specialChar.classList.add("good");
						specialChar.classList.remove("wrong");
					}
				}
			});
			
			password.addEventListener("blur", () => {
				passwordAlert.classList.add("d-none");
				if (password.value == "") {
					password.classList.remove("is-invalid");
				}
			});
		});
		// PW 일치 검사
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("password_check");
			const passwordAlert = document.getElementById("password-alert");
			const requirements = document.querySelectorAll(".requirements");
			
			password.addEventListener("focus", () => {
				if (!password.classList.contains("is-valid")) {
					password.classList.add("is-invalid");
				}
			});
			requirements.forEach((element) => element.classList.add("wrong"));
			
			password.addEventListener("input", () => {
				let value = password.value;
				if (value == document.getElementById("member_pw").value) {
					password.classList.remove("is-invalid");
					password.classList.add("is-valid");
					
					requirements.forEach((element) => {
						element.classList.remove("wrong");
						element.classList.add("good");
					});
					passwordAlert.classList.remove("alert-warning");
					passwordAlert.classList.add("alert-success");
				}else {
					password.classList.add("is-invalid");
					password.classList.remove("is-valid");
					
					requirements.forEach((element) => {
						element.classList.add("wrong");
						element.classList.remove("good");
					});
					passwordAlert.classList.add("alert-warning");
					passwordAlert.classList.remove("alert-success");
					console.log("틀렷음");
				}
			});
			
			password.addEventListener("blur", () => {
				if (password.value == "") {
					password.classList.remove("is-invalid");
				}
			});
        });
		// 타이머 구현
		function $ComTimer() { }
		$ComTimer.prototype = {
			comSecond: "",
			fnCallback: function () { },
			timer: "",
			domId: "",
			fnTimer: function () {
				// 남은 시간 계산
				var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";
				// 1초씩 감소
				this.comSecond--;					
				this.domId.innerText = m;
				// 시간이 종료 되었으면..
				if (this.comSecond < 0) {
					// 타이머 해제
					// 타이머 해제 시 세션에 저장된 인증번호 삭제
					clearInterval(this.timer);
					alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
					$.ajax({
						url : "/clientMember/removeSession"
					})
					$("#phone_auth").attr("disabled", false);
					$("#timeLimit").text("");
				}
			},
			fnStop: function () { clearInterval(this.timer); }
			}
		// 인증번호 받기 버튼 이벤트
		$("#phone_auth").on("click", function (evt) {
			// 전화번호 check 및 인증번호 발송
			$.ajax({
				url: "/clientMember/sendSmsSign",
				type: "post",
				dataType: "json",
				data: { phone: $("#member_phone").val(), type: "JOIN" }
			}).done(function (resp) {
				// 전화번호 check
				if (resp) {
					$("#member_phone").val("");
					$("#phone_auth").attr("disabled", true);
					alert("등록된 연락처가 존재합니다.");
					return false;
				}
				else {
					alert("인증문자가 전송되었습니다.");
					$("#phone_auth_code").attr("readonly", false);
				}
				
				// 인증번호 받기 버튼 비활성화
				$("#phone_auth").attr("disabled", true);
				
				AuthTimer = new $ComTimer();
				// 제한 시간
				AuthTimer.comSecond = 180; 
				// 제한 시간 만료 메세지
				AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
				AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
				AuthTimer.domId = document.getElementById("timeLimit");
			});
		});
		// 인증 버튼 이벤트
		$("#phone_auth_ok").on("click", function () {
			//입력 안했을 경우
			if(!$("#phone_auth_code").val()){
				alert("인증번호를 입력해주세요");
				return false;
			}
			// 인증 체크
			$.ajax({
				url: "/clientMember/certificationSign",
				type: "post",
				dataType: "json",
				data: { code: $("#phone_auth_code").val() }
			}).done(function name(resp) {
				if (resp) {
					AuthTimer.fnStop();
					$("#timeLimit").text("인증 성공!🎉");
					
					$("#pAuth button").attr("disabled", true);
					$("#pAuth input").attr("readonly", true);
					
					valid.set("auth", true);
				} else {
					alert("인증번호가 틀렸거나 시간이 초과되었습니다.");
					$("#phone_auth_code").val("");
				}
			});
		});
		// 생년월일 select option setting - 년 / 월
		$(document).ready(function () {
			var now = new Date();
			var year = now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
			//년도 selectbox만들기               
			for (var i = year - 100; i <= year; i++) {
				$("#member_birth_year").append('<option value="' + i + '">' + i + '</option>');
			}
			$("#member_birth_year>option[value="+ year + "]").attr("selected", "true");
			// 월별 selectbox 만들기            
			for (var i = 1; i <= 12; i++) {
			    var mm = i > 9 ? i : "0" + i;
			    $("#member_birth_month").append('<option value="' + mm + '">' + mm + '</option>');
			}
			$("#member_birth_month>option[value=" + mon + "]").attr("selected", "true");
			//
			let last = (new Date($("#member_birth_year").val(), $("#member_birth_month").val() - 0, 0)).getDate();
			// 일별 selectbox 만들기
			$("#member_birth_day").html("");
			for (var i = 1; i <= last; i++) {
			    var dd = i > 9 ? i : "0" + i;
			    $("#member_birth_day").append('<option value="' + dd + '">' + dd + '</option>');
			}
			$("#member_birth_day>option[value='01']").attr("selected", "true");
		});
		// 생년월일 select option setting - 일
		$("#member_birth_month").on("click", function () {
			let last = (new Date($("#member_birth_year").val(), $("#member_birth_month").val() - 0, 0)).getDate();
			// 일별 selectbox 만들기
			$("#member_birth_day").html("");
			for (var i = 1; i <= last; i++) {
			    var dd = i > 9 ? i : "0" + i;
			    $("#member_birth_day").append('<option value="' + dd + '">' + dd + '</option>');
			}
			$("#member_birth_day>option[value='01']").attr("selected", "true");
		});
		
		// 비밀번호 보기
		$("#view_pw").on("click", function() {
			let password_field = $("#member_pw");
			let password_field_type = password_field.attr("type");
			if (password_field_type == "password") {
				password_field.attr("type", "text");
				$("#view_pw").html("숨기기");
			} else {
				password_field.attr("type", "password");
				$("#view_pw").html("보기");
			}
		});
		
		
		// 주소
		// 주소
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}

							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open(); 
		
			
		}
		document.addEventListener("DOMContentLoaded", function() {
			  var password_check = document.getElementById("password_check");
			  var member_name = document.getElementById("member_name");
			  var member_nickname = document.getElementById("member_nickname");
			  var member_phone = document.getElementById("member_phone");
			  var phone_auth_code = document.getElementById("phone_auth_code");
			  var sample6_postcode = document.getElementById("sample6_postcode");
			  var sample6_address = document.getElementById("sample6_address");
			  var sample6_detailAddress = document.getElementById("sample6_detailAddress");
			  var member_email = document.getElementById("member_email");

			  if (password_check.value === "") {
			    password_check.focus();
			  } else if (member_name.value === "") {
			    member_name.focus();
			  } else if (member_nickname.value === "") {
			    member_nickname.focus();
			  } else if (member_phone.value === "") {
			    member_phone.focus();
			  } else if (phone_auth_code.value === "") {
			    phone_auth_code.focus();
			  } else if (sample6_postcode.value === "") {
			    sample6_postcode.focus();
			  } else if (sample6_address.value === "") {
			    sample6_address.focus();
			  } else if (sample6_detailAddress.value === "") {
			    sample6_detailAddress.focus();
			  } else if (member_email.value === "") {
			    member_email.focus();
			  }
			});	
		
		// 회원정보 수정할 수 있는 폼에서 뒤로가기 누를 시
		$("#backBtn").on("click", function() {
			$("#frm").hide()
			$("#info").fadeIn();
			
		})
	</script>
</body>
</html>