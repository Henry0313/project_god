<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 EVENT</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_event.css">

<script>
// 글쓰기 버튼
$(function() {
	
	writeBtn.onclick = function() {
		location.href = "${rootPath}/admin/admin_board_write.do";
	} //
	
});	
</script>
<style>

</style>
</head>
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| EVENT
		</header>
		
		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">

			<!-- 게시판 리스트 시작 -->
			<table id="board_list">
				<tr class="table table-striped table-bordered table-hover">
					<th>NO</th>
					<th>SUBJECT</th>
					<th>WRITER</th>
					<th>DATE</th>
				</tr>
				<tr>
					<td>{NO}</td>
					<td>{제목}</td>
					<td>{작성자}</td>
					<td>{작성일}</td>
				</tr>
				<tr>
					<td>87</td>
					<td>Happy new year! 새해맞이 3종 쿠폰 이벤트!</td>
					<td>GetOutDoor</td>
					<td>2020-01-01</td>				
				</tr>
				<tr>
					<td>86</td>
					<td>선착순 50분께 비비크림을 드립니다</td>
					<td>GetOutDoor</td>
					<td>2019-12-12</td>				
				</tr>				
				<tr>
					<td>85</td>
					<td>싱글코트 선착순 50장 19000원</td>
					<td>GetOutDoor</td>
					<td>2019-12-01</td>				
				</tr>
				<tr>
					<td>84</td>
					<td>BLACKPRIDAY 최대 70% SALE</td>
					<td>GetOutDoor</td>
					<td>2019-11-01</td>				
				</tr>
				<tr>
					<td>83</td>
					<td>퍼스트데이 아우터 할인전</td>
					<td>GetOutDoor</td>
					<td>2019-10-01</td>				
				</tr>
			</table>
			<!-- //게시판 리스트 끝 -->

		</div>
		<!-- //게시판 전체 wrap 끝 -->
				
		<!-- 글쓰기 버튼 -->
		<div id="write_btn" class="write_btn">
			<button type="button" 
					id="writeBtn"
					onclick=""
					class="btn btn-outline-secondary btn-sm" 
					style="width: 80px;">글쓰기</button>		
		</div>
		<!-- //글쓰기 버튼 끝 -->
		
        <!-- Paging -->
		<div id="pagination">
			<a href="#">|처음|</a> &nbsp;&nbsp;&nbsp;
			<a href="#">◀︎ 이전</a>&nbsp;
			<a href="#">[1]</a>&nbsp;
			<a href="#">[2]</a>&nbsp;
			<a href="#">[3]</a>&nbsp;
			<a href="#">[4]</a>&nbsp;
			<a href="#">[5]</a>&nbsp;
			<a href="#">다음 ▶︎</a> &nbsp;&nbsp;&nbsp;
			<a href="#">|마지막|</a>
		</div>
		<!-- //Paging 끝 -->

		<!-- 게시판 검색 선택(select) 박스 -->
		<div id="search_menu">

			<select class="select_box">
				<option>일주일</option>
				<option>한달</option>
				<option>세달</option>
				<option>전체</option>
			</select>
			<select class="select_box">
				<option>제목</option>
				<option>내용</option>
				<option>글쓴이</option>
				<option>아이디</option>
			</select> 
			<input type="text"
				   id=""
				   name=""
				   size=""
				   style="height: 30px;font-size: 10pt;"
				   placeholder=""
				   value=""/>
			<button type="button" 
					onclick=""
					class="btn btn-outline-secondary btn-sm" 
					style="width: 80px; margin-left: 5px;">찾기</button>
		</div>
		<!-- //게시판 검색 선택(select) 박스 끝 -->
		
	</div>
	<!-- //우측 본문 끝 -->

</div>
</body>
</html>