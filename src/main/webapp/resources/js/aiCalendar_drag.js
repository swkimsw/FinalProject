//meal-box 드래그 이벤트

let aiStartPoint;
let aiStartMeal;
let aiEndPoint;
let aiEndMeal;

$(".meal-box").on("dragstart", function (e) {
    e.stopPropagation();
    let parentClass = "." + $(this).parent().attr('class').split(" ").join(".");

    aiStartPoint = $(parentClass);
    aiStartMeal = aiStartPoint.children();

    let startSelectBox = $(this);
    aiStartDate = getMealDate(startSelectBox); // 00-00-00
    aiStartTime = getMealTime(startSelectBox); // 1001
});

$(".meal-box").on("dragenter", function (e) {
    e.stopPropagation();
    e.preventDefault();
    e.target.classList.add("drag-over");

    let parentClass = "." + $(this).parent().attr('class').split(" ").join(".");
    aiEndPoint = $(parentClass);
    aiEndMeal = aiEndPoint.children();

    let endSelectBox = $(this)
    aiEndDate = getMealDate(endSelectBox);
    aiEndTime = getMealTime(endSelectBox);
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

$(".meal-box").on("drop", function (e) {
    e.stopPropagation();
    e.preventDefault();
    e.target.classList.remove("drag-over");

    aiStartPoint.get(0).innerHTML = "";
    aiStartPoint.get(1).innerHTML = "";
    aiEndPoint.get(0).innerHTML = "";
    aiEndPoint.get(1).innerHTML = "";
    aiStartPoint.get(0).append(aiEndMeal.get(0));
    aiStartPoint.get(1).append(aiEndMeal.get(1));
    aiEndPoint.get(0).append(aiStartMeal.get(0));
    aiEndPoint.get(1).append(aiStartMeal.get(1));

    // let tmpDate;
    // let tmpTime;
    let startTarget = $(aiStartPoint.get(0)).children().get(0);
    let startMeals = startTarget.innerHTML.split("<br>").filter(e => e != "");

    // 배열값 바꾸기 
    aiMealArr.map((element, i) => {
        if (aiStartDate == element.mealDate && aiStartTime == element.timeCode) {

            element.mealDate = aiEndDate;
            element.timeCode = aiEndTime;

        } else if (aiEndDate == element.mealDate && aiEndTime == element.timeCode) {

            element.mealDate = aiStartDate;
            element.timeCode = aiStartTime;

        }
    });

});