<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - 내 장바구니</title>
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

<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
<!-- basket css -->
<link href="${path}/resources/css/meal/basket.css" rel="stylesheet"
	type="text/css">
<!-- basket js -->
<script src="${path}/resources/js/meal/basket.js"></script>
<!-- footer css -->
<link href="${path}/resources/css/pageFooter.css" rel="stylesheet" type="text/css">
</head>
<body>
   <header>
      <c:import url="../commons/gnb.jsp">
      </c:import>
   </header>
   
	<main>
		<div class="container">
			<div class="header title">
				<h2 class="text-center p-4">나의 장바구니 목록</h2>
			</div>
			<div class="row">
				<div class="col-6 d-none d-md-block col-md-6 extraBox">
					<div class="d-flex justify-content-center">
						<img src="/resources/img/grocery.png" alt="logo"
							class="groceryImg p-5">
					</div>
					<div class="text-center">
						<span id="extraText">즐거운 장보기 되세요!</span>
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="card card-white m-0">
						<div class="card-body">
								<input type="text" class="form-control add-task"
									placeholder="새로운 재료 등록..." maxlength="50">
							<div class="selectAllBox d-flex justify-content-between">
								<label class="checkAllLabel"> <input type="checkbox"
									class="checkAll"> 전체 클릭
								</label> <label class="deleteAllLabel">전체 삭제
									<button type="button" class="btn btn-success btnDeleteAll">X</button>
								</label>
							</div>
							<div class="todo-list">
								<c:forEach items="${basketList}" var="i">
									<div class="todo-item position-relative">
										<div class="checker">
											<span class=""><input type="checkbox" class="checkOne"
												id="${i.code}" value="${i.code}" status="${i.statusCode}"></span>
										</div>
										<span>${i.name}</span> <a href="javascript:void(0);"
											class="float-right remove-todo-item"><i
											class="icon-close"></i></a>
										<button type="button"
											class="btn btn-success position-absolute btnDeleteOne">X</button>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- footer -->
	<c:import url="../commons/pageFooter.jsp"/>
</body>
</html>