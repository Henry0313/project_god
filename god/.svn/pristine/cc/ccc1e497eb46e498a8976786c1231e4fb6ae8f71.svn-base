<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="${rootPath}/resources/css/member/order_details.css">

<script>
$(function (){
    $("#history_start_date").datepicker({
		showOn : "button",
		buttonImage : rootPath + "/css/member/images/date_range.png",
		buttonImageOnly : true,
		changeYear : true,
		changeMonth : true,
		dateFormat : "yy-mm-dd"
	});

    $("#history_end_date").datepicker({
		showOn : "button",
		buttonImage : rootPath + "/css/member/images/date_range.png",
		buttonImageOnly : true,
		changeYear : true,
		changeMonth : true,
		dateFormat : "yy-mm-dd"
	});

	$.datepicker.regional['ko'] = {
		autoSize : true,
		closeText : '닫기',
		prevText : '이전달',
		nextText : '다음달',
		currentText : '오늘',
		// yearRange: "1930:2020", // 1930 ~ 2019
		// yearRange: "-36:-20", // 36년전부터 20년전까지
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		weekHeader : 'Wk',
		dateFormat : 'yy-mm-dd', // 날짜 포맷
		firstDay : 0,
		// minDate: new Date(1930, 1 - 1, 1),
		isRTL : false,
		showMonthAfterYear : true,
		yearSuffix : '년',
		// 버그 패치 : 컴포넌트 겹침 현상 해소 ex) 성별 필드와의 겹침
		beforeShow : function() {
			setTimeout(function() {
				$('.ui-datepicker').css('z-index', 10);
			}, 0);
		}
	};

	$.datepicker.setDefaults($.datepicker.regional['ko']);

    $("#history_start_date").datepicker({
		changeYear : true,
		changeMonth : true
	});

	$('#history_start_date').datepicker("option", "maxDate", 'today'); //오늘 이전만 선택할 수 있게

});

$(document).ready(function(){
	
	$("#orderUpateBtn").click(function(){
		console.log("ggggggggg");
	});
});

window.onload = function (e) {
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
	
	console.log($("[id^=cart_quan_]").text());
	console.log("?"+$("[id^=prd_price_]").text());
	
	var sum1 = 0;
	for(var i=0; i<$("[id^=cart_quan_]").length; i++){
		var sum1 = $("th[id^=cart_quan_]:eq("+i+")").text();
		var sum2 = $("th[id^=prd_price_]:eq("+i+")").text();
		var sum3 = parseInt(sum1) * parseInt(sum2);
		
		$("th[id^=sum_price_]:eq("+i+")").text(comma(sum3)+"원");
	}
	 
};

</script>

</head>
<body>
    <div id="wrap">
        <div id="title_wrap">
            <h2>ORDER LIST</h2>
        </div>
		<%-- ${orderVO} --%>
        <!-- 조회 결과 wrap -->
        <div id="order_result">
            <ul>
                <li><a href="#" class="order_type_pick">주문내역조회({})</a></li>
                <li><a href="#" class="order_type_no">취소/반품/교환내역({})</a></li>
            </ul>
        </div>
        <!-- //조회 결과 warp -->

        <!-- 날짜에 따른 검색 결과 -->
        <div>
            <div id="order_search_days">
                <form class="" method="post">
                    <!-- 주문상태 범위 검색 영역 -->
                    <div id="order_search_select">
                        <select class="" name="">
                            <option value="all" selected>전체 주문처리상태</option>
                            <option value="">입금전</option>
                            <option value="">배송준비중</option>
                            <option value="">배송중</option>
                            <option value="">취소</option>
                            <option value="">교환</option>
                            <option value="">반품</option>
                        </select>
                    </div>
                    <!-- //주문상태 범위 검색 영역 -->

                    <!-- 간단 날짜 검색 버튼 -->
                    <span id="search_day_btn">
                        <a href="#">오늘</a>
                        <a href="#">1주일</a>
                        <a href="#">1개월</a>
                        <a href="#">3개월</a>
                        <a href="#">6개월</a>
                    </span>
                    <!-- //간단 날짜 검색 버튼 -->
                    <input type="text"
                           id="history_start_date"
                           name=""
                           value="">~
                    <input type="text"
                           id="history_end_date"
                           name=""
                           style="margin-left: 10px;"
                           value="">

                    <button type="submit"
                            id="orderSearchBtn"
                            name="orderSearchBtn">조회</button>
                </form>
            </div>
            <ul id="search_info_content">
                <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다</li>
                <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
            </ul>
        </div>
        <!-- // 날짜에 따른 검색 결과 -->

        <div style="margin: 30px 0 10px;">
            <h3>주문정보</h3>
        </div>
        <table id="order_result_list">
            <caption></caption>
            <colgroup>
                <col width="135px">
                <col width="93px">
                <col width="auto">
                <col width="80px">
                <col width="130px">
                <col width="130px">
                <col width="130px">
            </colgroup>
            <thead>
                <tr>
                    <th>
                        주문일자<br>[주문번호]
                    </th>
                    <th>이미지</th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>상품구매금액</th>
                    <th>주문처리상태</th>
                    <th>취소/교환/반품</th>
                </tr>
            </thead>
            <tbody>
	            	<c:forEach items="${orderVO}" var="orderList" varStatus="status"> 
	            		<tr>
	            			<td>
	            				<fmt:formatDate value="${orderList.orderDate}" pattern="yyyy-MM-dd" />
	            				<br>
	            				<a href="${rootPath}/member/order_detail_info.do?orderId=${orderList.orderId}">[${orderList.orderId}]</a>
	            			</td>
	            			<td><a href="#"><img src="${rootPath}/resources/image/thumbnail/${orderList.productThumImg}"></a></td>
	            			<td style="text-align: left;">
	                    		<a href="#">${orderList.productName}</a><br>
	                    		{[옵션:${orderList.cartColor}/${orderList.cartSize}]}
	                    	</td>
	                    <td id="cart_quan_${status.count}">${orderList.cartQuan}</td>
	                    <td id="sum_price_${status.count}"></td>
	                    <td id="prd_price_${status.count}" style="display:none;">${orderList.productPrice2}</td>
	                    <td>${orderList.orderDelivery}</td>
	                    <td>-</td>
	               	</tr>
	            	</c:forEach>
            </tbody>
        </table>

    </div>
</body>
</html>