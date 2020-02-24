<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_main.css">

</head>
<style>

</style>
<script>
// 알림 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $(".set_btn").click(function() {
        $("#modal").show();
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
    });
    
    $(function() {
        $( "#toDate" ).datepicker({
            dateFormat:"yy-mm-dd"
        });
    });

});

// TODAY 날짜 표시
function autoDate () {
	var tDay = new Date();
	var tMonth = tDay.getMonth()+1;
	var tDate = tDay.getDate();
	if ( tMonth < 10) tMonth = "0"+tMonth;
	if ( tDate < 10) tDate = "0"+tDate;
	document.getElementById("tDate").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
 }

function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
	window.onload = func;
	} else {
		window.onload = function() {
			if (oldonload) {
				oldonload();
			}
			func();
		}
	}
}

addLoadEvent(function() {
	autoDate();
});
// TODAY 날짜 표시 끝
 
function dDay () {
	
	document.getElementById("tDate").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
	
	document.getElementById("toDate").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
	
	var diff = Math.abs(toDate.getTime() - tDate.getTime());
	diff = Math.ceil(diff / (1000 * 3600 * 24));

	return diff;
	
}

</script>

<body>
	
	<!-- 전체 레이아웃 -->
	<div id="wrap">
		
		<!-- section 전체 레이아웃 -->
		<div id=section_wrap>
		
			<!-- section1 시작 -->
			<div id="section1">
			
				<!-- section1_left_wrap -->
				<div id="section1_left_wrap">
					
					<!-- section1_left 시작 -->
					<div id="section1_left">
					
						<!-- section1_left title -->
						<div id="section1_left_top1">
							자주 이용 메뉴
						</div>
						<div id="section1_left_top2">
							
						</div>
						<!-- // section1_left title 끝 -->
						
						<div id="section1_left_top3">
							접속중인 아이디 : <sec:authentication property="name"/>
						</div>
						
						<!-- 자주이용메뉴 클릭버튼 -->
						<div id="section1_left_middle">
							
							<div id="section1_left_middle1">
								<input type="button" id="" value="기본정책관리" class="often_btn" />
							</div>
							<div id="section1_left_middle2">
								<input type="button" id="" value="통계" class="often_btn" />
							</div>
							<div id="section1_left_middle3">
								<input type="button" id="" value="상품관리" class="often_btn" />
							</div>
						
						</div>
						<!-- // 자주이용메뉴 클릭버튼 끝 -->
						
						<!-- 만료일 -->
						<div id="section1_left_bottom">
							
							<!-- 호스팅 만료일 -->
							<div id="section1_left_bottom1">
								호스팅 만료일<br>
								- 2020-01-01<br>
								- 000일 남음
							</div>
							<!-- // 호스팅 만료일 끝 -->
							
							<!-- 만료일 설정 버튼 -->
							<div id="section1_left_bottom2">
								<input type="button"
									   id="set_btn"
									   name="set_btn"
									   title=""
									   class="set_btn">
							</div>
							<!-- // 만료일 설정 버튼 끝 -->
							
							<div style="width:25px">
							
							</div>
					
							<!-- 도메인 만료일 -->
							<div id="section1_left_bottom3">
								도메인 만료일<br>
								- 2020-01-01<br>
								- 000일 남음
							</div>
							<!-- // 도메인 만료일 끝 -->
							
							<!-- 만료일 설정 버튼 -->
							<div id="section1_left_bottom4">
								<input type="button"
									   id="set_btn"
									   name="set_btn"
									   title=""
									   class="set_btn">
							</div>
							<!-- // 만료일 설정 버튼 끝 -->
							
						</div>
						<!-- // 만료일 끝 -->
						
					</div>
					<!-- // section1_left 끝 -->
					
				</div>
				<!-- // section1_left_wrap 끝-->
				
				<div style="width:25px; height:360px">
					
				</div>
			
				<!-- section1_center_wrap 시작 -->
				<div id="section1_center_wrap">	
					
					<!-- section1_center 시작 -->
					<div id="section1_center">
						
						<!-- section1_center title -->
						<div id="section1_center_top1">
							<span>TODAY 현황</span>&nbsp;(<input type="text" id="tDate" class="today_date">)
						</div>
						<div id="section1_center_top2" style="">
							
						</div>
						<!-- // section1_center title 끝 -->
						
						<!-- 회원 가입 수 -->
						<div id="section1_box">
							<div id="section1_box_title">
								회원 가입 수
							</div>		
							<div id="section1_box_content">
								(000)명
							</div>					
						</div>
						<!-- // 회원 가입 수 끝 -->
						
						<div style="float:left; width:20px; height:90px">
						
						</div>
						
						<!-- 회원 탈퇴 수 -->
						<div id="section1_box">
							<div id="section1_box_title">
								회원 탈퇴 수
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 회원 탈퇴 수 끝 -->
						
						<div style="float:left; width:20px; height:90px">
						
						</div>
						
						<!-- 상품 등록 수 -->
						<div id="section1_box">
							<div id="section1_box_title">
								상품 등록 수
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 상품 등록 수 끝 -->
						
						<div id="section1_center_top2">
							
						</div>
						
						<!-- 페이지 뷰 -->
						<div id="section1_box">
							<div id="section1_box_title">
								페이지 뷰
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 페이지 뷰 끝 -->
						
						<div style="float:left; width:20px; height:90px">
						
						</div>
						
						<!-- 주문 수 -->
						<div id="section1_box">
							<div id="section1_box_title">
								주문 수
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 주문 수 끝 -->
						
						<div style="float:left; width:20px; height:90px">
						
						</div>
						
						<!-- 회원 가입 수 -->
						<div id="section1_box">
							<div id="section1_box_title">
								회원 가입 수
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 회원 가입 수 끝 -->
						
					</div>
				</div>
				<!-- // section1_center_wrap 끝 -->
					
				<div style="float:left; width:25px; height:360px">
					
				</div>
				
				<!-- section1_right_wrap 시작 -->
				<div id="section1_right_wrap">
					
					<!-- section1_right 시작 -->	
					<div id="section1_right">
						
						<!-- section1_right title -->
						<div id="section1_right_top1">
							미처리 현황
						</div>
						<div id="section1_right_top2">
							
						</div>
						<!-- // section1_right title 끝 -->
						
						<!-- 허위상품 신고 -->
						<div id="section1_box">
							<div id="section1_box_title">
								허위상품 신고
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 허위상품 신고 끝 -->
						
						<div style="float:left; width:60px; height:90px">
						
						</div>
						
						<!-- 교환/환불 신청 -->
						<div id="section1_box">
							<div id="section1_box_title">
								교환/환불 신청
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 교환/환불 신청 끝 -->
						
						<div id="section1_right_top2">
							
						</div>
						
						<!-- 1:1 문의 -->
						<div id="section1_box">
							<div id="section1_box_title">
								1:1 문의
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 1:1 문의 끝 -->
						
						<div style="float:left; width:60px; height:90px">
						
						</div>
						
						<!-- 상품 문의 -->
						<div id="section1_box">
							<div id="section1_box_title">
								상품 문의
							</div>		
							<div id="section1_box_content">
								(000)건
							</div>					
						</div>
						<!-- // 상품 문의 끝 -->
						
					</div>
				</div>
				<!-- // section1_right_wrap 끝 -->
					
			</div>
			<!-- // section1 끝 -->
			
			<!-- section2 시작 -->
			<div id="section2">
				
				<!-- section2_wrap -->
				<div id="section2_wrap">
					
					<!-- section2_left_wrap 사내 공지사항 -->
					<div id="section2_left_wrap">
						
						<!-- section2_left_top_wrap 사내공지사항, 더보기 title -->
						<div id="section2_left_top_wrap">
							
							<!-- 사내 공지사항 title -->
							<div id="section2_left_top1">
								| 사내 공지사항
							</div>
							<!-- // 사내 공지사항 title 끝 -->
							
							<!-- 사내 공지사항 더보기 버튼 -->
							<div id="section2_left_top2">
								<a href="${rootPath}/admin/admin_notice.do">[더보기]</a>&nbsp;&nbsp;
							</div>
							<!-- // 사내 공지사항 더보기 버튼 끝 -->
							
						</div>
						<!-- // section2_left_top_wrap 사내공지사항, 더보기 title 끝 -->
						
						<!-- section2_left_bottom_wrap 사내 공지사항 최신글 5개 -->
						<div id="section2_left_bottom_wrap">
						
							<!-- 게시판 리스트 시작 적용 -->
							<section id="listForm" style="width:550px; height:230px; margin:auto">
							
								<!-- <c:if test="${not empty boardList && pageVO.listCount > 0}"> -->
								
									<!-- 게시글 부분 시작 -->
									<table id="board_tbl" class="table table-striped table-hover">
										
										<tr>
												
											<!-- 게시글 제목 -->
											<td style="width:50%; text-align:left">게시글 제목</td>
											
											<!-- 작성자 아이디 -->
											<td style="width:20%; text-align:center">아이디</td>
											
											<!-- 게시글 작성일 -->
											<td style="width:30%; text-align:center">작성일</td>
											
										</tr>
									
									</table>
									<!-- // 게시글 부분 끝 -->
									
								<!-- </c:if> -->
								
							</section>
							<!-- // 게시판 리스트 끝 -->
							
						</div>
						<!-- // section2_left_bottom_wrap 사내 공지사항 최신글 5개 끝 -->
						
					</div>
					<!-- // section2_left_wrap 사내 공지사항 끝 -->
					
					<!-- section2_right_wrap 사내 웹 사이트 개선 사항 -->
					<div id="section2_right_wrap">
						
						<!-- section2_left_top_wrap 사내 웹 사이트 개선 사항, 더보기 title -->
						<div id="section2_left_top_wrap">
							
							<!-- 사내 공지사항 title -->
							<div id="section2_left_top1">
								| 사내 웹 사이트 개선 사항
							</div>
							<!-- // 사내 공지사항 title 끝 -->
							
							<!-- 사내 공지사항 더보기 버튼 -->
							<div id="section2_left_top2">
								<a href="${rootPath}/admin/admin_web_improve.do">[더보기]</a>&nbsp;&nbsp;
							</div>
							<!-- // 사내 공지사항 더보기 버튼 끝 -->
							
						</div>
						<!-- // section2_left_top_wrap 사내 웹 사이트 개선 사항, 더보기 title 끝 -->
						
						<!-- section2_left_bottom_wrap 사내 공지사항 최신글 5개 -->
						<div id="section2_left_bottom_wrap">
						
							<!-- 게시판 리스트 시작 적용 -->
							<section id="listForm" style="width:550px; height:230px; margin:auto">
							
								<!-- <c:if test="${not empty boardList && pageVO.listCount > 0}"> -->
								
									<!-- 게시글 부분 시작 -->
									<table id="board_tbl" class="table table-striped table-hover">
										
										<!-- <c:forEach var="board" items="${boardList}" varStatus="st"> -->
										
											<tr>
												
												<!-- 게시글 제목 -->
												<td style="width:50%; text-align:left">게시글 제목</td>
												
												<!-- 작성자 아이디 -->
												<td style="width:20%; text-align:center">아이디</td>
												
												<!-- 게시글 작성일 -->
												<td style="width:30%; text-align:center">작성일</td>
												
											</tr>
											
										<!-- </c:forEach> -->
									
									</table>
									<!-- // 게시글 끝 -->
								
								<!-- </c:if> -->
								
							</section>
							<!-- // 게시판 리스트 끝 -->
							
						</div>
						<!-- // section2_left_bottom_wrap 사내 공지사항 최신글 5개 끝 -->
						
					</div>
					<!-- // section2_right_wrap 사내 웹 사이트 개선 사항 끝 -->
					
				</div>
				<!-- // section2_wrap 끝 -->
				
			</div>
			<!-- // section2 끝 -->
			
			<!-- set_btn modal -->
			<div id="modal">
				<div id="modal_">
					<!-- 팝업창 제목 -->
					<div id="modal_header">
						<div style="float: left; font-size: 14pt;">| 알림설정</div>
							<a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px; color:black">
								close
							</a>
						</div>
					
					<!-- 팝업창 본문 -->
					<div id="modal_content">
						<div style="width: 100%">
							<input type="text" 
								   id="setId"
								   name="setId"
								   title=""
								   class="setId"
								   required
								   placeholder="&nbsp;타이틀을 입력하세요"
								   style="width: 100%" />
						</div>
						<div style="padding-top: 20px">
							<input id="toDate" 
								   type="text" 
								   pattern="\d{4}-\d{2}-\d{2}" 
								   style="width: 50%;
								   		  text-align: center;
								   		  border: 1px solid rgb(141,141,141);">
							<input id="diff"
								   type="text"
								   style="width:20%;
								   		  margin-left:20px" />
							<span id="diff" style="width:20%; margin-left:10px">일 남음</span>
						</div>
					</div>
            
					<!-- 팝업창 하단부 -->
					<div id="modal_footer">
						<button type="button" class="btn-secondary btn-sm" style="width: 80px;">확인</button>&nbsp;
						<button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 80px;">취소</button>
					</div>
				</div>
			</div>
			<!-- //set_btn modal 끝 -->
		
		</div>
		<!-- // section 전체 레이아웃 끝 -->
		
	</div>
</body>
</html>