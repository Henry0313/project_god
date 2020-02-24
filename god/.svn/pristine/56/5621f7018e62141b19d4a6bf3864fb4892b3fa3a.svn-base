<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/product_detail.css">

<c:set var="color" value="${fn:split(dto.productColor, ',')}"/>

<c:set var="size" value="${fn:split(dto.productSize, ',')}"/>

<script>
$(document).ready(function(){
	
	var color_options = "";
	var size_options = "";
	var total = "";
	var quan = $("#now_productQuan").text();
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
	
	$("tbody#displaynoned").on("click", "[id^=price_count_]", function(e){
		var postfix = (e.currentTarget.id).substring('price_count_'.length, e.currentTarget.id.length);
		var hiddenId = 'hidden_price_'+postfix;
		var sumId = 'prd_sum_'+postfix;
		var sumhideId = 'price_hide_'+postfix;
		
		//기존 금액
		sum = $("#"+hiddenId).text();
		console.log("######기존가격:"+sum);
		
		//console.log("#######개수:"+$("#price_count_"+postfix).val());
		var sum1 = $("#price_count_"+postfix).val();
		//console.log("dddddd"+sum1);
		//sum = $("#price_count_"+postfix).val() * (sum);
		sum2 = parseInt(sum) * parseInt(sum1);
		
		// 최종합계
		var test = $("#"+sumId).text(comma(sum2));
		var test = $("#"+sumId).val(sum2);
		//var test1 = $("#"+sumhideId).text(sum2);
		
		// 총계 초기화
		total_sum = 0;
		//기존 금액 합산
		console.log("##########개수:"+$("span[id^=prd_sum_]").length);
		for(var i=0; i<$("span[id^=prd_sum_]").length; i++){
			total_sum += parseInt($("span[id^=prd_sum_]:eq("+i+")").text());
		}
		console.log("########total_sum:"+total_sum);
		
		//총계 반영
		$("#price_total em").text($("[id^=prd_sum_]").text());
		
		
		
		console.log("##########quan:"+quan);
		console.log("##########sum1:"+sum1);
		if(quan == sum1) {
			alert("죄송합니다. 재고가 없습니다");
		}
	});
	
	$("#product_color").on('change', function(){
		color_options = $("#product_color option:selected").val();
		console.log("?????????"+quan);
		if(color_options != "1") {
			if(quan == 0){
				$(".test_option").hide();
				alert("죄송합니다. 재고가 없습니다")
			}
			else {
				$(".test_option").show();
			}
		}
		else{
			$(".test_option").hide();
		}
		
		// 컬러 값 히든필드로 이동
		$('#cartColor').val(color_options);
		console.log($('#cartColor').val());
	});
	
	$("#product_size").on('change', function(e){
		//옵션 선택 후 가격집계
		size_options = $("#product_size option:selected").val();
		
		var product_options_id = color_options+"_"+size_options;
		var displaynoned_length = $("tbody#displaynoned tr").html();
		
		var add = 
		'<tr id="option_'+product_options_id+'" class="displaynone">'+
	  		'<td>${dto.productName}<br>'+color_options+'/'+size_options+'</td>'+
			'<td style="text-align: center;">'+
				'<input id="price_count_'+color_options+'_'+size_options+'" '+ 
					'name="cartQuan" type="number" style="width: 35px;" value="1" max="${dto.productQuan}" min="1">'+
			'</td>'+
			'<td style="text-align: right; width: 175px">'+ 
			'<span id="prd_sum_'+product_options_id+'" class="qwerqwer">'+
			'<fmt:formatNumber value="${dto.productPrice2}" pattern="###,###,###" />' +
			'</span>원'+
			'<span style="display:none" id="hidden_price_'+product_options_id+'">${(dto.productPrice2)}</span></td>'+
		'</tr>'
		var addhtml = $("tbody#displaynoned");
		// 행이 없을때 밀어 넣고
		if(size_options != 1){
			if($("tbody#displaynoned").find("tr").html() == undefined){
				addhtml.html(add);
				total = $("#price_total em").text();
			}
			else{
				//중복 여부
				var flag = false;
				
				for(var i=0; i<$("tbody#displaynoned tr").length; i++){
					
					//옵션 중복시 alert 오류메세지
					if(product_options_id == $("tbody#displaynoned tr:eq("+i+")").attr("id")){
						alert("이미 있는 상품입니다.");
						flag = true;
					}				
				}//for
				
				// 이미 있는상품이 아닐 시 생성
				if(flag == false) {
					$("tbody#displaynoned tr:last").after(add);
					
				}//if
			}//else 행이 생성됐을때 추가로 하는
			
			//기존 금액 합산
			console.log("##########개수2:"+$("span[id^=prd_sum_]").length);
			// 총계 초기화
			total_sum = 0;
			
			for(var i=0; i<$("span[id^=prd_sum_]").length; i++){
				
				//console.log("#######합계:"+$("span[id^=prd_sum_]:eq("+i+")").text());
				total_sum += parseInt($("span[id^=prd_sum_]:eq("+i+")").text());
			}
			//총계 반영
			$("#price_total em").text($("[id^=prd_sum_]").text());
		}
		
		// 사이즈 값 히든필드로 이동
		$('#cartSize').val(size_options);
		
		console.log($('#cartSize').val());
	});

});

