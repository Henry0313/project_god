<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Template 상단 menu</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_header.css">

<script>
$(document).ready(function() {

	var menu = $('#top_main_menu_wrap').offset();

	$(window).scroll(function() {
		if ($(document).scrollTop() > menu.top) {
			$('#top_main_menu_wrap').addClass('fixed');
		} else {
			$('#top_main_menu_wrap').removeClass('fixed');
		}
	});
});
</script>
</head>
<body>
	<header id="top_menu_wrap">
		
		<!-- header 시작 -->
		<div id="header_wrap">
		
			<!-- header 좌측 -->
			<div id="header_left">
				<span><a class="main_title" href="${rootPath}/admin/admin_main.do">Get Out Door Shopping Mall - Admin</a></span>
			</div>
			<!-- // header 좌측 끝 -->
			
			<!-- header 우측 -->
			<table id="header_right">
				<tr>
					<td>
						<input type="button"
							   id="admin_change_btn"
							   name="admin_change_btn"
							   value="쇼핑몰 바로가기"
							   onClick="location.href='${rootPath}'">
		
						<input type="button"
							   id="admin_board_btn"
							   name="admin_board_btn"
							   value="사내 게시판"
							   onClick="location.href='${rootPath}/admin/admin_notice.do'">
   		
   						<input type="button"
							   id="admin_logout_btn"
							   name="admin_logout_btn"
							   value="로그아웃"
							   onClick="location.href='${rootPath}/login/logout_proc.do'">
					</td>
				</tr>
			</table>
			<!-- // header 우측 끝 -->
		
		</div>
		
		<div id="top_main_menu_wrap">
		
			<!-- nav 메뉴부분 -->
			<nav id="top_main_menu">
				<ul>
					<li id="home_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_main.do">메인</a></li>
					<li id="order_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_order_list.do/1">주문 관리</a>
						<ul>
							<li><a href="${rootPath}/admin/admin_order_list.do/1">주문</a></li>
							<li><a href="${rootPath}/admin/admin_order_cancel.do">주문취소</a></li>
							<li><a href="${rootPath}/admin/admin_order_change.do">교환/환불신청</a></li>
						</ul>
					</li>	
					<li id="board_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_board_faq.do/1">게시판 관리</a>
						<ul> 
							<li><a href="${rootPath}/admin/admin_board_write.do">글쓰기</a></li>
							<li><a href="${rootPath}/admin/admin_board_faq.do/1">FAQ</a></li>
							<li><a href="${rootPath}/admin/admin_board_qna_product.do/1">상품 문의</a></li>
							<li><a href="#">배송 문의</a></li>
							<li><a href="#">입금/기타 문의</a></li>
							<li><a href="#">배송전 변경/취소</a></li>
							<li><a href="#">배송후 교환/반품</a></li>
							<li><a href="${rootPath}/admin/admin_best_review.do">Best Review</a></li>
							<li><a href="${rootPath}/admin/admin_grade.do">등업신청</a></li>
							<li><a href="${rootPath}/admin/admin_event.do">EVENT</a></li>
						</ul>
					</li>
					<li id="member_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_member_list.do">회원 관리</a>
						<ul> 
							<li><a href="${rootPath}/admin/admin_member_list.do">회원리스트</a></li>
							<li><a href="${rootPath}/admin/admin_dropout_list.do">탈퇴회원 리스트</a></li>
							<li><a href="${rootPath}/admin/admin_mail.do">메일 관리</a></li>
							<li><a href="${rootPath}/admin/admin_sms.do">SMS 관리</a></li>
							<li><a href="${rootPath}/admin/admin_all_mail.do">대량 메일 발송</a></li>
						</ul>
					</li>
					<li id="mainpro_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_display.do">메인상품 관리</a>
						<ul> 
							<li><a href="${rootPath}/admin/admin_display.do">상품 진열</a></li>
						</ul>
					</li>
					<li id="pro_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_product_regi.do">상품 관리</a>
						<ul> 
							<li><a href="${rootPath}/admin/admin_product_regi.do">상품 등록</a></li>
							<li><a href="${rootPath}/admin/admin_product_list.do/1">상품 리스트</a></li>
						</ul>
					</li>
					<li id="ban_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_banner.do">배너 관리</a>
						<ul> 
							<li><a href="${rootPath}/admin/admin_banner.do">메인</a></li>
						</ul>
					</li>
					<li id="tot_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_visitor.do">통계</a>
						<ul> 
							<li><a href="${rootPath}/admin/admin_visitor.do">방문자수/페이지뷰</a></li>
							<li><a href="${rootPath}/admin/admin_member_number.do">회원수</a></li>
							<li><a href="${rootPath}/admin/admin_product_view.do">상품 조회수</a></li>
							<li><a href="${rootPath}/admin/admin_category_view.do">카테고리 조회수</a></li>
							<li><a href="${rootPath}/admin/admin_sales_rank.do">상품 판매 순위</a></li>
							<li><a href="${rootPath}/admin/admin_point.do">포인트</a></li>
							<li><a href="${rootPath}/admin/admin_dropout_reason.do">탈퇴 사유</a></li>
						</ul>
					</li>
					<li id="poli_btn"><a class="top_menu_link" href="${rootPath}/admin/admin_terms.do">기본정책 관리</a>
						<ul> 
							<%-- <li><a href="${rootPath}/admin/admin_terms.do">약관 관리</a></li> --%>
							<li><a href="${rootPath}/admin/admin_policy.do">정책 관리</a></li>
							<li><a href="${rootPath}/admin/admin_pay_method.do">결제 방법 설정</a></li>
							<li><a href="${rootPath}/admin/admin_menu_acc.do">메뉴 접근 권한</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		
		</div>
		
	</header>
	
</body>

</html>