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
<link rel="stylesheet" href="${rootPath}/resources/css/member/deliver.css">

</head>

<body>

	<!-- 게시판 시작 -->
	<div id="wrap">
			
		<!-- 좌측 메뉴 -->
		<%@ include file="/resources/common/member/board_left.jsp" %>

		<!-- 게시판 우측 본문 시작 -->
		<div id="container">
			<header>
				&nbsp;&nbsp;<strong>| Q&A &gt; 배송 문의</strong><br>
				<br>
				&nbsp;&nbsp;<strong>| 배송 문의</strong>
			</header>
		
			<!-- 게시판 전체 wrap -->
			<div id="board_wrap">
				
				<!-- 게시판 리스트 시작 -->
				<table id="board_list" class="table table-striped table-bordered table-hover">
					<tr>						
						<th>NO</th>
						<th>SUBJECT</th>
						<th>WRITER</th>
						<th>DATE</th>
					</tr>
					<tr>
						<td><h6><span class="badge badge-secondary">공지</span></h6></td>
						<td><a href="#">주문번호 구매자명 연락처는 꼭 같이 기재 부탁드립니다.</a></td>
						<td>GetOutDoor</td>
						<td>2017-04-21</td>
					</tr>
					<tr>
						<td><h6><span class="badge badge-secondary">공지</span></h6></td>
						<td><a href="#">당일배송상품 제외 모든 상품은 2일정도 소요되시는 점 참고부탁드립니다.</a></td>
						<td>GetOutDoor</td>
						<td>2017-05-19</td>
					</tr>
					<tr>
						<td>234895</td>
						<td><a href="#">GetOutDoor 배송문의</a></td>
						<td>윤XXXX</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>234894</td>
						<td><a href="${rootPath}/board/deliver_detail.do">GetOutDoor 배송문의</a></td>
						<td>오XXXX</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>234893</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>234892</td>
						<td><a href="#">GetOutDoor 배송문의</a></td>
						<td>임XXXX</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>234891</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-07</td>
					</tr>
					<tr>
						<td>234890</td>
						<td><a href="#">GetOutDoor 배송문의</a></td>
						<td>윤XXXX</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>234889</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>234888</td>
						<td><a href="#">GetOutDoor 배송문의</a></td>
						<td>장XXXX</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>234887</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-06</td>
					</tr>
					<tr>
						<td>234886</td>
						<td><a href="#">GetOutDoor 배송문의</a></td>
						<td>강XXXX</td>
						<td>2020-01-05</td>
					</tr>
					<tr>
						<td>234885</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-05</td>
					</tr>
					<tr>
						<td>234884</td>
						<td><a href="#">GetOutDoor 배송문의</a></td>
						<td>김XXXX</td>
						<td>2020-01-03</td>
					</tr>
					<tr>
						<td>234883</td>
						<td><span class="badge badge-secondary">RE</span><a href="#">&nbsp;&nbsp;감사합니다 문의에 대한 답변입니다.</a></td>
						<td>GetOutDoor</td>
						<td>2020-01-03</td>
					</tr>
				</table>
				<!-- //게시판 리스트 끝 -->
				
			</div>	
			<!-- //게시판 전체 wrap 끝 -->
			
			<!-- 하단 버튼 -->
			<button type="button" onclick=""
					class="btn btn-outline-secondary btn-sm"
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
