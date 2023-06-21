//meal-box 드래그 이벤트

let startPoint;
let startMeal;
let endPoint;
let endMeal;

$(".meal-box").on("dragstart", function (e, ) {
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

$(".meal-box").on("drop", function (e) {
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
});