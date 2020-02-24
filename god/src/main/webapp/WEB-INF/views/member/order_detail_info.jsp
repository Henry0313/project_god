<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="${rootPath}/resources/css/member/order_detail_info.css">

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
        <div id="title_wrap">
            <h2>주문상세조회</h2>
        </div>
        <!-- 주문 정보 테이블 전체 레이아웃 -->
        <div>
            <div>
                <h3 style="margin: 5px;">주문 정보</h3>
            </div>
            <!-- 주문 정보 테이블 레이아웃  -->
            <div id="order_member_info">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 160px;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>주문번호</th>
                            <td>${orderVOs.get(0).orderId}</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>${orderVOs.get(0).orderDate}</td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td>${orderVOs.get(0).orderName}</td>
                        </tr>
                        <tr>
                            <th>주문처리상태</th>
                            <td>${orderVOs.get(0).orderDelivery}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //주문 정보 테이블 레이아웃  -->
        </div>
        <!-- //주문 정보 테이블 전체 레이아웃  -->

        <!-- 결제 정보 테이블 레이아웃 -->
        <div>
            <div>
                <h3 style="margin: 5px;">결제 정보</h3>
            </div>
            <!-- 결제 정보 테이블 레이아웃  -->
            <div id="pay_member_info">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 160px;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>총 주문금액</th>
                            <td><fmt:formatNumber value="${orderVOs.get(0).orderAmount}" pattern="###,###,###"/>원</td>
                        </tr>
                        <tr>
                            <th>총 결제금액</th>
                            <td><fmt:formatNumber value="${orderVOs.get(0).orderAmount}" pattern="###,###,###"/>원</td>
                        </tr>
                        <tr>
                            <th>결제수단</th>
                            <td>무통장<br>
								입금자:${orderVOs.get(0).orderName}, 계좌번호:우리은행 1234-12-213333 ((주)GOD)
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <!-- //결제 정보 테이블 레이아웃  -->
        </div>
        <!-- //결제 정보 테이블 레이아웃  -->

        <div id="order_detali_wrap">
            <div>
                <h3 style="margin: 5px;">주문 상품 정보</h3>
            </div>

            <!-- 상품 구매리스트 박스 -->
            <div id="order_list_box">
                <!-- 상품 구매 리스트 테이블 -->
                <table>
                    <caption style="display:none;">기본배송</caption>
                    <colgroup>
                        <col style="width: 135px;">
                        <col style="width: auto;">
                        <col style="width: 98px;">
                        <col style="width: 75px;">
                        <col style="width: 98px;">
                        <col style="width: 85px;">
                    </colgroup>

                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>상품정보</th>
                            <th>판매가</th>
                            <th>수량</th>
                            <th>주문처리상태</th>
                            <th>취소/교환/반품</th>
                        </tr>
                    </thead>
                    <tbody>
	                    	<c:forEach items="${orderVOs}" var="orderView" varStatus="status">
	                    		<tr>
	                    			<td>
	                    				<a href="${orderView.productId}">
	                    					<img src="${rootPath}/resources/image/thumbnail/${orderView.productThumImg}">
	                    				</a>
	                    			</td>
									<td>
										<a href="${orderView.productId}">
											${orderView.productName}
										</a><br>
											[옵션:${orderView.cartColor}/${orderView.cartSize}]
									</td>
	    	        				<td id="prd_price_${status.count}" style="display:none;">${orderView.productPrice2}</td>
	    	        				<td id="cart_quan_${status.count}">${orderView.cartQuan}</td>
	    	        				<td id="sum_price_${status.count}"></td>
	    	        				<td>${orderView.orderDelivery}</td>
									<td>-</td>
	                    		</tr>
	                    	</c:forEach>
                    </tbody>

                    <tfoot>
                        <tr>
                            <td colspan="8" style="text-align:right;">
                                                               상품구매  합계 :
                                <span><fmt:formatNumber value="${orderVOs.get(0).orderAmount}" pattern="###,###,###"/>원</span>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <!-- //상품 구매 리스트 테이블 -->
            </div>
            <!-- //상품 구매리스트 박스 -->
        </div>

        <!-- 배송지 정보 테이블 전체 레이아웃 -->
        <div>
            <div>
                <h3 style="margin: 5px;">배송지 정보</h3>
            </div>
            <!-- 배송지 정보 테이블 레이아웃  -->
            <div id="delivery_member_info">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 160px;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>받으시는분</th>
                            <td>${orderVOs.get(0).orderName}</td>
                        </tr>
                        <tr>
                            <th>우편번호</th>
                            <td>${orderVOs.get(0).orderZip}</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${orderVOs.get(0).orderAddr}</td>
                        </tr>
                        <tr>
                            <th>일반전화</th>
                            <td>${orderVOs.get(0).orderPhone}</td>
                        </tr>
                        <tr>
                            <th>휴대전화</th>
                            <td>${orderVOs.get(0).orderCellphone}</td>
                        </tr>
                        <tr>
                            <th>배송메세지</th>
                            <td>${orderVOs.get(0).orderMsg}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //배송지 정보 테이블 레이아웃  -->

            <!-- 주문목록 으로 가기 버튼 -->
            <div id="order_detail_btn">
                <a href="${rootPath}/member/order_details.do?memberId=<sec:authentication property="name"/>">주문목록보기</a>
            </div>
            
        </div>
        <!-- //배송지 정보 테이블 전체 레이아웃 -->
        <div>
            <div class="nointerset_use_info_box">
                <div style="border-bottom: 1px solid #e7e7e7;">
                    <h4>이용안내</h4>
                </div>
                <div>
                    <h4>신용카드매출전표 발행 안내</h4>
                    <h4>신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</h4>
                    <h4>세금계산서 발행 안내</h4>
                    <p><span class="my_border_box2">1</span>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</p>
                    <p><span class="my_border_box2">2</span>세금계산서는 사업자만 신청하실 수 있습니다.</p>
                    <p><span class="my_border_box2">3</span>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</p>
                    <p><span class="my_border_box2">4</span>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</p>
                    <p><span class="my_border_box2">5</span>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</p>
                    <p><span class="my_border_box2">6</span>세금계산서는 실결제금액에 대해서만 발행됩니다.(적립금과 할인금액은 세금계산서 금액에서 제외됨)</p>
                    <h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경 안내</h4>
                    <p><span class="my_border_box2">1</span>변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</p>
                    <p><span class="my_border_box2">2</span>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</p>
                    <h4>현금영수증 이용안내</h4>
                    <p><span class="my_border_box2">1</span>현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</p>
                    <p><span class="my_border_box2">2</span>현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</p>
                    <p><span class="my_border_box2">3</span>발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</p>
                    <p><span class="my_border_box2">4</span>현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</p>
                    <p><span class="my_border_box2">5</span>현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>