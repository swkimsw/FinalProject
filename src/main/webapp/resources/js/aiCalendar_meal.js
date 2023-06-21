// 식단을 저장하는 함수
// 모달창 저장하기 버튼 누르면 식단 새로저장
function aiMealAdd(resp) {
    mealArr = resp.map(i => i);
}

// 모달창 입력이벤트 함수
function aiMealChange(e) {
    // 특수문자, 이모티콘 입력방지
    // startdayPoint 정보 가지고 있어야 한다

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
    let parentClass = "." + $(this).parent().attr('class').split(" ").join(".");
    selectBox = $(parentClass).children();

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

