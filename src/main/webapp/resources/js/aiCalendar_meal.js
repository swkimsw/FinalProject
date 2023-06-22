// 식단을 저장하는 함수
// 모달창 저장하기 버튼 누르면 식단 새로저장
function aiMealAdd(resp) {
    mealArr = resp.map(i => i);
}

// 모달창 입력이벤트 함수
// 특수문자, 이모티콘 입력방지
function aiMealChange(text) {
    var regexp = /(?:[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]|[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
    var value = $(text).val();
    if (regexp.test(value)) {
    	alert("한글만 입력해주세요");
        $(text).val(value.replace(regexp, ''));
    }
}

function remove (text) {
    return text.replace(emojis, '');
  }

// 식단 수정하는 함수
function aiMealUpdate(){

}

// 식단 삭제하는 함수
function aiMealDelete(){

}

//식단 날짜 구하는 함수
function getMealDate() {
    let days = ["day1", "day2", "day3", "day4", "day5", "day6", "day7"];
    let cloneDates = new Date(today);
    cloneDates = new Date(cloneDates.setDate(today.getDate() + days.indexOf(selectBox.parent().get(0).className.split(" ")[0])));
    let cloneMonth = cloneDates.getUTCMonth() + 1 >= 10 ? cloneDates.getUTCMonth() + 1 : '0' + (cloneDates.getUTCMonth() + 1);
    let cloneDate = cloneDates.getDate() >= 10 ? cloneDates.getDate() : '0' + cloneDates.getDate();
    // 23-06-21 형식으로 return
    return cloneDates.getUTCFullYear() + "-" + cloneMonth + "-" + cloneDate;
};

//식단 아/점/저 코드 구하는 함수
function getMealTime() {
    let times = ["breakfast", "lunch", "dinner"];
    return 1001 + times.indexOf(selectBox.parent().get(0).className.split(" ")[1])
};

//식단 박스 클릭 이벤트
let selectBox;
let preMeals; //열때 리스트
let postMeals; //닫을때 리스트
$(".meal-box").on("click", function () {
    //우선 modal창에 입력된 input 전부 삭제
    $(".meal-name").val("");

    //입력 위치 지정
    //작은 창, 큰 창 모두 입력되도록 하기 위해 부모 클래스 이름의 자식요소를 입력위치로 설정
    //그냥 this로 했을때 큰창, 작은창 상관없으면 그대로
    selectBox = $(this);
    
    //이미 값이 존재할 경우 input 태그에 넣어주기
    if (selectBox.html()) {
        let meals = this.innerHTML.split("<br>");
        let inputMeals = document.getElementsByClassName("meal-name");
        for (let i = 0; i < meals.length; i++) {
            inputMeals[i].value = meals[i];
        }
    }

    //모두 삭제하기 클릭 이벤트
    $("#delete-meals").on("click", function () {
        $(".meal-name").val("");
    });

    //외식 버튼 클릭 이벤트
    $("#eatingOut").on("click", function () {
        selectBox.html("외식<br>");
        $("#closeModal").click();
    });

    //배달 버튼 클릭 이벤트
    $("#delivery").on("click", function () {
        selectBox.html("배달<br>");
        $("#closeModal").click();
    });

    //찾아보기 클릭 이벤트
    //표준 음식 넣을 위치 저장
    let inputMeal;
    $(".toSearch").on("click", function () {
        inputMeal = $(this).closest(".insertBox").find(".meal-name");
    });

    //표준 음식 목록 선택 이벤트
    //선택한 음식 input 칸에 넣기
    $(".standard-meal").on("click", function () {
        let selectMeal = $(this).text();
        $("#toFirstModal").click();
        inputMeal.val(selectMeal);
    });

    //저장하기 버튼 클릭 이벤트
    $("#saveMeal").on("click", function () {
        //우선 선택한 meal-box의 내용 모두 지우기
        selectBox.html("");

        let meals = $(".meal-name");

    });


});

//모달 창이 닫힐 때, 안에 내용물이 있으면 draggable로 만들기
$("#mealModalToggle").on("hidden.bs.modal", function () {
    if (selectBox.html()) {
        selectBox.attr("draggable", true);
    }
    else {
        selectBox.attr("draggable", false);
    }
});

//meal-box들에 modal 설정 추가
//안에 내용물이 존재할 경우 draggable하게 설정
let mealBoxes = document.getElementsByClassName("meal-box");
Array.prototype.forEach.call(mealBoxes, (mealBox) => {
    mealBox.setAttribute("data-bs-toggle", "modal");
    mealBox.setAttribute("data-bs-target", "#mealModalToggle");
    if (mealBox.innerHTML) {
        mealBox.setAttribute("draggable", true);
    }
});

