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
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<!-- awesome font -icon -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/businessMember/businessInfoUpdate"></script>
<style>
* {
	font-family: NanumSquareNeo;
	box-sizing: border-box;
}

body {
	background-color: rgba(255,255,194,0.75);
}

.container {
	margin-top: 100px;
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
	
	<div class="container login_container align-self-center">
		<div class="wrapper mx-auto position-relative">
		
		<!-- 회원정보 수정하기 -->
			<form action="/businessMember/updateMemberInfo" method="post" id="frm">
				<div class="row justify-content-center" id="info">
					<div class="col-12 col-md-8">
						<div class="header text-center">
							<h3>CookCook</h3>
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
										<input type="text" class="form-control" id="member_name" name="name" onkeyup="checksum(this, 'R');" pattern="^[가-힣]{2,5}$" title="2자 이상 5자 이내의 한글" minlength="2" maxlength="4" value="${info.name}" required>
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
						<!-- 사업장명 -->
						<div class="row insert">
							<div class="col-10 ">
								<!-- 사업장명 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_companyname">사업장명</label>
									</div>
								</div>
								<!-- 사업장명 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" class="form-control" id="member_companyname" name="companyName" onkeyup="checksum(this, 'A');" pattern="^[가-힣a-zA-Z0-9]{1,30}$" title="1자 이상 30자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " minlength="1" maxlength="30" value="${info.companyName}" required>
									</div>
								</div>
								<!-- 닉네임 중복 & 정규식 확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_companyname_checking" style="font-size:x-small;"></h9>
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
										<input type="text" class="form-control" id="member_phone" name="phone" onkeyup="checksum(this, 'A');" pattern="^010[0-9]{8}$" title="010으로 시작하는 11자리 번화번호" maxlength="11" placeholder="(-) 제외" value="${info.phone}" required>
									</div>
									<div class="col-4 mt-1 d-flex justify-content-center">
										<button type="button" class="btn btn-outline-success text-wrap" id="phone_auth">인증번호 받기</button>
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
										<input type="email" class="form-control" id="member_email" name="eMail" onkeyup="checksum(this, 'A');" pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$" title="abc@abc.com 형식으로 입력" value="${info.eMail}"required>
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
										<input type="text" id="sample6_postcode" placeholder="우편번호" class="col-35 form-control" name="zipcode" value="${info.zipcode}" required>
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
										<input type="text" id="sample6_address" placeholder="주소" class="col-10 form-control" name="address1" value="${info.address1}" required>
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
										<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="col-10 form-control" name="address2" value="${info.address2}" required>
									</div>
								</div>
							</div>
						</div>
						<hr>

						<!-- 수정완료 버튼 & 돌아가기 버튼 -->
						<br>
						<div class="row justify-content-center">
							<div class="col-auto d-flex justify-content-end">
								<button class="btn btn-secondary" id="updateBtn" style="background-color: #76b852;">수정완료</button>
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

</body>
</html>