<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="path" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <!-- JQuery-->
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <!-- Bootstrap - CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <!-- Bootstrap - JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
            <!-- Bootstrap - icon -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
            <!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
            <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
            <!-- awesome font -icon -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

            <!-- gbn css -->
            <link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">

            <style>
                * {
                    font-family: NanumSquareNeo;
                }

                input {
                    border-radius: 5px;
                    padding: 5px;
                }

                .container {
                    margin-top: 100px;
                    border: 1px solid black;
                }

               .table th,
                td {
                    font-size: 18px;
                }
            </style>

        </head>

        <body>
            <c:import url="../commons/gnb.jsp">
            </c:import>


            <div class="container">
                <br>

                <form id="frm" action="/board/announcement" method="post">
                    <div class="header position-relative">
                        <div class="position-absolute top-0 end-0">

                            <input type="hidden" name="cpage" value="1">
                            <select class="form-select" aria-label="Default select example" id="searchCate"
                                name="searchCate" style="width: 120px; display: inline;">
                                <option value="선택">선택</option>
                                <option value="제목">제목</option>
                                <option value="작성자">작성자</option>
                            </select>
                            <input class="form-control" placeholder="Search" id="search" name="search"
                                onkeypress="if(event.keyCode == 13) { this.form.submit(e); }"
                                style="width: 300px; display: initial;" value="${search }">
                            <button class="btn btn-outline-primary" type="submit"><i class="bi bi-search"></i></button>

                        </div>
                        <br>
                    </div>
                </form>

                <div class="table-responsive mt-5">

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th style="width: 50%;">제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>추천수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${list.size() == 0}">

                                    <tr>
                                        <td colspan='6'>

                                            <div class='col-xxl-12 pt-5 text-center'>

                                                <i class="bi bi-arrow-clockwise" onclick="reload();" type="button"
                                                    style="font-size:50px; color:#007936;"></i>

                                                <p class='fs-6'> 검색결과가 없습니다 다시 검색해주세요 ㅠㅠ</p>
                                            </div>


                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="l" items="${list}">

                                        <tr
                                            onclick="goToLink('/board/AnnouncementContent?code=${l.code}&cpage=${cpage}&viewchoose=true')">
                                            <td>${l.code}</td>
                                            <td style="width: 50%;">${l.title}</td>
                                            <td>${l.memberName}</td>
                                            <td>${l.regDate}</td>
                                            <td>${l.viewCount}</td>
                                            <td>${l.likeCount}</td>

                                        </tr>

                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>


                        </tbody>
                    </table>

                    <br>
                    <c:choose>
                        <c:when test="${search == null }">
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center">
                                    <c:forEach var="ln" items="${listnavi}">
                                        <c:choose>
                                            <c:when test="${ln == '>' || ln == '<'}">
                                                <li class="page-item">
                                                    <a class="page-link" onclick="goToPage(1, '${ln}')"> ${ln} </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item ${cpage == ln ? 'active' : ''}">
                                                    <a class="page-link"
                                                        href="/board/announcement?cpage=${ln}">${ln}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:when>
                        <c:otherwise>
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center">
                                    <c:forEach var="ln" items="${listnavi}">
                                        <c:choose>
                                            <c:when test="${ln == '>' || ln == '<'}">
                                                <li class="page-item">
                                                    <a class="page-link"
                                                        onclick="goToPageSearch(1, '${ln}' ,'${search}' ,'${searchCate}' )">
                                                        ${ln}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item ${cpage == ln ? 'active' : ''}">
                                                    <a class="page-link"
                                                        href="/board/announcement?cpage=${ln}&search=${search}&searchCate=${searchCate}">${ln}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:otherwise>
                    </c:choose>



                    <c:choose>

                        <c:when test="${user == '1001'}">

                            <div style="float: right;">
                                <a href="/board/announcementWrite?cpage=${cpage}">
                                    <button class="btn btn-outline-primary" style="margin-bottom:10px;" type="button">작성하기</button>
                                   
                                </a>
                                
                            </div>

                        </c:when>

                        <c:otherwise>

                        </c:otherwise>

                    </c:choose>

<br>
                </div>

            </div>

            <script>


                $("#frm").on("submit", function (e) {

                    if ($("select[id=searchCate] option:selected").val() == "선택") {
                        alert("카테고리를 선택해주세요.");
                        e.preventDefault(); // 폼 제출을 막음
                    } else if ($("#search").val().trim() == "") {
                        alert("검색어를 작성해주세요.");
                        e.preventDefault(); // 폼 제출을 막음
                    }

                })


                $("#search").on("input", function () {
                    var maxLength = 20;
                    var search = $(this).val();

                    if (search.length > maxLength) {
                        alert("검색어는 최대 20자까지 입력할 수 있습니다.");
                        search = search.slice(0, maxLength - 1);
                        $(this).val(search);

                    }
                });


                function reload() {
                    location.href = "/board/announcement?cpage=1";
                }


                function goToLink(url) {
                    window.location.href = url;
                }


                function goToPage(page, point) {

                    // 페이지 이동 로직 구현
                    if (point == ("<")) {
                        console.log(page)
                        window.location.href = '/board/announcement?cpage=' + (page * 5);
                    } else {
                        window.location.href = '/board/announcement?cpage=' + (page * 5 + 1);
                    }
                }


                function goToPageSearch(page, point, search, searchCate) {
                    // 페이지 이동 로직 구현 - 검색
                    if (point == ("<")) {
                        console.log(page)
                        window.location.href = '/board/announcement?cpage=' + (page * 5) + '&search=' + search + '&searchCate=' + searchCate;
                    } else {
                        window.location.href = '/board/announcement?cpage=' + (page * 5 + 1) + '&search=' + search + '&searchCate=' + searchCate;
                    }

                }

                // 브라우저 크기 별 style 값 다르게 주기
          		 $(window).on("load", function() {
          			 const bodySize = parseInt($(".container").css("width"));
          			 if(bodySize<768) { 
          				 
          				 $("th").css("font-size" ,"10px");
          				 $("td").css("font-size" ,"10px");
          				$('.btn').addClass('btn-sm');
          				$('.pagination').addClass('pagination-sm');
          				$('.form-select').addClass('form-select-sm');
           				$('.form-control').addClass('form-control-sm');
          				 
          			}else if(bodySize>=768){
          			 $("th").css("font-size" ,"18px");
      				 $("td").css("font-size" ,"18px");
      				 $('.btn').removeClass('btn-sm');
      				$('.pagination').removeClass('pagination-sm');
      				$('.form-select').removeClass('form-select-sm');
       				$('.form-control').removeClass('form-control-sm');
          			}
          		})
          		addEventListener("resize", function (event) {
          			 const bodySize = parseInt($(".container").css("width"));
          			 if(bodySize<768) {
          				 
          				 $("th").css("font-size" ,"10px");
          				 $("td").css("font-size" ,"10px");
          				$('.btn').addClass('btn-sm');
          				$('.pagination').addClass('pagination-sm');
          				$('.form-select').addClass('form-select-sm');
           				$('.form-control').addClass('form-control-sm');
          				 
          			}else if(bodySize>=768){
          			 $("th").css("font-size" ,"18px");
      				 $("td").css("font-size" ,"18px");
      				 $('.btn').removeClass('btn-sm');
      				$('.pagination').removeClass('pagination-sm');
      				$('.form-select').removeClass('form-select-sm');
       				$('.form-control').removeClass('form-control-sm');
          			}
          		}) 
          		
            </script>

        </body>

        </html>