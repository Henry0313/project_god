<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${rootPath}/resources/css/member/myshopping.css">
</head>
<body>

	<!-- 게시판 시작 -->
	<div id="wrap">

		<!-- 게시판 우측 본문 시작 -->
		<div id="container">
		
			<!-- 제목 -->
			<div id="title">
				<strong>MY SHOPPING</strong><br>
			</div>
			
			<!-- 부제목 -->
			<div id="subtitle">
				<strong>나의 주문처리 현황</strong>(최근<span style="color:blue">3개월</span>기준)
			</div>
			
			<!-- 게시판 전체 wrap -->
			<div id="board_wrap">
			
			<!-- 첫번째 박스 -->
			<div id="first_box">
				<div id="first_box1" style="float: left; padding: 20px; text-align: center;">입금전<br>0</div>
				<div id="first_box2" style="float: left; padding: 20px; text-align: center;">배송준비중<br>0</div>
				<div id="first_box3" style="float: left; padding: 20px; text-align: center;">배송중<br>0</div>
				<div id="first_box4" style="float: left; padding: 20px; text-align: center;">배송완료<br>0</div>
				<div id="first_box5" style="float: left; padding: 20px; text-align: center;">-취소:0<br>-교환:0<br>-반품:0</div>
			</div>
			
			<!-- 두번째 박스 왼쪽 -->
			<div id="second_box_left">
				<div id="second_box_left1">&nbsp;&nbsp;- 가용 적립금</div><br>           
				<div id="second_box_left2">3,000원&nbsp;<button type="button" class="btn btn-secondary">조회</button></div><br>
				<div id="second_box_left3">&nbsp;&nbsp;- 사용 적립금</div><br>                
				<div id="second_box_left4">0원</div><br>
				<div id="second_box_left5">&nbsp;&nbsp;- 쿠폰</div>
				<div id="second_box_left6">0개&nbsp;<button type="button" class="btn btn-secondary">조회</button></div>
			</div>
			
			<!-- 두번째 박스 오른쪽 -->
			<div id="second_box_right">
				<div id="second_box_right1">&nbsp;&nbsp;- 총 적립금</div><br>          
				<div id="second_box_right2">3,000원</div><br>
				<div id="second_box_right3">&nbsp;&nbsp;- 총 주문</div>               
				<div id="second_box_right4">0원</div>
			</div>
			
				<!-- 세번째 윗 박스 -->
				<div id="third_box_up">					
					<div id="third_box1" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="order.jpg">ORDER</a></div>
					<div id="third_box2" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="profile.jpg">PROFILE</a></div>
					<div id="third_box3" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="wishlist.jpg">WISHLIST</a></div>
					<div id="third_box4" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="coupon.jpg">COUPON</a></div>		
				</div>

				
				<!-- 세번째 아래 박스 -->
				<div id="third_box_under">
					<div id="third_box5" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="mileage.jpg">MILEAGE</a></div>
					<div id="third_box6" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="cart.jpg"></a>CART</div>
					<div id="third_box7" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="board.jpg"></a>BOARD</div>
					<div id="third_box8" style="float: left; padding: 60px; text-align: center;">
						<a href="#"><img src="address.jpg">ADDRESS</a></div>			
				</div>
									
			</div>	
			<!-- //게시판 전체 wrap -->
					
		</div>
		<!-- //게시판 우측 본문 끝 -->
	
	</div>
	<!-- //게시판 끝 -->

</body>
</html>