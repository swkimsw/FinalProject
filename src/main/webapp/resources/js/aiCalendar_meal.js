//식단 박스 클릭 이벤트
let selectBox;
let preMeals = []; //열때 리스트
let postMeals = []; //닫을때 리스트
let preDiff; //교집합을 제거한 리스트
let postDiff;
let aiStartDate;
let aiStartTime;
let aiEndDate;
let aiEndTime;

$(".meal-box").off("click").on("click", function () {
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
    //원래 등록되어 있던 식단을 preMeals라는 리스트로 저장
    // preMeals = this.innerHTML.split("<br>");
    $(".meal-name").each((i, e) => {
        if (e.value) {
            preMeals.push(e.value);
        }
    })

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
    let takeMeal;
    $(".toSearch").on("click", function () {
        takeMeal = $(this).closest(".insertBox").find(".meal-name");
    });

    //표준 음식 목록 선택 이벤트
    //선택한 음식 input 칸에 넣기
    $(".standard-meal").on("click", function () {
        let selectMeal = $(this).text();
        $("#toFirstModal").click();
        takeMeal.val(selectMeal);
    });



    //저장하기 버튼 클릭 이벤트
    $("#saveMeal").off("click").on("click", function () {
        //우선 선택한 meal-box의 내용 모두 지우기
        selectBox.html("");

        //저장하기 버튼을 누르는 시점의 식단을 postMeals라는 리스트에 저장
        let meals = $(".meal-name");
        postMeals = [];
        meals.each((i, e) => {
            if (e.value) {
                postMeals.push(e.value);
            }

            let exceptDuplMeal = new Set(postMeals);
            if (postMeals.length != exceptDuplMeal.size) {
                alert("중복된 메뉴는 입력할 수 없습니다.");
                return;
            }

        });

        // if 걸어서 빈값이면 delete 
        // 겹치는 부분 제거 

        preDiff = preMeals.filter(e => !postMeals.includes(e)); 
        postDiff = postMeals.filter(e => !preMeals.includes(e));
		
        preDiff.forEach((e, i) => {
            aiMealArr = aiMealArr.filter(target => target.meal != e);
        });

        // postMeals에 있는 값만큼 aiMealArr 에 값저장
        let clientCode = $("#clientCode").val();
        aiStartDate = getMealDate(selectBox);
        aiStartTime = getMealTime(selectBox);
        postDiff.map((e,i) => {
            aiMealArr.push({
                "code": 0,
                "memberCode": clientCode,
                "mealDate": aiStartDate,
                "timeCode": aiStartTime,
                "meal": e
            });
            console.log("aiMealArr--> "+ aiMealArr);
        });
        
        aiMealPrint(aiMealArr);
        $("#closeModal").click();
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
//식단 날짜 구하는 함수
function getMealDate(selectBox) {
    let days = ["day1", "day2", "day3", "day4", "day5", "day6", "day7"];
    let cloneDates = new Date(today);
    cloneDates = new Date(cloneDates.setDate(today.getDate() + days.indexOf(selectBox.parent().get(0).className.split(" ")[0])));
    let cloneMonth = cloneDates.getUTCMonth() + 1 >= 10 ? cloneDates.getUTCMonth() + 1 : '0' + (cloneDates.getUTCMonth() + 1);
    let cloneDate = cloneDates.getDate() >= 10 ? cloneDates.getDate() : '0' + cloneDates.getDate();
    // 23-06-21 형식으로 return
    return cloneDates.getUTCFullYear() + "-" + cloneMonth + "-" + cloneDate;
};

//식단 아/점/저 코드 구하는 함수
function getMealTime(selectBox
    
    ) {
    let times = ["breakfast", "lunch", "dinner"];
    return 1001 + times.indexOf(selectBox.parent().get(0).className.split(" ")[1])
};

// 모달창 입력이벤트 함수
function aiMealChange(e) {

    // 특수문자, 이모티콘 입력방지
    var regexp = /(?:[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]|[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
    var value = $(e).val();
    if (regexp.test(value)) {
        alert("한글만 입력해주세요");
        $(e).val(value.replace(regexp, ''));
    }
    //엔터키 막기
    if (e.keyCode && e.keyCode == 13) {
        e.preventDefault();
    }
}
// 식단을 삭제하는 함수
function aiMealDelete(resp){

    let selectBox = $(this);
    $(resp).each((i, e) => {
        if(aiMealArr[i].mealDate == getMealDate() && 
            aiMealArr[i].timeCode == getMealTime()){
            aiMealArr.splice(i, 1);
        }
    })
}

// 식단을 저장하는 함수
function aiMealAdd(resp) {
    aiMealArr = resp.map(i => i);
}

// 식단을 출력하는 함수
function aiMealPrint(resp) {
	//시작하기전에 이전에 있던 값들 지워주기
	$(".meal-box").html("");
	
    // 캘린더에 뿌리는 로직
    const meals = ['breakfast', 'lunch', 'dinner'];
    const timeCodes = [1001, 1002, 1003];
    today = new Date();
    cloneToday = new Date(today);
    $(resp).each(function (index, item) {
    	console.log("item --> " + item.meal, "index--> " + index); 
        for (let day = 0; day <= 6; day++) {
            if (dateAdd(cloneToday, day) == item.mealDate) {
                for (let mealIndex = 0; mealIndex < meals.length; mealIndex++) {
                    if (item.timeCode == timeCodes[mealIndex]) {
                        var targetClass = ".day" + (day + 1) + "." + meals[mealIndex];
                        console.log(targetClass);
                        $(targetClass).find(".meal-box").append(item.meal, "<br>");
                        console.log(1111111);
                    }
                }
            }
        }
    });
}
