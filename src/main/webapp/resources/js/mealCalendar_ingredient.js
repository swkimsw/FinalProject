        //재료 추출 버튼 클릭 이벤트
        $("#aiIngredient").on("click", function () {
            //우선 모달창에 입력된 li 모두 비우기
            $("#myMealList").html("");
            
            //modal창 띄워서 식단표에 있는 메뉴 목록 띄우기
            //select 된 메뉴 정보를 가지고 재료추출 페이지로 이동
            let meals = [];
            let targets = document.getElementById("c-body-large").getElementsByClassName("meal-box");
            console.log(targets);

            for(let i=0;i<targets.length;i++){
                if(targets[i].innerHTML){
                    //<br>로 나눠서 리스트로 만들기
                    let oneBox = targets[i].innerHTML.split('<br>').filter((meal)=>meal.trim()!="");
                    //중복되는 메뉴는 없애기
                    $.each(oneBox, (i, value)=>{if(meals.indexOf(value)==-1)meals.push(value);})
                }
            }

            for(let i=0;i<meals.length;i++){
                let input = $(`<input class="form-check-input targetMeal me-1" type="checkbox" value="">`).attr('id',"checkboxStretched"+i);
                let label = $(`<label class="form-check-label stretched-link">`).attr('for',"checkboxStretched"+i).text(meals[i]);
                let li = $("<li class='list-group-item'>").append(input,label);

                $("#myMealList").append(li);
            }

            meals = [];
        });
        
        $("#myMealList").on("click",".targetMeal",function(){
        	if($(this).prop("checked")){
        		$(this).val($(this).next().text());        	
        	}else{
        		$(this).val("");
        	}
        });
        
        $("#btnExtract").on("click",function(){
            let targetMeals = [];
            $(".targetMeal").each((i,e)=>{
                if(e.value){
                    targetMeals.push(e.value);
                }
            });

        	$.ajax({
        		url:"/basket/aiBasket",
        		type:"post",
        		data:{
                    targetList:JSON.stringify(targetMeals),
                },
        	}).done(function(resp){
        		console.log(resp);
        		$("#ingredientModal").modal('hide');
            	$("#ingredientModal2").modal('show');
        	});
        });