<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - Shop Apply</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">
<!-- footer css -->
<link href="${path}/resources/css/pageFooter.css" rel="stylesheet" type="text/css">
<!-- shopApply css -->
<link rel="stylesheet" href="${path}/resources/css/shop/shopApply.css">
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	<main>
	<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
		<form action="/shop/updateShop" method="post" enctype="multipart/form-data">
			<h2 class="mb-5" style="text-align:center;">공구 신청</h2>
			
			<div class="images" style="height:40%;">
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div id="carouselExampleIndicators" class="carousel slide mb-3" data-bs-ride="carousel">
  						<div class="carousel-inner" style="text-align:center">
  							<div class="carousel-item active">
  								<input type="hidden" name="sysname" value="${fileDTO[0].sysname}">
      							<img src="${fileDTO[0].path}${fileDTO[0].sysname}" class="carouselImg img-fluid" alt="...">
    						</div>
  							<c:forEach var="i" items="${fileDTO}" begin="1">
  								<div class="carousel-item">
  									<input type="hidden" name="sysname" value="${i.sysname}">
      								<img src="${i.path}${i.sysname}" class="carouselImg img-fluid" alt="...">
    							</div>
  							</c:forEach>
  						</div>
  						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    						<span class="visually-hidden">Previous</span>
  						</button>
  						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    						<span class="carousel-control-next-icon" aria-hidden="true"></span>
    						<span class="visually-hidden">Next</span>
  						</button>
					</div>
				</div>
			</div>
			
			<div class="output">
					<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
						<div class="input-group mb-3">
							<input type="hidden" id="code" name="code" value="${shopDTO.code}">
							<input type="hidden" id="memberCode" name="memberCode" value="${shopDTO.memberCode}">
							<input class="form-control form-control-lg" type="text" id="title" name="title" value="${shopDTO.title}" aria-label=".form-control-lg example" required readonly>
						</div>
					</div>
				
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span>
						<input type="text" class="form-control" id="productName" name="productName" value="${shopDTO.productName}" required readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">판매 가격</span>
						<input type="text" class="form-control" id="productPrice" name="productPrice" value="${shopDTO.productPrice}" required readonly>
						<span class="input-group-text">원</span>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">마감 기한</span>
						<input type="datetime-local" class="form-control" id="deadLineTemp" name="deadLineTemp" value="${shopDTO.deadLineTemp}" required readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">최소 수량</span>
						<input type="text" class="form-control" id="min" name="min" value="${shopDTO.min}" required readonly>
						<span class="input-group-text">개</span>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">개수</span>
						<c:choose>
							<c:when test="${sessionScope.authGradeCode == 1003}">
								<input type="text" class="form-control" placeholder="입력해 주세요" id="quantity" name="quantity" required>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" placeholder="입력해 주세요" id="quantity" name="quantity" readonly>
							</c:otherwise>
						</c:choose>
						<span class="input-group-text">개</span>
					</div>
				</div>
				<div id="imageSelect" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto; display:none;">
  					<label for="formFile" class="form-label">사진 선택</label>
						<div class="input-group mb-3">
  							<input class="form-control" type="file" id="files" name="files" multiple>
  						</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">추가 정보 입력</label>
 						 <textarea class="form-control" id="detail" name="detail" rows="5" readonly>${shopDTO.detail}</textarea>
					</div>
				</div>
			</div>
			
			<div class="footer">
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<table class="table table-bordered">
						<tr>
							<td>업체명</td>
							<td style="padding:0px;">
								<input type="text" class="memberInfo form-control shadow-none" value="${memberDTO.companyName}" readonly>
							</td>
						</tr>
						<tr>
							<td>업체 연락처</td>
							<td style="padding:0px;">
								<input type="text" class="memberInfo form-control shadow-none" value="${memberDTO.phone}" readonly>
							</td>
						</tr>
						<tr>
							<td>배송 업체</td>
							<td style="padding:0px;">
 								<input type="text" class="memberInfo form-control shadow-none" id="shippingCompany" name="shippingCompany" value="${memberDTO.shippingCompany}" required readonly>
							</td>
						</tr>
						<tr>
							<td>교환 및 반품 주소</td>
							<td style="padding:0px;">
								<input type="text" class="memberInfo form-control shadow-none" value="${memberDTO.zipcode} ${memberDTO.address1} ${memberDTO.address2}" readonly>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<c:choose>
				<c:when test="${sessionScope.authGradeCode == 1002 and sessionScope.id.equals(shopDTO.businessId) or sessionScope.authGradeCode == 1001}">
					<!-- 등록한 판매자 & 관리자 -->
					<div class="col-xl-12 col-md-12 col-xs-12 text-center">
						<div class="buttons">
							<input type="button" id="updateBtn" value="수정" class="btn btn-success">
							<input type="button" id="deleteBtn" value="삭제" class="btn btn-success" onclick="deleteShopConfirm(${shopDTO.code})">
							<a href="/shop/toShopList"><input type="button" id="back" value="취소" class="btn btn-success"></a>
						</div>
					</div>
				</c:when>
				<c:when test="${sessionScope.authGradeCode == 1003 and nowTime <= shopDTO.deadLine}">
					<!-- 이용자 -->
					<div class="col-xl-12 col-md-12 col-xs-12 text-center">
						<div class="buttons">
							<input type="button" id="insertRequestBtn" value="신청" class="btn btn-success">
							<a href="/shop/toShopList"><input type="button" value="취소" class="btn btn-success"></a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 등록하지 않은 판매자일 때 & 날짜 지난 공구 신청하려는 이용자 -->
					<div class="col-xl-12 col-md-12 col-xs-12 text-center">
						<div class="buttons">
							<a href="/shop/toShopList"><input type="button" id="back" value="뒤로 가기" class="btn btn-success"></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</form>
		<hr class="solidHr">
		<!-- 여기부터 댓글 -->
		<!-- 댓글 등록 -->
		<c:choose>
			<c:when test="${sessionScope.authGradeCode == 1003}">
				<!-- 이용자인 경우 -->
				<form action="/shopReply/insertReplyAsk" method="post">
					<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
						<div class="mb-3">
							<input type="hidden" id="postCode" name="postCode" value="${shopDTO.code}">
							<input type="hidden" id="memberCode" name="memberCode" value="${sessionScope.code}">
  							<label for="exampleFormControlTextarea1" class="form-label">작성자 : ${sessionScope.nickname}</label>
							<div class="reply">
 						 		<textarea class="form-control" id="insertReply" name="content" rows="3"></textarea>
 								<div>
 						 			<button id="insertReplyBtn" class="btn btn-success btn-sm">등록</button>
 						 		</div>
							</div>
						</div>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<!-- 판매자인 경우 댓글 작성 못하도록 -->
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">작성자 : ${sessionScope.companyName}</label>
						<div class="reply">
 						 	<textarea class="form-control" id="insertReply" name="content" rows="3" readonly></textarea>
 							<div>
 						 		<button id="insertReplyBtn" class="btn btn-success btn-sm">등록</button>
 						 	</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		
		<hr class="dashedHr">
		<!-- 댓글 리스트 -->
		<c:forEach var="i" items="${shopReplyAskDTO}">
			<c:choose>
				<c:when test="${i.memberCode == sessionScope.code}">
					<form action="/shopReply/updateReplyAsk" method="post">
						<!-- 본인이 작성한 댓글인 경우 -->
						<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
							<div class="mb-3">
								<input type="hidden" name="code" value="${i.code}">
								<input type="hidden" id="postCode" name="postCode" value="${shopDTO.code}">
  								<label for="exampleFormControlTextarea1" class="form-label">작성자 : ${i.nickName}</label>
								<div class="reply">
 									<textarea id="replyAskContent${i.code}" class="selectReply form-control" name="content" rows="3" readonly>${i.content}</textarea>
 									<div id="replyAskBtns${i.code}" class="replyBtns">
 										<button type="button" id="updateReplyAskBtn${i.code}" class="selectReplyBtn btn btn-success btn-sm" onclick="updateReplyAskClick(${i.code})">수정</button>
 										<button type="button" id="deleteReplyAskBtn${i.code}" class="selectReplyBtn btn btn-success btn-sm"
 											onclick="deleteReplyAskConfirm(${i.code},${shopDTO.code})">삭제</button>
 									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 답글 -->
					<c:forEach var="j" items="${shopReplyAnswerDTO}">
						<c:if test="${j.askCode == i.code}">
							<div id="businessReplyAnswer${j.code}" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
								<div class="mb-3">
									<i class="bi bi-arrow-return-right" style="margin-left:3%;"></i>
									&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" class="form-label">판매자</label>
									<div class="reply" style="margin-left:5%;">
										<textarea class="form-control" name="content" rows="3" readonly>${j.content}</textarea>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${shopDTO.memberCode == sessionScope.code}">
					<form action="/shopReply/insertReplyAnswer" method="post">
						<!-- 판매자인 경우 -->
						<div id="businessReplyAsk${i.code}" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
							<div class="mb-3">
								<input type="hidden" id="postCode" name="postCode" value="${shopDTO.code}">
								<input type="hidden" name="askCode" value="${i.code}">
								<input type="hidden" id="memberCode" name="memberCode" value="${sessionScope.code}">
  								<label for="exampleFormControlTextarea1" class="form-label">작성자 : ${i.nickName}</label>
								<div class="reply">
 									<textarea class="selectReply form-control" rows="3" readonly>${i.content}</textarea>
 									<div>
 										<button type="button" class="toWriteAnswerBtn btn btn-success btn-sm" onclick="viewInsertAnswer(${i.code})">답글 달기</button>
 									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 답글 -->
					<c:forEach var="j" items="${shopReplyAnswerDTO}">
						<c:if test="${j.askCode == i.code}">
							<form action="/shopReply/updateReplyAnswer" method="post">
								<div id="businessReplyAnswer${j.code}" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
									<div class="mb-3">
										<input type="hidden" name="code" value="${j.code}">
										<input type="hidden" id="postCode" name="postCode" value="${shopDTO.code}">
										<i class="bi bi-arrow-return-right" style="margin-left:3%;"></i>
										&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" class="form-label">판매자</label>
										<div class="reply" style="margin-left:5%;">
											<textarea id="replyAnswerContent${j.code}" class="selectReplyAnswer form-control" name="content" rows="3" readonly>${j.content}</textarea>
											<div id="replyAnswerBtns${j.code}" class="replyBtns">
												<button type="button" id="updateReplyAnswerBtn${j.code}" class="selectReplyBtn btn btn-success btn-sm" onclick="updateReplyAnswerClick(${j.code})">답글 수정</button>
												<button type="button" id="deleteReplyAnswerBtn${j.code}" class="selectReplyBtn btn btn-success btn-sm" 
													onclick="deleteReplyAnswerConfirm(${j.code},${shopDTO.code})">답글 삭제</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${sessionScope.authGradeCode == 1001}">
					<form action="/shopReply/updateReplyAsk" method="post">
						<!-- 관리자인 경우 -->
						<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
							<div class="mb-3">
								<input type="hidden" name="code" value="${i.code}">
								<input type="hidden" id="postCode" name="postCode" value="${shopDTO.code}">
  								<label for="exampleFormControlTextarea1" class="form-label">작성자 : ${i.nickName}</label>
								<div class="reply">
 									<textarea id="replyAskContent${i.code}" class="selectReply form-control" name="content" rows="3" readonly>${i.content}</textarea>
 									<div id="replyAskBtns${i.code}" class="replyBtns">
 										<button type="button" id="updateReplyAskBtn${i.code}" class="selectReplyBtn btn btn-success btn-sm" onclick="updateReplyAskClick(${i.code})">수정</button>
 										<button type="button" id="deleteReplyAskBtn${i.code}" class="selectReplyBtn btn btn-success btn-sm"
 											onclick="deleteReplyAskConfirm(${i.code},${shopDTO.code})">삭제</button>
 									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 답글 -->
					<c:forEach var="j" items="${shopReplyAnswerDTO}">
						<c:if test="${j.askCode == i.code}">
							<form action="/shopReply/updateReplyAnswer" method="post">
								<div id="businessReplyAnswer${j.code}" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
									<div class="mb-3">
										<input type="hidden" name="code" value="${j.code}">
										<input type="hidden" id="postCode" name="postCode" value="${shopDTO.code}">
										<i class="bi bi-arrow-return-right" style="margin-left:3%;"></i>
										&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" class="form-label">판매자</label>
										<div class="reply" style="margin-left:5%;">
											<textarea id="replyAnswerContent${j.code}" class="selectReplyAnswer form-control" name="content" rows="3" readonly>${j.content}</textarea>
											<div id="replyAnswerBtns${j.code}" class="replyBtns">
												<button type="button" id="updateReplyAnswerBtn${j.code}" class="selectReplyBtn btn btn-success btn-sm" onclick="updateReplyAnswerClick(${j.code})">답글 수정</button>
												<button type="button" id="deleteReplyAnswerBtn${j.code}" class="selectReplyBtn btn btn-success btn-sm" 
													onclick="deleteReplyAnswerConfirm(${j.code},${shopDTO.code})">답글 삭제</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
						<div class="mb-3">
  							<label for="exampleFormControlTextarea1" class="form-label">작성자 : ${i.nickName}</label>
							<div class="reply">
 								<textarea class="form-control" rows="3" readonly>${i.content}</textarea>
 								<div>
 									<button type="button" class="toWriteAnswerBtn btn btn-success btn-sm" style="display:none;"></button>
 								</div>
							</div>
						</div>
					</div>
					<!-- 답글 -->
					<c:forEach var="j" items="${shopReplyAnswerDTO}">
						<c:if test="${j.askCode == i.code}">
							<div id="businessReplyAnswer${j.code}" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
								<div class="mb-3">
									<i class="bi bi-arrow-return-right" style="margin-left:3%;"></i>
									&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" class="form-label">판매자</label>
									<div class="reply" style="margin-left:5%;">
										<textarea class="form-control" name="content" rows="3" readonly>${j.content}</textarea>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<!-- 답글 -->
		</c:forEach>
	</div>
	</main>
	<script>
	// 공구 신청 버튼 클릭시
	$("#insertRequestBtn").on("click", function(){
		
		// 유효성 검사
		let regexQuantity = /^[0-9]+$/;
		
		let quantity = $("#quantity").val();
		let resultQuantity = regexQuantity.exec(quantity);
		if(!resultQuantity){
			alert("개수는 한글/영어 제외 숫자만 입력해 주세요!");
			return false;
		}
		
		let code = $("#code").val(); // 공구샵 코드
		let memberCode = ${sessionScope.code}; // 멤버 코드
		
		// 이미 공구 신청한 경우 더 이상 신청하지 못하도록
		$.ajax({
			url:"/shop/isExistRequest",
			type:"post",
			dataType:"json",
			data:{
				code:code,
				memberCode:memberCode
			}
		}).done(function(resp) {
			if(resp){
				alert("이미 신청한 공구입니다!");
				return false;
			}
			location.href="/shop/insertShopRequest?quantity="+quantity+"&parentCode="+code+"&memberCode="+memberCode;
		})
	})
	</script>
	<!-- shopApply js -->
	<script src="${path}/resources/js/shop/shopApply.js"></script>
	<c:import url="../commons/pageFooter.jsp"/>
</body>
</html>