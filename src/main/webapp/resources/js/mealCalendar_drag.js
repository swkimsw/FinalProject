                //meal-box 드래그 이벤트

                $(".meal-box").on("dragstart", function (e) {
                    e.stopPropagation();
                    startPoint = e.target.parentNode;
                    startMeal = e.target;
                });

                $(".meal-box").on("dragenter", function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                    e.target.classList.add("drag-over");
                    endPoint = e.target.parentNode;
                    endMeal = e.target;
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
                    
                    startPoint.append(endMeal);
                    endPoint.append(startMeal);
                });