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

                div>table {
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
                    margin-right: 15px;
                    font-size: medium;
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


            <div class="container">

                <div class="row header">
                    <h2>자유게시판</h2>
                    <br>
                </div>


                <div class="row body">

                    <table>
                        <form>
                            <tr>
                                <td>
                                    카테고리 : <select id="select" disabled>
                                        <option>일상</option>
                                        <option>정보</option>
                                        <option>질문</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>글번호 : ${result.seq} | 작성자 : ${result.writer} </td>
                            </tr>

                            <tr>
                                <td>제목 :
                                    <input id="title" type="text" placeholder="제목을 입력하세요 (최대 50자까지 가능합니다)" disabled>
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

                        </form>

                        <tr>
                            <td>
                                <!-- Comment form-->
                                <textarea id="write_reply" style="color:rgba(41, 41, 163, 0.928);" type="text"
                                    class="form-control mt-3 " rows="3" placeholder="댓글을 남겨주세요!"></textarea>
                                <div class="fs-2"
                                    style="display: inline; float:right; color:rgba(41, 41, 163, 0.928) ; margin-right:10px;">
                                    <i class="bi bi-send" type="button"></i>
                                </div>

                            </td>
                        </tr>

                    </table>

                </div>

                <div class="row footer">

                    <table>
                        <tr>


                            <td>

                                <div class="card">

                                    <div class="card-body">




                                        <!-- Comment with nested comments-->



                                        <!-- Parent comment-->
                                        <div class="d-flex mt-2">
                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container" style="float:right ;">
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
                                                        <div class="button-container" style="float:right ;">
                                                            <button class="btn btn-outline-primary btn-sm"
                                                                type="button">수정</button>
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

                                        <div class="d-flex mt-2">
                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container" style="float:right ;">
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="submit">수정</button>
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="button">취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="d-flex mt-2">
                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container" style="float:right ;">
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="submit">수정</button>
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="button">취소</button>
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

                var htmlContent = '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/XLo_K6GkGHk" width="640" height="360" class="note-video-clip"></iframe></p><p>오킹 재밌음 봐봐</p>';
                // ID를 사용하여 textarea 요소를 선택합니다.
                var content = document.getElementById('content');
                // innerHTML 속성을 사용하여 HTML 내용을 설정합니다.
                content.innerHTML = htmlContent;


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
                            ['insert', ['picture', 'video']],
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