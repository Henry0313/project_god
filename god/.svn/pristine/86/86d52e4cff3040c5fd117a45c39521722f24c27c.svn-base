<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="${rootPath}/resources/css/member/products.css">
<script>

$(document).ready(function() {


	//갤러리 이미지 롤오버 할 경우 돋보기 아이콘 투명도 조정 rollover
	$("div[id^=product_]").mousemove(function(e) {

		//console.log("mousemove");
		//console.log("id: "+ e.currentTarget.id);

		//console.log($("div[id^=product_] .list_img").siblings());

		//$("div[id^=product_]").parent().find("div.icon").css("opacity", "1.0");
		$("#"+e.currentTarget.id).find("div.icon").css("opacity", "1");


	});

	//갤러리 이미지 mouseout 경우 돋보기 아이콘 투명도 조정 mouseout
	$("div[id^=product_]").mouseout(function(e) {

		console.log("mouseout");
		//console.log($("div.product_list .list_img").parent().find("div.icon"));

		//$("div[id^=product_]").parent().find("div.icon").css("opacity", "0");


		$("#"+e.currentTarget.id).find("div.icon").css("opacity", "0");

	});


});

$(window).ready(function() {
    
});
</script>

</head>
<body>
<%-- <div>
	pageVO : ${pageVO} <br>
	cateProductList : ${cateProductList}<br>
	code : ${code}<br>
	rootPath : ${rootPath} <br>
	pageVO.page : ${pageVO.page} <br>
	pageVO.startPage : ${pageVO.startPage} <br>
	pageVO.endPage : ${pageVO.endPage} <br>
	pageVO.maxPage : ${pageVO.maxPage}
</div> --%>
<%-- <div>
	list : ${list}
