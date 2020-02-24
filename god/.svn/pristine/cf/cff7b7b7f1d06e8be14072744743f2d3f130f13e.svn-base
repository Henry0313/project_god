<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 주문관리 상세</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_order_detail.css">
<c:set var="orderView" value="${orderVO}"/>
<script>
window.onload = function (e) {
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
	
	var sum1 = 0;
	for(var i=0; i<$("[id^=cart_quan_]").length; i++){
		var sum1 = $("td[id^=cart_quan_]:eq("+i+")").text();
		var sum2 = $("td[id^=prd_price_]:eq("+i+")").text();
		var sum3 = parseInt(sum1) * parseInt(sum2);
		$("td[id^=sum_price_]:eq("+i+")").text(comma(sum3)+"원");
	}
	 
};
</script>
</head>
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/order_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| 주문서 관리
		</header>
		<form id="deliveryUpdate" method="POST" action="${rootPath}/admin/admin_order_delivery.do">
		<!-- 주문서 관리 폼 -->
		<div id="heandle_area">
			<!-- 관리 폼 상단 -->
			<div id="heandle_top">
				<!-- 주문일 -->
				<div id="heandle_top_left">
					주문일 : ${orderVOs.get(0).orderDate}
				</div>
				
				<!-- 주문 고객 -->
				<div id="heandle_top_center">
					주문고객 : ${orderVOs.get(0).memberId}
				</div>
				<!-- 주문 번호 -->
				<div id="heandle_top_right">
					주문번호 : <input type="text" 
								    id="orderId"
								    name="orderId" 
								    value="${orderVOs.get(0).orderId}"/>
				</div>
			</div>
			<!-- //관리 폼 상단 끝 -->
			
			<!-- 관리 폼 중단 -->
			<div id="heandle_middle">
				<!-- 결제 상태 -->
				<div id="heandle_middle_left">
					<div style="width:30%; float:left">
						결제 상태
					</div>
					<div>
						<select id="select_box">
							<option value="입금 전">입금 전</option>
							<option value="결제 완료">결제 완료</option>
						</select>
					</div>
				</div>
				<!-- 주문 처리 상태 -->
				<div id="heandle_middle_center">
					주문 처리 상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="select_box" name="orderDelivery">
						<option value="현재 상태 ">${orderVOs.get(0).orderDelivery}</option>
						<option value="배송 준비 중">배송 준비 중</option>
						<option value="배송 중">배송 중</option>
						<option value="배송 완료">배송 완료</option>
					</select>
				</div>
				<!-- 교환 진행 버튼 -->
				<div id="heandle_middle_right">
					<button type="submit" 
							id="orderUpateBtn"
							class="btn btn-outline-secondary btn-sm" 
							style="width: 110px; font-size:13px;">배송 버튼</button>
				</div>
				<!-- 주문 취소하기 버튼 -->
				<div id="heandle_bottom_right">
					<button type="button" 
							onclick="" 
							class="btn btn-outline-secondary btn-sm" 
							style="width: 110px; font-size:13px;">주문 취소 하기</button>
				</div>
			</div>
			<!-- //관리 폼 중단 끝 -->
			
			
		</div>
		<!-- //주문서 관리 폼 끝 -->
		</form>
		
		<header style="padding-top:20px;">
				<b>| 주문 상품</b>
		</header>
		<!-- 주문 상품 -->
		<div id="order_info">
			
			<!-- 주문 상품 리스트 -->
    	    <table id="order_info_list">

    	        <tr class="list1">
    	            <td>번호</td>
    	            <td>이미지</td>
    	            <td>상품정보</td>
    	            <td>수량</td>
    	            <td>금액</td>
    	        </tr>
    	        
    	        <c:forEach items="${orderVOs}" var="orderView" varStatus="status">
    	        	<tr class="list2">
    	        		<td>${status.count}</td>
    	        		<td>
    	        			<a href="#">
    	        				<img src="${rootPath}/resources/image/thumbnail/${orderView.productThumImg}"/>
    	        			</a>
    	        		</td>
    	        		<td>
    	        			${orderView.productName}<br>
    	        			{옵션:
    	        			${orderView.cartColor}/
    	        			${orderView.cartSize}}
    	        		</td>
    	        		<td id="cart_quan_${status.count}">${orderView.cartQuan}</td>
    	        		<td id="prd_price_${status.count}" style="display:none;">${orderView.productPrice2}</td>
    	        		<td id="sum_price_${status.count}"></td>
    	        	</tr>
    	        </c:forEach>
    	        <tr>
    	        	<td></td><td></td><td></td><td></td>
    	        	<td id="sum_amount">총 :<fmt:formatNumber value="${orderVOs.get(0).orderAmount}" pattern="###,###,###" />원</td>
    	        </tr>
    	    </table>
    	    <!-- //주문상품 리스트 끝 -->
		
		</div>
		<!-- //주문 상품 끝 -->
		
		
		<header style="padding-top:20px;">
				<b>| 배송 정보</b><br>
		</header>
			
		<!-- 배송 정보 -->
		<div id="delivery_info">
		
			<!-- 주문자 정보 -->	
			<div id="delivery_info_wrap">
				<div style="padding: 10px 0 10px 30px; width:100%;">
					주문자 정보
				</div>
				
				<!-- 주문자명 -->
				<div class="order_fld">
					
					<div class="order_fld1">	
						이름
					</div>
					<div id="order_name" class="order_fld2">
						<input type="text"
							   id="orderName"
							   name="orderName"
							   class="form-control rounded-sm bg-light"
							   size="15"
							   readonly
							   style="font-size:10pt; width:300px "
							   placeholder="&nbsp;(주문자명)"
							   value="${orderVOs.get(0).memberName}"/>
					</div>
					
				</div>
				<!-- //주문자명 끝 -->
				
				<!-- 주문자명 휴대폰 번호 -->
				<div class="order_fld">
					
					<div class="order_fld1">	
						휴대폰 번호
					</div>
					<div id="order_phone" class="order_fld2">
						<input type="text"
							   id="orderPhone"
							   name="orderPhone"
							   class="form-control rounded-sm bg-light"
							   size="15"
							   readonly
							   style="font-size:10pt; width:300px "
							   placeholder="&nbsp;(주문자 휴대폰 번호)"
							   value="${orderVOs.get(0).memberCellphone}"/>
					</div>
					
				</div>
				<!-- //주문자명 휴대폰 번호 -->
				
			</div>
			<!-- //주문자 정보 끝 -->
			
			<!-- 수령자 정보 -->
			<div id="receipt_info_wrap" style="width:100%;">
				<div style="padding: 20px 0 10px 30px; width:100%;">
					수령자 정보
				</div>	
				<!-- 수령자명 -->
				<div class="order_fld">
					<div style="width:10%; float:left; height:50px;">
			
					</div>
					<div class="order_fld1">	
						이름
					</div>
					<div id="receipt_name" class="order_fld2">
						<input type="text"
							   id="receiptName"
							   name="receiptName"
							   class="form-control rounded-sm bg-light"
							   size="15"
							   readonly
							   style="font-size:10pt; width:300px "
							   placeholder="&nbsp;(받는분 성함)"
							   value="${orderVOs.get(0).orderName}"/>
					</div>
					<div style="width:10%; float:left; height:50px;">
			
					</div>
				</div>
				<!-- //수령자명 끝 -->
				
				<!-- 수령자 주소 -->
				<div class="receipt_fld">
					<div style="width:10%; float:left; height:120px;">
						
					</div>
					<div class="receipt_fld1">	
						주소
					</div>
					<div class="receipt_fld2" style="width:55%; height:120px;">
						<!-- 우편번호 검색 -->
						<div class="receipt_fld2_top">
							<div style="width:40%; height:100%; float:left;">
								<input type="text"
									   id="receiptName"
									   name="receiptName"
									   class="form-control rounded-sm bg-light"
									   size="15"
									   readonly
									   style="font-size:10pt; width:150px; "
									   placeholder="&nbsp;(우편번호)"
									   value="${orderVOs.get(0).orderZip}"/>
							</div>
							
						</div>
						<!-- //우편번호 검색 끝 -->
						
						<!-- 주소 -->				
						<div class="receipt_fld2_top">
							<div style="width:70%; height:100%; float:left;">
								<input type="text"
									   id="receiptName"
									   name="receiptName"
									   class="form-control rounded-sm bg-light"
									   size="15"
									   readonly
									   style="font-size:10pt; width:300px; "
									   placeholder="&nbsp;(주소)"
									   value="${orderVOs.get(0).orderAddr}"/>
							</div>
							<div style="width:30%; height:100%; float:left;">
								<input type="text"
									   id="receiptName"
									   name="receiptName"
									   class="form-control rounded-sm bg-light"
									   size="15"
									   readonly
									   style="font-size:10pt; width:180px; "
									   placeholder="&nbsp;(나머지 주소)"
									   value="${orderVOs.get(0).orderAddrDetail}"/>
							</div>
						</div>
					</div>
					<!-- //주소 끝 -->
					<div style="width:10%; float:left; height:120px;">
			
					</div>
				</div>
				<!-- //수령자 주소 끝 -->
					
				<!-- 수령자 휴대폰 번호 -->
				<div class="order_fld">
					<div style="width:10%; float:left; height:50px;">
			
					</div>
					<div class="order_fld1">	
						휴대폰 번호
					</div>
					<div id="order_phone" class="order_fld2">
						<input type="text"
							   id="orderPhone"
							   name="orderPhone"
							   class="form-control rounded-sm bg-light"
							   size="15"
							   readonly
							   style="font-size:10pt; width:300px "
							   placeholder="&nbsp;(주문자 휴대폰 번호)"
							   value="${orderVOs.get(0).orderCellphone}"/>
					</div>
					<div style="width:10%; float:left; height:50px;">
			
					</div>
				</div>
				<!-- //수령자 휴대폰 번호 -->
					
				<!-- 수령자 배송 요청사항 -->
				<div class="receipt_fld">
					<div style="width:10%; float:left; height:120px;">
						
					</div>
					<div class="receipt_fld1">	
						배송 요청사항
					</div>
					<div class="receipt_fld2" style="height:120px;">
						<!-- 배송 요청사항 표기 -->
						<div class="receipt_fld2_top" style="height:90px;">
							<div style="width:100%; height:70px; float:left;">
								<input type="text"
									   id="receiptName"
									   name="receiptName"
									   class="form-control rounded-sm bg-light"
									   size="15"
									   readonly
									   style="font-size:10pt; width:100%; height:100%"
									   placeholder="&nbsp;(배송 요청사항 표기)"
									   value="${orderVOs.get(0).orderMsg}"/>
							</div>
						</div>
						<!-- //배송 요청사항 표기 끝 -->
						<div style="width: 100%; height: 20px; text-align:right;">
							<span>0자 / 100자</span>
						</div>
					</div>

					<div style="width:10%; float:left; height:120px;">
			
					</div>
				</div>
				<!-- //수령자 배송 요청사항 끝 -->
				
			</div>
			<!-- //수령자 정보 끝 -->
		</div>
		<!-- //배송 정보 끝 -->

		<!-- <header style="padding-top:20px;">
				<b>| 결제 정보</b><br>
		</header>	
			
		결제 정보
		<div id="payment_info">
			
			<div style="width:100%;">
				<div class="info_title" style="width:50%;">
					결제 방법 및 금액
				</div>
				<div class="info_title" style="width:10%;">
				
				</div>
				<div class="info_title" style="width:40%;">
					결제 로그
				</div>
				
				결제 방법 및 금액
				<div style="float:left; width:50%; height:200px;">
					<div style="width:100%; height:40px;">
						<div class="info_detail_title" style="width:25%; border-top: 1px solid rgb(141,141,141);">
							상품가격
						</div>
						<div class="info_detail_content" style="width:75%; border-top: 1px solid rgb(141,141,141);">
							{상품가격 표기} 원
						</div>
						<div class="info_detail_title" style="width:25%;">
							포인트 사용
						</div>
						<div class="info_detail_content" style="width:75%;">
							{사용 포인트 표기} 원
						</div>
						<div class="info_detail_title" style="width:25%;">
							배송료
						</div>
						<div class="info_detail_content" style="width:75%;">
							{배송료 표기} 원
						</div>
						<div class="info_detail_title" style="width:25%;">
							총 결제 금액
						</div>
						<div class="info_detail_content" style="width:75%;">
							{합계금액 표기} 원
						</div>
						<div class="info_detail_title" style="width:25%;">
							결제 방법
						</div>
						<div class="info_detail_content" style="width:75%;">
							{신용카드, 계좌이체, 무통장입금(입금자명)}
						</div>
					</div>
				</div>
				//결제 방법 및 금액 끝
				
				<div style="float:left; width:10%; height:200px; ">
				
				</div>
				
				결제 로그
				<div id="payment_log">
					결제 요청 결과<br>결과 코드 : 0000(성공)<br>결과 내용 : 결제 성공<br>결제 방법 : 신용카드<br><br><br><br><br><br><br><br><br><br>	
				</div>	
				//결제 로그 끝
			</div>
			
		</div>
		//결제 정보 끝
		
		<header style="padding-top:20px;">
			<b>| 관리</b><br>
		</header>	
		
		관리 정보
		<div id="management_info">
			
			<div id="management_info_wrap" style="width:100%;">
				<div class="info_title" style="width:50%;">
					관리 이력
				</div>
				<div class="info_title" style="width:10%;">
				
				</div>
				<div class="info_title" style="width:40%;">
					상담 메모
				</div>
				
				<div style="float:left; width:50%; height:200px;">
					<div style="width:100%; height:200px;">
						<div id="management_detail">
							- {배송 요청사항 표기}<br>  
							- 2017.08.16 10: 10 35 : 주문<br>  
							- 2017.08.16 10: 10 35 : 결제완료로 수정<br>  
							- 2017.08.16 10: 10 35 : 배송 준비 중으로 수정<br>  
							- 2017.08.16 10: 10 35 : 배송 완료로 수정<br><br><br><br><br><br><br>
						</div>
					</div>
				</div>
				
				<div style="float:left; width:10%; height:200px;">
				
				</div>
				
				상담 메모
				<div id="management_memo">
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
				</div>	
				//상담 메모 끝
			</div>
			
		</div>
		//관리 정보 끝
		
		저장/취소 버튼
		<div style="width:100%; height:120px;">
			저장 버튼
			<div style="float:left; width:50%; height:120px; padding:30px 15px 0 0;">
				<button id=""
						type="button" 
						onclick="" 
						class="btn btn-outline-secondary btn-sm" 
						style="width: 100px; float:right; font-size:13px;">저장</button>
			</div>
			취소 버튼
			<div style="float:left; width:50%; height:120px; padding:30px 0 0 15px;">
				<button id=""
						type="button" 
						onclick="" 
						class="btn btn-outline-secondary btn-sm" 
						style="width: 100px; float:left; font-size:13px;">취소</button>
			</div>
		
		</div>
		//저장/취소 버튼 끝 -->
	
	</div>
	<!-- //우측 본문 끝 -->
	
</div>
</body>
</html>