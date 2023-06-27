<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 식단 리스트</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- mealCalendar css -->
<link href="${path}/resources/css/mealCalendar.css" rel="stylesheet" type="text/css">
<!-- mealCalendar calendar js -->
<script src="${path}/resources/js/mealCalendar_calendar.js"></script>

<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
	<c:import url="../commons/gnb.jsp">
	</c:import>
</header>

<main>
	    <div class="container">
        <div class="titleBox d-flex justify-content-center align-items-center m-5">
            <img class="mx-4" width="60rem" src="/resources/img/cutlery.png">
            <h1 class="text-center m-0" id="title">주간 식단표</h1>
        </div>
        <div id="calendar">
            <table class="c-header">
                <tbody>
                    <tr>
                        <td class="c-header-left" style="text-align: left;">
                            <span class="c-header-title">
                                <h3 class="m-0 d-inline" id="month-year">June 2023</h3>
                            </span>
                        </td>
                        <td class="c-header-center"></td>
                        <td class="c-header-right d-grid justify-content-end h-100">
                            <div id="change_week" class="btn-group m-1" role="group"
                                aria-label="Basic outlined example">
                                <button type="button" id="prevWeek" class="btn btn-outline-primary btn-sm">&lt;</button>
                                <button type="button" id="today" class="btn btn-outline-primary btn-sm">Today</button>
                                <button type="button" id="nextWeek" class="btn btn-outline-primary btn-sm">&gt;</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="c-body c-body-large d-none d-xl-table" id="c-body-large">
                <colgroup>
                    <col style="width:8%;" />
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th class="day-header-blank"></th>
                        <th class="day-header">Day 1</th>
                        <th class="day-header">Day 2</th>
                        <th class="day-header">Day 3</th>
                        <th class="day-header">Day 4</th>
                        <th class="day-header">Day 5</th>
                        <th class="day-header">Day 6</th>
                        <th class="day-header">Day 7</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="time-header breakfast">아침</th>
                        <td class="day1 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day2 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day3 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day4 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day5 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day6 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day7 breakfast">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="time-header lunch">점심</th>
                        <td class="day1 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day2 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day3 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day4 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day5 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day6 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day7 lunch">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="time-header dinner">저녁</th>
                        <td class="day1 dinner">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day2 dinner">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day3 dinner">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day4 dinner">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day5 dinner">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day6 dinner">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day7 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="c-body c-body-small d-table d-xl-none" id="c-body-small">
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:30%; max-width:30%;">
                    <col style="width:30%; max-width:30%;">
                    <col style="width:30%; max-width:30%;">
                </colgroup>
                <thead>
                    <tr>
                        <th class="time-header-blank"></th>
                        <th class="time-header dinner">아침</th>
                        <th class="time-header dinner">점심</th>
                        <th class="time-header dinner">저녁</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="day-header">Day 1</th>
                        <td class="day1 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day1 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day1 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="day-header">Day 2</th>
                        <td class="day2 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day2 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day2 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="day-header">Day 3</th>
                        <td class="day3 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day3 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day3 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="day-header">Day 4</th>
                        <td class="day4 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day4 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day4 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="day-header">Day 5</th>
                        <td class="day5 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day5 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day5 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="day-header">Day 6</th>
                        <td class="day6 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day6 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day6 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="day-header">Day 7</th>
                        <td class="day7 breakfast">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day7 lunch">
                            <div class="meal-box"></div>
                        </td>
                        <td class="day7 dinner">
                            <div class="meal-box"></div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="c-footer mt-3 mb-5">
                <thead></thead>
                <tbody>
                    <tr>
                        <td class="btnBox-ai">
                            <button type="button" id="aiMeal" class="btn btn-outline-success btn-lg btn-ai m-3">AI 식단
                                추천</button>
                            <button type="button" id="aiIngredient" class="btn btn-outline-success btn-lg btn-ai m-3" data-bs-toggle="modal" data-bs-target="#ingredientModal">재료
                                추출</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- 식단 수정 창 -->
            <div class="modal fade" id="mealModalToggle" aria-hidden="true" aria-labelledby="mealModalToggleLabel"
                tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="mealModalToggleLabel">식단 수정하기</h1>
                            <button type="button" id="closeModal" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="btnBox-mealList mx-2 mb-3 d-flex justify-content-between">
                                <div class="btnLeft-mealList">
                                    <button type="button" id="delete-meals" class="btn btn-secondary">모두삭제</button>
                                </div>
                                <div class="btnRight-mealList">
                                    <button type="button" id="eatingOut" class="btn btn-success">외식</button>
                                    <button type="button" id="delivery" class="btn btn-success">배달</button>
                                </div>
                            </div>
                            <div class="insertBox m-2">
                                <div class="row">
                                    <div class="col-9" style="padding-right: 0;">
                                        <input type="text" class="form-control meal-name m-0" placeholder="요리명 입력">
                                    </div>
                                    <div class="col-3">
                                        <button class="btn btn-success w-100 toSearch"
                                            data-bs-target="#mealModalToggle2" data-bs-toggle="modal">찾아보기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="insertBox m-2">
                                <div class="row">
                                    <div class="col-9" style="padding-right: 0;">
                                        <input type="text" class="form-control meal-name m-0" placeholder="요리명 입력">
                                    </div>
                                    <div class="col-3">
                                        <button class="btn btn-success w-100 toSearch"
                                            data-bs-target="#mealModalToggle2" data-bs-toggle="modal">찾아보기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="insertBox m-2">
                                <div class="row">
                                    <div class="col-9" style="padding-right: 0;">
                                        <input type="text" class="form-control meal-name m-0" placeholder="요리명 입력">
                                    </div>
                                    <div class="col-3">
                                        <button class="btn btn-success w-100 toSearch"
                                            data-bs-target="#mealModalToggle2" data-bs-toggle="modal">찾아보기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="insertBox m-2">
                                <div class="row">
                                    <div class="col-9" style="padding-right: 0;">
                                        <input type="text" class="form-control meal-name m-0" placeholder="요리명 입력">
                                    </div>
                                    <div class="col-3">
                                        <button class="btn btn-success w-100 toSearch"
                                            data-bs-target="#mealModalToggle2" data-bs-toggle="modal">찾아보기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="insertBox m-2">
                                <div class="row">
                                    <div class="col-9" style="padding-right: 0;">
                                        <input type="text" class="form-control meal-name m-0" placeholder="요리명 입력">
                                    </div>
                                    <div class="col-3">
                                        <button class="btn btn-success w-100 toSearch"
                                            data-bs-target="#mealModalToggle2" data-bs-toggle="modal">찾아보기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer mx-2">
                            <button type="button" id="saveMeal" class="btn btn-success">저장하기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="mealModalToggle2" aria-hidden="true" aria-labelledby="mealModalToggleLabel2"
                tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="mealModalToggleLabel2">표준 음식 목록</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="searchBox-mealList">
                                <form class="d-flex" role="search">
                                    <input class="form-control me-2" type="search" placeholder="요리명으로 검색"
                                        aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">search</button>
                                </form>
                            </div>
                            <div class="standard-mealList">
                                <div class="list-group mealListGroup">

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="toFirstModal" class="btn btn-success" data-bs-target="#mealModalToggle"
                                data-bs-toggle="modal">돌아가기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 재료 추출 버튼 클릭 시 모달 -->
            <div class="modal fade" id="ingredientModal" tabindex="-1" aria-labelledby="ingredientModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="ingredientModalLabel">내 식단 목록</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p class="m-3 mt-0">재료를 추출하여 장바구니에 등록해 보세요!</p>
                            <ul class="list-group" id="myMealList">

                            </ul>
                            	<div class="d-flex align-items-center justify-content-center">
                            	<div class="m-4" id="waitingSpinner" style="display: none;">
                            	<div class="d-flex justify-content-center">
                    				<div class="spinner-border m-3 text-success" role="status">
  										<span class="visually-hidden"></span>
									</div>
                            	</div>
								<div class="d-flex justify-content-center">
  									<span class="loadingText">재료를 추출하는 중입니다...</span>
								</div>
                            	</div>
								</div>
                        </div>
                        <div class="modal-footer justify-content-center">
                          <button type="button" class="btn btn-success" id="btnExtract">재료 추출</button>
                        </div>
                      </div>
                </div>
            </div>
            <div class="modal fade" id="ingredientModal2" aria-hidden="true" aria-labelledby="ingredientModalLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="ingredientModalLabel2">재료 목록</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="ingredientList">

                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-success" id="btnInsertBasket">장바구니에 담기</button>
                      <button type="button" class="btn btn-success" data-bs-target="#ingredientModal" data-bs-toggle="modal">돌아가기</button>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
    
    <input type="hidden" id="mealInit" value="<c:out value="${mealList}"/>">
</main>
<!-- mealCalendar meal js -->
<script src="${path}/resources/js/mealCalendar_meal.js" th:inline="javascript"></script>
<!-- mealCalendar drag js -->
<script src="${path}/resources/js/mealCalendar_drag.js"></script>
<!-- mealCalendar ingredient js -->
<script src="${path}/resources/js/mealCalendar_ingredient.js"></script>

</body>
</html>