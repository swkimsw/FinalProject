//meal-box 드래그 이벤트

//Date 값을 넣으면 YYYY-MM-DD 형식의 문자열로 반환해주는 함수
function getFormedDate(date) {
    let formedYear = date.getUTCFullYear();
    let formedMonth = date.getUTCMonth() + 1 >= 10 ? date.getUTCMonth() + 1 : '0' + (date.getUTCMonth() + 1);
    let formedDate = date.getDate() >= 10 ? date.getDate() : '0' + date.getDate();
    return formedYear + "-" + formedMonth + "-" + formedDate;
}

//day에 해당하는 클래스로 식단 날짜 구하는 함수
function getModMealDate(dayClass) {
    let days = ["day1", "day2", "day3", "day4", "day5", "day6", "day7"];
    let cloneDates = new Date(today);
    cloneDates = new Date(cloneDates.setDate(today.getDate() + days.indexOf(dayClass)));
    return getFormedDate(cloneDates);
};

//time에 해당하는 클래스로 식단 아/점/저 코드 구하는 함수
function getModMealTime(timeClass) {
    let times = ["breakfast", "lunch", "dinner"];
    return 1001 + times.indexOf(timeClass);
};

//update 함수
function updateMeal(e, mealDate, modDate, timeCode, modTime){
	$.ajax({
		url:"/meal/updateMeal",
		type:"post",
		data:{
			//membercode는 server쪽에서 갖기
			mealDate:mealDate,
			modDate:modDate,
			timeCode:timeCode,
			modTime:modTime,
			meal:e,
		}
	}).done(function(resp){
		
	})
}

let startPoint;
let startMeal;
let endPoint;
let endMeal;

$(".meal-box").on("dragstart", function (e) {
    e.stopPropagation();
    let parentClass = "."+$(this).parent().attr('class').split(" ").join(".");
    
    startPoint = $(parentClass);
    startMeal = startPoint.children();
    
});

$(".meal-box").on("dragenter", function (e) {
    e.stopPropagation();
    e.preventDefault();
    e.target.classList.add("drag-over");

    let parentClass = "."+$(this).parent().attr('class').split(" ").join(".");
    endPoint = $(parentClass);
    endMeal = endPoint.children();
});

$(".meal-box").on("dragover", function (e) {
    e.stopPropagation();
    e.preventDefault();
    e.target.classList.add("drag-over");
});

$(".meal-box").on("dragleave", function (e) {
    e.target.classList.remove("drag-over");
    e.target.parentElement.classList.remove("drag-over");
});

$(".meal-box").off("drop").on("drop", function (e) {
    e.stopPropagation();
    e.preventDefault();
    e.target.classList.remove("drag-over");
    
    startPoint.get(0).innerHTML ="";
    startPoint.get(1).innerHTML ="";
    endPoint.get(0).innerHTML ="";
    endPoint.get(1).innerHTML ="";
    startPoint.get(0).append(endMeal.get(0));
    startPoint.get(1).append(endMeal.get(1));
    endPoint.get(0).append(startMeal.get(0));
    endPoint.get(1).append(startMeal.get(1));
    
    //DB에도 식단 update 하기
    //바꾸는 자리에 값이 입력되어 있을 때
    if(endMeal.get(0).innerHTML){
   		//시작 자리의 mealDate, timeCode를 끝자리로 update
   		let startMeals = startMeal.get(0).innerHTML.split("<br>").filter(e => e != "");
   		let endMeals = endMeal.get(0).innerHTML.split("<br>").filter(e => e != "");
   		startMeals.forEach((meal)=>{
   			updateMeal(meal, getModMealDate(startPoint.get(0).classList[0]), getModMealDate(endPoint.get(0).classList[0]), getModMealTime(startPoint.get(0).classList[1]), getModMealTime(endPoint.get(0).classList[1]));
   		});
   		//끝 자리의 mealDate, timeCode를 시작자리로 update
   		endMeals.forEach((meal)=>{
   			updateMeal(meal, getModMealDate(endPoint.get(0).classList[0]), getModMealDate(startPoint.get(0).classList[0]), getModMealTime(endPoint.get(0).classList[1]), getModMealTime(startPoint.get(0).classList[1]));
   		});
    }
    else{ //바꾸는 자리에 아무 값도 없을 때
    	//시작 자리의 mealDate, timeCode만 끝자리로 update
    	let startMeals = startMeal.get(0).innerHTML.split("<br>").filter(e => e != "");
    	startMeals.forEach((meal)=>{
   			updateMeal(meal, getModMealDate(startPoint.get(0).classList[0]), getModMealDate(endPoint.get(0).classList[0]), getModMealTime(startPoint.get(0).classList[1]), getModMealTime(endPoint.get(0).classList[1]));
   		});
    }
});
