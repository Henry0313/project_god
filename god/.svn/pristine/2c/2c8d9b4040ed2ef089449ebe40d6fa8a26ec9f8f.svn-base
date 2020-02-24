<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>입금 기타 문의 상세보기</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp"%>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/credit_etc_detail.css">

</head>

<body>

	<!-- 게시판 시작 -->
	<div id="wrap">

		<!-- 좌측 메뉴 -->
		<%@ include file="/resources/common/member/board_left.jsp" %>

		<!-- 게시판 우측 본문 시작 -->
		<div id="container">
			<header>
				&nbsp;&nbsp;<strong>| Q&A &gt; 입금/기타 문의 &gt; 상세 보기</strong><br>
				<br>
				&nbsp;&nbsp;<strong>| 입금/기타 문의 &gt; 상세 보기</strong>
			</header>

			<!-- 게시판 전체 wrap -->
			<div id="board_wrap">

				<!-- 게시판 리스트 시작 -->
				<div id="board_list">

					<!-- 게시판 제목 -->
					<div id="board_title">
						<div id="board_title1" style="text-align: left;"><b>SUBJECT</b></div>	
						<div id="board_title2" style="text-align: left;">GetOutDoor 입금/기타 문의</div>
					</div>

					<!-- 게시판 작성자 -->
					<div id="board_writer">
						<div id="board_writer1" style="text-align: left;"><b>WRITER</b></div>	
						<div id="board_writer2" style="text-align: left;">윤XXXX</div>
					</div>

					<!-- 게시판 날짜 -->
					<div id="board_date">
						<div id="board_date1" style="text-align: left;"><b>DATE</b></div>	
						<div id="board_date2" style="text-align: left;">2020-01-07</div>
					</div>

					<!-- 게시판 내용 -->
					<div id="board_content">						
						---------------------------------------------------------------------------<br>
						입금자명 : <br>
						입금금액 : <br>
						입금날짜 : <br>
						---------------------------------------------------------------------------
					</div>

			</div>	
			<!-- //게시판 전체 wrap -->

			<!-- 게시판 LIST/DELETE/MODIFY 버튼 -->
			<div id="board_btn">				
				<div style="float: left; width: 50%; padding-top: 15px;">
					<button type="button"
							class="btn btn-outline-secondary btn-sm" 
							onclick = "location.href ='${rootPath}/board/credit_etc.do'"
							style="width: 80px;">LIST</button>	
				</div>						
				<div style=" float: left; width: 50%; padding-top: 15px; text-align:right;">
					<button type="button" class="btn btn-outline-secondary btn-sm">DELETE</button>&nbsp;							
					<button type="button" class="btn btn-outline-secondary btn-sm">MODIFY</button>				
				</div>
			</div>

			</div>
			
		</div>
		<!-- //게시판 우측 본문 끝 -->
	
	</div>
	<!-- //게시판 끝 -->

</body>
</html>