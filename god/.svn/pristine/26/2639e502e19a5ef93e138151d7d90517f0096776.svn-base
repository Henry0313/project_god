<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Template 상단 menu</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<c:set var="jquery" value="${rootPath}/resources/js/jQuery/3.4.1/jquery-3.4.1.min.js" />
<c:set var="jqueryui_css" value="${rootPath}/resources/js/jQueryUI/1.12.1/jquery-ui.min.css" />
<c:set var="jqueryui_js" value="${rootPath}/resources/js/jQueryUI/1.12.1/jquery-ui.min.js"  />

<!-- jQuery : 3.4.1 -->
<script src="${jquery}" charset="UTF-8"></script>

<!-- jQuery UI css/js : 1.12.1 -->
<link rel="stylesheet" href="${jqueryui_css}">
<script src="${jqueryui_js}" charset="UTF-8"></script>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/layout/header.css">

<!-- js 외장화 -->
<script src="${rootPath}/resources/js/member/layout/header.js" charset="UTF-8"></script>

</head>
<body>
<!-- 추가 -->
<!-- 모달 전체 레이아웃 -->
<div id="search_modal_wrap">
	<div id="search_modal">
		<p>PRODUCT SEARCH</p>
		<form id="modal_search" method="POST" action="${rootPath}/search.do">
			<div id="search_box">
				<input type="text"
					   id="search_txt">
				<span id="search_modal_btn">
					<a href="${rootPath}/member/productSearch.do">
					<input type="image"
						   src="${rootPath}/resources/css/member/images/img_btn.png"
						   id="img_btn">
					</a>
				</span>
			</div>
		</form>

		<div id="popular_search">
			<span>인기검색어 : </span>
				<a href="#">니트</a>
				<a href="#">양털</a>
				<a href="#">목폴라</a>
				<a href="#">패딩</a>
				<a href="#">슬랙스</a>
		</div>
	</div>
</div>
<!-- //모달 전체 레이아웃-->

