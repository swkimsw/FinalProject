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

                .row>table {
                    width: 100%;
                    table-layout: fixed;
                }


                .title {
                    width: 75%;
                }

                .body tr,
                td {
                    border: 1px solid black;
                    font-size: 20px;
                }


                .content {
                    width: 100%;
                    height: 600px;
                    overflow: auto;
                    word-break: break-all;

                }

                #write_reply {
                    width: 100%;
                    height: 150px;
                    overflow: auto;
                    word-break:break-all;
                }
                
                #write_reply:empty:before {
   					content: attr(placeholder);
				}

                .reply {
                    word-break: break-all;
                }

                .re_reply {
                    word-break: break-all;
                }

              .con{
                    margin-right: 15px;
                    float: right;
                    border: 0;
                    margin-top: 10px;
                    margin-bottom: 10px;
                }

                .note-modal-footer>input {
                    margin-right: 20px;
                    margin-top: -15px;
                    font-size: small;
                }
                
                .replyCode {
                	display: none;
                }
                
                .replyMemberCode {
                	display: none;
                }
                
                .replyMemberNickNameOrCompanyName {
                	display: inline;
                }
                
                .me {
                	font-size: 12px; 
                	display: inline;
                }
                
                .modiWriteReply {
                	border: none;
                	word-break : break-word;
                }
                
                .modiWriteReply:empty:before {
   					content: attr(placeholder);
				}
				
				.replyModiCancleBtn {
					display: none;
				}
				
				.replyModiSuccessBtn {
					display: none;
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
                            <h2>후기게시판</h2>
                            <br>
                        </div>


                        <div class="row body">

                            <table>


                                <tr>
                                    <td>글번호 : ${result.code} | 작성자 : ${result.memberNickName} </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input id="code" type="text" value="${result.code}" style="display:none">
                                    </td>
                                </tr>


                                <tr>
                                    <td>제목 :
                                        <input class="title" id="title" type="text" value="${result.title}" disabled>
                                        <div id="info">
                                            <input type="hidden" name="oriName">
                                            <input type="hidden" name="sysName">
                                            <input type="hidden" name="realPath">
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="content" id="content">${result.content}</div>
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                        <div id="button" class="button-container con">
                                            <button id="modi" class=" btn btn-outline-primary" type="button">수정</button>

                                            <button id="save" class=" btn btn-outline-primary" style="display:none"
                                                type="submit">완료</button>

                                            <button id="cancel" class=" btn btn-outline-primary" style="display:none"
                                                type="button">취소</button>

                                            <button id="del" class="btn btn btn-outline-primary"
                                                type="button">삭제</button>

                                             <a href="/board/review?cpage=${cpage}">
                                            <button id="list" type="button" class="btn btn-outline-secondary">목록</button>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </table>


                        </div>



                </c:when>
                <c:otherwise>
                    <div class="container">

                        <div class="row header">
                            <h2>후기게시판</h2>
                            <br>
                        </div>

                        <div class="row body">
                            <table>

                                <tr>
                                    <td>글번호 : ${result.code} | 작성자 : ${result.memberNickName} </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <input id="code" type="text" value="${result.code}" style="display:none">
                                    </td>
                                </tr>

                                <tr>
                                    <td>제목 :
                                        <input class="title" id="title" type="text" value="${result.title}" disabled>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="content" id="content">${result.content}</div>
                                    </td>
                                </tr>


								<tr>
						            <td>
						                <div id="button" class="button-container con">
						                
						                	<button id="report" type="button" class="btn btn-outline-danger">신고</button>
						                  
						
						                  	<button id="likecount" class=" btn btn-outline-primary" type="button">추천</button> 
						
						                    <a href="/board/review?cpage=${cpage}"> 
						                    <button id="list" type="button" class="btn btn-outline-secondary">목록</button>
						                    </a>
						                    
						                </div>
						            </td>
        						</tr>

                            </table>
                        </div>



                </c:otherwise>

            </c:choose>


            <div class="row footer">

                <table>
                    <tr>
                        <td>

                            <div class="card">

                                <div class="card-body" class="mt-5 ">

                                    <!-- Comment form-->
                                    <div contenteditable="true" id="write_reply" class="form-control mt-3" rows="3" placeholder="내용을 입력하세요(200자 미만)"></div>
                                    <input type="hidden" name="replyContent" id="hidden_write_reply">
                                    <input type="hidden" name="boardFreeCode" value="${result.code}">
                                    <input type="hidden" name="cpage" value="${cpage}">   
                                                               
                                    <button class="btn btn-primary btn-m mt-2" id="replyWriteBtn" style="float:right;">작성</button>

                                    <!-- Parent comment-->
                                    <c:forEach var="i" items="${replyList}">
                                    <div id="rep">
                                    <c:choose>
			                            <c:when test="${user == i.memberCode}">
			                            <div class="replyMemberCode">${i.memberCode}</div>
		                                    <hr style="margin-top: 60px;">
			                                    <div class="d-flex mt-5">
			                                        <div class="flex-shrink-0">
			                                        	<img class="rounded-circle" style="height:50px; width:50px; border:1px solid black;" src="https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png" alt="...">
			                                        </div>
		
			                                        <div class="ms-3">
			                                            <div class="fw-bold">
			                                            	<div class="replyMemberNickNameOrCompanyName">${i.nickName}</div> 
			                                            	<div class="replyMemberNickNameOrCompanyName">${i.companyName}</div> 
			                                            	<div class="me">(본인)</div>
			                                            </div>
			                                            <div class="replyCode">${i.code}</div>			                                            
	                                   					<div class="form-control mt-3 modiWriteReply" rows="3" placeholder="내용을 입력하세요(200자 미만)">${i.content}</div>
			                                        </div>
			                                    </div>


			                                    <div class="button-container con">
				                                   	<button class="btn btn-outline-primary btn-sm replyModiBtn">수정</button>				                                   				                                   	
				                                    <button class="btn btn-outline-primary btn-sm replyDeleteBtn">삭제</button> 
				                                   	<button class="btn btn-outline-primary btn-sm replyModiSuccessBtn">수정완료</button>				                                    				                                   	
				                                   	<button class="btn btn-outline-primary btn-sm replyModiCancleBtn">수정취소</button>	
				                                </div>

		                                    </c:when>
		                                    <c:otherwise>
		                                    	<div class="replyMemberCode">${i.memberCode}</div>
		                                    	<hr style="margin-top: 60px;">
			                                    <div class="d-flex mt-5">
			                                        <div class="flex-shrink-0">
			                                        	<img class="rounded-circle" style="height:50px; width:50px; border:1px solid black;" src="https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png" alt="...">			                                        
<!-- 			                                        <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
 -->			                                    </div>
		
			                                        <div class="ms-3">
			                                            <div class="fw-bold" >${i.nickName}</div>
			                                            <div class="fw-bold" >${i.companyName}</div>
			                                            <div class="replyCode">${i.code}</div>			                                            
                                   					 	<div contenteditable="false" class="form-control mt-3 modiWriteReply" rows="3" placeholder="내용을 입력하세요(200자 미만)">${i.content}</div>
			                                        </div>
			                                    </div>
                                                    <div class="button-container con">
                                                    
                                                        <button class="btn btn-outline-primary btn-sm likeBtn">
	                                                         <i class="bi bi-hand-thumbs-up">${i.likeCount}</i>
                                                         </button>
                                                         
                                                        <button class="btn btn-outline-primary btn-sm replyReport">신고</button>
                                                        
                                                    </div>
		                                    </c:otherwise>
	                                    </c:choose>
                                    </div>
                                    </c:forEach>



                                    <!-- child comment-->
<!--                                   <div class="ms-5">

                                        <div class="d-flex mt-1">

                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container con" style="float:right ;">
                                                        <button class="btn btn-outline-primary btn-sm" type="button"> <i
                                                                class="bi bi-hand-thumbs-up"></i>13</button>
                                                        <button class="btn btn-outline-primary btn-sm"
                                                            type="button">신고</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    child comment
                                    <div class="ms-5">
                                        <div class="d-flex mt-1">

                                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                                            </div>
                                            <div class="ms-3">
                                                <div class="fw-bold">작성자</div>
                                                <div class="reply">
                                                    sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                                    <div class="button-container con"
                                                        style="float:right ; margin-top: 10px;">
                                                        <button class="btn btn-outline-primary btn-sm" type="button"> <i
                                                                class="bi bi-hand-thumbs-up"></i>13</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                </div>

                            </div>
                        </td>
                    </tr>
                </table>


            </div>

            </div>

            <script>


                // 수정버튼


                $(document).ready(function () {

                	//const contentDiv = document.getElementById('content');
                	//console.log(contentDiv.innerTEXT)
                	//contentDiv.innerHTML = contentDiv.innerText;
                	
					$("#content").html($("#content").html());
                    $("#modi").on("click", function () {

                        $("#modi").css("display", "none"); // 수정버튼 안보이게

                        $('#content').summernote({
                            placeholder: '글을 입력해주세요 (최대 2000자까지 가능합니다)',
                            height: 600,
                            focus: true,
                            maxHeight: 800,
                            minHeight: 200,
                            disableDragAndDrop: true,
                            lang: 'ko-KR',
                            toolbar: [
                                ['style', ['style']],
                                ['font', ['bold', 'underline', 'clear']],
                                ['color', ['color']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['table', ['table']],
                                ['insert', ['picture', 'video']],
                                ['view', ['codeview', 'help']]
                            ], callbacks: {
                                onImageUpload: function (files) {
                                    console.log("1번째")
                                    uploadImages(files);
                                    checkContentLength();

                                },
                                onKeyup: function () {
                                    console.log("2번째")
                                    checkContentLength();
                                },
                                onPaste: function () {
                                    console.log("3번째")
                                    checkContentLength();
                                },
                                onChange: function (contents, $editable) {
                                    console.log("4번째")
                                    checkContentLength();
                                }
                            }
                        });


                        $("#title").removeAttr("disabled"); // 제목버튼 - 활성화/ 고칠수있게
                        $("#save").css("display", "inline"); // 완료버튼보이게


                    });



                    // 완료
                    $("#save").on("click", function () {

                        let result = confirm("수정하시겠습니까?");

                        if (result) {


                            let content = $('#content').summernote('code'); //태그있는거
                            var text = $('<div>').html(content).text(); //태그없는거

                            if ($("#title").val() == "" || $("#title").val().trim() == "") {
                                alert("제목을 작성해주세요.");
                                return false;
                            } else if (content == "") {
                                alert("내용을 입력해주세요.");
                                return false;
                            } else if (text.length == 0) {
                                alert("글자를 입력해주세요.");
                                return false;
                            }


                            let title = $("#title").val();
                            let code = $("#code").val();


                            $.ajax({
                                url: "/board/updateReview",
                                type: "post",
                                dataType: "json",
                                data: {
                                    title: title,
                                    content: content,
                                    code: code,
                                }
                            }).done(function (resp) {
                                if (resp == 1) {
                                    alert("수정되었습니다");
                                    location.reload();

                                } else {
                                    alert("수정에 실패했습니다");
                                    return false;
                                }
                            })


                        } else {
                            location.reload();
                        }



                    });

                    function uploadImages(files) {
                        var formData = new FormData();
                        // FormData 객체를 사용하여 파일 데이터를 추가합니다.
                        for (var i = 0; i < files.length; i++) {
                            console.log(files.length);
                            formData.append('image', files[i]);
                            //  FormData 객체의 append 메서드를 사용하여 키-값 쌍으로 데이터를 추가합니다. 여기서 "image"라는 키 이름으로 파일 데이터를 추가하고 있습니다.
                        }


                        $.ajax({
                            url: "/board/uploadImage",
                            type: 'POST',
                            data: formData, //FormData 객체로 만들면 일반적인 텍스트 필드뿐만 아니라 파일 업로드 필드와 같은 복잡한 데이터도 쉽게 처리가능
                            contentType: false,
                            processData: false,
                        }).done(function (resp) {

                            if (resp != null) {

                                alert('이미지 업로드에 성공했습니다.');

                                $('#info input[name="realPath"]').val(resp[0].realPath);

                                var imageUrls = [];
                                var sysNames = [];
                                var oriNames = [];


                                // resp 배열에서 이미지 URL을 추출하여 imageUrls 배열에 저장합니다
                                for (var i = 0; i < resp.length; i++) {
                                    console.log(resp[i]);
                                    imageUrls.push(resp[i].url);
                                    oriNames.push(resp[i].oriName);
                                    sysNames.push(resp[i].sysName);
                                }

                                // imageUrls 배열의 각 이미지 URL을 사용하여 미리보기 이미지를 생성하고 에디터에 삽입합니다.
                                for (var i = 0; i < imageUrls.length; i++) {
                                    var imageUrl = imageUrls[i];
                                    var $preview = $('<img src="' + imageUrl + '">');
                                    $('#content').summernote('editor.insertNode', $preview[0]);
                                }


                                for (var i = 0; i < oriNames.length; i++) {
                                    var oriName = oriNames[i];
                                    var sysName = sysNames[i];

                                    console.log(oriName);
                                    console.log(sysName);

                                    // Set the oriName and sysName values as input tag values
                                    $('#info input[name="oriName"]').val(oriNames.join(','));
                                    $('#info input[name="sysName"]').val(sysNames.join(','));

                                }


                            } else {
                                alert('이미지 업로드에 실패했습니다.');
                            }
                        });

                    }



                    $("#title").on("input", function () {
                        var maxLength = 50;
                        var title = $(this).val();

                        if (title.length > maxLength) {
                            alert("제목은 최대 50자까지 입력할 수 있습니다.");
                            title = title.slice(0, maxLength - 1);
                            $(this).val(title);
                        }
                    }); // 제목 글자수 제한


                    function checkContentLength() {
                        var maxLength = 1000;
                        var content = $('#content').summernote('code');


                        var text = $('<div>').html(content).text();

                        var iframeTags = (content.match(/<iframe[^>]+>/g) || []);
                        var iframeCount = iframeTags.length; // 영상 개수

                        var imageTags = (content.match(/<img[^>]+>/g) || []);
                        var imageCount = imageTags.length; // 이미지 개수

                        var contentLength = text.length + (iframeCount * 100) + (imageCount * 100);

                        console.log("contentLength: " + contentLength);
                        console.log("Iframe Count: " + iframeCount);
                        console.log("Image Count: " + imageCount);

                        if (contentLength > maxLength) {
                            alert("내용은 최대 1000자까지 입력할 수 있습니다.");
                            $('#content').summernote('undo');
                        } else {
                            return;
                        }
                    } //유효성검사

                    $("#del").on("click",function(){
                    	let result = confirm("삭제하시겠습니까?")
                    
                    	if(result){
                    		alert("삭제되었습니다");
                    		location.href = "/board/deleteReview?code=" + ${result.code} +"&cpage=" + ${cpage};
                    	}else{
                    		return false;
                    	}
                    })
                    
                    
                    $("#likecount").on("click", function () {
                    	
                    	 let postcode = $("#code").val();
                    	let count = (${result.likeCount}+1) ;
                    	 console.log(postcode);
                    	 
                    	 $.ajax({
 						    url: "/board/LikeCount",
 						    type: "post",
 						    dataType: "json",
 						    data: {
 						    	code : postcode ,
 						     	likeCount: count,
 						     	boardKindCode: "1003"
 						    },
 						  }).done(function (resp) {
 						      if (resp == 1) {
 						    	 alert("추천되었습니다");
                     	        location.href="/board/ReviewContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
 						      } else {
 						        alert("다시 눌러주세요");
 						      }
 						    })
 						    .fail(function () {
 						      alert("요청 실패");
 						    });
                    	 
                    	 
						});
						
						

                     $("#report").on("click",function(){
                    	let result = confirm("신고하겠습니까?")
                    
                    	if(result){
                    		 window.open("/board/reviewReport?postcode="+ ${result.code}+"&boardKindCode=1003&reporterCode="+${user}+"&reporteeCode="+ ${result.memberCode},"", "width=500px, height=600px");
                    	}else{
                    		return false;
                    	}
                    })
                    
                    
                    
                    
                    // 댓글 작성 엔터키 기능 바꿈
                    $("#write_reply").on("keydown",function(e){
                    	if(e.key == "Enter" && e.shiftKey) {
                    		
                    	}
                    	else if(e.key == "Enter") {
                    		e.preventDefault();
                    		$("#replyWriteBtn").click();
                    	}
                    })
                    
                    // 댓글 작성하기 (클릭 혹은 엔터) 
                    $("#replyWriteBtn").on("click", function() {
                    	const write_text = $("#write_reply").text();
                    	$("#hidden_write_reply").val(write_text);
                    	if($("#hidden_write_reply").val().trim() == "") {
                    		alert("댓글을 입력해주세요.");
                    		return false;
                    	}
                    	if($("#hidden_write_reply").val().length >= 200) {
                    		alert("200자 미만으로 입력하세요.");
                    		$("#write_reply").html($("#hidden_write_reply").val().slice(0,198));
                    		return false;
                    	}
                  	
                    	let replycontent = $("#hidden_write_reply").val();
                    	
                    	
                    	$.ajax({
                            url: "/board/insertReviewReply",
                            type: "post",
                            dataType: "json",
                            data: {
                            	replyContent: replycontent,
                            	boardReviewCode: ${result.code},
                            	cpage: ${cpage}
                            }
                        }).done(function (resp) {
                        	  if (resp == 1) {
                        	        alert("작성되었습니다.");
                        	        location.href="/board/ReviewContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
                        	   
                        	    } else {
                        	        alert("작성에 실패했습니다.");
                        	        return false;
                        	    }
                        })
                    })
                    
                    

                    
                    // 댓글 수정버튼 클릭 시
                    let previousReply;
                    $(".replyModiBtn").on("click", function() {
                    	// 버튼변환
                    	$(this).hide();
                    	$(this).next().hide();
                    	$(this).next().next().fadeIn();
                    	$(this).next().next().next().fadeIn();
                    	
                    	// 수정버튼 클릭 하고 취소 했을 때 원래 댓글로 돌아가기 위해 기존 댓글 뽑아놓음.
                    	// 그리고 수정취소 누를 시 기존댓글 대입.
                    	previousReply = $(this).parent().prev().children().next().children().next().next().text();

	
                    	// 댓글 감싸고 있는 div 뽑아오기
                    	const replyDiv = $(this).parent().prev().children().next().children().next();

                    	replyDiv.attr("contenteditable", "true");
                    	replyDiv.css("border", "1px solid black");
                    	replyDiv.focus();

                    })
                    
                    
                   	// 댓글 수정 시  엔터키 기능을 수정완료버튼 click되게 함
                    $(".modiWriteReply").on("keydown",function(e){
                    	if(e.key == "Enter" && e.shiftKey) {
                    		
                    	}
                    	else if(e.key == "Enter") {
                    		e.preventDefault();
                    		$(this).parent().parent().next().children().next().next().click();
                    	}
                    })
                    

                    // 댓글수정 완료 (버튼클릭 혹은 엔터) 
                    $(".replyModiSuccessBtn").on("click", function() {
                    	const replyCode = $(this).parent().prev().children().next().children().next().html();
                    	const updateReply = $(this).parent().prev().children().next().children().next().next().text();
                    	const updateReplyDiv = $(this).parent().prev().children().next().children().next().next(); 
                    	

						
                    	if(updateReply.trim() == "") {
                    		alert("댓글을 입력해주세요.");
                    		return false;
                    	}
                    	if(updateReply.length >= 200) {
                    		alert("200자 미만으로 입력하세요.");
                    		updateReplyDiv.text(updateReply.slice(0,198));
                    		return false;
                    	}
                    	
                    	$.ajax({
                    		url : "/board/updateReviewReply",
                    		type : "post",
                    		dataType : "json",
                    		data : {
                    			code : replyCode,
                    			content : updateReply
                    		}
                    	}).done(function(resp) {
                    		if(resp == 1) {
                    			alert("수정되었습니다.");
                    	        location.href="/board/ReviewContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
                    		}
                    		else {
                    			alert("수정에 실패했습니다.");
                    		}
                    	})
                    
                 })
                 
                 // 수정취소 버튼 클릭 시
                 $(".replyModiCancleBtn").on("click", function() {
                 	const replyDiv = $(this).parent().prev().children().next().children().next();
                	replyDiv.attr("contenteditable", "false");
                	replyDiv.css("border", "none");
                	replyDiv.text(previousReply);
                	
                 	$(this).hide();
                 	$(this).prev().hide();
                 	$(this).prev().prev().fadeIn();
                 	$(this).prev().prev().prev().fadeIn();
                 })

                 
                 // 댓글에서 삭제버튼 클릭 시
                 $(".replyDeleteBtn").on("click", function() {
                	 if(confirm("정말로 삭제하시겠습니까?")) {
                		 const replyCode =  $(this).parent().prev().children().next().children().next().html();
                		 console.log(replyCode);
                		 $.ajax({
                			 url : "/board/deleteReviewReply",
                			 type : "post",
                     		 dataType : "json",
                     		 data : {
                     			code : replyCode
                     		 }
                		 }).done(function(resp) {
                			 if(resp == 1) {
	                			 alert("삭제되었습니다.");
	                			 location.href="/board/ReviewContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
                			 }
                			 else {
                				 alert("삭제에 실패하였습니다.");
                				 return false;
                			 }
                		})
                	 }
                	 else {
                		 return false;
                	 }
                 })
                 
                 
                 // 댓글 좋아요 버튼 클릭 시
                 $(".likeBtn").on("click", function() {
                	  var $button = $(this); // $(this)를 변수에 저장

                	  var replyCode = $button.parent().prev().children().next().children().next().next().html();

                	  $.ajax({
                	    url: "/board/upReviewReplyLikeCount",
                	    type: "post",
                	    dataType: "json",
                	    data: {
                	      code: replyCode
                	    }
                	  }).done(function(resp) {
                	    $button.children().html(resp.likeCount); // $button 변수를 사용하여 값을 변경
                	  });
                	});
                    
                    
                 // 댓글 신고하기 버튼 클릭 시
                 $(".replyReport").on("click",function() {
                	 replyCode = $(this).parent().prev().children().next().children().next().next().html();
                	 replyMemberCode = $(this).parent().prev().prev().prev().html();
            		 window.open("/board/reviewReport?postcode="+ ${result.code}+"&boardKindCode=1003&reporterCode="+${sessionScope.code}+"&reporteeCode="+ replyMemberCode +"&replyCode="+replyCode,"", "width=500px, height=600px");

                 })


                })
            </script>



        </body>

        </html>