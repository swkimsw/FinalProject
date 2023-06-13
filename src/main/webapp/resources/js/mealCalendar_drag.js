 //meal-box 드래그 이벤트

            // $("*").attr("draggable",false);
            // $(".meal-box").attr("draggable",true);

            // $("*").attr("droppable",false);
            // $(".meal-box").attr("droppable",true);

                $(".meal-box").on("dragenter",".meal",function(e){
                    // console.log(e);
                    e.stopPropagation();
                    e.stopImmediatePropagation();
                });
                $(".meal-box").on("dragover",".meal",function(e){
                    console.log("1111111");
                    console.log(e);
                    e.stopPropagation();
                    e.stopImmediatePropagation();
                });




                $(".meal-box").on("dragstart", function (e) {
                    // e.stopPropagation();
                    startPoint = e.target.parentNode;
                    startMeal = e.target;
                });

                $(".meal-box").on("dragenter", function (e) {
                    // if(e.target.className=="meal-box"){
                    // console.log(e);
                    e.stopPropagation();
                    e.preventDefault();
                    e.target.classList.add("drag-over");
                    endPoint = e.target.parentNode;
                    endMeal = e.target;
                    // }
                    // else if(e.target.parentElement.className=="meal-box"){
                    //     e = e.target.parentElement;
                    //     console.log("1111111111111"+e);
                    //     console.log(e.target);
                    //     e.preventDefault();
                    //     e.target.classList.add("drag-over");
                    //     endPoint = e.target.parentElement;
                    //     endMeal = e.target;
                    // }
                });
                $(".meal-box").on("dragover", function (e) {
                    // console.log(e);
                    // if(e.target.className=="meal-box"){
                    console.log("22222222");
                    console.log(e);
                    e.stopPropagation();
                    e.preventDefault();
                    e.target.classList.add("drag-over");
                    // }
                    // else if(e.target.parentElement.className=="meal-box"){
                    //     console.log("222");
                    //     console.log(e);
                    //     e.preventDefault();
                    //     e.target.parentElement.classList.add("drag-over");
                    //     endPoint = e.target.parentElement;
                    //     endMeal = e.target.parentElement.innerHTML;
                    // }
                });
                $(".meal-box").on("dragleave", function (e) {
                    e.target.classList.remove("drag-over");
                    e.target.parentElement.classList.remove("drag-over");
                });
                $(".meal-box").on("drop", function (e) {
                    // e.preventDefault();
                    // alert("@");
                    // if(e.target.classList.contains("meal-box")){
                    e.stopPropagation();
                    e.preventDefault();
                    e.target.classList.remove("drag-over");
                    console.log("drop: " + e);
                    console.log(startPoint);
                    console.log(startMeal);
                    console.log(endPoint);
                    console.log(endMeal);
                    
                    startPoint.append(endMeal);
                    endPoint.append(startMeal);
                });