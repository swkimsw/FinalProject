<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - Shop</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
	<!-- SheetJS CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!-- FileSaver saveAs CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<title>신청차 정보</title>
<style>

* {
	font-family: NanumSquareNeo;
	font-size:small;
}
</style>
</head>
<body>
			<div class="container-fluid px-0 mt-5 position-relative" style="width:1200px;">
				<span class="fs-2">신청자 목록</span>
				<button class="btn btn-success position-absolute end-0 top-0" onclick="exportExcel(${code})">
					<i class="bi bi-box-arrow-in-down"></i>&nbsp;Excel로 내보내기
				</button>
				<table class="table table-striped table-bordered" id="applicantList">
			 		<thead>
			 			<tr align="center">
			 				<th scope='col'>#</th>
			 				<th scope='col'>코드</th>
			 				<th scope='col'>신청일자</th>
			 				<th scope='col'>이름</th>
			 				<th scope='col'>아이디</th>
			 				<th scope='col'>전화번호</th>
			 				<th scope='col'>이메일</th>
			 				<th scope='col'>우편번호</th>
			 				<th scope='col'>도로명주소</th>
			 				<th scope='col'>상세주소</th>
			 				<th scope='col'>수량</th>
			 				<th scope='col'>총액</th>
			 			</tr>
			 		</thead>
			 		<tbody>
			 			<c:choose>
			 				<c:when test="${fn:length(list) > 0}">
					 			<c:forEach var="i" items="${list}" varStatus="status">
						 			<tr align="center">
						 				<th scope='row'>${status.count}</th>
						 				<td>${i.applyCode}</td>
						 				<td>${i.applyDateTemp}</td>
						 				<td>${i.name }</td>
						 				<td>${i.clientId }</td>
						 				<td>${i.phone }</td>
						 				<td>${i.email }</td>
						 				<td>${i.zipcode }</td>
						 				<td>${i.address1 }</td>
						 				<td>${i.address2 }</td>
						 				<td>${i.quantity }</td>
						 				<td>${i.quantity * i.productPrice }</td>
						 			</tr>
				 				</c:forEach>
				 			</c:when>
				 			<c:otherwise>
				 				<tr align="center">
				 					<th colspan='12'>신청자가 없습니다.</th>
				 				</tr>
				 			</c:otherwise>
			 			</c:choose>
			 		</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<button class="btn btn-success" onclick="window.close()">닫기</button>	
				</div>	 			
			</div>
			
			<script>
			//excel파일의 콘텐츠 유형은 octet-stream이므로 binary를 octet으로 변환해야함 -> ArrayBuffer과 Uint8Array와 같은 비트 연산을 사용
			function s2ab(s){
				let buf =  new ArrayBuffer(s.length);
				let view = new Uint8Array(buf);
				for(let i=0;i<s.length;i++) view[i] = s.charCodeAt(i) & 0xFF;
				return buf;
			}
			
			function exportExcel(a){
				let wb = XLSX.utils.book_new(); //book_new(): 빈 통합 문서 개체를 반환
				
															//데이터 가져올 html 테이블 id
				let newWorksheet =  XLSX.utils.table_to_sheet(document.getElementById("applicantList"));
															
															//sheet 제목
				XLSX.utils.book_append_sheet(wb, newWorksheet, "신청자 정보");
															
				let wbout = XLSX.write(wb, {bookType:'xlsx', type:'binary'});
				
				saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), "공구번호_"+ a +"_신청자.xlsx");
																				//파일명.xlsx
			}
			</script>

</body>
</html>
































