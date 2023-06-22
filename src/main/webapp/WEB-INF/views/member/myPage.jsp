<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- awesome font -icon -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">

<style>
* {
	font-family: NanumSquareNeo;
	border: 1px solid black;
}

body {
	
}
.th{
	text-align: inherit;
}
.font_1 {
	
}

.container {
	margin-top: 100px;
}

tbody {
	/* display: p; */
	
}

thead {
	margin-bottom: 5px;
	border-radius: 0;
	height: 70px;
}
.btValue{
height: 20px;

}
.board {
	/* background-color: white; */
	background-color: #007936;
	color: white;
}

thead:hover {
	background-color: #00793650;
	opacity: 75%;
	color: black;
}

a {
	color: white;
}

.text-muted {
	color: #8898aa !important;
}

./* user-table tbody tr .category-select {
	max-width: 150px;
	border-radius: 20px;
} */

.font_1 {
	font-size: 16px;
}

.th_nul {
	width: 10px;
}

.current-page {
	color: white;
}
/* h1태그 */
h1.second {
	font-weight: 200;
}

h1.second span {
	position: relative;
	display: inline-block;
	padding: 5px 10px;
	border-radius: 10px;
	border-bottom: 1px solid mediumseagreen;
}

h1.second span:after {
	content: '';
	position: absolute;
	bottom: calc(-100% - 1px);
	margin-left: -10px;
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 10px;
	border-top: 1px solid mediumseagreen;
}
/* h1태그 종료 */
</style>
</head>
<body>
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container">
		<h1 class="second">
			<span>MY FREEBOARD</span>
		</h1>
		<br>
		<div class="row">
			<div class="col">
				<div class="row checkbox ">
					<div class="col input-group mb-3">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox1" value="option1"> <label
								class="form-check-label" for="inlineCheckbox1">일상</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">정보</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox3" value="option3"> <label
								class="form-check-label" for="inlineCheckbox3">질문</label>
						</div>
						<div class="position-absolute top-0 end-0">

							<input type="text" placeholder="제목이나 작성자로 검색">
							<button class="btn btn-outline-success" type="button">
								<i class="bi bi-search"></i>
							</button>

						</div>
					</div>
				</div>
				<!-- 메인시작 -->
				<div class="row font_1">
					<div class="col">
						<div class="row">
									<table class="table">
							<c:forEach var="i" items="${list}">
										<thead>
											<tr>
												<th>${i.headlinecode}</th>
												<th colspan='3'>${i.title}</th>
											</tr>
											<tr class="btValue">
												<td>${i.membercode}</td>
												<td>${i.regdate}</td>
												<td>${i.viewcount}</td>
												<td>${i.likecount}</td>
											</tr>
											<br>
										</thead>
							</c:forEach>
									</table>



							<%-- <table
								summary="This table shows how to create responsive tables using Datatables' extended functionality"
								class="table table-bordered table-hover dt-responsive">
								<colgroup>
								<col style="width:5%">
								<col style="width:7%">
								<col style="width:40%">
								<col style="width:5%">
								<col style="width:5%">
								<col style="width:5%">
								</colgroup>
								<thead>
									<tr class="boradTop">
										<th>no.</th>
										<th>작성자</th>
										<th class="">제목</th>
										<th>작성일</th>
										<th>조회수</th>
										<th>추천</th>
									</tr>
								</thead>
								<tbody>
								
								<td>1</td>
								<td>?</td>
								<td>31221</td>
								<td>2012/05/12</td>
								<td>1</td>
								<td>1</td>
									<c:forEach var="i" items="${recordList}">
										<div class="col-4 col-lg-2">
											<tr>
												<td>no : ${i.seq}</td>
												<td>${i.writer}</td>
												<td><a
													href="secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=1">${i.title}</a></td>
												<td class="col d-none d-md-block" style="height: 55px;">${i.view_count}</td>
												<td>${i.detailDate}</td>
												<td>0</td>

											</tr>
										</div>
									</c:forEach>


								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" class="text-center">ㅇㄴ</td>
									</tr>
								</tfoot>
							</table> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>

		<nav aria-label="Page navigation example" align="center">
			<ul class="pagination d-flex justify-content-center">
				<c:forEach var="i" items="${navi}">
					<c:choose>
						<c:when test="${i eq '<<'}">
							<li class="page-item"><a class="page-link"
								href="/secondHand.adminBoard?cpage=${start}">${i}</a></li>
						</c:when>
						<c:when test="${i eq '<'}">
							<li class="page-item"><a class="page-link"
								href="/secondHand.adminBoard?cpage=${cpage - 1}">${i}</a></li>
						</c:when>
						<c:when test="${i eq '>'}">
							<li class="page-item"><a class="page-link"
								href="/secondHand.adminBoard?cpage=${cpage + 1}">${i}</a></li>
						</c:when>
						<c:when test="${i eq '>>'}">
							<li class="page-item"><a class="page-link"
								href="/secondHand.adminBoard?cpage=${end}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								class="page-link ${i == cpage ? 'current-page' : ''}"
								href="/secondHand.adminBoard?cpage=${i}"
								${i == cpage ? "disabled" : ""} onclick="${i == cpage ? "event.preventDefault()" : ""}">
									${i} </a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</nav>

	</div>
	</div>
	<script>
	var currentPage = ${cpage}; // 현재 페이지 번호
	var pageLinks = document.querySelectorAll(".page-link"); // 페이지 링크 요소들을 가져옴
	for (var i = 0; i < pageLinks.length; i++) {
	  // 페이지 링크 요소들에 클릭 이벤트를 추가
	  pageLinks[i].addEventListener("click", function(event) {
		if (parseInt(event.target.textContent) === currentPage) {
		  // 현재 페이지 번호와 클릭한 페이지 번호가 같으면 클릭 이벤트를 막음
		  event.preventDefault();
		} else {
		  // 현재 페이지 번호와 클릭한 페이지 번호가 다르면 링크를 따라 이동
		  window.location.href = event.target.getAttribute("href");
		}
		
	  });
	}
	
	const currentPage2 = document.querySelector('.current-page');
	currentPage2.style.backgroundColor = '#1e3c3e';
  </script>
</body>
</html>