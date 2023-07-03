//검색 결과 리스트 ajax
		function getSearchList() {
			let category = $('select[name="category"]').val();
			let keyword = $("#keyword").val();

			if (keyword.trim() != "") {
				$.ajax({
							url : "/shop/searchByKeyword",
							type : "post",
							dataType : "json",
							data : {
								category : category,
								keyword : keyword
							},
							error : function() {
								alert("검색에 실패하였습니다");
							}
						})
						.done(
								function(resp) {
									$(".body> .col> .list").empty();
									//$(".subNav").empty();
									if (resp.length > 0) {
										div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-search'/>"
												+ "   '"
												+ keyword
												+ "'의 검색결과는 "
												+ resp.length
												+ "개 입니다.</p><hr/></div>";
										$(".list").append(div);
											resp.forEach(function(i) {
													card = "<div class='col-xl-4 col-sm-12 col-md-6 p-3 mb-2 contents'><div class='card border-0'>";
													if (i.dDay > 0 && i.statusCode == 1001) {
														card += "<span class='badge deadLine rounded-pill text-bg-primary position-absolute top-0 end-0 m-2 p-2'>"
																+ i.dDay
																+ "일 남음</span>";
													}
													if (i.dDay == 0 && i.statusCode == 1001) {
														card += "<span class='badge deadLine rounded-pill text-bg-danger position-absolute top-0 end-0 m-2 p-2'>오늘 종료</span>";
													}
													if (i.dDay < 0 && i.statusCode == 1002) {
														card += "<span class='badge deadLine rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2'>공구 완료</span>";
													}
													if (i.dDay < 0 && i.statusCode == 1003) {
														card += "<span class='badge deadLine rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2'>공구 실패</span>";
													}
													card += "<div class='card-image'><a href='/shop/SelectShop?code = "
															+ i.code + "'>";
													card += "<img src='"
															+ i.path
															+ i.sysName
															+ "' style='width: 100%;'> </a> </div> <div class='card-body'>";
													card += "<p class='card-title' style='font-size: 20px;'>"
															+ i.title + "</p> ";
													card += "<p class='card-text fw-lighter' style='font-size: 12px;'>"
															+ i.productName
															+ " | "
															+ i.companyName
															+ "</p> </div> </div> </div>";
													$(".list").append(card);
												})

										keyword = "";

									} else {
										div = "<div class='col-xxl-12 pt-5 pb-1 text-center' style='color:#007936;margin-bottom:400px;'><hr/><p class='fs-6'> <i class='bi bi-search'/>"
												+ "   '"
												+ keyword
												+ "'의 검색결과가 없습니다.</p><hr/></div>";
										$(".list").append(div);
									}
									$("#keyword").val("");
								}).fail(function() {
							alert("검색에 실패하였습니다.");
						})

			} else {
				alert("검색어를 입력해주세요.");
			}

		}