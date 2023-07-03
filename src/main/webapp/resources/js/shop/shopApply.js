
// 공구 수정 완료 버튼 클릭시 유효성 검사
$(document).on("click", "#updateCompleteBtn", function(){
			
	let regexProductPrice = /^[0-9]+$/;
	let regexMin = /^[0-9]+$/;
			
	let productPrice = $("#productPrice").val();
	let min = $("#min").val();
			
	let resultProductPrice = regexProductPrice.exec(productPrice);
	let resultMin = regexMin.exec(min);
			
	if(!resultProductPrice){
		alert("상품가격 은 숫자로 입력해 주세요!");
		return false;
	}
			
	if(!resultMin){
		alert("최소 인원 은 숫자로 입력해 주세요!");
		return false;
	}
			
})
		
// 답글 달기 버튼 눌렀을 때
function viewInsertAnswer(code) {
		
	let row="";
	row += '<div id="replyAnswerInsert'+code+'">';
	row += '<div class="mb-3">';
	row += '<i class="bi bi-arrow-return-right" style="margin-left:3%;"></i>';
	row += '&nbsp;&nbsp;&nbsp;<label for="exampleFormControlTextarea1" class="form-label">판매자</label>';
	row += '<div class="reply" style="margin-left:5%;">';
	row += '<textarea class="selectReplyAnswer form-control" name="content" rows="3"></textarea>';
	row += '<div>';
	row += '<button id="writeAnswerBtn" class="writeAnswerBtn btn btn-success btn-sm">답글 등록</button>';
	row += '</div>';
	row += '</div>';
	row += '</div>';
	row += '</div>';
			
	$("#businessReplyAsk"+code).append(row);		
}
		
// 이용자 자신이 쓴 댓글 수정 버튼 눌렀을 때
function updateReplyAskClick(code){
	$("#replyAskContent"+code).removeAttr("readonly");
	$("#updateReplyAskBtn"+code).css("display", "none");
	$("#deleteReplyAskBtn"+code).css("display", "none");
			
	let updateReplyComplete = $("<button class='selectReplyBtn btn btn-success btn-sm'>");
	updateReplyComplete.text("수정 완료");
			
	let cancel = $("<button type='button' class='selectReplyBtn btn btn-success btn-sm'>");
	cancel.text("취소");
	cancel.on("click", function(){
		location.reload();
	})
			
	$("#replyAskBtns"+code).append(updateReplyComplete);
	$("#replyAskBtns"+code).append(cancel);
}
		
// 판매자 자신이 쓴 답글 수정 버튼 눌렀을 때
function updateReplyAnswerClick(code){
	$("#replyAnswerContent"+code).removeAttr("readonly");
	$("#updateReplyAnswerBtn"+code).css("display", "none");
	$("#deleteReplyAnswerBtn"+code).css("display", "none");
			
	let updateReplyComplete = $("<button class='selectReplyBtn btn btn-success btn-sm'>");
	updateReplyComplete.text("수정 완료");
			
	let cancel = $("<button type='button' class='selectReplyBtn btn btn-success btn-sm'>");
	cancel.text("취소");
	cancel.on("click", function(){
		location.reload();
	})
			
	$("#replyAnswerBtns"+code).append(updateReplyComplete);
	$("#replyAnswerBtns"+code).append(cancel);
}
		
// 공구샵 삭제 버튼 눌렀을 때 확인
function deleteShopConfirm(code){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="/shop/deleteShop?code="+code;
	}
	return false;
}
		
// 공구샵 댓글 삭제 버튼 눌렀을 때 확인
function deleteReplyAskConfirm(code, postCode){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="/shopReply/deleteReplyAsk?code="+code+"&postCode="+postCode;
	}
	return false;
}
		
// 공구샵 답글 삭제 버튼 눌렀을 때 확인
function deleteReplyAnswerConfirm(code, postCode){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="/shopReply/deleteReplyAnswer?code="+code+"&postCode="+postCode;
	}
	return false;
}
