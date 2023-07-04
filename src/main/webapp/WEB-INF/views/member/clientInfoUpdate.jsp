<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - 내 정보 보기</title>
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
<!-- css -->
<link href="${path}/resources/css/member/clientInfoUpdate.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:import url="../commons/gnb.jsp">
	</c:import>
	
	<div class="container login_container align-self-center">
		<div class="wrapper mx-auto position-relative">
		
		<!-- 회원정보 수정하기 -->
			<form action="/clientMember/updateMemberInfo" method="post" id="frm">
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
										<input type="text" class="form-control" id="member_nickname" name="nickName" onkeyup="checksum(this, 'A');" pattern="^[가-힣a-zA-Z0-9]{2,10}$" title="2자 이상 10자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " minlength="2" maxlength="10" value="${info.nickName}" required>
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
										<input type="text" id="sample6_postcode" placeholder="우편번호" class="col-35 form-control" name="zipcode" value="${info.zipcode}" readonly required>
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
										<input type="text" id="sample6_address" placeholder="주소" class="col-10 form-control" name="address1" value="${info.address1}" readonly required>
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
	
	<script>

	
	
	// 여기부터 회원수정할 때 정규식, 중복체크
	$("#member_phone").on("keydown", function () {
		$("#phone_auth").attr("disabled", true);
		$("#phone_auth_code").attr("readonly", true);
		$("#phone_auth_ok").attr("disabled", true);
	});
	// 정규식 & 중복 체크 - 아이디 & 닉네임 & 이메일 ...
	let valid = new Map();
	let setValid;
	setValid = valid.set("auth", false);
	let id;
	function checksum(evt, type) {
		id = $(evt).attr("id");
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
				$.ajax({
					url : "/clientMember/selectClientMemberInfo",
					type : "post",
					dataType : "json",
					data : {
						id : "${sessionScope.id}"
					}
				}).done(function (info) {
						if (id.split("_")[1].toUpperCase() === "NICKNAME") {
							if(info.nickName == $("#member_nickname").val()) {
								$("#" + id + "_checking").html("사용가능한 " + id.split("_")[1].toUpperCase()).css("color", "#198754");
								setValid = valid.set(id, true);
							}
							else {
								$("#" + id + "_checking").html("중복된 " + id.split("_")[1].toUpperCase()).css("color", "red");
								setValid = valid.set(id, false);
							}
						}

						if (id.split("_")[1].toUpperCase() === "PHONE"){
							if(info.phone == $("#member_phone").val()) {
								$("#" + id + "_checking").html("사용가능한 " + id.split("_")[1].toUpperCase()).css("color", "#198754");
								$("#phone_auth").attr("disabled", false);
								setValid = valid.set(id, true);
							}
							else {
								$("#" + id + "_checking").html("중복된 " + id.split("_")[1].toUpperCase()).css("color", "red");
								setValid = valid.set(id, false);
							}
						}

						if (id.split("_")[1].toUpperCase() === "EMAIL") {
							if(info.eMail == $("#member_email").val()) {
								$("#" + id + "_checking").html("사용가능한 " + id.split("_")[1].toUpperCase()).css("color", "#198754");
								setValid = valid.set(id, true);
							}
							else {
								$("#" + id + "_checking").html("중복된 " + id.split("_")[1].toUpperCase()).css("color", "red");
								setValid = valid.set(id, false);
							}
						}
				})
			} else {
				$("#" + id + "_checking").html("사용가능한 " + id.split("_")[1].toUpperCase()).css("color", "#198754");
				setValid = valid.set(id, true);
				if (id == "member_phone") {
					$("#phone_auth").attr("disabled", false);
					valid.set("auth", false);
				}
			}
		});
	}
	
	$("#updateBtn").on("click", function() {
		if(setValid.get(id) == false) {
			$("#" + id).focus();
			return false;
		}
		if(setValid.get("auth") == false) {
			alert("수정 시 휴대폰 인증은 필수입니다.");
			return false;
		}
		alert("변경되었습니다.");
	})

	
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
		// 인증번호 받기 버튼 비활성화
		$("#phone_auth").attr("disabled", true);
		$.ajax({
			url: "/clientMember/sendSmsUpdate",
			type: "post",
			dataType: "json",
			data: { phone: $("#member_phone").val(), type: "JOIN" }
		}).done(function (resp) {
			// 전화번호 check
			if (resp) {
				alert("인증문자가 전송되었습니다.");
				$("#phone_auth_code").attr("readonly", false);
				$("#phone_auth_ok").attr("disabled", false);
			}

			

			
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
				setValid = valid.set("auth", true);
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
		
		// 컨트롤러에서 넘어온 값 중 생년월일을 년 월 일로 나누어서 값 대입시키기
		let birthDate = "${info.birthDate}";
		let clientYear = birthDate.substr(0,4);
		let clientMonth = birthDate.substr(4,2);
		let clientDay = birthDate.substr(6,2);

		$("#member_birth_year").val(clientYear);
		$("#member_birth_month").val(clientMonth);
		$("#member_birth_day").val(clientDay);
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
						// 커서를 상세주소 필드로 이동하면서 값 비우기
						document.getElementById("sample6_detailAddress").focus();
						document.getElementById("sample6_detailAddress").value = "";
					}
				}).open(); 
	
		
	}

	
	// 회원정보 수정할 수 있는 폼에서 뒤로가기 누를 시
	$("#backBtn").on("click", function() {
		window.history.back();
	})
	</script>
	
</body>
</html>