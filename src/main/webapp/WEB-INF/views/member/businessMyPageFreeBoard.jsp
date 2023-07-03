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
<script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0-alpha3/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script> 
<style>
* {
	font-family: NanumSquareNeo;
	/* border: 1px solid black; */
	box-sizing: border-box;
}

.font {
	font-size: 10px;
}
label{
font-size: 12px;
color:green;
}
.container {
	margin-top: 100px;
}

.mainPage {
	border: 5px solid #fee1e870;
	border-radius: 30px;
	/* background-color: #ffffc230; */
}
/* 페이징 */
.table{
  overflow: hidden;
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

/*  */
/*   .dataTables_wrapper .dataTables_paginate .paginate_button ,
.dataTables_wrapper .dataTables_paginate .paginate_button a {
  background: #007936;
  color: white;
  border-radius: 20px;
}  */
.dataTables_wrapper .dataTables_paginate .paginate_button:hover,
.dataTables_wrapper .dataTables_paginate .paginate_button:hover a {
background: none;
border: none;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.active,
.dataTables_wrapper .dataTables_paginate .paginate_button.active a {
	  color: white;
background: blue;
opacity: 70%;
}
/* .paginate_button .ton{
background: green;}
.paginate_button .active,
.paginate_button .active a{
background-color: red;
color: thite;
} 
 */
/*  */
table.dataTable thead>tr>th.sorting:before, table.dataTable thead>tr>th.sorting_asc:before,
	table.dataTable thead>tr>th.sorting_desc:before, table.dataTable thead>tr>th.sorting_asc_disabled:before,
	table.dataTable thead>tr>th.sorting_desc_disabled:before, table.dataTable thead>tr>td.sorting:before,
	table.dataTable thead>tr>td.sorting_asc:before, table.dataTable thead>tr>td.sorting_desc:before,
	table.dataTable thead>tr>td.sorting_asc_disabled:before, table.dataTable thead>tr>td.sorting_desc_disabled:before
	{
	bottom: 50%;
	content: "▲";
	content: "▲"/"";
	display: none;
}

table.dataTable thead>tr>th.sorting:after, table.dataTable thead>tr>th.sorting_asc:after,
	table.dataTable thead>tr>th.sorting_desc:after, table.dataTable thead>tr>th.sorting_asc_disabled:after,
	table.dataTable thead>tr>th.sorting_desc_disabled:after, table.dataTable thead>tr>td.sorting:after,
	table.dataTable thead>tr>td.sorting_asc:after, table.dataTable thead>tr>td.sorting_desc:after,
	table.dataTable thead>tr>td.sorting_asc_disabled:after, table.dataTable thead>tr>td.sorting_desc_disabled:after
	{
	top: 50%;
	content: "▼";
	content: "▼"/"";
	display: none;
}
=
.fontCol {
	color: #007936;
}

.a1 {
	/* text-align: center; */
	
}

/* 사이즈 대비 출력되는 부트스트랩반응형 */
  @media (max-width: 494px) {
            .atag {
                display: inline-block;
                width: 100%;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .table-responsive {
                max-height: none !important;
                overflow: hidden !important;
            }
            .table {
                margin-bottom: 0 !important;
                text-align: left;
            }
            .d-none.d-sm-table-cell {
                display: none !important;
            }
        }
        @media (max-width: 768px) {
            .title {
                width: 100% !important;
                text-align: left;
            }
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
.atag{text-decoration-line: none;
color: #007936;}
/* h1태그 종료 */
</style>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	<main>
		<div class="container-fluid shadow p-3 mb-5 bg-body-tertiary rounded">
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
                                <td class="fontCol title col-12 col-md-5 col-lg-5">
                                    <a href="/board/FreeContent?code=${i.code}&cpage=1&viewchoose=true" class="atag">${i.title}</a>
                                </td>
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
	<script>
	function goToLink(url) {
    	console.log(url)
      window.location.href = url;
    }
	window.addEventListener('DOMContentLoaded', (event) => {
	    const atagElements = document.getElementsByClassName('atag');
	    Array.from(atagElements).forEach((element) => {
	        const maxWidth = element.offsetWidth;
	        const text = element.textContent;
	        const fontSize = getComputedStyle(element).fontSize;

	        let shortenedText = text;
	        while (element.scrollWidth > maxWidth) {
	            shortenedText = shortenedText.slice(0, -1);
	            element.textContent = shortenedText + '...';
	        }

	        element.style.fontSize = fontSize;
	    });
	});
		$(document).ready(function() {
			$("td.b1").each(function() {
				if ($(this).text() === "자유 게시판") {
					$(this).html("&#127803;자유 게시판");
				} else if ($(this).text() === "후기 게시판") {
					$(this).html("&#127804;후기 게시판");
				} else if ($(this).text() === "문의 게시판") {
					$(this).html("&#127801;문의 게시판");
				}
			});
			$("td.b2").each(function() {
				if ($(this).text() === "일상") {
					$(this).html("🍿일상");
				} else if ($(this).text() === "정보") {
					$(this).html("🕵️‍♂️정보");
				} else if ($(this).text() === "질문") {
					$(this).html("🙋‍♀️질문");
				} else if ($(this).text() === "후기") {
					$(this).html("🤷후기");
				}
			});
			$("#text").each(function() {
				if ($(this).text() === "Search:") {
					$(this).html("검색");
				}
			})
		});
		$(document).ready(function() {

			$('#myTables').DataTable({
				pagingType : "full_numbers",
				info : false,
				lengthChange: false,
				/* sPaginationType : "bootstrap" */
			});
			$('.dataTables_empty').text('내가 쓴 게시물이 없어요');
		});
	</script>
</body>
</html>