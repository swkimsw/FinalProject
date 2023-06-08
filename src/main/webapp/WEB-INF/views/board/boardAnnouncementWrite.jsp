<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


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
            font-family: NanumSquareNeoBold;
            box-sizing: border-box;
        }

        .container {
            margin-top: 100px;
        }

        select {
            margin-top: 5px;
        }

        input {
            margin-bottom: 5px;
            width: 75%
        }

        h2 {
            text-align: center;
        }

        #title {
            word-break: break-all;

        }

        div>table {
            width: 100%;

        }

        #content {
            white-space: pre-wrap;
            word-wrap: break-word;

        }

        .button-container {
            text-align: center;
        }

        .button-container button {
            margin-right: 10px;
        }

        button {
            margin-bottom: 10px;

        }
    </style>

</head>
<body>

  <c:import url="../commons/gnb.jsp">
		</c:import>


    <div class="container">

        
            <div class="col-xs-12 col-md-12  col-lg-12 ">
                <h2>후기 작성하기</h2>
                <br>

                <div class="col-xs-12 col-md-12  col-lg-12 ">
                        제목 : <input id="title" type="text" placeholder="제목을 입력하세요 (최대 50자까지 가능합니다)">
                </div>

             </div>
             
            <table>
                <tr>
                    <td colspan="2"><textarea id="content" type="text"></textarea></td>
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

    <script>


        $(document).ready(function () {
            $('#content').summernote({
                placeholder: '글을 입력해주세요 (최대 4000자까지 가능합니다)',
                tabsize: 2,
                height: 500,
                focus: true,
                maxHeight: 600,
                minHeight: 200,
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture']],
                    ['view', ['codeview', 'help']]

                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
            });

        });

    </script>
</body>
</html>