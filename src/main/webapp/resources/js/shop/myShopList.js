// 일반회원 function

function clientSelect(){
	let status = $('select[name="clientCategory"]').val();
	$.ajax({
		url: "/shop/myShopListByStatus",
		type: "post",
		dataType : "json", 
		data : {status : status},
		error: function(){
			alert("서버 연결에 실패하였습니다.");
		}
	}).done(
		function(resp){
			appendClientDiv(resp);
	}		
)}
					
					
function appendClientDiv(resp){
		$(".applyList").empty();
		if(resp.length > 0){
			resp.forEach(function(i){
			div = "<div class='ms-5 mb-1'><span class='text ms-2'><b>" + i.applyDateTemp + " 신청 </b></span></div>";
			div += "<div class='card ml-3 mb-3 listCard'>";
			div += "<div class='row cardRow'>" ;
			div += "<div class='col col-md-5 col-lg-4 col-xl-3 cardImgBox'>";
			div += "<div class='cardImg'>";
			div += "<img src='" + i.path + i.sysName + "' class='img-fluid productImg' onclick='location.href='/shop/toShopApply?code=" 
					+ i.groupbuyingCode+ "''>";
			div += "</div></div>";	
			div += "<div class='col col-md-7 col-lg-7 col-xl-7 card-body cardText'>";
											
			if(i.statusCode == 1001){
				div += "<span class='badge rounded-pill text-bg-success position-absolute top-0 end-0 m-3 p-2'>" 
						+ i.statusValue + "</span>"
			}else if(i.statusCode == 1002){
				div += "<span class='badge rounded-pill text-bg-secondary position-absolute top-0 end-0 m-3 p-2'>" 
						+ i.statusValue + "</span>"
			}else if(i.statusCode == 1003){
				div += "<span class='badge rounded-pill text-bg-dark position-absolute top-0 end-0 m-3 p-2'>" 
						+ i.statusValue + "</span>"
			}
													
			div += "<p class='card-text mt-3'>" + i.productName + " | " + i.companyName + "</p>";
			div += "<h4 class='card-title'>" + i.title + "</h4>";
			div += "<p class='card-text'> 진행기간&nbsp;&nbsp;" + i.regDateTemp + " ~ " +  i.deadLineTemp + "</p>";
			div += "<p class='card-text'> 신청수량&nbsp;&nbsp;&nbsp;" + i.quantity + "&nbsp;&nbsp;|&nbsp;&nbsp;합계액&nbsp;&nbsp;&nbsp;&nbsp;" + (i.productPrice * i.quantity) + "원 </p>";
			div += "</div></div></div>";
			$(".applyList").append(div);
			
			})
			
		}else{
			div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936;margin-bottom: 700px;margin-top:100px;'><hr/><p class='fs-6'> <i class='bi bi-send-x'/> 신청하신 내역이 없습니다. </p><hr/></div>";
			$(".applyList").append(div);
		}
	}		





//사업자회원 function					
		
function statusBtn(a){
	$.ajax({
		url: "/shop/myShopListByStatus", 
		type: "post",
		dataType : "json",
		data : {status : a},
		error: function(){
			alert("서버 연결에 실패하였습니다.");
		}
	}).done(
		function(resp){
			appendBusinessDiv(resp);
		}
	)}


function appendBusinessDiv(resp){						
	$(".list-wrapper").empty();
	if(resp.length > 0){
		resp.forEach(function(i){
		div = "<div class='registBox py-2'>";
		if(i.statusCode == 1001){
			div += "<span class='badge rounded-pill text-bg-success ms-3 mb-2 p-2'>" 
					+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;진행</span>";
		}else if(i.statusCode == 1002){
			div += "<span class='badge rounded-pill text-bg-secondary ms-3 mb-2 p-2'>" 
					+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;종료</span>";
		}else if(i.statusCode == 1003){
			div += "<span class='badge rounded-pill text-bg-dark ms-3 mb-2 p-2'>" 
					+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;실패</span>";
		}
		div += "<div class='regist position-relative px-5 py-4 mb-4'>"
		div += "<h4><a class='toApply' href='/shop/toShopApply?code=" + i.groupbuyingCode + "'>" + i.title + "</a></h4>";
		div += "<span>" + i.productName + "&ensp;|&ensp;" + i.productPrice + "원 </span><br>";
		div += "<span>신청인수&emsp;" + i.applyCount + "&ensp;|&ensp;신청수량&emsp;" + i.applyQuantity + "&ensp;|&ensp;판매액&emsp;" + (i.productPrice * i.applyQuantity) + "원</span>";
		div += "<button class='infoBtn position-absolute p-3 mt-4 me-5 top-0 end-0' onclick='openInfo(" + i.groupbuyingCode + ")'>신청자<br>정보</button>";
		div += "<div class='progress' style='min-width:300px; max-width:600px; margin-top:10px;'>";
		div += "<div class='progress-bar progress-bar-striped bg-success' role='progressbar' style='width:" 
				+ (i.applyQuantity / i.min * 100) +"%;' aria-valuemin='0' aria-valuemax='100'>달성률&ensp;"
				+ (i.applyQuantity / i.min * 100) + "%</div></div></div></div>";
		$(".list-wrapper").append(div);
		})
	}else{
		$(".list-wrapper").append("<span><i class='bi bi-send-x-fill'></i>&ensp;등록 내역이 없습니다.</span>");
	}					
}					
											

function openInfo(a){
	window.open("/shop/buyingMemberInfoList?code="+a ,"list","width=1350, height=600,left=200, top=100, scrollbars=yes");
}