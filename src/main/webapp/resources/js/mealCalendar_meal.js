                //const myModal = document.getElementById('mealModalToggle');

                //식단 박스 클릭 이벤트
                let selectBox;
                $(".meal-box").on("click", function () {
                    //우선 modal창에 입력된 input 전부 삭제
                    $(".meal-name").val("");

                    //입력 위치 지정
                    selectBox = $(this);

                    //이미 등록된 식단이 있는 경우 input 태그 안에 넣기
                    if (selectBox.html()) {   
                        let meals = this.innerText.split("\n");
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
                        console.log(selectBox);
                        selectBox.html("외식");
                        $("#closeModal").click();
                    });

                    //배달 버튼 클릭 이벤트
                    $("#delivery").on("click", function () {
                        selectBox.html("배달");
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
                        //DB에 실제로 저장하기 기능 추가해야 함
                        //insert, update, delete 

                        for (let i = 0; i < meals.length; i++) {
                            if (meals.get(i).value) {
                                selectBox.append(meals.get(i).value+"<br>");
                            }
                        }

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