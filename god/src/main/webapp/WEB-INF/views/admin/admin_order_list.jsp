<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 주문 관리</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_order_list.css">

<script>
// 메뉴 tabs
$(function() {
	$("#tabs").tabs();
});
	
// 데이트피커
$(document).ready(function(){
    $( "#sdate,#edate" ).datepicker({
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat:'yy-mm-dd',
    });

    $('#sdate').datepicker("option", "maxDate", 'today'); //오늘 이전만 선택할 수 있게
    $('#sdate').datepicker("option", "onClose", function (selectedDate){
        $("#edate").datepicker( "option", "minDate", selectedDate );
    });

    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val()); //시작일 부터 선택할 수 있게
    $('#edate').datepicker("option", "maxDate", 'today'); //오늘까지만 선택할 수 있게
});
</script>
</head>
<body>
<!-- 전체 -->
<div id="wrap">

    <!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/order_left.jsp" %>
    
    <!-- 우측 본문 -->
    <div id="container">

		<!-- 현재창 title -->
		<header>
			| 주문
		</header>
		<!-- 검색 폼 -->
		<div id="search_area">
        
			<table id="search_order_op">
               
				<tr>
					<!-- 주문일 -->
					<td>
						주문일 &nbsp;
					</td>
					<td>
						<input type="text" id="sdate">
							<i class="material-icons" style="font-size: 24px;">date_range</i> ~
						<input type="text" id="edate">
							<i class="material-icons" style="font-size: 24px;">date_range</i>
					</td>
			
					<!-- 셀렉트 박스 -->
					<td style="padding-left: 20px;">
						키워드 검색&nbsp;
					</td>
					<td>
						<select id="select_box">
		                    <option value="주문번호">주문번호</option>
		                    <option value="주문 상품">주문상품</option>
		                    <option value="주문자 아이디">주문자 아이디</option>
		                    <option value="주문자 이름">주문자 이름</option>
		                </select> &nbsp;
               		</td>
               		<td>
               			<input type="text" 
               				   style="width: 230px; 
               				   		  height: 30px; 
               				   		  font-size: 12px; 
               				   		  border: 1px solid rgb(141,141,141);"> &nbsp;
               		</td>
               		<td>
               			<button type="button" class="btn btn-outline-secondary btn-sm" onclick="search()" style="width: 80px;">검색</button>
               		</td>
               		
               	</tr>
               	
			</table>

		</div>
		<!-- //검색 폼 -->
		
		<!-- 메뉴 탭 부분 -->
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">주문 모두 보기</a></li>
				<li><a href="#tabs-2">배송준비중</a></li>
				<li><a href="#tabs-3">배송 중</a></li>
				<li><a href="#tabs-4">배송 완료</a></li>
			</ul>
			
			<div id="tabs-1" class="tabs_position">
				<!-- 주문 리스트 -->
				<table class="order_checkbefore_list">
					<tr class="list1">
						<td>선택</td>
						<td>주문 일시</td>
						<td>주문 번호</td>
						<td>주문 상품</td>
						<td>주문자<br>(아이디)</td>
						<td>결제 금액</td>
						<td>결제 상태</td>
					</tr>
					
					<c:forEach items="${orderVO}" var="orderView" varStatus="status">
					<tr class="list2">
						<td>
							<input type="checkbox">
						</td>
						<td>${orderView.orderDate}</td>
						<td><a href="${rootPath}/admin/admin_order_detail.do?orderId=${orderView.orderId}">${orderView.orderId}</a></td>
						<td>${orderView.orderName}</td>
						<td>${orderView.memberId}</td>
						<td><fmt:formatNumber value="${orderView.orderAmount}" pattern="###,###,###"/>원</td>
						<td>${orderView.orderDelivery}</td>
					</tr>
					</c:forEach>
				</table>
					<!-- Paging -->
					<!--  페이징 모듈 외장화 -->
						<%@ include file="paging/admin_order_paging.jspf" %>
					<!-- //Paging 끝 -->
			</div>
			
			<div id="tabs-2" class="tabs_position">
				<table class="order_checkbefore_list">
					<tr class="list1">
						<td>선택</td>
						<td>주문 일시</td>
						<td>주문 번호</td>
						<td>주문 상품</td>
						<td>주문자<br>(아이디)</td>
						<td>결제 금액</td>
						<td>결제 상태</td>
					</tr>
					<c:forEach items="${orderVO}" var="orderView" varStatus="status">
						<c:set var="name" value="${orderView.orderDelivery}" />
						<c:if test="${name eq '배송준비중'}">
							<tr class="list2">
								<td>
									<input type="checkbox">
								</td>
								<td>${orderView.orderDate}</td>
								<td><a href="${rootPath}/admin/admin_order_detail.do?orderId=${orderView.orderId}">${orderView.orderId}</a></td>
								<td>${orderView.orderName}</td>
								<td>${orderView.memberId}</td>
								<td><fmt:formatNumber value="${orderView.orderAmount}" pattern="###,###,###"/>원</td>
									<c:set var="name" value="${orderView.orderDelivery}" />
								<td>${orderView.orderDelivery}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
					<!-- Paging -->
					<!--  페이징 모듈 외장화 -->
						<%@ include file="paging/admin_order_paging.jspf" %>
					<!-- //Paging 끝 -->
			</div>
			
			<div id="tabs-3" class="tabs_position">
				<table class="order_checkbefore_list">
					<tr class="list1">
						<td>선택</td>
						<td>주문 일시</td>
						<td>주문 번호</td>
						<td>주문 상품</td>
						<td>주문자<br>(아이디)</td>
						<td>결제 금액</td>
						<td>결제 상태</td>
					</tr>
					<c:forEach items="${orderVO}" var="orderView" varStatus="status">
						<c:set var="name" value="${orderView.orderDelivery}" />
						<c:if test="${name eq '배송 중'}">
							<tr class="list2">
								<td>
									<input type="checkbox">
								</td>
								<td>${orderView.orderDate}</td>
								<td><a href="${rootPath}/admin/admin_order_detail.do?orderId=${orderView.orderId}">${orderView.orderId}</a></td>
								<td>${orderView.orderName}</td>
								<td>${orderView.memberId}</td>
								<td><fmt:formatNumber value="${orderView.orderAmount}" pattern="###,###,###"/>원</td>
									<c:set var="name" value="${orderView.orderDelivery}" />
								<td>${orderView.orderDelivery}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
					<!-- Paging -->
					<!--  페이징 모듈 외장화 -->
						<%@ include file="paging/admin_order_paging.jspf" %>
					<!-- //Paging 끝 -->
			</div>
			
			<div id="tabs-4" class="tabs_position">
				<table class="order_checkbefore_list">
					<tr class="list1">
						<td>선택</td>
						<td>주문 일시</td>
						<td>주문 번호</td>
						<td>주문 상품</td>
						<td>주문자<br>(아이디)</td>
						<td>결제 금액</td>
						<td>결제 상태</td>
					</tr>
					<c:forEach items="${orderVO}" var="orderView" varStatus="status">
						<c:set var="name" value="${orderView.orderDelivery}" />
						<c:if test="${name eq '배송 완료'}">
							<tr class="list2">
								<td>
									<input type="checkbox">
								</td>
								<td>${orderView.orderDate}</td>
								<td><a href="${rootPath}/admin/admin_order_detail.do?orderId=${orderView.orderId}">${orderView.orderId}</a></td>
								<td>${orderView.orderName}</td>
								<td>${orderView.memberId}</td>
								<td><fmt:formatNumber value="${orderView.orderAmount}" pattern="###,###,###"/>원</td>
									<c:set var="name" value="${orderView.orderDelivery}" />
								<td>${orderView.orderDelivery}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
					<!-- Paging -->
					<!--  페이징 모듈 외장화 -->
						<%@ include file="paging/admin_order_paging.jspf" %>
					<!-- //Paging 끝 -->
			</div>
		</div>
        <!-- //메뉴 탭 부분 끝 -->
                
    </div>
    <!-- //우측 본문 -->
</div>
<!-- //전체 -->
</body>
</html>
