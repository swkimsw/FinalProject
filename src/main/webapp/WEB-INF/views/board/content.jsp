<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="path" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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

            <!-- gnb css -->
            <link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">

            <style>
                * {
                    font-family: NanumSquareNeo;
                    box-sizing: border-box;
                }

                .container {
                    margin-top: 100px;
                }

                h2 {
                    text-align: center;
                }

                div>table {
                    width: 100%;
                    table-layout: fixed;
                }

                button {
                    margin-bottom: 10px;
                    border: 0;
                }

                table tr,
                td {
                    border: 1px solid black;
                }

                #content {
                    width: 100%;
                    height: 600px;
                    overflow: auto;
                    word-break: break-all;
                }

                #write_reply {
                    width: 100%;
                    height: 150px;
                }

                .reply {
                    word-break: break-all;
                }

                .re_reply {
                    word-break: break-all;
                }
            </style>

        </head>

        <body>

            <c:import url="../commons/gnb.jsp">
            </c:import>

            <div class="container">

                <div class="row header">
                    <h2>자유게시판</h2>
                    <br>
                </div>

                <div class="row body">
                    <table>
                        <tr>
                            <td>
                                카테고리 : 일상
                            </td>
                        </tr>

                        <tr>
                            <td>글번호 : ${result.seq} | 작성자 : ${result.writer} </td>
                        </tr>

                        <tr>
                            <td>제목 :
                                우동을 먹었더니 냉우동이...
                            </td>
                        </tr>

                        <tr>
                            <td>첨부 사진 :
                            </td>
                        </tr>

                        <tr>
                            <c:forEach var="f" items="${file}">
                                <a href="/board/download?oriName=${f.oriName}&sysName=${f.sysName}">
                                    <td> ${f.oriName}</td>
                                </a>
                            </c:forEach>
                        </tr>

                        <tr>
                            <td>
                                <div id="content"></div>
                            </td>
                        </tr>



                    </table>
                </div>

                <div class="row footer">

                    <table>
                        <tr>
                            <td>

                                <div class="card">

                                    <div class="card-body" class="mt-5 ">

                                        <!-- Comment form-->
                                        <textarea id="write_reply" class="form-control mt-3" rows="3"
                                            placeholder="Join the discussion and leave a comment!"></textarea>
                                        <a href="#" class="btn btn-primary btn-sm mt-2 " style="float:right;">작성</a>
                                        <!-- Comment with nested comments-->

                                        <!-- Parent comment-->
                                        <div class="d-flex mt-5">
                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container"
                                                        style="float:right ; margin-top: 10px;">
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="submit">수정</button>
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="button">취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- child comment-->
                                        <div class="ms-5">
                                            <div class="d-flex mt-1">

                                                <div class="flex-shrink-0"><img class="rounded-circle"
                                                        src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                                </div>
                                                <div class="ms-3">
                                                    <div class="fw-bold">작성자</div>
                                                    <div class="reply">
                                                        sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                        <div class="button-container"
                                                            style="float:right ; margin-top: 10px;">
                                                            <button class="btn btn-outline-primary btn-sm"
                                                                type="submit">수정</button>
                                                            <button class="btn btn-outline-primary btn-sm"
                                                                type="button">취소</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- child comment-->
                                        <div class="ms-5">
                                            <div class="d-flex mt-1">

                                                <div class="flex-shrink-0"><img class="rounded-circle"
                                                        src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                                </div>
                                                <div class="ms-3">
                                                    <div class="fw-bold">작성자</div>
                                                    <div class="reply">
                                                        sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                        <div class="button-container"
                                                            style="float:right ; margin-top: 10px;">
                                                            <button class="btn btn-outline-primary btn-sm"
                                                                type="button"> <i
                                                                    class="bi bi-hand-thumbs-up"></i>13</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </td>
                        </tr>
                    </table>


                </div>

            </div>


            <script>

                var htmlContent = '';

                // ID를 사용하여 textarea 요소를 선택합니다.
                var content = document.getElementById('content');
                // innerHTML 속성을 사용하여 HTML 내용을 설정합니다.
                content.innerHTML = htmlContent;



            </script>


        </body>

        </html>