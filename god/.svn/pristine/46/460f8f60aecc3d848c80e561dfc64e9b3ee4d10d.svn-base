<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 FAQ</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_board_faq.css">

<script>
function search() {
    
   $("#page").val("1");
   // alert(""+$("#page").val());
   document.getElementById('searchProc').submit();
}
</script>


</head>
<body>

<%-- <div>
	pageVO : ${pageVO} <br>
	rootPath : ${rootPath} <br>
	pageVO.page : ${pageVO.page} <br>
	pageVO.startPage : ${pageVO.startPage} <br>
	pageVO.endPage : ${pageVO.endPage} <br>
	pageVO.maxPage : ${pageVO.maxPage}
</div> --%>

<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>

	<!-- 우측 본문 -->
	<div id="container">

		<!-- 현재창 title -->
		<header>
			<b>| FAQ</b>
		</header>

			<c:if test="${not empty articleFaqList && pageVO.faqListCount > 0}">
			
				<!-- 게시판 전체 wrap -->
				<div id="board_wrap">
	
					<!-- 게시판 리스트 시작 -->
					<table id="board_list">
					
						<colgroup>
							<col width=10%/>
							<col width=60%/>
							<col width=20%/>
							<col width=10%/>
						</colgroup>
					
						<tr class="table table-striped table-bordered table-hover">
							<th>NO</th>
							<th>SUBJECT</th>
							<th>WRITER</th>
							<th>VIEW</th>
						</tr>
						
						<c:forEach var="article" items="${articleFaqList}" varStatus="st">
						
							<tr>
								<td>${article.faqId}</td>
								<td style="padding: 0 40px; text-align: left;">
									<%-- <a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${article.faqId}"> --%>
									<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${article.faqId}">
										${article.faqTitle}
									</a>
								</td>
								<td>${article.memberId}</td>
								<td id="faqReadCount_${article.faqId}">
									${article.faqReadCount}
								</td>
							</tr>
							
						</c:forEach>
					</table>
					<!-- //게시판 리스트 끝 -->
				</div>
					
				<!-- 글쓰기 버튼 -->
				<div class="write_btn">
					<button type="button" 
							id="writeBtn"
							class="btn btn-outline-secondary btn-sm" 
							onclick="location.href='${rootPath}/admin/admin_board_write.do'"
							style="width: 80px;">글쓰기</button>
				</div>
				<!-- //글쓰기 버튼 끝 -->
		
		        <!-- 페이징 시작 -->
				<!-- 페이징 모듈 외장화 -->
				<c:if test="${search_YN != 'search'}">
					<%@ include file="paging/faq_paging.jspf" %>
				</c:if>
				<c:if test="${search_YN == 'search'}">
					<%@ include file="paging/faq_paging_search.jspf" %>
				</c:if>
				<!-- 페이징 끝 -->
			
			</c:if>
			
			<!-- 등록글 없을 경우 -->
			<c:if test="${empty articleFaqList || pageVO.faqListCount==0}">
	
				<div id="boardEmptyArea">등록된 글이 없습니다.</div>
				
				<!-- 글쓰기 버튼 -->
				<div class="write_btn">
					<button type="button" 
							id="writeBtn"
							class="btn btn-outline-secondary btn-sm" 
							onclick="location.href='${rootPath}/admin/admin_board_write.do'"
							style="width: 80px;">글쓰기</button>
				</div>
				<!-- //글쓰기 버튼 끝 -->
	
			</c:if>
	
			<!-- 검색 시작  -->
			<form method="post" id="searchProc"
				  action="${rootPath}/admin/faqListbySearch.do">
	
				<!-- 게시판 검색 선택(select) 박스 -->
				<div id="faq_search_menu">
				
					<input type="hidden" id="page" name="page" value="${pageVO.page}"/>
		
					<select id="search_date" name="search_date" class="select_box">
						<option>전체</option>
						<option>일주일</option>
						<option>한달</option>
						<option>세달</option>
					</select>
					<select id="search_kind" name="search_kind" class="select_box">
						<option>제목</option>
						<option>내용</option>
						<option>아이디</option>
					</select> 
					
					<input type="text"
						   id="search_word"
						   name="search_word"
						   style="width: 200px; height: 30px; font-size: 10pt;"
						   placeholder=""
						   required
						   title="검색어를 입력해주세요.">
						   
					<button type="submit"
							id="search_board_btn"
							class="btn btn-outline-secondary btn-sm"
							onclick="search()"
							style="width: 80px; margin-left: 5px;">찾기</button>
				</div>
				<!-- //게시판 검색 선택(select) 박스 끝 -->
			
			</form>

	</div>
	<!-- //게시판 우측 본문 끝 -->

</div>
<!-- //게시판 끝 -->

</body>
</html>
