<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <!-- 부트스트랩모드가 아닌 lite모드로-->
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.min.js"></script>
            <!--한글지원-->


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

                form>table {
                    width: 100%;
                    table-layout: fixed;
                }

                button {
                    margin-bottom: 10px;
                    border: 0;
                }

                #title {
                    width: 75%;
                }

                .body tr,
                td {
                    border: 1px solid black;
                    font-size: 20px;
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

                .btn-primary {
                    margin-top: -15px;
                    font-size: small;
                }

                .button-container {
                    margin-top: 10px;
                }

                #asdf {
                    margin-right: 15px;
                    float: right;
                }
            </style>

        </head>

        <body>
            <c:import url="../commons/gnb.jsp">
            </c:import>


            <c:choose>
                <c:when test="${user == result.memberCode}">
                    <div class="container">

                        <div class="row header">
                            <h2>공지게시판</h2>
                            <br>
                        </div>


                        <div class="row body">
                        
                            <form style="padding:0">
                                <table>

                                    <tr>
                                        <td>글번호 : ${result.code} | 작성자 : ${result.memberName} </td>
                                    </tr>

                                    <tr>
                                        <td>제목 :
                                            <input id="title" type="text" value="${result.title}" disabled>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div id="content">${result.content}</div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div id="asdf" class="button-container">
                                                <button id="modi" class=" btn btn-outline-primary" onclick="edit()"
                                                    type="button">수정</button>
                                                <button id="save" class="btn btn-outline-primary" onclick="save()"
                                                    type="button">수정
                                                    완료</button>
                                                <button id="undo" class="btn btn btn-outline-primary" onclick="undo()"
                                                    type="button">취소</button>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </form>

                        </div>

                        <div class="row footer">

                            <table>
                                <tr>
                                    <td>

                                        <div class="card">

                                            <div class="card-body" class="mt-5 ">

                                                <!-- Comment form-->
                                                <textarea id="write_reply" class="form-control mt-3" rows="3"
                                                    placeholder="댓글을 작성해주세요!"></textarea>
                                                <a href="#" class="btn btn-primary btn-sm mt-2 "
                                                    style="float:right;">작성</a>
                                                <!-- Comment with nested comments-->

                                                <!-- Parent comment-->
                                                <div class="d-flex mt-5">
                                                    <div class="flex-shrink-0"><img class="rounded-circle"
                                                            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                            alt="...">
                                                    </div>
                                                    <div class="ms-3">
                                                        <div class="fw-bold">작성자</div>
                                                        <div class="reply">
                                                            ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
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
                                                                src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                                alt="...">
                                                        </div>
                                                        <div class="ms-3">
                                                            <div class="fw-bold">작성자</div>
                                                            <div class="reply">
                                                                sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                                <div class="button-container" style="float:right ;">
                                                                    <button class="btn btn-outline-primary btn-sm"
                                                                        type="button"> <i
                                                                            class="bi bi-hand-thumbs-up"></i>13</button>
                                                                    <button class="btn btn-outline-primary btn-sm"
                                                                        type="button">신고</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- child comment-->
                                                <div class="ms-5">
                                                    <div class="d-flex mt-1">

                                                        <div class="flex-shrink-0"><img class="rounded-circle"
                                                                src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                                alt="...">
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


                </c:when>
                <c:otherwise>
                    <div class="container">

                        <div class="row header">
                            <h2>공지게시판</h2>
                            <br>
                        </div>

                        <div class="row body">
                            <table>


                                <tr>
                                    <td>글번호 : ${result.code} | 작성자 : ${result.memberName} </td>
                                </tr>

                                <tr>
                                    <td>제목 :
                                        ${result.title}
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                        <div id="content">${result.content}</div>
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
                                                    placeholder="댓글을 작성해주세요!"></textarea>
                                                <a href="#" class="btn btn-primary btn-sm mt-2 "
                                                    style="float:right;">작성</a>
                                                <!-- Comment with nested comments-->

                                                <!-- Parent comment-->
                                                <div class="d-flex mt-5">
                                                    <div class="flex-shrink-0"><img class="rounded-circle"
                                                            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                            alt="...">
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
                                                                src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                                alt="...">
                                                        </div>
                                                        <div class="ms-3">
                                                            <div class="fw-bold">작성자</div>
                                                            <div class="reply">
                                                                sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                                <div class="button-container" style="float:right ;">
                                                                    <button class="btn btn-outline-primary btn-sm"
                                                                        type="button"> <i
                                                                            class="bi bi-hand-thumbs-up"></i>13</button>
                                                                    <button class="btn btn-outline-primary btn-sm"
                                                                        type="button">신고</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- child comment-->
                                                <div class="ms-5">
                                                    <div class="d-flex mt-1">

                                                        <div class="flex-shrink-0"><img class="rounded-circle"
                                                                src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                                alt="...">
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
                </c:otherwise>

            </c:choose>

            <script>



                // 수정버튼
                $("#modi").on("click", function () {
                    $('#content').summernote({
                        placeholder: '글을 입력해주세요 (최대 4000자까지 가능합니다)',
                        height: 600,
                        focus: true,
                        maxHeight: 800,
                        minHeight: 200,
                        lang: 'ko-KR', // default: 'en-US'
                        toolbar: [
                            ['style', ['style']],
                            ['font', ['bold', 'underline', 'clear']],
                            ['color', ['color']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['table', ['table']],
                            ['insert', ['video']],
                            ['view', ['codeview', 'help']]
                        ]
                    });
                })

                // 완료
                $("#save").on("click", function () {
                    var markup = $('#content').summernote('code');
                    $('#content').summernote('destroy');
                })



            </script>



        </body>

        </html>