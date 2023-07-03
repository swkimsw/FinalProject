// 유효성 검사
let regexProductPrice = /^[0-9]+$/;
let regexMin = /^[0-9]+$/;
			
$("#register").on("click", function(){
				
	let productPrice = $("#productPrice").val();
	let min = $("#min").val();
				
	let resultProductPrice = regexProductPrice.exec(productPrice);
	let resultMin = regexMin.exec(min);
				
	if(!resultProductPrice){
		alert("판매 가격 은 숫자로 입력해 주세요!");
		return false;
	}
				
	if(!resultMin){
		alert("최소 수량 은 숫자로 입력해 주세요!");
		return false;
	}
				
})

// 오늘 이전은 선택하지 못하도록 - 하루 뒤부터 선택 가능
let days = 1 * 24 * 60 * 60 * 1000;
		
var nowUtc = Date.now();
var timeOff = new Date().getTimezoneOffset()*60000;
var afterOneDay = new Date(nowUtc+days-timeOff).toISOString().substring(0,16);
		
$("#deadLineTemp").attr("min", afterOneDay);