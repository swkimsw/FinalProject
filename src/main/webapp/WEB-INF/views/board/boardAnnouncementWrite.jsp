<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- 부트스트랩모드가 아닌 lite모드로-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.min.js"></script> <!--한글지원-->


    <!-- Bootstrap - CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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

        label{
            word-break: break-all;
            margin-bottom: 5px;
            width: 75%;
        }
        
        div>table {
            width: 100%;
            table-layout: fixed;
        }
        .btn {
            margin-top: -10px;
            margin-right: 14px;
            font-size: medium;
        }


        .button-container {
            text-align: center;
        }
    </style>

</head>
<body>

	<c:import url="../commons/gnb.jsp">
		</c:import>

<form id="frm" action="/board/inputAnnouncement" method="get">

    <div class="container">

        <div class="header">
        </div>


        <div class="body">

            <h2>공지게시판 작성하기</h2>
            <br>

            <div>
                제목 : <label><input id="title" name="title" class="form-control" placeholder="제목을 입력하세요 (최대 50자까지 가능합니다)"></label>
            </div>
        </div>



        <div>
            <table>
                <tr>
                    <td colspan="2">
                        <textarea id="content" name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <br>
                        <button class="btn btn-outline-primary" type="submit">작성</button>
                        <button class="btn btn-outline-primary" type="button">취소</button>
                    </td>
                </tr>
            </table>
        </div>


    </div>

    <div class="footer">
    </div>

    </div>
</form>

    <script>


        $(document).ready(function () {

            $('#content').summernote({
                placeholder: '글을 입력해주세요 (최대 4000자까지 가능합니다)',
                height: 600,
                focus: true,
                maxHeight: 800,
                minHeight: 200,
                disableDragAndDrop: true,
                lang: 'ko-KR', // default: 'en-US'
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['video']],
                    ['view', ['codeview', 'help']]
                ],callbacks: { //이미지 복 붙 안되게
                    onImageUpload: function (data) {
                        data.pop();
                    }
                }
            });

        });
        
        
        
        $("#frm").on("submit",function(){
        	if($("#title").val() == "" || $("#title").val().trim() == "" ){
        		alert("제목을 작성해주세요.");
        		return false;
        	}else if($('#content').val() == ""){
        		alert("내용을 입력해주세요.");
        		return false;
        	}
        })
        


    </script>
    
</body>
</html>