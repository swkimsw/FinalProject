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

                th,
                td {
                    font-size: 20px;
                }

            </style>

        </head>

        <body>
            <c:import url="../commons/gnb.jsp">
            </c:import>


            <div class="container">
                <br>
                <div class="header position-relative">

                    <div class="position-absolute top-0 end-0">

                        <input type="text" placeholder="제목이나 작성자로 검색">
                        <button class="btn btn-outline-primary" type="button"><i class="bi bi-search"></i></button>

                    </div>
                    <br>

                </div>

                <div class="table-responsive mt-5">

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>추천수</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                          <c:forEach var="l" items="${list}">
                            <tr onclick="goToLink('/board/ReviewContent?code=${l.code}&cpage=${cpage}')">
                                <td>${l.code}</td>
                                <td style="width: 50%;">${l.title}</td>
                                <td>${l.memberNickName}</td>
                                <td>${l.regDate}</td>
                                <td>${l.viewCount}</td>
                                <td>${l.likeCount}</td>
                            </tr>
                            
                        </c:forEach>
                         
                        </tbody>
                    </table>

                    <br>

                    <nav aria-label="...">
                        <ul class="pagination justify-content-center">
					        <c:forEach var="ln" items="${listnavi}">
						        <c:choose>
							        <c:when test="${ln == '>' || ln == '<'}">
							          <li class="page-item" >
							            <a class="page-link" onclick="goToPage(1, '${ln}')"> ${ln} </a>
							          </li>
							        </c:when>
							        <c:otherwise>
							          <li class="page-item ${cpage == ln ? 'active' : ''}"  >
							            <a class="page-link" href="/board/review?cpage=${ln}">${ln}</a>
							          </li>
							        </c:otherwise>
						        </c:choose>  
					        </c:forEach>
    					</ul>
                    </nav>


            <c:choose>
			
				<c:when test="${user == '1003'}">

					<div style="float: right;">
						<a href="/board/reviewWrite">
							<button class="btn btn-outline-primary" type="button">작성하기</button>
						</a>
					</div>

				</c:when>
			
				<c:otherwise> 
			
				</c:otherwise> 
			
			</c:choose>

                </div>

            </div>

            <script>

            
            function goToLink(url) {
              window.location.href = url;
            }
        
            function goToPage(page , point) {
            	
                
            	
                // 페이지 이동 로직 구현
                if(point==("<")){
                	console.log(page)
                	window.location.href = '/board/review?cpage=' + (page*5) ;
                }else{
                	window.location.href = '/board/review?cpage=' + (page*5+1) ;
                }
               
              }
            </script>

        </body>

        </html>