</div> --%>

	<!-- 전체 레이아웃(임시) -->
	<div id="wrap">
		<!-- 카테고리 박스 -->
		<div id="box_wrap">
			<!-- 카테고리 타이틀 영역 -->
			<div id="category">
				<span>OUTER</span>
				<div style="padding: 12px;">
					<a href="#">#코트/트렌치코트</a>
					<a href="#">#자켓</a>
					<a href="#">#점퍼</a>
					<a href="#">#가디건</a>
					<a href="#">#집업</a>
					<a href="#">#조끼</a>
				</div>
			</div>
			<!-- //카테고리 타이틀 영역 -->

		</div>
		<!-- //카테고리 박스 -->

		<!-- main_best 전체 레이아웃 -->
		<div id="main_best">

			<h2 id="title_best"><span>BEST ITEM</span></h2>

			<!-- best 상품 전체 영역 -->
			<ul id="best_products">
				
				<%-- <c:forEach items="${list}" var="list">
					<!-- 상품 각 전체 영역 -->
					<li>
						<!-- 상품 각 영역-->
						<div id="product_best_list_1" style="width: 350px; height: 450px;">
							<div class="list_img">
								<a href="${rootPath}/products/product_detail.do?productId=${list.productId}"><img src="${rootPath}/resources/image/${list.productListImg}" style="width: 350px; height: 450px;"></a>
							</div>
	
							<!-- 돋보기 및 좋아요 이미지 전체 영역 -->
							<div class="icon">
	
								<!-- 이미지 각 영역-->
								<div class="expand_button">
									<span>
										<img src="${rootPath}/resources/css/member/images/icon_img.png" style="cursor:pointer">
									</span>
									<span></span>
									<div class="option"></div>
	
									<div class="like_button">
										<button type="button">
											<strong></strong>
										</button>
									</div>
								</div>
								<!-- //이미지 각 영역-->
							</div>
							<!-- //돋보기 및 좋아요 이미지 -->
						</div>
						<!-- //상품 각 영역-->
	
						<!-- 상품 정보 -->
						<div class="description_product">
							<strong class="name_description">
								<a href="#">
									<span class="title_description">
										<span>상품명</span>
										<!-- <span style="font-size:12pt; color:#222222;">상품명</span> -->
									</span>
	
									<span style="font-size:8pt; color:#222222;">${list.productName}</span>
								</a>
							</strong>
	
							<!-- 상품 색상 및 가격 세일 -->
							<ul class="info_product">
								<li>
									<strong><span>상품색상</span>:</strong>
									<div class="color_product">
										<span class="chips" style="background:red"></span>
										<span class="chips" style="background:brown"></span>
										<span class="chips" style="background:black"></span>
										<span class="chips" style="background:gray"></span>
									</div>
								</li>
	
								<li>
									<strong><span>판매가</span>:</strong>
									<span style="font-size:8pt; color:#222222;">${list.productPrice2}원</span>
								</li>
	
								<li>
									<strong><span>상품세일정보</span>:</strong>
									<span style="font-size:8pt; color:#222222; font-weight:bold; font-style:italic;"><b>season off 40%</b></span>
								</li>
							</ul>
							<!-- //상품 색상 및 가격 세일 -->
						</div>
						<!-- //상품 정보 -->
						<!-- ///////////////////////////// 상품 1/////////////////////////// -->
					</li>
					<!-- //상품 각 전체 영역 -->
				</c:forEach> --%>
				
			</ul>
			<!-- //best 상품 전체 영역 -->
		</div>
		<!-- //main_best 전체 레이아웃-->

		<!-- 상품 카테고리 별 상품들 영역 -->
		<div id="prd">
			<div id="prd_align" >
				<p id="prd_count">TOTAL<strong>&nbsp;${pageVO.cateProductListTotCount}&nbsp;</strong>PRODUCT</p>

				<ul id="prd_box_button">
					<li><a href="#">신상품</a></li>
					<li><a href="#">낮은가격</a></li>
					<li><a href="#">높은가격</a></li>
					<li><a href="#">인기상품</a></li>
					<li><a href="#">사용후기</a></li>
				</ul>
			</div>
			<!-- //상품 설명-->
			<div style="margin-bottom: 100px">
				<ul id="best_products">
					
					<c:if test="${not empty cateProductList && pageVO.cateProductListCount > 0}">
						
						<c:forEach var="list" items="${cateProductList}">
						<li>
							<!-- 상품 각 영역-->
							<div id="product_list_1" style="width: 350px; height: 450px;">
								<div class="list_img">
									<a href="${rootPath}/products/product_detail.do?productId=${list.productId}"><img src="${rootPath}/resources/image/${list.productListImg}" style="width: 350px; height: 450px;"></a>
								</div>
								<!-- 돋보기 및 좋아요 이미지 전체 영역 -->
								<div class="icon">
		
									<!-- 이미지 각 영역-->
									<div class="expand_button">
										<span>
											<img src="${rootPath}/resources/css/member/images/icon_img.png" style="cursor:pointer">
										</span>
										<span></span>
										<div class="option"></div>
		
										<div class="like_button">
											<button type="button">
												<strong></strong>
											</button>
										</div>
									</div>
									<!-- //이미지 각 영역-->
								</div>
								<!-- //돋보기 및 좋아요 이미지 -->
							</div>
							<!-- //상품 각 영역-->
		
							<!-- 상품 정보 -->
							<div class="description_product">
								<strong class="name_description">
									<a href="${rootPath}/products/product_detail.do?productId=${list.productId}">
										<span class="title_description">
											<span>상품명</span>
											<!-- <span style="font-size:12pt; color:#222222;">상품명</span> -->
										</span>
		
										<span style="font-size:9pt; color:#222222;">${list.productName}</span>
									</a>
								</strong>
		
								<!-- 상품 색상 및 가격 세일 -->
								<ul class="info_product">
									<li>
										<strong><span>상품색상</span>:</strong>
										<div class="color_product">
											<span class="chips" style="background:red"></span>
											<span class="chips" style="background:brown"></span>
											<span class="chips" style="background:black"></span>
											<span class="chips" style="background:gray"></span>
										</div>
									</li>
		
									<li>
										<strong><span>판매가</span>:</strong>
										<span style="font-size:9pt; color:#222222;">
											<b><fmt:formatNumber value="${list.productPrice2}" pattern="###,###,###" />원</b>
										</span>
									</li>
		
									<li>
										<strong><span>상품세일정보</span>:</strong>
										<span style="font-size:8pt; color:#222222; font-weight:bold; font-style:italic;"><b>season off 40%</b></span>
									</li>
								</ul>
								<!-- //상품 색상 및 가격 세일 -->
							</div>
							<!-- //상품 정보 -->
						</li>
						</c:forEach>
						
					</c:if>
					
				</ul>
				
			</div>
			<!-- //상품 설명 -->
		</div>
		<!-- //상품 카테고리별 상품들 영역 -->

		<!-- 페이징 시작 -->
		<!-- 페이징 모듈 외장화 -->
		<c:if test="${search_YN != 'search'}">
			<%@ include file="paging/products_paging.jspf" %>
		</c:if>
		<!-- 페이징 끝 -->
		
	</div>
	<!-- //전체 레이아웃(임시) -->
</body>
</html>
