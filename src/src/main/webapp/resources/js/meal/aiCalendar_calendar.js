
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
    let formedMonth = date.getUTCMonth() + 1 >= 10 ? date.getUTCMonth() + 1 : '0' + (date.getUTCMonth() + 1);
    let formedDate = date.getDate() >= 10 ? date.getDate() : '0' + date.getDate();
    return formedYear + "-" + formedMonth + "-" + formedDate;
}

//두 날짜 사이 일수 차이를 반환하는 함수
function getDateDiff(date1, date2) {
    let d1 = new Date(date1);
    let d2 = new Date(date2);
    return Math.abs((d1.getTime() - d2.getTime()) / (1000 * 60 * 60 * 24));
};

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

    for (let i = 0; i < 7; i++) {
        cloneToday = new Date(today);
        cloneToday.setDate(today.getDate()+i);
        date = cloneToday.getDate();
        day = getDayOfWeek(cloneToday);
        dayBoxes[j].innerHTML = date + " " + day;

        j++;
    }
    today = new Date();
});