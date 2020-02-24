<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ 게시판</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp"%>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/deliver_detail.css">

</head>

<body>

	<!-- 게시판 시작 -->
	<div id="wrap">

		<!-- 좌측 메뉴 -->
		<%@ include file="/resources/common/member/board_left.jsp" %>

		<!-- 게시판 우측 본문 시작 -->
		<div id="container">
			<header>
				&nbsp;&nbsp;<strong>| Q&A &gt; 배송 문의 &gt; 상세 보기</strong><br>
				<br>
				&nbsp;&nbsp;<strong>| 배송 문의 &gt; 상세 보기</strong>
			</header>

			<!-- 게시판 전체 wrap -->
			<div id="board_wrap">

				<!-- 게시판 리스트 시작 -->
				<div id="board_list">

					<!-- 게시판 제목 -->
					<div id="board_title">
						<div id="board_title1" style="text-align: left;"><b>SUBJECT</b></div>	
						<div id="board_title2" style="text-align: left;">GetOutDoor 배송문의</div>
					</div>

					<!-- 게시판 작성자 -->
					<div id="board_writer">
						<div id="board_writer1" style="text-align: left;"><b>WRITER</b></div>	
						<div id="board_writer2" style="text-align: left;">오XXXX</div>
					</div>

					<!-- 게시판 날짜 -->
					<div id="board_date">
						<div id="board_date1" style="text-align: left;"><b>DATE</b></div>	
						<div id="board_date2" style="text-align: left;">2020-01-07</div>
					</div>

					<!-- 게시판 내용 -->
					<div id="board_content">
						<b>※ 글 작성하기 전에 꼭 읽어주세요 ※</b><br>
						---------------------------------------------------------------------------<br>
						# 기본상품 준비기간 영업일기준 2~5일정도 소요됩니다.<br>
						# 상품이 지연될 경우는 주문폭주, 제작지연, 품절입니다.<br>
						# 지연시 입고안내 알림톡으로 안내드리고있으며, 품절은 문자로 안내드리고있으며,<br>
						고객센터 또는 게시글 통해 문의주시면 안내 도와드리겠습니다!
						<p>카카오톡 문의 시 무료배송쿠폰 지급 해드리니 카카오톡 1:1채팅으로 아이디 말씀해주세요</p><br>
						친구 추가 후 무료 배송 쿠폰 받아보시고 즐거운 쇼핑 되시길 바랍니다.<br>
						카카오톡 Yellow ID : @GetOutDoor<br><br>
						---------------------------------------------------------------------------<br><br>
						아래의 양식에 따라 작성 부탁드립니다♥<br>
						(관리자 답변은 로그인 후 홈페이지 상단->마이페이지에서 확인 가능하며<br>
						답변의 답변하기 글은 확인이 불가능하니, 재문의는 새 글작성 부탁드립니다.)<br><br>
						<p>① 주문번호: </p>
						<p>② 고객님의 성함: </p>
						<p>③ 연락처: </p>
						<p>④ 문의내용: </p>
					</div>
				</div>
			</div>	
			<!-- //게시판 전체 wrap -->

			<!-- 게시판 LIST/DELETE/MODIFY 버튼 -->
			<div id="board_btn">				
				<div style="float: left; width: 50%; padding-top: 15px;">
					<button type="button" onclick=""
							class="btn btn-outline-secondary btn-sm"
							style="width: 80px;">
							<a href="${rootPath}/board/deliver.do"></a>LIST</button>			
				</div>						
				<div style=" float: left; width: 50%; padding-top: 15px; text-align:right;">
					<button type="button" onclick="" class="btn btn-outline-secondary btn-sm">DELETE</button>&nbsp;							
					<button type="button" onclick="" class="btn btn-outline-secondary btn-sm">MODIFY</button>				
				</div>
			</div>
		</div>
		<!-- //게시판 우측 본문 끝 -->
	
	</div>
	<!-- //게시판 끝 -->

</body>
</html>
