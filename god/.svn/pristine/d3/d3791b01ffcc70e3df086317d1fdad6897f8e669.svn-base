<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="${rootPath}/resources/css/member/order_sheet.css">

<!-- daum 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function searchPost() {

	  new daum.Postcode({

	      oncomplete: function(data) {
	          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	          var fullAddr = ''; // 최종 주소 변수
	          var extraAddr = ''; // 조합형 주소 변수

	          // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	              fullAddr = data.roadAddress;

	          } else { // 사용자가 지번 주소를 선택했을 경우(J)
	              fullAddr = data.jibunAddress;
	          }

	          // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	          if(data.userSelectedType === 'R'){
	              //법정동명이 있을 경우 추가한다.
	              if(data.bname !== ''){
	                  extraAddr += data.bname;
	              }
	              // 건물명이 있을 경우 추가한다.
	              if(data.buildingName !== ''){
	                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	              }
	              // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	              fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	          }

	          // 3단계 : 해당 필드들에 정보 입력
	          // 우편번호와 주소 정보를 해당 필드에 넣는다.
	          document.getElementById('orderZip').value = data.zonecode; //5자리 새우편번호 사용
	          document.getElementById('orderAddr').value = fullAddr;
	      }

	  }).open();

	}; //
	
$(document).ready(function(){
	
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
    $('#orderAmount').val(tsum);
    
    // 총 상품 금액 포멧 적용
    $('#tot_product').text(psum.format());
    
});
</script>
</head>
<body>
    <div id="wrap">
    
    <div>
		<%-- cartList : <c:forEach items="${map.cartList}" var="demo">${demo}<br></c:forEach><br> --%>
		<%-- <b>CART_SESSION</b> : ${sessionScope.CART_SESSION}<br>
		<b>CART_SESSION 갯수</b> : ${sessionScope.CART_SESSION.size()}<br>	
		<b>CART_SESSION 상세</b> : <c:forEach items="${CART_SESSION}" var="cart">${cart}<br></c:forEach> --%>
		<%-- cartLength : ${map.cartList.size()}<br> --%>
		<%-- orderDate : ${map.cartList.get(0).cartDate} --%>	
	</div>
    
        <div id="title_wrap">
            <h2>ORDER SHEET</h2>
        </div>

        <form id="order" method="POST" action="${rootPath}/products/order_proc.do">
        
        	<!-- 배송상태 초기설정 -->
        	<input type="hidden" name="orderDelivery" value="배송준비중">
        	
        	<!-- cartId=313, memberId=admin_user, productId=62, cartQuan=1, cartDate=2020-02-21, cartListNum=1, 
        	productName=호랑이코트, productPrice2=10000, productThumImg=thumb_IMGP3305.png, cartColor=red, 
        	cartSize=95, productDeliveryFee=Y -->
        	
        	<!-- 주문정보 인자 설정 -->
        	<c:forEach items="${map.cartList}" var="cartInfo" varStatus="st">
        		<input type="hidden" name="cartId_${st.count}" value="${cartInfo.cartId}">
        		<input type="hidden" name="memberId_${st.count}" value="${cartInfo.memberId}">
        		<input type="hidden" name="productId_${st.count}" value="${cartInfo.productId}">
        		<input type="hidden" name="cartQuan_${st.count}" value="${cartInfo.cartQuan}">
        		<input type="hidden" name="cartDate_${st.count}" value="${cartInfo.cartDate}">
        		<input type="hidden" name="cartListNum_${st.count}" value="${cartInfo.cartListNum}">
        		<input type="hidden" name="productName_${st.count}" value="${cartInfo.productName}">
        		<input type="hidden" name="productPrice2_${st.count}" value="${cartInfo.productPrice2}">
        		<input type="hidden" name="productThumImg_${st.count}" value="${cartInfo.productThumImg}">
        		<input type="hidden" name="cartColor_${st.count}" value="${cartInfo.cartColor}">
        		<input type="hidden" name="cartSize_${st.count}" value="${cartInfo.cartSize}">
        		<input type="hidden" name="productDeliveryFee_${st.count}" value="${cartInfo.productDeliveryFee}">
        	</c:forEach>
        	
        	<!-- 멤버 아이디 -->
        	<input type="hidden" name="memberId" value="${pageContext.request.userPrincipal.name}">
        	
        	<!-- 날짜 -->
        	<input type="hidden" name="orderDate" value="${map.cartList.get(0).cartDate}">
        	
        	<!-- 카트 담긴 갯수 -->
        	<input type="hidden" name="cartLength" value="${map.cartList.size()}">
        	
            <div id="order_detali_wrap">

                <!-- 상품 구매 리스트 레이아웃 -->
                <div id="order_list_wrap">
                    <div class="order_delivery_title">
                        <h3 style="margin: 5px;">상품주문내역</h3>
                    </div>

                    <!-- 상품 구매리스트 박스 -->
                    <div id="order_list_box">
                        <!-- 상품 구매 리스트 테이블 -->
                        <table>
                            <caption style="display:none;">기본배송</caption>
                            <colgroup>
                                <col style="width:27px;">
                                <col style="width:240px;">
                                <col style="width:auto;">
                                <col style="width:120px;">
                                <col style="width:100px;">
                                <%-- <col style="width:98px;"> --%>
                                <col style="width:120px;">
                                <col style="width:150px;">
                            </colgroup>

                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox"
                                               class="prd_order_all_checkbox"
                                               name="order_all_checkbox">
                                    </th>
                                    <th>이미지</th>
                                    <th>상품정보</th>
                                    <th>판매가</th>
                                    <th>수량</th>
                                    <!-- <th>적립금</th> -->
                                    <th>배송비</th>
                                    <th>합계</th>
                                </tr>
                            </thead>
                            <tbody>
	                       		<c:forEach items="${map.cartList}" var="mapc" varStatus="status">
	                                <tr>
	                                    <td class="prd_detail_center">
	                                        <input type="checkbox"
	                                               class="prd_order_checkbox"
	                                               name="prd_order_checkbox">
	                                    </td>
	                                    <td class="prd_detail_center">
	                                        <a href="#">
	                                            <img src="${rootPath}/image/thumbnail/${mapc.productThumImg}"/>
	                                        </a>
	                                    </td>
	                                    <td class="prd_detail_left">
	                                    	<input type="hidden" name="cartId" value="${mapc.cartId}">
	                                        <a href="#">${mapc.productName}</a>
	                                        <div>${mapc.cartColor} / ${mapc.cartSize}</div>
	                                    </td>
	                                    <td class="prd_detail_center"><fmt:formatNumber pattern="###,###,###" value="${mapc.productPrice2}"/>원</td>
	                                    <td class="prd_detail_center">${mapc.cartQuan}</td>
	                                    <!-- <td class="prd_detail_center">220원</td> -->
	          							<c:choose>
											<c:when test="${mapc.productDeliveryFee == 'Y'}">
												<td class="prd_detail_center">
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
                        <!-- //상품 구매 리스트 테이블 -->
                    </div>
                    <!-- //상품 구매리스트 박스 -->

                    <!-- 상품리스트 삭제하기 및 이전페이지로 가는 버튼 -->
                    <div id="order_list_delete_back_wrap">
                        <span id="order_list_delete">선택상품을
                            <a href="#">X삭제하기</a>
                        </span>
                        <span id="order_list_back"><a href="#">이전페이지로</a></span>
                    </div>
                    <!-- //상품리스트 삭제하기 및 이전페이지로 가는 버튼 -->


                    <!-- 배송 정보 -->
                    <div class="order_delivery_title">
                        <h3 style="margin: 5px; display: inline;">배송 정보</h3>
                        <div style="float: right;s">*필수입력사항</div>
                    </div>

                    <div id="order_delivery_member_info">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width: 139px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>받으시는분*</th>
                                    <td>
                                        <input type="text"
                                               id="orderName"
                                               name="orderName"
                                               class="txt_input"
                                               required
                                               value="">
                                    </td>
                                </tr>

                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <input type="text"
                                               id="orderZip"
                                               name="orderZip"
                                               class="txt_input"
                                               pattern="\d{5}"
                                               maxlength="5"
                                               readonly
                                               value="">
                                        <a href="#" class="address" onClick="searchPost()">우편번호</a><br>
                                        <input type="text"
                                               id="orderAddr"
                                               name="orderAddr"
                                               class="txt_input"
                                               pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
                                               size="30"
                                               value="">기본주소<br>
                                        <input type="text"
                                               id="orderAddrDetail"
                                               name="orderAddrDetail"
                                               class="txt_input"
                                               pattern="[\w | \W | 가-힣 | / | -]{2,100}"
                                               size="30"
                                               value="">상세주소
                                    </td>
                                </tr>

                                <tr>
                                    <th>일반전화</th>
                                    <td>
										<input type="text"
											   id="orderPhone"
											   name="orderPhone" 
											   class="txt_input" 
											   maxlength="13"
											   pattern="0\d{1,2}-\d{3,4}-\d{4}"
											   size="15"
											   title=""
											   value="">
										ex) 02-1234-5678
                                    </td>
                                </tr>

                                <tr>
                                    <th>휴대전화*</th>
                            <td>
								<input type="text"
									   id="orderCellphone"
									   name="orderCellphone"  
									   class="txt_input"
									   maxlength="13"
									   pattern="01\d{1}-\d{3,4}-\d{4}"
									   required
									   size="15"
									   title=""
									   value="">
								ex) 010-1234-5678	   
							</td>
                                </tr>

                                <tr>
                                    <th>배송메시지</th>
                                    <th>
                                    	<input type="text"
											   id="orderMsg"
											   name="orderMsg"  
											   class="txt_input"
											   title=""
											   value="">
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 결제 예정 금액 -->
                    <div class="order_delivery_title">
                        <h3 style="margin: 5px;">결제 예정 금액</h3>
                    </div>

                    <!-- 총 결제 금액 테이블 -->
                    <div id="order_all_price">
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width: 33.3%">
                                <col style="width: 33.3%">
                                <col style="width: 33.3%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>총 주문 금액 <a href="#">내역보기</a></th>
                                    <th>총 배송비</th>
                                    <th>총 결제예정 금액</th>
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
                    </div>
                    <!-- //총 결제 금액 테이블 -->

                    <div class="order_delivery_title">
                        <h3 style="margin: 5px; display: inline-block;">결제수단</h3>
                        <input type="checkbox"
                               id="next_pay_use"
                               name="next_pay_use"> 지금 선택한 결제수단을 다음에도 사용
                    </div>

                    <!-- 결제 전체 레이아웃(결제수단) -->
                    <div id="pay_wrap">

                        <!-- 결제 수단 및 방식 레이아웃 -->
                        <div id="pay_ment">
                            <div id="pay_div">
                                <span>
                                    <input type="radio"
                                           id="pay_way1"
                                           class="pay_way"
                                           name=""
                                           checked="checked">
                                    <label for="">무통장 입금</label>
                                </span>
                                <span>
                                    <input type="radio"
                                           id="pay_way2"
                                           class="pay_way"
                                           name="pay_way">
                                    <label for="">카드 결제</label>
                                </span>
                                <span>
                                    <input type="radio"
                                           id="pay_way3"
                                           class="pay_way"
                                           name="pay_way">
                                    <label for="">휴대폰 결제</label>
                                </span>
                                <span>
                                    <input type="radio"
                                           id="pay_way4"
                                           class="pay_way"
                                           name="pay_way">
                                    <label for="">에스크로(실시간 계좌이체)</label>
                                </span>
                                <span>
                                    <input type="radio"
                                           id="pay_way5"
                                           class="pay_way"
                                           name="pay_way">
                                    <label for="">PAYCO(간편결제)</label>
                                </span>
                                <span>
                                    <input type="radio"
                                           id="pay_way6"
                                           class="pay_way"
                                           name="pay_way">
                                    <label for="">카카오 페이(간편결제)</label>
                                </span>
                            </div>

                            <!-- 결제 방식 박스 -->
                            <div id="pay_box">

                                <!-- 결제 방법 변경되는 레이아웃 -->
                                <div id="pay_system_way">
                                    <!-- 무통장 입금 -->
                                    <table id="deposit_way1" class="deposit_way1">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width: 130px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>입금자명</th>
                                                <td>
                                                    <input type="text"
                                                           id="member_pay1"
                                                           name="">
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>입금은행</th>
                                                <td>
                                                    <select id="select_pay1"
                                                            class=""
                                                            name="">
                                                        <option value="1">:::선택해 주세요:::</option>
                                                        <option value="2">우리은행:1002-788-940126(주)GOD</option>
                                                    </select><br>
                                                    <a href="#">은행사이트 바로가기</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- 무통장 하단 팁 -->
                                    <div class="deposit_way1">
                                        <p><span class="my_border">!</span>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
                                    </div>
                                    <!-- //무통장 입금 -->

                                    <!-- 카드 결제 -->
                                    <div id="deposit_way2" class="deposit_way2">
                                        <p><span class="my_border">!</span>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
                                        <p><span class="my_border">!</span>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                                    </div>
                                    <!-- //카드 결제 -->

                                    <!-- 휴대폰 결제 -->
                                    <div id="deposit_way3" class="deposit_way3">
                                        <p><span class="my_border">!</span>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                                    </div>
                                    <!-- //휴대폰 결제 -->

                                    <!-- 에스크로 결제 -->
                                    <table id="deposit_way4" class="deposit_way4">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width: 139px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>예금주명</th>
                                                <td>
                                                    <input type="text"
                                                           id="member_pay4"
                                                           name=""
                                                           size="15">
                                                </td>
                                            </tr>

                                            <tr>
                                                <th></th>
                                                <td>
                                                    <input type="checkbox"
                                                           name=""
                                                           value="">에스크로(구매안전)서비스를 적용합니다.
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div class="deposit_way4">
                                        <p><span class="my_border">!</span>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                                    </div>
                                    <!-- /에스크로 결제 -->

                                    <div id="deposit_way5" class="deposit_way5">
                                        <p><span class="my_border">!</span>페이코 결제 팝업창에서 비밀번호 입력만으로 빠르고 안전하게 결제가 가능한 서비스 입니다.</p>
                                        <p><span class="my_border">!</span>www.payco.com 에 회원가입 후, 최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.</p>
                                    </div>

                                    <div id="deposit_way6" class="deposit_way6">
                                        <p><span class="my_border">!</span>휴대폰에 설치된 카카오톡 앱에서 비밀번호 입력만으로 빠르고 안전하게 결제가 가능한 서비스 입니다.</p>
                                        <p><span class="my_border">!</span>안드로이드의 경우 구글 플레이, 아이폰의 경우 앱 스토어에서 카카오톡 앱을 설치 한 후,
                                                                            최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.</p>
                                        <p><span class="my_border">!</span>인터넷 익스플로러의 경우 8 이상에서만 결제 가능합니다.</p>
                                        <p><span class="my_border">!</span>BC카드 중 신한, 하나, 국민카드는 결제가 불가능합니다.</p>
                                    </div>
                                </div>
                                <!-- //결제 방식 박스 -->
                            </div>
                            <!-- //결제 방식 박스 -->
                        </div>
                        <!-- //결제 수단 및 방식 레이아웃 -->

                        <!-- 결제 금액 및 결제 버튼 박스 -->
                        <div id="pay_btn_box">
                            <h4>최종결제금액</h4>
                            <p>
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
                            </p>


                            <p style="font-size: 11px;">
                                <input type="checkbox"
                                      id="pay_admit_check"
                                      name="pay_admit_check">결제정보를 확인하였으며, 구매진행에 동의합니다.
                            </p>

                            <div id="pay_btn">
								<button type="submit"
										class="btn btn-dark btn-sm"
										style="margin-bottom: 5px;">결제하기</button>
                            </div>
						
							<c:choose>
								<c:when test="${map.cartSumPrice < 50000}">
									<input type="hidden"
										   id="orderAmount"
										   name="orderAmount"
										   value="">
								</c:when>
								<c:otherwise>
									<input type="hidden"
										   id=""
										   name="orderAmount"
										   value="${map.cartSumPrice}">
								</c:otherwise>
							</c:choose>
						
                            <!-- <div id="mileage_price_wrap">
                                <dl>
                                    <dt>총 적립예정금액</dt>
                                    <dd>220원</dd>
                                </dl>
                                <dl>
                                    <dt>· 상품별 적립금</dt>
                                    <dd>220원</dd>
                                    <dt>·  회원 적립금</dt>
                                    <dd>0원</dd>
                                    <dt>· 쿠폰 적립금</dt>
                                    <dd>0원</dd>
                                </dl>
                            </div> -->
                        </div>
                        <!-- //결제 금액 및 결제 버튼 박스 -->
                    </div>
                    <!-- //결제 전체 레이아웃(결제수단) -->

                    <div class="nointerset_use_info_box">
                        <h3>이용안내</h3>
                        <h4>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</h4>
                        <p><a href="#"><span class="my_border_box2">1</span>안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a></p>
                        <p><a href="#"><span class="my_border_box2">2</span>Service Pack 2에 대한 Microsoft사의 상세안내</a></p>
                        <h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
                        <p><span class="my_border_box2">1</span>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</p>
                        <p><span class="my_border_box2">2</span>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</p>
                        <p><span class="my_border_box2">3</span>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(무통장, 휴대폰결제 포함)</p>
                        <h4>세금계산서 발행 안내</h4>
                        <p><span class="my_border_box2">1</span>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</p>
                        <p><span class="my_border_box2">2</span>세금계산서는 사업자만 신청하실 수 있습니다.</p>
                        <p><span class="my_border_box2">3</span>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</p>
                        <p><span class="my_border_box2">4</span>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</p>
                        <p><span class="my_border_box2">5</span>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</p>
                        <h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h4>
                        <p><span class="my_border_box2">1</span>변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</p>
                        <p><span class="my_border_box2">2</span>신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</p>
                        <p><span class="my_border_box2">3</span>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</p>
                        <h4>현금영수증 이용안내</h4>
                        <p><span class="my_border_box2">1</span>현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</p>
                        <p><span class="my_border_box2">2</span>현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</p>
                        <p><span class="my_border_box2">3</span>발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</p>
                        <p><span class="my_border_box2">4</span>현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</p>
                        <p><span class="my_border_box2">5</span>현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</p>
                    </div>

                </div>
                <!-- //상품 구매 리스트 레이아웃 -->
            </div>
        </form>
    </div>
</body>
</html>