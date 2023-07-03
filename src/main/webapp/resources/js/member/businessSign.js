	// 사업자 아이디 입력칸 숫자만 입력되게 해주는 정규식이벤트입니다.
	function validateInput(event) {
        var input = event.target;
        var regex = /[^0-9]/g;
        input.value = input.value.replace(regex, '');
    }
	
	
		$("#member_phone").on("keydown", function () {
			$("#phone_auth").attr("disabled", true);
			$("#phone_auth_code").attr("readonly", true);
			$("#phone_auth_ok").attr("disabled", true);
		});
		// 정규식 & 중복 체크 - 아이디 & 닉네임 & 이메일 ...
		let valid = new Map();
		let setValid;
		let id
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
				setValid = valid.set(id, false);
				return false;
			} else {
				$("#" + id + "_checking").html("사용가능").css("color", "#198754");
				setValid = valid.set(id, true);
			}
			// 중복체크 여부 확인
			if (type != "A") return false;
			// 중복 체크
			$.ajax({
				url : "/businessMember/checkSum",
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
						valid.set("auth", false);
					}
				}
			});
		}
		
		$("#join").on("click", function() {
			if($("#B_businessId").val() == "") {
				$("#B_businessId").focus();
				return false;
			}
			if(setValid.get(id) == false) {
				$("#" + id).focus();
				return false;
			}
			if(lengBoolean == false || bigLetterBoolean == false || numBoolean == false || specialCharBoolean == false) {
				$("#member_pw").focus();
				return false;
			}
			if($("#member_pw").val() != $("#password_check").val()){
				$("#password_check").focus();
				return false;
			}
			if(setValid.get("member_phone") == true && setValid.get("auth") == false) {
				alert("휴대폰 인증을 해주세요.");
				return false;
			}
		})
		
		// PW 유효성 검사
		let lengBoolean=false, bigLetterBoolean=false, numBoolean=false, specialCharBoolean=false;
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("member_pw");
			const passwordAlert = document.getElementById("password-alert");
			const requirements = document.querySelectorAll(".requirements");
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
						url : "/businessMember/removeSession"
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
				url: "/businessMember/sendSmsSign",
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
		setValid = valid.set("auth", false);
		$("#phone_auth_ok").on("click", function () {
			//입력 안했을 경우
			if(!$("#phone_auth_code").val()){
				alert("인증번호를 입력해주세요");
				return false;
			}
			// 인증 체크
			$.ajax({
				url: "/businessMember/certificationSign",
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
			  var b_businessId = document.getElementById("B_businessId");
			  var password_check = document.getElementById("password_check");
			  var member_name = document.getElementById("member_name");
			  var b_companyname = document.getElementById("B_companyname");
			  var member_phone = document.getElementById("member_phone");
			  var phone_auth_code = document.getElementById("phone_auth_code");
			  var sample6_postcode = document.getElementById("sample6_postcode");
			  var sample6_address = document.getElementById("sample6_address");
			  var sample6_detailAddress = document.getElementById("sample6_detailAddress");
			  var member_email = document.getElementById("member_email");
				
			  if(b_businessId.value === "") {
				 b_businessId.focus();
			  }else if (password_check.value === "") {
			    password_check.focus();
			  } else if (member_name.value === "") {
			    member_name.focus();
			  } else if (b_companyname.value === "") {
			    b_companyname.focus();
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
