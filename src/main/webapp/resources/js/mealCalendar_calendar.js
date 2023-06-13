
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

        //기본 설정(오늘 날짜)
        let today = new Date();
        let year = today.getFullYear();
        let month = getNameOfMonth(today);
        let date = today.getDate();
        let day = getDayOfWeek(today);

        window.onload = function () {

            //년, 월 설정
            $("#month-year").html(month + " " + year);

            //일, 요일 설정
            let dayBoxes = document.getElementsByClassName("day-header");

            let j = 0;
            for (let i = 0; i < 7; i++) {
                date = today.getDate();
                day = getDayOfWeek(today.setDate(today.getDate() + 1));
                dayBoxes[j].innerHTML = date + " " + day;
                j++;
            }
            today = new Date();
            for (let i = 0; i < 7; i++) {
                date = today.getDate();
                day = getDayOfWeek(today.setDate(today.getDate() + 1));
                dayBoxes[j].innerHTML = date + " " + day;
                j++;
            }

            today = new Date();

            //1주일 전으로 이동
            $("#prevWeek").on("click", function () {
                let clone = new Date(today.setDate(today.getDate() - 7));
                year = today.getFullYear();
                month = getNameOfMonth(today);
                date = today.getDate();
                day = getDayOfWeek(today);

                $("#month-year").html(month + " " + year);

                let dayBoxes = document.getElementsByClassName("day-header");

                let j = 0;
                for (let i = 0; i < 7; i++) {
                    date = clone.getDate();
                    day = getDayOfWeek(clone.setDate(clone.getDate() + 1));
                    dayBoxes[j].innerHTML = date + " " + day;
                    j++;
                }
                today = new Date(clone.setDate(clone.getDate() - 7));
                for (let i = 0; i < 7; i++) {
                    date = clone.getDate();
                    day = getDayOfWeek(clone.setDate(clone.getDate() + 1));
                    dayBoxes[j].innerHTML = date + " " + day;
                    j++;
                }
            });
            //오늘 날짜로 이동
            $("#today").on("click", function () {
                today = new Date();
                let clone = new Date(today);
                year = today.getFullYear();
                month = getNameOfMonth(today);
                date = today.getDate();
                day = getDayOfWeek(today);

                $("#month-year").html(month + " " + year);

                let dayBoxes = document.getElementsByClassName("day-header");

                let j = 0;
                for (let i = 0; i < 7; i++) {
                    date = clone.getDate();
                    day = getDayOfWeek(clone.setDate(clone.getDate() + 1));
                    dayBoxes[j].innerHTML = date + " " + day;
                    j++;
                }
                today = new Date(clone.setDate(clone.getDate() - 7));
                for (let i = 0; i < 7; i++) {
                    date = clone.getDate();
                    day = getDayOfWeek(clone.setDate(clone.getDate() + 1));
                    dayBoxes[j].innerHTML = date + " " + day;
                    j++;
                }
            });
            //1주일 후로 이동
            $("#nextWeek").on("click", function () {
                let clone = new Date(today.setDate(today.getDate() + 7));
                year = today.getFullYear();
                month = getNameOfMonth(today);
                date = today.getDate();
                day = getDayOfWeek(today);

                $("#month-year").html(month + " " + year);

                let dayBoxes = document.getElementsByClassName("day-header");

                let j = 0;
                for (let i = 0; i < 7; i++) {
                    date = clone.getDate();
                    day = getDayOfWeek(clone.setDate(clone.getDate() + 1));
                    dayBoxes[j].innerHTML = date + " " + day;
                    j++;
                }
                today = new Date(clone.setDate(clone.getDate() - 7));
                for (let i = 0; i < 7; i++) {
                    date = clone.getDate();
                    day = getDayOfWeek(clone.setDate(clone.getDate() + 1));
                    dayBoxes[j].innerHTML = date + " " + day;
                    j++;
                }
            });
        }; 