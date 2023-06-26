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
<!-- DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<style>
* {
	font-family: NanumSquareNeo;
	/* border: 1px solid black; */
}

.font {
	font-size: 10px;
}

.myTables {
	margin: auto;
}

.container {
	margin-top: 100px;
}
.row{
border: 5px solid #fee1e870;
border-radius: 30px;
background-color: #ffffc230;
}
/* 페이징 */
.dataTables_wrapper .dataTables_paginate .dataTables_paginate{
	box-sizing: border-box;
	display: inline-block;
	min-width: 1.5em;
	padding: 0.5em 1em;
	margin-left: 2px;
	text-align: center;
	text-decoration: none !important;
	cursor: pointer;
	color: inherit !important;
	border: 1px solid #f6eac2;
	border-radius: 10px;
	background-color: #ffffc2;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
	box-sizing: border-box;
	display: inline-block;
	min-width: 1.5em;
	padding: 0.5em 1em;
	margin-left: 2px;
	text-align: center;
	text-decoration: none !important;
	cursor: pointer;
	color: white;
	border-radius: 10px;
	border: 1px solid #00793630;
	background-color: #ffffc2;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
    color: inherit !important;
    border: 1px solid rgba(0, 0, 0, 0.3);
    background-color: #ffffc2;
    border-radius: 30px;
}
/* input */
.dataTables_wrapper .dataTables_filter input {
    border: 1px solid #aaa;
    border-radius: 3px;
    padding: 5px;
    background-color: transparent;
    margin-left: 3px;
    border-radius: 10px;
}
/* select */
.dataTables_wrapper .dataTables_length select {
    border: 1px solid doderblue;
    border-radius: 10px;
    padding: 5px;
    background-color: transparent;
    padding: 4px;
    
}

td {
	color: #007936;
}

table.dataTable tbody tr {
	border-radius: 50px;
	color: red;
}

table.dataTable tbody tr:hover {
	background-color: #00793630;
	color: red;
}

.title {
	text-align: left;
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
			<span>My Review</span>
		</h1>
		<br>
		<div class="row">
			<!-- <div class="row checkbox ">
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
				</div> -->
			<!-- 메인시작 -->
			<table id="myTables" class="table" style="width: 100%">
				<thead>
					<tr>
						<th><h9 class="hd1">no</h9></th>
						<th class="hd0">말머리</th>
						<th class="hd2">게시판종류</th>
						<th class="hd3">게시판제목</th>
						<th class="hd4">붐업</th>
						<th class="hd5">발자국</th>
						<th class="hd6">게시글날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td class="b2">${i.headLineValue}</td>
							<td class="b1">${i.boardKindValue}</td>
							<td><a href="#">&#127880;${i.title}</a></td>
							<td class="b1">👍${i.likeCount}</td>
							<td class="b1">👣${i.viewCount}</td>
							<td class="b1">&#128197;${i.regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
		</div>
		<script>
		$(document).ready(function() {
		    $("td.b1").each(function() {
		        if ($(this).text() === "자유 게시판") {
		            $(this).html("&#127803;자유 게시판");
		        }else if($(this).text() === "후기 게시판"){
		        	 $(this).html("&#127804;후기 게시판");
		        }else if($(this).text() === "문의 게시판"){
		        	 $(this).html("&#127801;문의 게시판");
		        }
		    });
		    $("td.b2").each(function() {
		        if ($(this).text() === "일상") {
		            $(this).html("💃일상");
		        }else if($(this).text() === "정보"){
		        	 $(this).html("🕵️‍♂️정보");
		        }else if($(this).text() === "질문"){
		        	 $(this).html("🙋‍♀️질문");
		        }else if($(this).text() === "후기"){
		        	 $(this).html("🤷후기");
		        }
		    });
		});
		
			$(document).ready(function() {

				$('#myTables').DataTable({
					pagingType : "full_numbers",
					 info: false
				});
			});
		</script>
</body>
</html>