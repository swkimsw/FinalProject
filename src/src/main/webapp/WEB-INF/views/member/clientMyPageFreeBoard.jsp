<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - 내가 쓴 게시글 보기</title>
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
<!-- DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script
	src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0-alpha3/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<!-- footer css -->
<link href="${path}/resources/css/pageFooter.css" rel="stylesheet"
	type="text/css">
	<!-- css파일 -->
<link href="${path}/resources/css/myPage/clientMyPageFreeBoard.css" rel="stylesheet"
	type="text/css">
	<!-- js파일 -->
<script src="${path}/resources/js/myPage/clientMyPageFreeBoard.js"></script>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>

	</header>
	<main>
		<div class="container-fluid shadow p-3s bg-body-tertiary rounded" style="margin-top:100px;margin-bottom:200px;">
			<h1 class="second">
				<span>내가 쓴 게시물</span>
			</h1>
			<br>
			<div class="row mainPage">
				<div class="col">
					<!-- 메인시작 -->
					<div class="table">
						<table id="myTables" class="table shadow p-3 mb-5 bg-body rounded">
							<thead>
								<tr>
									<th class="col-1 d-none d-sm-table-cell">no</th>
									<th class="col-1 col-sm-1 col-xs-3">Type</th>
									<th class="col-1 d-none d-lg-table-cell">BoardType</th>
									<th class="col-5 col-sm-6 col-xs-4">Title</th>
									<th class="col-1 d-none d-lg-table-cell">Like</th>
									<th class="col-1 d-none d-lg-table-cell">View</th>
									<th class="col-2 col-sm-4 col-xs-4">PostDate</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${list}" varStatus="status">
									<tr>
										<td class="fontCol col-1 d-none d-sm-table-cell">${status.count}</td>
										<td class="fontCol b2 col-1 col-sm-1 col-xs-3">${i.headLineValue}</td>
										<td class="fontCol b1 col-1 d-none d-lg-table-cell">${i.boardKindValue}</td>
										<td class="fontCol title col-12 col-md-5 col-lg-5"><a
											href="/board/FreeContent?code=${i.code}&cpage=1&viewchoose=true"
											class="atag">${i.title}</a></td>
										<td class="fontCol a1 col-1 d-none d-lg-table-cell">${i.likeCount}</td>
										<td class="fontCol a1 col-1 d-none d-lg-table-cell">${i.viewCount}</td>
										<td class="fontCol a1 col-2 col-sm-4 col-xs-4">${i.regDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:import url="../commons/pageFooter.jsp" />
</body>
</html>