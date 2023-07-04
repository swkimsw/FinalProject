<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar bg-body-tertiary fixed-top">
	<div class="container-fluid">
		<button id="refresh" class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
			aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas-header">
			<a href="/" class="nav_a">
				<h1 class="offcanvas-title" id="offcanvasNavbarLabel"
					style="text-decoration: none; font-family: 'NanumSquareNeoHeavy'; color: #007936;">🍽CookCook</h1>
			</a>
		</div>
		<c:if test="${sessionScope.id == null}">
			<a class="navbar-brand nav_a" href="/clientMember/login_form">Login</a>
		</c:if>
		<c:if test="${sessionScope.id != null}">
			<a class="navbar-brand nav_a" href="/clientMember/logout">Logout</a>
		</c:if>
		<c:if test="${sessionScope.businessId != null}">
			<a class="navbar-brand nav_a" href="/businessMember/logout">Logout</a>
		</c:if>
		<div class="offcanvas offcanvas-start flex-shrink-0 p-3"
			style="width: 280px;" tabindex="-1" id="offcanvasNavbar"
			aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header d-flex justify-content-end">
				<button type="button" class="btn-close text-end"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<!-- 프로필 -->
			<!-- div 태그 아래에만 border 1 주기 색은 그레이-->
			<div class="profile border-bottom text-center pb-2">
				<div class="d-flex justify-content-center">
					<a href="/" class="nav_a"> <img
						src="/resources/img/foodWithPlate2.png" alt="logo"
						class="img-fluid" style="width: 10rem;">
					</a>
				</div>
				<h5 class="offcanvas-title p-1" id="offcanvasNavbarLabel"
					style="text-decoration: none; color: #007936">🍽CookCook</h5>
				<c:choose>
					<c:when
						test="${sessionScope.nickname != null || sessionScope.companyName != null}">
						<!-- 유저이름 -->
						<c:if test="${sessionScope.nickname != null}">
							<h3 class="nick_name text-center mb-3">${sessionScope.nickname}</h3>
						</c:if>
						<c:if test="${sessionScope.companyName != null}">
						<div class="position-relative">
							<h3 class="company_name text-center mb-3 position-relative">${sessionScope.companyName}</h3>
							<!-- 알림 -->
							<div class="col position-absolute" style="left:10.5rem;top:-0.3rem;">
								<a href="/shop/toMyShopList"><button type="button" class="btn position-relative">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
									<path
											d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                				</svg>
                				<c:choose>
                				
                					<c:when test="${sessionScope.authGradeCode == 1002}">
                						<span id="countShopRequest" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
											<span class="visually-hidden">New alerts</span>
										</span>
                					</c:when>
                					<c:otherwise>
                						<span class="position-absolute translate-middle p-1 bg-danger border border-light rounded-circle">
											<span class="visually-hidden">New alerts</span>
										</span>
                					</c:otherwise>
                				</c:choose>
									
								</button></a>
							</div>
						</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<a class="btn btn-outline-success m-1" id="loginBtn" role="button"
							href="/clientMember/login_form">로그인 하러 가기</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="p-3 nav-scroller">
				<ul class="list-unstyled ps-0">
					<!--마이페이지 카테고리-->
					<c:if
						test="${sessionScope.nickname != null || sessionScope.companyName != null}">
						<li class="mb-1 nav-menu"><i class="bi bi-house"></i>
							<button
								class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#home-collapse"
								aria-expanded="true">마이페이지</button>
							<div class="collapse show" id="home-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<c:if test="${sessionScope.authGradeCode == 1003}">
										<li class="login"><a href="/MyPage/myPageFreeboard"
											class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">
												내가 쓴 게시글 보기</a></li>
										<li class="login"><a href="/MyPage/myPageReview"
											class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
												후기글 보기</a></li>
										<li class="login"><a href="/clientMember/clientMyInfo"
											class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
												정보 보기</a></li>
									</c:if>
									<c:if test="${sessionScope.authGradeCode == 1002}">
										<li class="login"><a
											href="/MyPage/businessMypageBoard"
											class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">
												내가 쓴 게시글 보기</a></li>
										<li class="login"><a
											href="/businessMember/businessMyInfo"
											class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
												정보 보기</a></li>
									</c:if>
									<c:if test="${sessionScope.authGradeCode == 1001}">
										<li class="login"><a
											href="http://localhost:3000/dashboard/app"
											class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">
												관리자페이지</a></li>
									</c:if>
								</ul>
							</div></li>
					</c:if>
					<!--전체게시판 카테고리-->
					<li class="mb-1 nav-menu"><i class="fa-solid fa-file-pen"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">전체 게시판</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/board/announcement?cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항</a>
								</li>
								<li><a href="/board/free?cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">자유게시판</a>
								</li>
								<li><a href="/board/review?cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">후기게시판</a>
								</li>
							</ul>
						</div></li>
					<!-- 공구 카테고리 -->
					<li class="mb-1 nav-menu"><i class="fa-solid fa-store"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#orders-collapse"
							aria-expanded="false">공구 카테고리</button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="login"><a href="/shop/toShopList"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">공구
										하러가기</a></li>
								<li><a href="/shop/toMyShopList"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">
										내 공구 리스트</a></li>
							</ul>
						</div></li>
					<!-- 식단 카테고리 -->
					<c:if test="${sessionScope.authGradeCode ne 1002}">
					<li class="mb-1 nav-menu"><i class="fa-solid fa-utensils"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#meal-collapse"
							aria-expanded="false">식단 카테고리</button>
						<div class="collapse" id="meal-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="login"><a href="/meal/toAiMeal"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">식단
										추천 받기</a></li>
								<li><a href="/meal/toMyMeal"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded"
									onclick="needLogin(${sessionScope.authGradeCode}, '/meal/toMyMeal')"> 내 식단 리스트</a></li>
								<li><a href="/basket/toMyBasket"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded"
									onclick="needLogin(${sessionScope.authGradeCode}, '/basket/toMyBasket')"> 내 장바구니</a></li>
							</ul>
						</div></li>
						</c:if>
					<!-- 구분선 -->
					<li class="border-top my-3"></li>
					<!-- 운영진 카테고리 -->
					<!-- 
					<li class="mb-1 nav-menu"><i class="fa-solid fa-paper-plane"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false">운영진에게</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="#" id="inquire"
									class="nav_a link-dark d-inline-flex text-decoration-none rounded">문의하기</a>
								</li>
								<c:if test="${sessionScope.auth_grade ne null}">
									<li><a href="#"
										class="nav_a link-dark d-inline-flex text-decoration-none rounded">신고내역</a>
									</li>
								</c:if>
							</ul>
						</div></li> -->
				</ul>
			</div>
		</div>
	</div>
</nav>
<script>
	
	// navi 버튼 누르면 공구샵에 온 총 요청수 구해 업데이트
	$("#refresh").on("click", function(){
		$.ajax({
			url:"/shop/countShopRequest",
			type : "post",
			dataType: "json",
			data:{
				"code" : ${sessionScope.code}
			}
		}).done(function(resp) {
			$("#countShopRequest").empty();
			$("#countShopRequest").append(resp);
		})
	})
	
</script>
