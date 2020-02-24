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
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_board_faq_detail.css">

</head>

<body>
<div id="wrap">
	
	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/member/board_left.jsp" %>

	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			<b>| FAQ > 상세보기</b>
		</header>

		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">
		
			<!-- 게시판 제목 -->
			<div>
				<div class="board_title1" style="border-top: 1px solid rgb(141, 141, 141);">
					SUBJECT
				</div>	
				<div class="board_title2" style="border-top: 1px solid rgb(141, 141, 141);">
					${dto.faqTitle}
				</div>
			</div>
			
			<!-- 게시판 작성자 -->
			<div>
				<div class="board_title1">
					WRITER
				</div>	
				<div class="board_title2">
					${dto.memberId}
				</div>
			</div>
			
			<!-- 게시판 조회수 -->
			<div>
				<div class="board_title1">
					VIEW
				</div>	
				<div class="board_title2">
					${dto.faqReadCount}
				</div>
			</div>
			
			<!-- 게시판 내용 -->
			<div id="board_content">
				<%-- <c:if test="${not empty dto.faqFile}">
					<img src="${rootPath}/image/${dto.faqFile}" style="width: 1000px; height: auto;"/>
				</c:if> --%>
				${dto.faqContent}
			</div>

		</div>
		<!-- //게시판 전체 wrap 끝 -->

		<!-- 버튼 wrap1(LIST, 수정, 삭제)-->
		<div id="btn_wrap1">
			<div class="btn_wrap_left">
				<button id="faqBtn"
						type="button" 
						onclick="location.href='${rootPath}/admin/admin_board_faq.do/1'"
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">LIST</button>
			</div>	
		</div>
		<!-- //버튼 wrap1(LIST, 수정, 삭제) 끝 -->

		<!-- 버튼 wrap2(이전글, 다음글)-->
		<div id="btn_wrap2">
			<c:if test="${nextId != dto.faqId}">
				<div style="height: 50px;">
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${nextId}" id="nextBtn" style="margin: 0 20px;">다음글&nbsp;▲</a>
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${nextId}">${nextTitle.faqTitle}</a>
				</div>
			</c:if>
			<c:if test="${preId != dto.faqId}">
				<div style="height: 50px;">
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${preId}" id="preBtn" style="margin: 0 20px;">이전글&nbsp;▼</a>
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${preId}">${preTitle.faqTitle}</a>
				</div>
			</c:if>
		</div>
		<!-- //버튼 wrap2(이전글, 다음글) 끝 -->

	</div>
	<!-- // 우측 본문 끝 -->

</div>
</body>
</html>
