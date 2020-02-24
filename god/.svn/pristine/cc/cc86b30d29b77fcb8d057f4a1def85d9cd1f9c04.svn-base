<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이용자 : 게시판 글쓰기</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/board_write.css">

<script>
// 에디터
$(document).ready(function() {
	$('#qnaProductContent').summernote({
		height: 550,
		placeholder: '내용을 작성해주세요...'
    });
});

$(document).ready(function() {
	$("#saveBtn").click(function() {
		var title = $("#qnaProductTitle").val();
		var content = $("#qnaProductContent").val();
		var pw = $("#qnaProductPw").val();
		if (title == "") {
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if (content == "") {
			alert("내용을 입력하세요.");
			document.form1.content.focus();
			return;
		}
		if (pw == "") {
			alert("비밀번호를 입력하세요.");
			document.form1.pw.focus();
			return;
		}
		document.form1.submit();
	});
});
</script>

</head>
<body>

<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/member/board_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| 글쓰기
		</header>
		<form name="form1" method="post" action="${rootPath}/board/insert.do">
		<!-- 상단 타이틀 -->
		<div id="title_wrap">
			
	
			<!-- 게시판 종류 선택 -->
			<div id="board_choice">
				게시판 
				<select id="select_box">
					<option>GetOutDoor 상품 문의</option>
					<option>GetOutDoor 배송 문의</option>
					<option>GetOutDoor 입금/기타 문의</option>
					<option>GetOutDoor 배송 전 변경/취소 문의</option>
					<option>GetOutDoor 배송 후 교환/반품 문의</option>
					<option>GetOutDoor 등업신청</option>
				</select>
			</div>
			
			<!-- 글쓰기 타이틀 -->
			<div id="write_title">
				제목
				<input type="text"
						   id="qnaProductTitle"
						   name="qnaProductTitle"
						   size="60"
						   style="height: 30px; margin-left: 22px; font-size: 10pt;"
						   placeholder="제목을 입력해 주세요!"
						   value=""/>
			</div>
			
			<!-- 현재 접속한 아이디 -->
			<input type="text"
				   id="memberId"
				   name="memberId"
				   value="<sec:authentication property="name"/>"
				   style="display: none;"/>
			
		</div>
		<!-- //상단 타이틀 끝 -->
		
		<!-- 글쓰기 content -->
		<div id="write_content" style="width:100%;">
			<!-- 에디터 -->
            <textarea id="qnaProductContent" name="qnaProductContent"></textarea>
		</div>
		<!-- //글쓰기 content 끝 -->
		
		<!-- 게시판 비밀번호 -->
		<div style="padding: 10px 0;">
			<div id="board_pw1">비밀번호</div>
			<input type="text" id="qnaProductPw" name="qnaProductPw">
		</div>
		
		<!-- 게시판 LIST/REGISTER/CANCEL 버튼 -->
		<div id="board_btn">				
			<div style="float: left; width: 50%;">
				<button id=""
						type="button" 
						class="btn btn-outline-secondary btn-sm" 
						onclick="location.href='${rootPath}/board/qna_product.do/1'"
						style="width: 80px;">LIST</button>
			</div>
			
			<div style=" float: left; width: 50%; text-align:right;">
				<button id="saveBtn"
						type="button" 
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">REGISTER</button>
				<button id=""
						type="button" 
						class="btn btn-outline-secondary btn-sm" 
						onclick="location.href='${rootPath}/board/qna_product.do/1'"
						style="width: 80px;">CANCEL</button>							
			</div>
			
		</div>
		<!-- 게시판 LIST/REGISTER/CANCEL 버튼 끝 -->
		</form>
	</div>
	<!-- //우측 본문 끝 -->	
	
</div>
</body>
</html>