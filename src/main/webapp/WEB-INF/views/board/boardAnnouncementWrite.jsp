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
                    font-family: NanumSquareNeo-;
                    box-sizing: border-box;
                }

                .container {
                    margin-top: 100px;
                }

                h2 {
                    text-align: center;
                }

                .label {
                    word-break: break-all;
                    margin-bottom: 5px;
                    width: 75%;
                }

                div>table {
                    width: 100%;
                    table-layout: fixed;
                }

                .btn-outline-primary {
                    margin-top: -10px;
                    margin-right: 14px;
                    font-size: medium;
                }

                .button-container {
                    text-align: center;
                }

                .note-modal-footer>input {
                    margin-right: 20px;
                    margin-top: -15px;
                    font-size: small;
                }
                 .note-editor .note-toolbar .note-color-all .note-dropdown-menu,
	.note-popover .popover-content .note-color-all .note-dropdown-menu {
	min-width: 0px;
}

.note-dimension-picker-mousecatcher,
.note-dimension-picker-highlighted,
.note-dimension-picker-unhighlighted { 
  max-width: 3em;
  max-height: 3em;
}
            </style>

        </head>

        <body>

            <c:import url="../commons/gnb.jsp">
            </c:import>

            <form id="frm" action="/board/inputAnnouncement" method="post">

                <div class="container">

                    <div class="header"></div>


                    <div class="body">

                        <h2>공지게시판 작성하기</h2>
                        <br>

                        <div>
                            제목 : <label class="label"><input id="title" name="title" class="form-control"
                                    placeholder="제목을 입력하세요 (최대 50자까지 가능합니다)"></label>
                        </div>
                    </div>



                    <div>
                        <table>
                            <tr>
                                <td colspan="2"><textarea id="content" name="content"></textarea>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="button-container"><br>
                                    <button class="btn btn-outline-primary" style="margin-bottom:10px;" type="submit">작성</button>
                                    <a href="javascript:window.history.go(-1);">
                                    <button class="btn btn-outline-primary" style="margin-bottom:10px;" type="button">취소</button>
                                   </a>
                                </td>
                            </tr>
                        </table>
                    </div>


                </div>

                <div class="footer"></div>

                </div>
            </form>

            <script>


                $(document).ready(function () {

                    $('#content').summernote({
                        placeholder: '글을 입력해주세요 (최대 1000자까지 가능합니다)',
                        height: 600,
                        focus: true,
                        maxHeight: 800,
                        minHeight: 200,
                        disableDragAndDrop: false,
                        lang: 'ko-KR',
                        toolbar: [
                            ['style', ['style']],
                            ['font', ['bold', 'underline', 'clear']],
                            ['color', ['color']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['table', ['table']],
                            ['insert', ['video']],
                            ['view', ['codeview', 'help']]
                        ],
                        callbacks: {
                        	onImageUpload: function (data) {
                                alert("이미지 업로드 불가능합니다")
                            },
                            onChange: function (contents, $editable) {
                                console.log("asdf")
                                checkContentLength();

                            }
                        }

                    });

                })



              function checkContentLength() {
                    var maxLength = 1000;
                    var content = $('#content').summernote('code');
                    var text = $('<div>').html(content).text();


                    var iframeTags = (content.match(/<iframe[^>]+>/g) || []);
                    var iframeCount = iframeTags.length; // 영상 개수

                    var imageTags = (content.match(/<img[^>]+>/g) || []);
                    var imageCount = imageTags.length; // 이미지 개수

                    var contentLength = text.length + (iframeCount * 100) + (imageCount * 100);
                    var DBcontentLength = content.length;

                    console.log("contentLength: " + contentLength);
                    console.log("DBcontentLength: " + DBcontentLength);
                    console.log("Iframe Count: " + iframeCount);
                    console.log("Image Count: " + imageCount);


                    if (contentLength > maxLength ) {
                        alert("내용은 최대 1000자까지 입력할 수 있습니다.");
                        $('#content').summernote('undo');
                    }else if(DBcontentLength>1300){
                    	alert("저장할수 있는 용량을 초과하였습니다.");
                        $('#content').summernote('undo');
                    }else {
                        return;
                    }
                }

                $("#title").on("input", function () {
                    var maxLength = 50;
                    var title = $(this).val();

                    if (title.length > maxLength) {
                        alert("제목은 최대 50자까지 입력할 수 있습니다.");
                        title = title.slice(0, maxLength - 1);
                        $(this).val(title);
                    }
                });

                $("#frm").on("submit", function () {

                    var content = $('#content').summernote('code');
                    var text = $('<div>').html(content).text();


                    if ($("select[id=headline] option:selected").val() == 0) {
                        alert("카테고리를 선택해주세요.");
                        return false;
                    } else if ($("#title").val() == "" || $("#title").val().trim() == "") {
                        alert("제목을 작성해주세요.");
                        return false;
                    } else if ($('#content').val() == "") {
                        alert("내용을 입력해주세요.");
                        return false;
                    } else if (text.length == 0) {
                        alert("내용을 입력해주세요.");
                        return false;
                    }
                })




            </script>

        </body>

        </html>