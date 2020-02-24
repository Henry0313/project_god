<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Cart</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/cart.css">

<script>

$(document).ready(function(){
	
	// 카트 리스트 체크박스
	// 전체선택 전체선택해제
    var flag = true;
	var checkbox = $('.cart_checkbox');
    
    $('#cart_all_checkbox').click(function(){
        if(flag){
            checkbox.prop({
                'checked': true
            });
            flag = false;
        }else{
            checkbox.prop({
                'checked': false
            });
            flag = true;
        }
    });
    
    // 카트 비우기
    $('#delete_all_cart_btn').click(function() {
    	
    	if (confirm('카트를 비우시겠습니까?')) {
    		location.href='${rootPath}/products/delete_all_cart.do';
    	}
    });
	
 	// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
    Number.prototype.format = function(){
        if(this==0) return 0;
     
        var reg = /(^[+-]?\d+)(\d{3})/;
        var n = (this + '');
     
        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
     
        return n;
    };
     
    // 문자열 타입에서 쓸 수 있도록 format() 함수 추가
    String.prototype.format = function(){
        var num = parseFloat(this);
        if( isNaN(num) ) return "0";
     
        return num.format();
    };
    
 	// 배송비 합계
    var dc = $('[id^=delivery_charge]').length;
    var dcsum = dc * 2500;
    $('.tot_delivery').text(dcsum.format());
    
 	// 총 상품 금액 + 총 배송비
 	var psum = $('#tot_product').text();
    var tsum = parseInt(dcsum) + parseInt(psum);
    
    $('.tot_price').text(tsum.format());
    
    // 총 상품 금액 포멧 적용
    $('#tot_product').text(psum.format());
});

</script>

</head>
<body>

<%-- <div>
	cartList : ${map.cartList}
</div> --%>