$(window).ready(function() {
    
});

</script>
<body>
<%-- <form name="form1" method="POST" action="${rootPath}/products/addCart.do"> --%>
	<div>
	
		<!-- 상품 상세보기 전체 영역 -->
		<div id="content_wrap">
			<!-- 상품 상세보기 중앙정렬 -->
			<div id="content">
				<!-- 상품 이미지 및 옵선 선택 영역 -->
				<div id="content_img_opt_wrap">
					<!-- -->
					<div id="content_imgs_wrap">
						<div id="main_image">
							<a href="#"><img src="${rootPath}/resources/image/${dto.productImg}"></a>
						</div>

						<!-- 상품 이미지 하단 부분 후기 영역-->
						<div style="width: 100%; height: 128px;">

						</div>
						<!-- //상품 이미지 하단 부분 후기 영역-->
					</div>
					<!-- // -->

					<!-- 상품 가격 및 옵선 선택 전체 레이아웃 -->
					<div id="content_opt_wrap">
						<div id="content_title">
							<h2><b>${dto.productName}</b></h2>
							<p id="now_productQuan">${dto.productQuan}</p>
						</div>

						<!-- 상품 가격 및 세일정보-->
						<table id="detail_price">
							<tbody>
								<tr>
									<th><span>PRICE</span></th>
									<td>
										<span><fmt:formatNumber value="${dto.productPrice2}" pattern="###,###,###" /></span>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 상품 가격 및 세일정보-->

						<!-- 사이즈 및 컬러 옵션 선택 영역 -->
						<table id="detail_option">
							<tbody>
								<tr>
									<th><span>색상</span></th>
									<td>
										<select id="product_color">
											<option value="1">- [필수] 색상 선택 -</option>
											<option value="1">----------------</option>
											<c:forEach var="colorBox"
													   items="${color}">
												<option value="${colorBox}"><c:out value="${colorBox}" /></option>
											</c:forEach>
										</select>
									</td>
								</tr>

								<!-- 사이즈 있을시 -->
								<c:if test="${not empty size}">
								<tr>
									<th><span>사이즈</span></th>
									<td>
										<select id="product_size">
											<option value="1">- [필수] 사이즈 선택 -</option>
											<option value="1">----------------</option>
											<c:forEach var="sizeBox"
													   items="${size}">
												<option class="test_option" style="display: none" value="${sizeBox}"><c:out value="${sizeBox}"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<!-- //사이즈 있을시 -->
								</c:if>
							</tbody>
						</table>
						<!-- //사이즈 및 컬러 옵션 선택 영역 -->

						<div id="option_pick">
							<p>(최소주문수량 1개 이상)</p>
						</div>
						
						<form name="form1" method="post" action="${rootPath}/products/add_cart.do">
							<!-- 옵선 선택 후 가격 영역 -->
							<div id="hidden_price">
	
								<!-- 가격 및 옵선 선택 수량 -->
								<table id="price_total_wrap">
									<caption style="display: none;">상품 목록</caption>
									<tbody id="displaynoned">
										
									</tbody>
									
									<!-- 임시 -->
									<tbody id="option_check">
										<tr>
	
										</tr>
									</tbody>
									<!-- //임시 -->
	
									<!-- 토탈금액 표시 -->
									<tfoot>
										<tr>
											<td id="price_total" colspan="3">
												<strong>TOTAL</strong>:
												<span>
													<strong>
														<em>0</em>
													</strong>
												</span>
											</td>
										</tr>
									</tfoot>
									<!-- //토탈금액 표시 -->
	
								</table>
								<!-- //가격 및 옵선 선택 수량 -->
	
							</div>
							<!-- //옵선 선택 후 가격 영역 -->
	
							<!-- 구매하기 및 장바구니 등등 버튼 영역-->
							<div id="product_btn_wrap">
								<div id="prd_btns">
									<a href="${rootPath}/products/now_order.do"><span>구매하기</span></a>
									
									<!-- 상품 번호 -->
									<input type="hidden" name="productId" value="${dto.productId}" />
									
									<!-- 카트에 담는 색상 -->
									<input type="hidden" id="cartColor" name="cartColor" value="" />
									
									<!-- 카트에 담는 사이즈 -->
									<input type="hidden" id="cartSize" name="cartSize" value="" />
									
									<!-- 카트에 담기 -->
									<button type="submit" id="add_cart_btn">
										<span style="display:block; height:58px;">
											<img src="${rootPath}/resources/css/member/images/hamb_cart.png" style="width:30px; margin:13px 0;">
										</span>
									</button>
	 
									<sec:authorize access="isAnonymous()">
										<script>
											$("#add_cart_btn").click(function() {
										        alert("회원만 이용할 수 있습니다.");
										    });
										</script>
									</sec:authorize>
									
									<a href="#">
										<span style="display:block; height:58px;">
											<img src="${rootPath}/resources/css/member/images/hamb_heart.png" style="width:30px; margin:13px 0;">
										</span>
									</a>
								</div>
							</div>
							<!-- //구매하기 및 장바구니 등등 버튼 영역-->
						</form>

						<div id="product_plus_btn">
							<a href="#">플러스친구<b>+2,000원</b>쿠폰</a>
						</div>

					</div>
					<!-- //상품 가격 및 옵선 선택 전체 레이아웃 -->

				</div>
				<!-- //상품 이미지 및 옵션 선택 영역 -->

			</div>
			<!-- //상품 상세보기 중앙정렬 -->

			<!-- 상품 다른 이미지 및 리뷰 Q&A 레이아웃  -->
			<div id="prd_detail_wrap">
				<!-- 상품 다른 이미지 및 리뷰 Q&A 영역 -->
				<div class="prd_detail">
					<!-- 상품상세보기tab -->
					<div id="tab_det_wrap">
						<ul class="tab">
							<li class="on"><a href="#tab_det_wrap">상품상세보기</a></li>
							<li><a href="#tab_review_wrap">사용후기</a></li>
							<li><a href="#tab_qna_wrap">상품Q&A</a></li>
						</ul>
					</div>
					<!-- //상품상세보기tab -->

					<!-- 상품상세보기 이미지 및 정보들 레이아웃 -->
					<div id="detail_image_wrap">

						<!-- 상품상세보기 중앙정렬 -->
						<div style="padding:10px; text-align: center;">
							<div>
								${dto.productContent}
							</div>
							<h2 style="font-size: 16px;">
								<span>SIZE INFO</span>
							</h2>
							<img src="${rootPath}/resources/css/member/images/detail_sizeinfo_img.jpg">
							<p style="font-size: 9pt;">
								사이즈는 제품 측정 방법에 따라 1-3cm 정도의 오차가 발생할 수 있습니다.
								<br>
								평소 착용하는 옷의 실측 사이즈와 상세 사이즈를 비교 후 구매하시면 더욱 정확하게 확인할 수 있습니다. 단위(cm)
							</p>

							<!-- 테이블식 상품정보 설명 레이아웃 -->
							<div class="size_info_table_wrap">
								<div class="size_info_table_header">
									<div class="size_info_table_row">
										<div class="table_head">사이즈</div>
										<div class="table_head">총길이</div>
										<div class="table_head">어깨</div>
										<div class="table_head">가슴</div>
										<div class="table_head">팔길이</div>
										<div class="table_head">팔통</div>
									</div>
								</div>
								<div class="size_info_table_body"></div>
								<div class="size_info_table_row">
									<div class="table_cell">FREE</div>
									<div class="table_cell">80</div>
									<div class="table_cell">57</div>
									<div class="table_cell">64</div>
									<div class="table_cell">62</div>
									<div class="table_cell">25</div>
								</div>
							</div>
							<h2 style="font-size: 16px;">MATERIAL INFO</h2>
							<p style="font-size: 9pt;">
								주관적인 느낌이므로 개인차가 있을 수 있습니다.
								<br>
								화이트 / 아이보리 컬러는 약간의 비침이 있을 수 있습니다.
							</p>
							<div class="size_info_table_wrap">
								<div class="size_info_table_header">
									<div class="size_info_table_row">
										<div class="table_head">두께</div>
										<div class="table_head">신축성</div>
										<div class="table_head">비침</div>
										<div class="table_head">안감</div>
									</div>
								</div>
								<div class="size_info_table_body"></div>
								<div class="size_info_table_row">
									<div class="table_cell">보통</div>
									<div class="table_cell">없음</div>
									<div class="table_cell">없음</div>
									<div class="table_cell">없음</div>
								</div>
							</div>
							<h2 style="font-size: 16px;">PRODUCT INFO</h2>
							<div class="size_info_table_wrap">
								<div class="size_info_table_row">
									<div class="table_head">소재</div>
									<div class="table_cell">코트혼방</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">색상</div>
									<div class="table_cell">블랙,카멜,카키,크림</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">사이즈</div>
									<div class="table_cell">FREE</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">세탁방법</div>
									<div class="table_cell">손세탁 / 세탁기 / 그늘건조 / 드라이크리닝</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">제조사/제조국</div>
									<div class="table_cell">GetOutDoor은 소매 업체로 정확한 제조자명을 알 수 없습니다. / 제조 시기에 따라 다름</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">제조연월</div>
									<div class="table_cell">2020.1</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">품질보증기준</div>
									<div class="table_cell">공정거래위원회가 고시하는 소비자 분쟁 해결기준에 따라 보상가능합니다.</div>
								</div>

								<div class="size_info_table_row">
									<div class="table_head">A/S 책임자 및 담당자</div>
									<div class="table_cell">GetOutDoor / 02-0000-00000 또는 070-0000-0000</div>
								</div>
							</div>
							<!-- //테이블식 상품정보 설명 레이아웃 -->


							<!-- 세탁 정보 이미지 -->
							<div id="" style="padding: 70px 0;">
								<img src="washing_tip.jpg">
								<img src="model_info.jpg">
							</div>
							<!-- //세탁 정보 이미지 -->

							<div style="border-top: 1px solid black;">
								<div id="relation">
									<h2>RELATION PRODUCT</h2>

									<!-- 다른상품 추천 이미지 영역 -->
									<div style="display: flex; justify-content: center; align-items: center; ">
										<div id="relation_imgs1">
											<a href="#">
												<img src="relation_img.jpg">
												<p class="txt">
													<span>마인츠</span>
													<span>42,000원</span>
												</p>
											</a>
										</div>

										<div id="relation_imgs2">
											<a href="#">
												<img src="relation_img.jpg">
												<p class="txt">
													<span>마인츠</span>
													<span>42,000원</span>
												</p>
											</a>
										</div>

										<div id="relation_imgs3">
											<a href="#">
												<img src="relation_img.jpg">
												<p class="txt">
													<span>마인츠</span>
													<span>42,000원</span>
												</p>
											</a>
										</div>

										<div id="relation_imgs4">
											<a href="#">
												<img src="relation_img.jpg">
												<p class="txt">
													<span>마인츠</span>
													<span>42,000원</span>
												</p>
											</a>
										</div>
									</div>
									<!-- //다른상품 추천 이미지 영역 -->

									<div style="position: absolute; top: 50%; margin-left: -40px;">&#10094;</div>
									<div style="position: absolute; top: 50%; right: 0; margin-right: -40px;">&#10095;</div>
								</div>
							</div>
						</div>
						<!-- //상품상세보기 중앙정렬 -->
					</div>
					<!-- //상품상세보기 이미지 및 정보들 레이아웃 -->
				</div>
				<!-- //상품 다른 이미지 및 리뷰 Q&A 영역 -->

				<!-- 사용후기tab -->
				<div class="prd_detail">

					<div id="tab_review_wrap">
						<ul class="tab">
							<li><a href="#tab_det_wrap">상품상세보기</a></li>
							<li class="on"><a href="#tab_review_wrap">사용후기</a></li>
							<li><a href="#tab_qna_wrap">상품Q&A</a></li>
						</ul>
					</div>

					<!-- 리뷰 전체 레이아웃 -->
					<!-- **********리뷰 상단 리뷰는 5개까지********* -->
					<div id="review_content_wrap">

						<!-- 리뷰1 레이아웃 -->
						<div id="review_conte_img1">
							<img src="171118_ja_01_image.jpg">
							<div class="review_content_text_wrap">
								<div>
									<span>NAME 윤***</span>
									<span>블랙(★)당일출고</span>
								</div>
								<div>
									<span>★★★★★ 최고</span>
								</div>
								<div class="review_content_text">
									최고예요!
								</div>
							</div>
						</div>
						<!-- // 리뷰1 레이아웃 -->

						<!-- 리뷰2 레이아웃 -->
						<div id="review_conte_img2">
							<img src="171118_ja_01_image.jpg">
							<div class="review_content_text_wrap">
								<div>
									<span>NAME 윤***</span>
									<span>블랙(★)당일출고</span>
								</div>
								<div>
									<span>★★★★★ 최고</span>
								</div>
								<div class="review_content_text">
									최고예요!
								</div>
							</div>
						</div>
						<!-- // 리뷰2 레이아웃 -->

						<!-- 리뷰3 레이아웃 -->
						<div id="review_conte_img3">
							<img src="171118_ja_01_image.jpg">
							<div class="review_content_text_wrap">
								<div>
									<span>NAME 윤***</span>
									<span>블랙(★)당일출고</span>
								</div>
								<div>
									<span>★★★★★ 최고</span>
								</div>
								<div class="review_content_text">
									최고예요!
								</div>
							</div>
						</div>
						<!-- // 리뷰3 레이아웃 -->

						<!-- 리뷰4 레이아웃 -->
						<div id="review_conte_img4">
							<img src="171118_ja_01_image.jpg">
							<div class="review_content_text_wrap">
								<div>
									<span>NAME 윤***</span>
									<span>블랙(★)당일출고</span>
								</div>
								<div>
									<span>★★★★★ 최고</span>
								</div>
								<div class="review_content_text">
									최고예요!
								</div>
							</div>
						</div>
						<!-- // 리뷰4 레이아웃 -->

						<!-- 리뷰5 레이아웃 -->
						<div id="review_conte_img5">
							<img src="171118_ja_01_image.jpg">
							<div class="review_content_text_wrap">
								<div>
									<span>NAME 윤***</span>
									<span>블랙(★)당일출고</span>
								</div>
								<div>
									<span>★★★★★ 최고</span>
								</div>
								<div class="review_content_text">
									최고예요!
								</div>
							</div>
						</div>
						<!-- //리뷰5 레이아웃 -->

					</div>
					<!-- //리뷰 전체 레이아웃 -->


					<div style="padding: 15px; display:flex; justify-content:center;">
						리뷰 후기 임시 영역 확보
					</div>

				</div>
				<!-- //시용후기tab -->

				<!-- 상품Q&A tab -->
				<div class="prd_detail">

					<div id="tab_qna_wrap">
						<ul class="tab">
							<li><a href="#tab_det_wrap">상품상세보기</a></li>
							<li><a href="#tab_review_wrap">사용후기</a></li>
							<li class="on"><a href="#tab_qna_wrap">상품Q&A</a></li>
						</ul>
					</div>
					<div>
						<h3 style="font-size: 21pt; text-align: center;"><span>PRODUCT Q&A</span></h3>
					</div>
					<div id="prd_qna_wrap">
						<table>
							<colgroup style="width: 1200px;">
								<col style="width:70px;">
								<col style="width:auto;">
								<col style="width:175px;">
								<col style="width:135px;">
							</colgroup>
							<thead style="background: white;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>10</td>
									<td><a href="#">GetOutDoor 상품문의</a></td>
									<td>전***</td>
									<td>2020-01-29</td>
								</tr>
								<tr>
									<td>9</td>
									<td><a href="#">감사합니다. 문의에 대한 답변입니다.</a></td>
									<td>GetOutDoor</td>
									<td>2020-01-29</td>
								</tr>
							</tbody>
						</table>
					</div>

					<p id="qna_btn">
						<a href="#" id="qna_all_view_btn">전체보기</a>
						<a href="#" id="qna_inquiry_btn">문의하기</a>
					</p>
				</div>
				<!-- //상품Q&Atab -->

			</div>
			<!-- //상품 다른 이미지 및 리뷰 Q&A 레이아웃 -->

		</div>
		<!-- //상품 상세보기 전체 영역 -->

	</div>
	<!-- -->
<!-- </form> -->
</body>
</head>