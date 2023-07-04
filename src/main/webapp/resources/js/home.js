//로딩 중 문구 출력 (무한반복 타이핑)
const textContent = "식단을 생성 중입니다. \n 너무 오래걸린다면 새로고침 후 재시도해주세요.";
const loadingText = document.querySelector(".loadingText");
let i = 0;

function typing() {
    let txt = textContent[i++];
    loadingText.innerHTML += txt === "\n" ? "<br/>" : txt;
    if (i > textContent.length) {
        loadingText.textContent = "";
        i = 0;
    }
}
setInterval(typing, 200);

let timeArr = [];
let timeArrLength;
let aiMealArr = [];
let timeStr = "";
let special;
let dayTime;
let todate;

function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;

    return date.getFullYear() + '-' + month + '-' + day;
}

function dateAdd(addDays) {
    let today = new Date();
    today.setDate(today.getDate() + addDays);
    return dateFormat(today);
}

const successMeal = () => {
    $.ajax({
        url: "/meal/successMeal",
        type: "post"
    }).done(function () {
        console.log("successMeal+++++");
    });
};

const failMeal = () => {
    $.ajax({
        url: "/meal/failMeal",
        type: "post"
    }).done(function () {
        console.log("failMeal+++++");
    });
};

$("#sendBtn").on("click", function () {
    // 로그인시 실행 추가 
    let clientCode = $("#clientCode").val();
    let authCode = $("#authCode").val();
    if (!clientCode) {
        alert("일반회원만 사용할 수 있는 기능입니다. 일반회원으로 로그인해주세요");
        return false;
    }
    if (authCode == 1002) {
        alert("일반회원만 사용할 수 있는 기능입니다. 일반회원으로 로그인해주세요");
        return false;
    }
    
    timeArr = [];
    $("input[type=checkbox][name=time]:checked").each(function (i) {
        timeArr.push($(this).val());
    });
    timeStr = timeArr.join(',');
    timeArrLength = timeArr.length;

    special = $("input[name=special]:checked").val();
    dayTime = $("select[name=dayTime]").val();

    // 아점저 선택안하면 생성 금지
    if (timeArrLength == 0) {
        alert("아침, 점심, 저녁중 반드시 하나이상은 선택하셔야 합니다.");
        return false;
    }



    const makeAiMealAjax = (dayTime, special, timeStr, count) => {
        $.ajax({
            url: "/meal/aiMeal",
            type: "post",
            data: {
                dayTime: dayTime,
                special: special,
                timeStr: timeStr
            },
            beforeSend: function () {

                $(".calBox").slideUp(600, 'swing', () => {
                    $(".waitingSpinner").slideDown();
                });
            },
            complete: function () {

                $(".waitingSpinner").slideUp(400, 'swing', () => {
                    $(".calBox").slideDown(600);
                });
            }
        }).done(function (resp) {
            // resp List<MealDTO> 로 저장하는 함수 만들기?

            aiMealAdd(resp);
            aiMealPrint(resp);

            $("#aiMealAddBtn").removeAttr("hidden");
            $("#sendBtn").attr("hidden", true);

            successMeal();
            alert("생성 성공~!");
        }).error(function (error) {
            console.log(error);
            if (count > 0) {
                failMeal();
                makeAiMealAjax(dayTime, special, timeStr, count - 1);
            }
        });
    };
    // 3번 gpt재전송하면 재전송 취소
    makeAiMealAjax(dayTime, special, timeStr, 3);


});

// 식단 저장 
$("#aiMealAddBtn").on("click", function () {

    $.ajax({
        type: 'POST',
        url: '/meal/addAiMeal',
        data: JSON.stringify(aiMealArr),
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
        },
        error: function (error) {
            console.log(error);
        }
    }).done(function (resp) {
        if(confirm("저장 전송에 성공했습니다. 내 식단표로 이동합니까?")){
            location.href="/meal/toMyMeal";
        }
    });
});