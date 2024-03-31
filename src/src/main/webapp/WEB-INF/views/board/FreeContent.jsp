<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>CookCook - 자유게시판</title>
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
  			<link href="${path}/resources/css/pageFooter.css" rel="stylesheet" type="text/css">
	
	        <!-- FreeContent css -->
			<link rel="stylesheet" href="${path}/resources/css/board/FreeContent.css">
        </head>

        <body>
            <c:import url="../commons/gnb.jsp">
            </c:import>


            <c:choose>
                <c:when test="${user == result.memberCode}">
                    <div class="container ct">

                        <div class="row header m-4">
                            <h2>자유게시판</h2>
                            <br>
                        </div>


                        <div class="row body">

                            <table>
                                <c:choose>
                                    <c:when test="${result.memberAuthGradeCode == 1002 }">
                                        <tr>
                                            <td class="postMemberSort">
                                                사업자회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="postHeader">글번호 : ${result.code} | 작성자 : ${result.memberCompanyName} </td>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td class="postMemberSort">
                                                일반회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="postHeader">글번호 : ${result.code} | 작성자 : ${result.memberNickName} </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>


                                <c:choose>
                                    <c:when test="${result.headLineCode == 2001 }">
                                        <tr>
                                            <td class="postHeadline">
                                                카테고리 : <input id="headlinecode" type="text" value="일상" disabled>
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:when test="${result.headLineCode == 2002 }">
                                        <tr>
                                            <td class="postHeadline">
                                                카테고리 : <input id="headlinecode" type="text" value="정보" disabled>
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td class="postHeadline">
                                                카테고리 : <input id="headlinecode" type="text" value="질문" disabled>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

                                <tr>
                                    <td>
                                        <input id="code" type="text" value="${result.code}" style="display:none">
                                    </td>
                                </tr>


                                <tr>
                                    <td class="postTitle">제목 :
                                        <input class="title" id="title" type="text" value="${result.title}" disabled>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="postContent">
                                        <div class="content" id="content">${result.content}</div>
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                        <div id="button" class="button-container con">
                                            <button id="modi" class=" btn btn-outline-primary" type="button">수정</button>

                                            <button id="save" class=" btn btn-outline-primary" style="display:none"
                                                type="button">완료</button>

                                            <button id="cancel" class=" btn btn-outline-dark" style="display:none"
                                                type="button">취소</button>

                                            <button id="del" class="btn btn btn-outline-danger"
                                                type="button">삭제</button>

                                             <a href="/board/free?cpage=${cpage}">
                                            <button id="list" type="button" class="btn btn-outline-secondary">목록</button>
                                            </a>
                                            
                                        </div>
                                    </td>
                                </tr>
                            </table>



                        </div>

                </c:when>
                <c:otherwise>
                    <div class="container ct">

                        <div class="row header">
                            <h2>자유게시판</h2>
                            <br>
                        </div>

                        <div class="row body">
                            <table>


                                <c:choose>
                                    <c:when test="${result.memberAuthGradeCode == 1002 }">
                                        <tr>
                                            <td>
                                                사업자회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>글번호 : ${result.code} | 작성자 : ${result.memberCompanyName} </td>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td>
                                                일반회원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>글번호 : ${result.code} | 작성자 : ${result.memberNickName} </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>



                                <c:choose>
                                    <c:when test="${result.headLineCode == 2001 }">
                                        <tr>
                                            <td>
                                                카테고리 : 일상
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:when test="${result.headLineCode == 2002 }">
                                        <tr>
                                            <td>
                                                카테고리 : 정보
                                            </td>
                                        </tr>

                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td>
                                                카테고리 : 질문
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

								<tr>
                                    <td>
                                        <input id="code" type="text" value="${result.code}" style="display:none">
                                    </td>
                                </tr>


                                <tr>
                                    <td>제목 :
                                        ${result.title}
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
						                  
						
						                  	<button id="likecount" class=" btn btn-outline-primary" type="button"><i class="bi bi-hand-thumbs-up"></i>${result.likeCount }</button> 
						
						                    <a href="/board/free?cpage=${cpage}"> 
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

                            <div class="card" style="border:none;">

                                <div class="card-body" class="mt-5 ">

                                    <!-- Comment form-->
                                  
                                    <div contenteditable="true" id="write_reply" class="form-control mt-3" rows="3" placeholder="내용을 입력하세요(200자 미만)"></div>
                                    <input type="hidden" name="replyContent" id="hidden_write_reply">
                                    <input type="hidden" name="boardFreeCode" value="${result.code}">
                                    <input type="hidden" name="cpage" value="${cpage}">   
                                                               
                                    <button class="btn btn-primary btn-m mt-2" id="replyWriteBtn" style="float:right;">작성</button>
                                   
                                    <!-- Comment with nested comments-->

                                    <!-- Parent comment-->
                                    <c:forEach var="i" items="${replyList}">
                                    <div id="rep">
                                    <c:choose>
			                            <c:when test="${user == i.memberCode}">
			                            <div class="replyMemberCode">${i.memberCode}</div>
		                                    <hr style="margin-top: 60px;">
			                                    <div class="d-flex mt-5">
			                                        <div class="flex-shrink-0"><img class="rounded-circle" style="height:50px; width:50px; border:1px solid black;"
			                                                src="https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png" alt="...">
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
			                                        </div>
		
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

                                </div>

                            </div>
                        </td>
                    </tr>
                </table>


            </div>

    </div>
	<!-- footer -->
	<c:import url="../commons/pageFooter.jsp"/>	

            <script>


                // 수정버튼


                $(document).ready(function () {



                    $("#modi").on("click", function () {

                        $("#modi").css("display", "none"); // 수정버튼 안보이게

                        $('#content').summernote({
                            placeholder: '글을 입력해주세요 (최대 2000자까지 가능합니다)',
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
                                    checkContentLength();
                                }
                            }
                        });


                        // 수정 버튼 클릭 시 headline 입력란을 <select> 태그로 변경
                        var headline = $("#headlinecode");
                        var headlineValue = headline.val();  //headline값 없애주기

                        var headlineSelect = document.createElement('select');
                        headlineSelect.id = 'headlinecode';

                        var options = [
                            { value: '2001', text: '일상' },
                            { value: '2002', text: '정보' },
                            { value: '2003', text: '질문' }
                        ];

                        options.forEach(function (option) {
                            var newOption = document.createElement('option');
                            newOption.value = option.value;
                            newOption.text = option.text;
                            headlineSelect.appendChild(newOption);
                        });

                        headline.replaceWith(headlineSelect); //headlinecode


                        $("#title").removeAttr("disabled"); // 제목버튼-활성화/ 고칠수있게
                        $("#save").css("display", "inline"); // 완료버튼보이게
                        $("#cancel").css("display", "inline"); // 취소버튼보이게


                    });

                    
                    $("#cancel").on("click", function () {
                    	location.reload();
                    });


                    // 완료
                    $("#save").on("click", function () {
                        console.log("adgyusg")

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
                                alert("내용을 입력해주세요.");
                                return false;
                            }

                            var titleValue = $("#title").val();
                            var escapedValue = $("<div>").text(titleValue).html();
                            $("#title").val(escapedValue);
                            let title = $("#title").val();
                            let headlinecode = $("select[id=headlinecode] option:selected").val();
                            let code = $("#code").val();


                            $.ajax({
                                url: "/board/updateFree",
                                type: "post",
                                dataType: "json",
                                data: {
                                    title: title,
                                    content: content,
                                    code: code,
                                    headLineCode: headlinecode
                                }
                            }).done(function (resp) {
                            	console.log(resp)
                                if (resp) {
                                	
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
                    
                    $("#likecount").on("click", function () {
                    	
                    	let result = confirm("추천하시겠습니까?");
                    	
                    	if(result){
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
      						     	boardKindCode: "1002"
      						    },
      						  }).done(function (resp) {
      						      if (resp == 1) {
      						 	        alert("추천되었습니다");
                             	        location.href="/board/FreeContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
      						      } else {
      						        alert("다시 눌러주세요");
      						      }
      						    })
      						    .fail(function () {
      						      alert("요청 실패");
      						    });
                         	 
                    	}else{
                    		alert("취소되었습니다")
                    	}
                    	
                    	
                    	 
						});
                    
                    
                    $("#del").on("click",function(){
                    	let result = confirm("삭제하시겠습니까?")
                    
                    	if(result){
                    		alert("삭제되었습니다");
                    		location.href = "/board/deleteFree?code=" + ${result.code}+"&cpage="+${cpage};
                    	}else{
                    		return false;
                    	}
                    })
                    
                    
                    
                     $("#report").on("click",function(){
                    	let result = confirm("신고하겠습니까?")
                    
                    	if(result){
                    		 window.open("/board/freeReport?postcode="+ ${result.code}+"&boardKindCode=1002&reporterCode="+${user}+"&reporteeCode="+ ${result.memberCode}+"&authGradeCode="+${result.memberAuthGradeCode},"", "width=500px, height=600px");
                    	}else{
                    		return false;
                    	}
                    })
                    
                    // 댓글 작성하기 실행
/*                     $("#replyForm").on("submit", function() {
                    	const regex1 = $("#write_reply").html().replace(/&nbsp;/gi,' ');
						const regex2 = regex1.replace(/&lt;/gi,'<');
						const regex3 = regex2.replace(/&gt;/gi, '>');
						const write_reply = regex3.replace(/&amp;/gi,'&');
                    	$("#hidden_write_reply").val(write_reply);
                    	if($("#hidden_write_reply").val().trim() == "") {
                    		alert("댓글을 입력해주세요.");
                    		return false;
                    	}
                    	if($("#hidden_write_reply").val().length >= 200) {
                    		alert("200자 미만으로 입력하세요.");
                    		const cutReply = $("#hidden_write_reply").val().slice(0, 199);
                    		$("#write_reply").html(cutReply);
                    		return false;
                    	}
                    	$("#hidden_write_reply").val($("#write_reply").html());
                    }) */
                    
                    
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
                    	const write_text = $("#write_reply").html().replace(/&nbsp;/gi,' ');
						const write = write_text.replace(/&lt;/gi,'<');
						const wri = write.replace(/&gt;/gi, '>');
						const wr = wri.replace(/&amp;/gi,'&');
                    	$("#hidden_write_reply").val(wr);
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
                            url: "/board/insertFreeReply",
                            type: "post",
                            dataType: "json",
                            data: {
                            	replyContent: replycontent,
                            	boardFreeCode: ${result.code},
                            	cpage: ${cpage}
                            }
                        }).done(function (resp) {
                        	  if (resp == 1) {
                        	        alert("작성되었습니다.");
                        	        location.href="/board/FreeContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
                        	   
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
                    		url : "/board/updateFreeReply",
                    		type : "post",
                    		dataType : "json",
                    		data : {
                    			code : replyCode,
                    			content : updateReply
                    		}
                    	}).done(function(resp) {
                    		if(resp == 1) {
                    			alert("수정되었습니다.");
                    	        location.href="/board/FreeContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
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
                		 $.ajax({
                			 url : "/board/deleteFreeReply",
                			 type : "post",
                     		 dataType : "json",
                     		 data : {
                     			code : replyCode
                     		 }
                		 }).done(function(resp) {
                			 if(resp == 1) {
	                			 alert("삭제되었습니다.");
	                			 location.href="/board/FreeContent?code="+${result.code}+"&cpage="+${cpage}+"&viewchoose=false";
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
                	    url: "/board/upFreeReplyLikeCount",
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
            		 window.open("/board/freeReport?postcode="+ ${result.code}+"&boardKindCode=1002&reporterCode="+${sessionScope.code}+"&reporteeCode="+ replyMemberCode +"&replyCode="+replyCode+"&authGradeCode="+${result.memberAuthGradeCode},"", "width=500px, height=600px");
                 })
                 
                })

            </script>



        </body>

        </html>