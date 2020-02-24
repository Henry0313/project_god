<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 등업신청</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_grade.css">

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
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| 등업신청
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
					<td>
						<h6><span class="badge badge-secondary">공지</span></h6>
					</td>
					<td>등업신청전 꼭 등급별 할인혜텍 확인해주세요!</td>
					<td>GetOutDoor</td>
					<td>2019-09-13</td>
				</tr>
				<tr>
					<td>22187</td>
					<td>GetOutDoor 등업신청합니다.</td>
					<td>오유*<br>(user1)</td>
					<td>2020-01-01</td>				
				</tr>
				<tr>
					<td>22186</td>
					<td>GetOutDoor 등업신청합니다.</td>
					<td>이인*<br>(user2)</td>
					<td>2020-01-01</td>				
				</tr>
				<tr>
					<td>22185</td>
					<td>GetOutDoor 등업신청합니다.</td>
					<td>길정*<br>(user3)</td>
					<td>2020-01-01</td>				
				</tr>
				<tr>
					<td>22184</td>
					<td>GetOutDoor 등업신청합니다.</td>
					<td>임꺽*<br>(user4)</td>
					<td>2020-01-01</td>				
				</tr>
				<tr>
					<td>22183</td>
					<td>GetOutDoor 등업신청합니다.</td>
					<td>홍길*<br>(user5)</td>
					<td>2020-01-01</td>				
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