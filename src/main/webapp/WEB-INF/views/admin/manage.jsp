<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Apply</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
<style>
* {
	font-family: 'NanumSquareNeo';
}
.container {
	margin-top: 100px;
	background-color: #F5F5F5;
}

.tab-content{
	margin-top: 20px;
}
.nav-link {
	background-color: white;
}
.box {
	background-color: white;
}

table.dataTable tfoot td {
    text-align: right;
}
</style>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	<main>
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<div class="navi col-12 col-md-12 col-xl-12">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#home-tab-pane" type="button" role="tab"
							aria-controls="home-tab-pane" aria-selected="true">대시보드</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="business-tab" data-bs-toggle="tab"
							data-bs-target="#business-tab-pane" type="button" role="tab"
							aria-controls="business-tab-pane" aria-selected="false">회원
							관리 - 판매자</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="client-tab" data-bs-toggle="tab"
							data-bs-target="#client-tab-pane" type="button" role="tab"
							aria-controls="client-tab-pane" aria-selected="false">회원
							관리 - 이용자</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="shop-tab" data-bs-toggle="tab"
							data-bs-target="#shop-tab-pane" type="button" role="tab"
							aria-controls="shop-tab-pane" aria-selected="false">공구샵 관리</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="disabled-tab" data-bs-toggle="tab"
							data-bs-target="#disabled-tab-pane" type="button" role="tab"
							aria-controls="disabled-tab-pane" aria-selected="false">게시판 관리</button>
					</li>
				</ul>
			</div>
			<div class="tab-content" id="myTabContent">
				<!-- Main -->
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="box mb-3" style="width: 200px; height: 200px;">
							방문자 현황	
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="box mb-3" style="width: 200px; height: 200px;">
							일자별 요약
						</div>
					</div>
				</div>
				
				<!-- 회원 관리 : 판매자 -->
				<div class="tab-pane fade" id="business-tab-pane" role="tabpanel" aria-labelledby="business-tab" tabindex="0">
					<div class="table-responsive">
						<table id="businessTable" class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">ID</th>
									<th scope="col">회사명</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일</th>
									<th scope="col">가입일</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${businessMemberDTO}" varStatus="status">
									<tr>
										<th scope="row">${status.count}</th>
										<td>${i.businessId}</td>
										<td>${i.companyName}</td>
										<td>${i.phone}</td>
										<td>${i.eMail}</td>
										<td>${i.regDate}</td>
										<td><input class="form-check-input-business" type="checkbox" value="">삭제</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7" align="right">
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="checkAll()">전체 선택</button>
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="uncheckAll()">전체 해제</button>
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="checkDelete()">선택 삭제</button>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				
				<!-- 회원 관리 : 이용자 -->
				<div class="tab-pane fade" id="client-tab-pane" role="tabpanel" aria-labelledby="client-tab" tabindex="0">
					<div class="table-responsive">
						<table id="clientTable" class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">ID</th>
									<th scope="col">이름</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일</th>
									<th scope="col">가입일</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${clientMemberDTO}" varStatus="status">
									<tr>
										<th scope="row">${status.count}</th>
										<td>${i.id}</td>
										<td>${i.name}</td>
										<td>${i.phone}</td>
										<td>${i.eMail}</td>
										<td>${i.regDate}</td>
										<td><input class="form-check-input-client" type="checkbox" value="">삭제</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7" align="right">
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="checkAll()">전체 선택</button>
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="uncheckAll()">전체 해제</button>
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="checkDelete()">선택 삭제</button>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="shop-tab-pane" role="tabpanel"
					aria-labelledby="shop-tab" tabindex="0">!!!!</div>
				<div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel"
					aria-labelledby="disabled-tab" tabindex="0">*****</div>
			</div>


		</div>
	</main>
	<script>
		$("#businessTable").DataTable({});
		$("#clientTable").DataTable({});
		
		function checkAll(){
			$("input:checkbox").prop("checked", true);
		}
		
		function uncheckAll(){
			$("input:checkbox").prop("checked", false);
		}
		
		function checkDelete(){
			if(confirm("정말 삭제하시겠습니까?")){
				alert("삭제완료!");
			}
		}
	
	</script>
</body>
</html>