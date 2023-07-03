
// 사업자 아이디 입력칸 숫자만 입력되게 해주는 정규식이벤트입니다.
	function validateInput(event) {
        var input = event.target;
        var regex = /[^0-9]/g;
        input.value = input.value.replace(regex, '');
    }

        // 쿠키 저장 함수
        function setCookie(cookieName, value, exdays) {
           let exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays);
           let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
        }
        // 쿠키 삭제 함수
        function deleteCookie(cookieName) {
           var expireDate = new Date();
           expireDate.setDate(expireDate.getDate() - 1);
           document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
        // 쿠키 가져오기
        function getCookie(cookieName) {
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if (start != -1) { // 쿠키가 존재하면
              start += cookieName.length;
              var end = cookieData.indexOf(';', start);
              if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                 end = cookieData.length;
              cookieValue = cookieData.substring(start, end);
           }
           return unescape(cookieValue);
        }
        // 아이디 저장
        $(document).ready(function name() {
           // 쿠키에 저장된 id 값 가져와서 세팅
           let save_id = getCookie("save_id");
           $("#id").val(save_id);
           // 체크 박스 값 세팅
           if ($("#id").val() != "") {
              $("#save_id").attr("checked", true);
           }
           // 체크박스 변화 유무에 따른 쿠키 저장 - 7일 저장
           $("#save_id").change(function () {
              if ($("#save_id").is(":checked")) {
                 setCookie("save_id", $("#id").val(), 7);
              } else {
                 deleteCookie("save_id");
              }
           });
           // 체크 상태에서 ID 입력한 경우 - 7일 저장
           $("#id").keyup(function () {
              if ($("#save_id").is(":checked")) {
                 setCookie("save_id", $("#id").val(), 7);
              }
           });
        });
        // 아이디/비밀번호 찾기 버튼
        $("#btn_forget_pwd").on("click", function () {
           $("#login_view_fadeOut").hide();
           $("#find_member_fadeIn").fadeIn();
           $("#btn_close").removeClass("visually-hidden");
        });
        $("#btn_forget_pwd2").on("click", function () {
           $("#login_view_fadeOut2").hide();
           $("#find_member_fadeIn2").fadeIn();
           $("#btn_close2").removeClass("visually-hidden");
        });
        // 휴대폰 인증하기 버튼
        $("#btn-check-outlined").on("click", function () {
           $("#login_view_fadeOut").hide();
           $("#find_member_fadeIn").hide();
           $("#to_phone_authentication_fadeIn").fadeIn();
           $("#btn_close").removeClass("visually-hidden");
        });
        $("#btn-check-outlined2").on("click", function () {
           $("#login_view_fadeOut2").hide();
           $("#find_member_fadeIn2").hide();
           $("#to_phone_authentication_fadeIn2").fadeIn();
           $("#btn_close2").removeClass("visually-hidden");
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
                 clearInterval(this.timer);
                 alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
 				 $.ajax({
				 url : "/clientMember/removeSession"
				 })
                 $("#phone_auth").attr("disabled", false);
                 $("#timeLimit").text("");
                 $("#timeLimit2").text("");
              }
           },
           fnStop: function () { clearInterval(this.timer); }
        }
        
        
        // 인증번호 받기 버튼 이벤트
        $("#phone_auth").on("click", function (evt) {
           // 전화번호 check 및 인증번호 발송
           $.ajax({
              url: "/clientMember/sendSmsLogin",
              type: "post",
              dataType: "json",
              data: { phone: $("#phone").val() }
           }).done(function (resp) {
              // 전화번호 check
              if (!resp) {
                 $("#phone").val("");
                 alert("전화번호를 확인해주세요.");
                 return false;
              }
              else {
              // 인증번호 받기 버튼 비활성화
              $("#phone_auth").attr("disabled", true);
              alert("인증번호가 발송되었습니다.");
              
              AuthTimer = new $ComTimer();
              // 제한 시간
              AuthTimer.comSecond = 180;
              // 제한 시간 만료 메세지
              AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
              AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
              AuthTimer.domId = document.getElementById("timeLimit");
              }

           });
        });
     // 사업자 인증번호 받기 버튼 이벤트
        $("#businessPhoneOk2").on("click", function (evt) {
           // 전화번호 check 및 인증번호 발송
           $.ajax({
              url: "/businessMember/sendSmsLogin",
              type: "post",
              dataType: "json",
              data: { phone: $("#businessPhone").val() }
           }).done(function (resp) {
              // 전화번호 check
              if (!resp) {
                 $("#businessPhone").val("");
                 alert("전화번호를 확인해주세요.");
                 return false;
              }
              else {
              // 인증번호 받기 버튼 비활성화
              $("#businessPhoneOk2").attr("disabled", true);
              alert("인증번호가 발송되었습니다.");
              
              AuthTimer = new $ComTimer();
              // 제한 시간
              AuthTimer.comSecond = 180;
              // 제한 시간 만료 메세지
              AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
              AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
              AuthTimer.domId = document.getElementById("timeLimit2");
              }

           });
        });
        // 인증 버튼 이벤트
        $("#phone_auth_ok").on("click", function () {
           //입력 안했을 경우
           if (!$("#phone_auth_code").val()) {
              alert("인증번호를 입력해주세요");
              return false;
           }
           // 인증 체크
           $.ajax({
              url: "/clientMember/certificationLogin",
              type: "post",
              dataType: "json",
              data: { code: $("#phone_auth_code").val() }
           }).done(function name(resp) {
              if (resp.success) {
               	AuthTimer.fnStop();  
                 $("#login_view_fadeOut").hide();
                 $("#find_member_fadeIn").hide();
                 $("#to_phone_authentication_fadeIn").hide();
                 $("#to_change_pw_fadeIn").fadeIn();
                 $("#search_id").text(resp.searchId + " 님!");
                 $("#search_id2").text("아이디는 "+resp.searchId + " 입니다");
              } else {
                 alert("인증번호를 다시 입력해주세요");
                 $("#phone_auth_code").val("");
              }
           });
        }); 
        
        // 사업자 인증 버튼 이벤트
        $("#businessPhoneOk").on("click", function () {
            //입력 안했을 경우
            if (!$("#businessPhoneCode").val()) {
               alert("인증번호를 입력해주세요");
               return false;
            }
            // 인증 체크
            $.ajax({
               url: "/businessMember/certificationLogin",
               type: "post",
               dataType: "json",
               data: { code: $("#businessPhoneCode").val() }
            }).done(function name(resp) {
         	   
               if (resp.success) {
                AuthTimer.fnStop(); 
                  $("#login_view_fadeOut2").hide();
                  $("#find_member_fadeIn2").hide();
                  $("#to_phone_authentication_fadeIn2").hide();
                  $("#to_change_pw_fadeIn2").fadeIn();
                  $("#businessScId").text(resp.businessId + " 님!");
                  $("#businessScId2").text("아이디는 "+resp.businessId + " 입니다");
               } else {
                  alert("인증번호를 다시 입력해주세요");
                  $("#businessPhoneCode").val("");
               }
            });
         });
        //pw 유효성 검사
        addEventListener("DOMContentLoaded", (event) => {
           const password = document.getElementById("password");
           const passwordAlert = document.getElementById("password-alert");
           const requirements = document.querySelectorAll(".requirements");
           let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
           let leng = document.querySelector(".leng");
           let bigLetter = document.querySelector(".big-letter");
           let num = document.querySelector(".num");
           let specialChar = document.querySelector(".special-char");
           const specialChars = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?`~";
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
        //pw 일치 검사
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
              if (value == document.getElementById("password").value) {
                 password.classList.remove("is-invalid");
                 password.classList.add("is-valid");

                 requirements.forEach((element) => {
                    element.classList.remove("wrong");
                    element.classList.add("good");
                 });
                 passwordAlert.classList.remove("alert-warning");
                 passwordAlert.classList.add("alert-success");
              }
           });

           password.addEventListener("blur", () => {
              if (password.value == "") {
                 password.classList.remove("is-invalid");
              }
           });
        });
        
        
        //사업자
      //pw 유효성 검사
        addEventListener("DOMContentLoaded", (event) => {
           const password = document.getElementById("businessPw");
           const passwordAlert = document.getElementById("businessPw-alert");
           const requirements = document.querySelectorAll(".requirements");
           let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
           let leng = document.querySelector(".leng");
           let bigLetter = document.querySelector(".big-letter");
           let num = document.querySelector(".num");
           let specialChar = document.querySelector(".special-char");
           const specialChars = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?`~";
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
        //pw 일치 검사
        addEventListener("DOMContentLoaded", (event) => {
           const password = document.getElementById("businessPw_check");
           const passwordAlert = document.getElementById("businessPw-alert");
           const requirements = document.querySelectorAll(".requirements");

           password.addEventListener("focus", () => {
              if (!password.classList.contains("is-valid")) {
                 password.classList.add("is-invalid");
              }
           });
           requirements.forEach((element) => element.classList.add("wrong"));

           password.addEventListener("input", () => {
              let value = password.value;
              if (value == document.getElementById("businessPw").value) {
                 password.classList.remove("is-invalid");
                 password.classList.add("is-valid");

                 requirements.forEach((element) => {
                    element.classList.remove("wrong");
                    element.classList.add("good");
                 });
                 passwordAlert.classList.remove("alert-warning");
                 passwordAlert.classList.add("alert-success");
              }
           });

           password.addEventListener("blur", () => {
              if (password.value == "") {
                 password.classList.remove("is-invalid");
              }
           });
        });
        //사업자
        
        
        //pw 변경
        $("#btn_change_pw").on("click", function () {
           let password = $("#password").val();
           let password_check = $("#password_check").val();
           if (password == password_check && password != "") {
              $.ajax({
                 url: "/clientMember/changePw",
                 type: "post",
                 data: { id: $("#search_id").text().split(" ")[0], pw: $("#password").val() }
              }).done(function () {
            	  alert("비밀번호가 변경되었습니다.")
                 location.reload();
              });
           } else {
        	   $("#password").val("");
        	   $("#password_check").val("");
              alert("다시 입력해주세요");
           }
        });
        
        //사업자 pw 변경
        $("#businessBtnChangePw").on("click", function () {
            let password = $("#businessPw").val();
            let password_check = $("#businessPw_check").val();
            if (password == password_check && password != "") {
               $.ajax({
                  url: "/businessMember/changePw",
                  type: "post",
                  data: { businessId: $("#businessScId").text().split(" ")[0], pw: $("#businessPw").val() }
               }).done(function () {
             	  alert("비밀번호가 변경되었습니다.")
                  location.reload();
               });
            } else {
         	   $("#businessPw").val("");
         	   $("#businessPw_check").val("");
               alert("다시 입력해주세요");
            }
         });
        const image = document.querySelector("#to_main_ball_img");
        const tooltip = document.querySelector("#tooltip");

        const { createPopper } = Popper;
        createPopper(image, tooltip, {
           placement: 'top',
           modifiers: [{
              name: 'offset',
              options: { offset: [0, 8] }
           }],
        });

        
        //카카오 로그인
        $(".kakao_login").on("click", function loginWithKakao() {
           alert("아직 구현되지 않았습니다");
        });

        //naver_login
        $(".naver_login").on("click", function () {
           alert("아직 구현되지 않았습니다");
        });

        //apple_login
        $(".apple_login").on("click", function () {
           alert("아직 구현되지 않았습니다");
        });

        var full1 = document.getElementById("full1");
        var full2 = document.getElementById("full2");
        var z = document.getElementById("btn");
        function login(){
            z.style.left = "0";
            full1.style.display="block";
            full2.style.display="none";
        }
        function register(){
            z.style.left = "110px";
            full1.style.display="none";
            full2.style.display="block";
        }