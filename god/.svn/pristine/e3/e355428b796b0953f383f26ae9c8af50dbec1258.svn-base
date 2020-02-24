<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 Best Review List</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_best_review_list.css">

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
			| Best Review > Best Review List
		</header>
		
		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">

			<!-- 게시판 리스트 시작 -->
			<table id="board_list">
				<tr class="table table-striped table-bordered table-hover">
					<th>번호</th>
					<th>상품평</th>
					<th>내용</th>
					<th>작성자</th>
					<th>좋아요
						<button type="button" 
								onclick=""
								class="btn btn-outline-secondary btn-sm">▼</button>
					</th>
				</tr>
				<tr>
					<td>{NO}</td>
					<td>{상품명}</td>
					<td>{내용}</td>
					<td>{이름}<br>{(ID)}</td>
					<td>{좋아요}</td>
				</tr>
				<tr>
					<td>5</td>
					<td>모헤어 울니트</td>
					<td>가격 대비 만족</td>
					<td>오유*<br>(user1)</td>
					<td>2000</td>				
				</tr>
				<tr>
					<td>2</td>
					<td>양말</td>
					<td>신축성이 좋아요</td>
					<td>이인*<br>(user2)</td>
					<td>1231</td>				
				</tr>
				<tr>
					<td>3</td>
					<td>데이브 올 블레이저</td>
					<td>품질이 좋아요</td>
					<td>길준*<br>(user3)</td>
					<td>324</td>
				</tr>
				<tr>
					<td>4</td>
					<td>모지</td>
					<td>햇빛 차단에 좋아요</td>
					<td>홍길*<br>(user4)</td>
					<td>23</td>
				</tr>
				<tr>
					<td>1</td>
					<td>신발</td>
					<td>튼튼하고 좋아요</td>
					<td>임꺽*<br>(user5)</td>
					<td>1</td>
				</tr>
			</table>
			<!-- //게시판 리스트 끝 -->

		</div>
		<!-- //게시판 전체 wrap 끝 -->
		
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