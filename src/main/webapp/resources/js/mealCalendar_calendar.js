
//달 이름 얻는 함수
function getNameOfMonth(strOfDate) {
    const mon = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    const nameOfMonth = mon[new Date(strOfDate).getMonth()];
    return nameOfMonth;
}

//요일 얻는 함수
function getDayOfWeek(strOfDate) {
    const week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    const dayOfWeek = week[new Date(strOfDate).getDay()];
    return dayOfWeek;
}

//Date 값을 넣으면 YYYY-MM-DD 형식의 문자열로 반환해주는 함수
function getFormedDate(date) {
    let formedYear = date.getUTCFullYear();
    let formedMonth = date.getUTCMonth() + 1 >= 10 ? date.getUTCMonth + 1 : '0' + (date.getUTCMonth() + 1);
    let formedDate = date.getDate() >= 10 ? date.getDate() : '0' + date.getDate();
    return formedYear + "-" + formedMonth + "-" + formedDate;
}

//두 날짜 사이 일수 차이를 반환하는 함수
function getDateDiff(date1, date2) {
    let d1 = new Date(date1);
    let d2 = new Date(date2);
    return Math.abs((d1.getTime() - d2.getTime()) / (1000 * 60 * 60 * 24));
};

//특정 날짜로부터 일주일 치 식단을 꺼내 출력하는 함수
function selectWeekMeal(date) {

    $.ajax({
        url: "/meal/selectWeekMeal",
        type: "post",
        data: {
            startDate: getFormedDate(date),
        }
    }).done(function (resp) {
        let mealList = JSON.parse(resp);
        console.log(mealList);

        $(".meal-box").html("");
        mealList.forEach((meal)=>{
            //mealDate, timeCode로 들어갈 meal-box 구하기
            let days = ["day1","day2","day3","day4","day5","day6","day7"];
            let times = ["breakfast","lunch","dinner"];
            let todayForm = getFormedDate(today);
            let parentBoxClass="."+days[getDateDiff(todayForm,meal.mealDate)]+"."+times[meal.timeCode-1001];
            let insertBoxs = $(parentBoxClass).children();
            
            insertBoxs.each((i,box)=>{
                $(box).append(meal.meal)
                $(box).append("<br>");
            });
        })
    });
}


//기본 설정(오늘 날짜)
let today = new Date();
let year = today.getFullYear();
let month = getNameOfMonth(today);
let date = today.getDate();
let day = getDayOfWeek(today);

window.addEventListener('load', function () {

    //년, 월 설정
    $("#month-year").html(month + " " + year);

    //일, 요일 설정
    let dayBoxes = document.getElementsByClassName("day-header");

    let j = 0;

    for (let i = 0; i < 7; i++) {
        cloneToday = new Date(today);
        cloneToday.setDate(today.getDate()+i);
        date = cloneToday.getDate();
        day = getDayOfWeek(cloneToday);
        dayBoxes[j].innerHTML = date + " " + day;

        j++;
    }
    today = new Date();
    //cloneToday = new Date(today);
    for (let i = 0; i < 7; i++) {
        cloneToday = new Date(today);
        cloneToday.setDate(today.getDate()+i);
        date = cloneToday.getDate();
        day = getDayOfWeek(cloneToday);
        dayBoxes[j].innerHTML = date + " " + day;

        j++;
    }
    today = new Date();



//1주일 전으로 이동 이벤트
$("#prevWeek").on("click", function () {
    let clone = new Date(today.setDate(today.getDate() - 7));
    year = clone.getFullYear();
    month = getNameOfMonth(clone);
    date = clone.getDate();
    day = getDayOfWeek(clone);

    $("#month-year").html(month + " " + year);

    let dayBoxes = document.getElementsByClassName("day-header");

    let j = 0;
    for (let i = 0; i < 7; i++) {
        date = clone.getDate();
        day = getDayOfWeek(clone);
        dayBoxes[j].innerHTML = date + " " + day;
        clone.setDate(clone.getDate() + 1);
        j++;
    }
    today = new Date(clone.setDate(clone.getDate() - 7));
    for (let i = 0; i < 7; i++) {
        date = clone.getDate();
        day = getDayOfWeek(clone);
        dayBoxes[j].innerHTML = date + " " + day;
        clone.setDate(clone.getDate() + 1);
        j++;
    }

    //일주일치 식단 새로 꺼내 출력하기
    selectWeekMeal(today);

});

//오늘 날짜로 이동 이벤트
$("#today").on("click", function () {
    today = new Date();
    let clone = new Date(today);
    year = clone.getFullYear();
    month = getNameOfMonth(clone);
    date = clone.getDate();
    day = getDayOfWeek(clone);

    $("#month-year").html(month + " " + year);

    let dayBoxes = document.getElementsByClassName("day-header");

    let j = 0;
    for (let i = 0; i < 7; i++) {
        date = clone.getDate();
        day = getDayOfWeek(clone);
        dayBoxes[j].innerHTML = date + " " + day;
        clone.setDate(clone.getDate() + 1);
        j++;
    }
    today = new Date(clone.setDate(clone.getDate() - 7));
    for (let i = 0; i < 7; i++) {
        date = clone.getDate();
        day = getDayOfWeek(clone);
        dayBoxes[j].innerHTML = date + " " + day;
        clone.setDate(clone.getDate() + 1);
        j++;
    }

    //일주일치 식단 새로 꺼내 출력하기
    selectWeekMeal(today);
});

//1주일 후로 이동 이벤트
$("#nextWeek").on("click", function () {
    let clone = new Date(today.setDate(today.getDate() + 7));
    year = today.getFullYear();
    month = getNameOfMonth(today);
    date = today.getDate();
    day = getDayOfWeek(today);

    $("#month-year").html(month + " " + year);

    let dayBoxes = document.getElementsByClassName("day-header");

    let j = 0;
    for (let i = 0; i < 7; i++) {
        date = clone.getDate();
        day = getDayOfWeek(clone);
        dayBoxes[j].innerHTML = date + " " + day;
        clone.setDate(clone.getDate() + 1);
        j++;
    }
    today = new Date(clone.setDate(clone.getDate() - 7));
    for (let i = 0; i < 7; i++) {
        date = clone.getDate();
        day = getDayOfWeek(clone);
        dayBoxes[j].innerHTML = date + " " + day;
        clone.setDate(clone.getDate() + 1);
        j++;
    }

    //일주일치 식단 새로 꺼내 출력하기
    selectWeekMeal(today);
});

});