<!-- 전체 레이아웃 -->
<div id="top_wrap">

	<!-- 상단 영역 최소넓이 -->
	<div id="head_wrap" >

		<!-- 상단 영역 최대넓이-->
		<div id="head">

			<!-- 고객센터-->
			<div id="topbox_left">
				<ul>
					<li><a href="${rootPath}/board/faq.do/1">고객센터</a></li>
					<li><a href="${rootPath}/board/event.do">EVENT</a></li>
				</ul>
			</div>
			<!-- //고객센터 -->

			<!-- LOGIN -->
			<div id="topbox_right">
				<ul>
					<sec:authorize access="isAnonymous()">
						<li><a href="${rootPath}/login/login.do">LOGIN</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<a href="${rootPath}/admin/admin_main.do">관리자 화면&nbsp;</a>
							</sec:authorize>
						</li>
							<li style="font-size: 8pt; color: ">
								<sec:authentication property="name"/>&nbsp;님이 접속중입니다.&nbsp;
							</li>
						<li>
							<a href="${rootPath}/login/logout_proc.do">LOGOUT</a>
						</li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="${rootPath}/member/join.do">JOIN</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="${rootPath}/member/update.do?memberId=<sec:authentication property="name"/>">MODIFY</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="#" id="order_btn">ORDER</a></li>
						<script>
							$("#order_btn").click(function() {
						        alert("회원만 이용할 수 있습니다.");
						        location.href="${rootPath}/login/login.do";
						    });
						</script>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="${rootPath}/member/order_details.do?memberId=<sec:authentication property="name"/>">ORDER</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="#" id="cart_btn">CART</a></li>
						<script>
							$("#cart_btn").click(function() {
						        alert("회원만 이용할 수 있습니다.");
						        location.href="${rootPath}/login/login.do";
						    });
						</script>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="${rootPath}/products/cart2.do">CART</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="#" id="my_shopping_btn">MYSHOPPING</a></li>
						<script>
							$("#my_shopping_btn").click(function() {
						        alert("회원만 이용할 수 있습니다.");
						        location.href="${rootPath}/login/login.do";
						    });
						</script>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="${rootPath}/member/myshopping.do">MYSHOPPING</a></li>
					</sec:authorize>
					<li><a href="#" id="search_paging_result">SEARCH</a></li>
				</ul>
			</div>
			<!-- //LOGIN -->

			<!-- 쇼핑몰이름 -->
			<div id="title">
				<a href="${rootPath}/" style="text-decoration:none; color: black;"><span style="display:inline;">GetOutDoor</span></a>
			</div>
			<!-- //쇼핑몰 이름 -->

		</div>
		<!-- 상단 영역 최대넓이 -->

		<!-- 드롭 메뉴바 -->
		<div id="menu">

			<!-- 드롭 메뉴바 레이아웃 -->
			<div id="menu_wrap">
				<ul>
					<li id="best_btn"><a href="#">BEST</a></li>
					<li id="new_btn"><a href="#">NEW10%</a></li>
					<li id="set_btn" class="space"><a href="#">1+1SET</a></li>
					<li id="outer_btn"><a href="${rootPath}/products/list.do/101/1">OUTER</a>
						<div id="outer_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/101/1">코트/트렌치코트</a>
							<a href="${rootPath}/products/list.do/102/1">자켓</a>
							<a href="${rootPath}/products/list.do/103/1">점퍼</a>
							<a href="${rootPath}/products/list.do/104/1">가디건</a>
							<a href="${rootPath}/products/list.do/105/1">집업</a>
							<a href="${rootPath}/products/list.do/106/1">조끼</a>
						</div>
					</li>
					<li id="top_btn"><a href="${rootPath}/products/list.do/201/1">TOP</a>
						<div id="top_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/201/1">긴팔티</a>
							<a href="${rootPath}/products/list.do/202/1">맨투맨/후드</a>
							<a href="${rootPath}/products/list.do/203/1">반팔티</a>
							<a href="${rootPath}/products/list.do/204/1">니트</a>
							<a href="${rootPath}/products/list.do/205/1">나시</a>
						</div>
					</li>
					<li id="shirt_btn"><a href="${rootPath}/products/list.do/301/1">SHIRT</a>
						<div id="shirt_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/301/1">심플/베이직</a>
							<a href="${rootPath}/products/list.do/302/1">체크/패턴/데님</a>
						</div>
					</li>
					<li id="pants_btn"><a href="${rootPath}/products/list.do/401/1">PANTS</a>
						<div id="pants_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/401/1">슬랙스</a>
							<a href="${rootPath}/products/list.do/402/1">밴딩팬츠</a>
							<a href="${rootPath}/products/list.do/403/1">면바지</a>
							<a href="${rootPath}/products/list.do/404/1">청바지</a>
							<a href="${rootPath}/products/list.do/405/1">반바지</a>
						</div>
					</li>
					<li id="shoes_btn"><a href="${rootPath}/products/list.do/501/1">SHOES</a>
						<div id="shoes_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/501/1">스니커즈</a>
							<a href="${rootPath}/products/list.do/502/1">로퍼</a>
							<a href="${rootPath}/products/list.do/503/1">부츠/워커</a>
							<a href="${rootPath}/products/list.do/504/1">샌들</a>
						</div>
					</li>
					<li id="bag_btn"><a href="${rootPath}/products/list.do/601/1">BAG</a>
						<div id="bag_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/601/1">백팩</a>
							<a href="${rootPath}/products/list.do/602/1">토드백</a>
							<a href="${rootPath}/products/list.do/603/1">크로스백</a>
						</div>
					</li>
					<li id="acc_btn"><a href="${rootPath}/products/list.do/701/1">ACC</a>
						<div id="acc_sub" style="width:120px">
							<a href="${rootPath}/products/list.do/701/1">목걸이/팔찌/반지</a>
							<a href="${rootPath}/products/list.do/702/1">모자</a>
							<a href="${rootPath}/products/list.do/703/1">안경/선글라스</a>
							<a href="${rootPath}/products/list.do/704/1">양말</a>
							<a href="${rootPath}/products/list.do/705/1">벨트</a>
							<a href="${rootPath}/products/list.do/706/1">기타</a>
						</div>
					</li>
					<li id="beauty_btn" class="space"><a href="#">#BEAUTY</a></li>
					<li id="review_btn"><a href="#">REVIEW</a></li>
				</ul>
			</div>

		</div>

	</div>
	<!-- 상단 영역 최소넓이 -->
</div>
<!-- //전체 레이아웃 -->
</body>
</html>
