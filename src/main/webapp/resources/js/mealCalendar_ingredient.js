       //재료 추출하는 함수 따로 생성
       function extractIngredients(targetMeals, limit){

        $.ajax({
            url:"/basket/aiBasket",
            type:"post",
            data:{
                targetList:JSON.stringify(targetMeals),
            },
            beforeSend : function() {
                $("#myMealList").slideUp(600,'swing',()=>{
                    $("#waitingSpinner").fadeIn(600);
                });
            },
            complete : function() {
                $("#waitingSpinner").fadeOut(400,'swing',()=>{
                    $("#myMealList").slideDown(600);
                });
            }
        }).done(function(resp){
            //성공횟수 증가시키기
            $.ajax({
                url:"/basket/successCount",
                type:"post",
            })
            //다음 모달창에 추출한 재료 목록 append하고 띄워주기
            let ingredientList = JSON.parse(resp);
            let count=1;
            Array.prototype.forEach.call(ingredientList, (element) => {
                $("#ingredientList").append("🍽 "+element.meal).append("<hr class='titleLine'>");
                let ul = $('<ul class="list-group ingredientUL">');
                element.ingredients.forEach(i=>{
                    let li = $(`<li class="list-group-item">`);
                    let inputs = $(`<input class="form-check-input me-1 selectIngredient" type="checkbox" value="">`).attr('id',"selectIngredient"+count);
                    let labels = $(`<label class="form-check-label stretched-link">`).attr('for', "selectIngredient"+count).text(i);
                    li.append(inputs,labels);
                    ul.append(li);
                    count++;
                });
                $("#ingredientList").append(ul);
            });
            $("#ingredientModal").modal('hide');
            $("#ingredientModal2").modal('show');
        }).error(function(error){
            console.log(error);
            //실패횟수 증가시키기
            $.ajax({
                url:"/basket/failCount",
                type:"post",
            })

            if(count>0){
                extractIngredients(targetMeals, limit-1);
            }
        });

       }
       
       //재료 추출(하러가기) 버튼 클릭 이벤트
        $("#aiIngredient").on("click", function () {
            //우선 모달창에 입력된 li 모두 비우기
            $("#myMealList").html("");
            
            //modal창 띄워서 식단표에 있는 메뉴 목록 띄우기
            //select 된 메뉴 정보를 가지고 재료추출 페이지로 이동
            let meals = [];
            let targets = document.getElementById("c-body-large").getElementsByClassName("meal-box");

            for(let i=0;i<targets.length;i++){
                if(targets[i].innerHTML){
                    //<br>로 나눠서 리스트로 만들기
                    let oneBox = targets[i].innerHTML.split('<br>').filter((meal)=>meal.trim()!="");
                    //중복되는 메뉴는 없애기
                    $.each(oneBox, (i, value)=>{
                    	if(meals.indexOf(value)==-1){
                    		meals.push(value);
                    	}
                    });
                }
            }
            //외식, 배달도 제외
            meals = meals.filter((e)=>e!="외식"&&e!="배달");

			if(meals.length==0){
				let emptyMsg = "재료를 추출 할 메뉴가 없습니다! 식단을 등록해 주세요.";
				$("#iModalInfo").text(emptyMsg);
			}
			else{
				$("#iModalInfo").text("재료를 추출하여 장바구니에 등록해 보세요!");
			}
            for(let i=0;i<meals.length;i++){
                let input = $(`<input class="form-check-input targetMeal me-1" type="checkbox" value="">`).attr('id',"checkboxStretched"+i);
                let label = $(`<label class="form-check-label stretched-link">`).attr('for',"checkboxStretched"+i).text(meals[i]);
                let li = $("<li class='list-group-item'>").append(input,label);

                $("#myMealList").append(li);
            }

            meals = [];
        });

        //재료 추출할 식단 선택 이벤트 (checkBox에 value 설정)
        $("#myMealList").on("click",".targetMeal",function(){
        	if($(this).prop("checked")){
        		$(this).val($(this).next().text());        	
        	}else{
        		$(this).val("");
        	}
        });
        
        //재료추출 하기 버튼 클릭 이벤트
        $("#btnExtract").on("click",function(){
            let targetMeals = [];
            $(".targetMeal").each((i,e)=>{
                if(e.value){
                    targetMeals.push(e.value);
                }
            });

            //에러나면 3번까지 재전송, 그 이상은 취소
        	extractIngredients(targetMeals, 3);
        });

        //장바구니에 저장할 재료 선택 이벤트 (checkBox에 value 설정)
        $("#ingredientList").on("click",".selectIngredient",function(){
        	if($(this).prop("checked")){
        		$(this).val($(this).next().text());        	
        	}else{
        		$(this).val("");
        	}
        });

        //장바구니에 담기 버튼 클릭 이벤트
        $("#btnInsertBasket").on("click",function(){
            let targetIngredients = [];
            $(".selectIngredient").each((i,e)=>{
                if(e.value){
                    targetIngredients.push(e.value);
                }
            });
            targetIngredients = [...new Set(targetIngredients)];
            $.ajax({
            	url:"/basket/addAiBasket",
            	type:"post",
            	data:{
            		aiBasketArr:JSON.stringify(targetIngredients),
            	},
            }).done(function(){
            	if(confirm("등록되었습니다! 장바구니로 이동합니까?")){
            		location.href="/basket/toMyBasket";            	
            	}
            })
        });