<div id="wrap">
	<c:if test="${not empty map.cartList}">
		<!-- 본문 시작 -->
		<div id="container">
	
			<!-- 제목 -->
			<div id="title">
				<strong>CART</strong>
			</div>
			
			<!-- 배송비 무료 이미지 -->
			<div style="width: 100%; margin-bottom: 50px; text-align: center;">
				<img src="${rootPath}/resources/css/member/images/dc.png" style="width: 400px;" />
			</div>
			
			<!-- 카트 리스트 -->
			<table>
				<colgroup>
					<col width="3%" />
					<col width="16%" />
					<col width="31%" />
					<col width="10%" />
					<col width="8%" />
					<col width="9%" />
					<col width="11%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<td><input type="checkbox" id="cart_all_checkbox" /></td>
						<td>상품 이미지</td>
						<td>상품 정보</td>
						<td>판매가</td>
						<td>수량</td>
						<td>배송비</td>
						<td>합계</td>
						<td>선택</td>
					</tr>
				<thead>
				<tbody>
					<c:forEach items="${map.cartList}" var="mapc" varStatus="status">
						<tr>
							<td><input type="checkbox" class="cart_checkbox" /></td>
							<td><img src="${rootPath}/image/thumbnail/${mapc.productThumImg}"/></td>
							<td style="text-align: left;">
								${mapc.productName}<br>${mapc.cartColor} / ${mapc.cartSize}
							</td>
							<td><fmt:formatNumber pattern="###,###,###" value="${mapc.productPrice2}"/>원</td>
							<td>
								<form method="post" action="${rootPath}/products/update_cart.do">
									<input type="hidden"
										   name="cartId"
										   value="${mapc.cartId}"/>
									<input type="number"
										   name="cartQuan"
										   value="${mapc.cartQuan}"
										   style="width: 50px; margin-bottom: 5px; text-align: center;" /><br>
									<button type="submit"
									   		class="btn btn-outline-secondary btn-sm">변경</button>
								</form>
							</td>
							
							<c:choose>
								<c:when test="${mapc.productDeliveryFee == 'Y'}">
									<td>
										<div id="delivery_charge${status.count}"
											 style="display: contents;">
											 <fmt:formatNumber pattern='###,###,###' value='2500'/>
										</div>원
									</td>		
								</c:when>
								<c:otherwise>
									<td>무료</td>
								</c:otherwise>
							</c:choose>
							
							<td><fmt:formatNumber pattern="###,###,###" value="${mapc.productPrice2 * mapc.cartQuan}"/>원</td>
							<td>
								<form method="get" action="${rootPath}/products/one_order.do">
									<input type="hidden" name="cartId" value="${mapc.cartId}" />
									<button type="submit"
											class="btn btn-dark btn-sm"
											style="margin-bottom: 5px;">주문하기</button><br>
								</form>
								<a type="button"
								   class="btn btn-outline-secondary btn-sm"
								   href="${rootPath}/products/delete_cart.do?cartId=${mapc.cartId}">삭제</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="9" style="height: 50px; text-align: right;">
							상품구매금액 &nbsp; 
							<fmt:formatNumber pattern="###,###,###" value="${map.cartSumPrice}"/>원
							&nbsp; + &nbsp; 배송비
							<c:choose>
								<c:when test="${map.cartSumPrice < 50000}">
									<div class="tot_delivery"
										 style="display: contents;">
									</div>원
								</c:when>
								<c:otherwise>
									무료
								</c:otherwise>
							</c:choose>
							&nbsp; = &nbsp; 합계 : 
							<c:choose>
								<c:when test="${map.cartSumPrice < 50000}">
									<div class="tot_price"
										 style="display: contents;
										 		font-weight: bold;
										 		font-size: 12pt;">
									</div>원
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; font-size: 12pt;">
										<fmt:formatNumber pattern="###,###,###" value="${map.cartSumPrice}"/>원
									</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
			
			<!-- 장바구니 비우기 버튼 -->
			<div style="margin: 30px 20px 60px 0; text-align: right;">
				<button type="button"
						id="delete_all_cart_btn"
						class="btn btn-outline-secondary btn-sm">장바구니 비우기</button>
			</div>
			
			<!-- 카트 리스트 요약 테이블 -->
			<table>
				<colgroup>
					<col width="33%"/>
					<col width="33%"/>
					<col width="33%"/>
				</colgroup>
				<thead>
					<tr>
						<td>총 상품 금액</td>
						<td>총 배송비</td>
						<!-- <td>총 할인금액</td> -->
						<td>결제 예정 금액</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div id="tot_product"
								 style="display: contents;">
								<fmt:parseNumber value="${map.cartSumPrice}"/>
							</div>원
						</td>
						<td>
							<c:choose>
								<c:when test="${map.cartSumPrice < 50000}">
									<div class="tot_delivery"
										 style="display: contents;">
									</div>원
								</c:when>
								<c:otherwise>
									무료
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${map.cartSumPrice < 50000}">
									<div class="tot_price"
										 style="display: contents;">
									</div>원
								</c:when>
								<c:otherwise>
									<fmt:formatNumber pattern="###,###,###" value="${map.cartSumPrice}"/>원
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
			
			<!-- 상품 주문, 쇼핑 계속하기 버튼 -->
			<div style="margin: 30px 0;">
				<div style="width: 49%; float: left; text-align: right;">
					<button type="button"
							onclick="location.href='${rootPath}/products/order.do'"
							class="btn btn-dark btn-sm">전체상품주문</button>
				</div>
				<div style="width: 49%; float: right;">
					<button type="button"
							class="btn btn-outline-secondary btn-sm">선택상품주문</button>
					<button type="button"
							style="float: right;"
							class="btn btn-outline-secondary btn-sm">쇼핑계속하기</button>
				</div>
			</div>
		</div>
		<!-- //본문 끝 -->
	</c:if>
	<!-- 등록글 없을 경우 -->
	<c:if test="${map.cartSumPrice == 0}">

		<div id="not_cart">
			카트가 비었습니다.
		</div>

	</c:if>
</div>
</body>
</html>