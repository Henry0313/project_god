<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BEST REVIEW</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp"%>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/credit_etc.css">

</head>

<body>

	<!-- 게시판 시작 -->
	<div id="wrap">

		<!-- 좌측 메뉴 -->
		<%@ include file="/resources/common/member/board_left.jsp" %>

		<!-- 게시판 우측 본문 시작 -->
		<div id="container">
			<header>
				&nbsp;&nbsp;<strong>| Q&A &gt; 입금/기타 문의</strong><br> <br>
				&nbsp;&nbsp;<strong>| 입금/기타 문의</strong>
			</header>

			<!-- 게시판 전체 wrap -->
			<div id="board_wrap">

				<!-- 게시판 리스트 시작 -->
				<table id="board_list"
					class="table table-striped table-bordered table-hover">
					<tr>
						<th>NO</th>
						<th>SUBJECT</th>
						<th>WRITER</th>
						<th>DATE</th>
					</tr>
					<tr>
						<td><h6><span class="badge badge-secondary">공지</span></h6></td>
						<td><a href="#">입금 확인이 안될 경우</a></td>
						<td>GetOutDoor</td>
						<td>2017-04-21</td>
					</tr>
					<tr>
						<td><h6><span class="badge badge-secondary">공지</span></h6></td>
						<td><a href="#">입금시 입금자명에 고객님 성함 기재 부탁드립니다.</a></td>
						<td>GetOutDoor</td>
						<td>2017-05-19</td>
					</tr>
					<tr>
						<td>76420</td>
						<td><a href="${rootPath}/board/credit_etc_detail.do">GetOutDoor 입금/기타문의</a></td>
						<td>윤XXXX</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>76419</td>
						<td><a href="#">GetOutDoor 입금/기타문의</a></td>
						<td>오XXXX</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>76418</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>76417</td>
						<td><a href="#">GetOutDoor 입금/기타문의</a></td>
						<td>임XXXX</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>76416</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>76415</td>
						<td><a href="#">GetOutDoor 입금/기타문의</a></td>
						<td>윤XXXX</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>76414</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>76413</td>
						<td><a href="#">GetOutDoor 입금/기타문의</a></td>
						<td>장XXXX</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>76412</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>76411</td>
						<td><a href="#">GetOutDoor 입금/기타문의</a></td>
						<td>강XXXX</td>
						<td>2020-01-05</td>
					</tr>
					<tr>
						<td>76410</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-05</td>
					</tr>
					<tr>
						<td>76409</td>
						<td><a href="#">GetOutDoor 입금/기타문의</a></td>
						<td>김XXXX</td>
						<td>2020-01-03</td>
					</tr>
					<tr>
						<td>76408</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-03</td>
					</tr>
				</table>
				<!-- //게시판 리스트 끝 -->

			</div>
			<!-- //게시판 전체 wrap 끝 -->

			<!-- 하단 버튼 -->
			<button type="button"
					class="btn btn-outline-secondary btn-sm"
					onclick="location.href='${rootPath}/board/board_write.do'"
					style="float: right; width: 60px; text-align: right;">WRITE</button>

			<!-- 게시판 페이징 시작 -->
			<div id="board_paging">
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
			<!-- //게시판 페이징 끝 -->
			
		</div>
		<!-- //게시판 우측 본문 끝 -->

	</div>
	<!-- //게시판 끝 -->

</body>
</html>
