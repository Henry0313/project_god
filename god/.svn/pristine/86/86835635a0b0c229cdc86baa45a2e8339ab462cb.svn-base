<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 Q&A-상품문의 글 확인 Proc</title>

<!-- contextPath --> 
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<%-- <link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_qna_product.css"> --%>

<style>

</style>

<script>
$(function() {  

	// 비밀번호 비교 점검 플래그
	var pwCheckFlag = false;
	
	// PW 확인점검
	$("#pwCheckConfirm").click(function() {

		console.log("비밀번호 비교점검");

		var regexPwCheck = new RegExp($("#qnaProductPwCheck").attr("pattern"));

		var qnaProductPwCheck = $("#qnaProductPwCheck").val();

		console.log("qnaProductId : " + $('#qnaProductId').val());
		console.log("qnaProductPw : " + $('#qnaProductPw').val());
		console.log("qnaProductPwCheck : " + $('#qnaProductPwCheck').val());

		if (regexPwCheck.test(qnaProductPwCheck)) { // 정규식 점검 통과

			$.ajax({
				// 주의사항) 외장화할 경우 코드 단절현상으로 인해 문제 발생 -> 광역 javascript 변수로 패치
				url : rootPath + '/board/qna_product_pw_proc.do',
				type : 'post',
				dataType : 'text',
				data : {
					qnaProductId : $('#qnaProductId').val(),
					qnaProductPw : $('#qnaProductPwCheck').val()
				},
				success : function(data) {

					// console.log("qnaProductId : " +$('#qnaProductId').val());
					// console.log("qnaProductPw : " +$('#qnaProductPw').val());
					
					console.log("비밀번호 비교점검 수신 !");
					console.log("data :" + data);
					
					// alert(data);

					var qnaProductPwCheck = $('#qnaProductPwCheck').val();
					// alert("qnaProductPwCheck : "+qnaProductPwCheck);
					
					if (data.trim()=="입력한 비밀번호가 일치합니다") {
						// alert("비밀번호가 일치합니다");
						$("#qnaProductPwCheck_err").text("비밀번호가 일치합니다");
						pwCheckFlag = true;
						location.href= rootPath + "/board/qna_product_detail.do?qnaProductId=" + $('#qnaProductId').val();
					}
					else if(qnaProductPwCheck=="") {
						// alert("비밀번호를 입력하세요");
						$("#qnaProductPwCheck_err").text("비밀번호를 입력하세요");
					}
					else if (data.trim()!="입력한 비밀번호가 일치합니다") { // 패스워드가 불일치 할 경우
						
						// alert("비밀번호가 일치하지 않습니다");
						$("#qnaProductPwCheck_err").text("비밀번호가 일치하지 않습니다");
						$("#qnaProductPwCheck").focus();
					} // else 
						
					// 플래그 인쇄
					console.log("pwCheckFlag : " + pwCheckFlag);

				}, // success

				error : function(xhr, status) {
					console.log(xhr + " : " + status); // 에러 코드
				}

			}); // ajax 

		} else { // 정규식 통과 실패

			// 에러 메시징
			// $("#qnaProductPwCheck_err").text(($("#qnaProductPwCheck").attr("title")));
			pwCheckFlag = false;
			// 재입력 대기
			$("#qnaProductPwCheck").focus();

		} //

	});  // PW 확인점검 끝

});
</script>

</head>
<body>

	<!-- 패쓰워드 인자 -->
	<%-- qnaProductPw : ${defaultQnaProductVO.qnaProductPw}<br> --%>

	<div id="wrap">
	
		<div style="float: left; width: 20%; height: 700px;">
		</div>
	
		<form id="pwCheckhProc" name="pwCheckProc" action="${rootPath}/board/qna_product_pw_proc.do" method="POST" style="float:left; width: 60%; margin-bottom: 200px;">
			
			<!-- 상품 ID -->
			<input type="hidden" id="qnaProductId" name="qnaProductId" value="${defaultQnaProductVO.qnaProductId}">
			<!-- 상품 PW -->
			<input type="hidden" id="qnaProductPw" name="qnaProductPw" value="${defaultQnaProductVO.qnaProductPw}">
			
			<div id="check_top" style="width: 100%; height: 50px; margin: 100px auto 50px auto; text-align: center;">
				<h4><b>상품문의</b></h4>
			</div>
			
			<div id="check_content" style="width: 100%; height: 300px; margin-bottom: 50px; padding: 50px auto 0 auto; border: 1px solid rgb(141,141,141); text-align: center;">
				
				<h5 style="padding-top: 30px;"><b>비밀글 보기</b></h5>
				
				<!-- 글번호 -->
				<input type="hidden" name="qnaProductId" value="" />
				
				<div id="content_box" style="width: 100%; height: 40px; margin: 30px auto; font-size: 10pt">
					이 글은 비밀글입니다. <span style="color: red;"><b>비밀번호를 입력하여 주세요.</b></span>
				</div>
				
				<div id="pw_fld" style=" width: 100%; height: 40px; font-size: 10pt">
					▶ 비밀번호&nbsp;
					<input type="text"
						   id="qnaProductPwCheck"
						   name="qnaProductPwCheck"
						   style="width: 200px; height: 25px; font-size: 10pt;"
						   placeholder=""
						   required
						   title="비밀번호를 입력하세요">
				</div>
				
				<div style="width: 100%; height: 30px;">
				<!-- PwCheck 에러 메세지  -->  
				<span id="qnaProductPwCheck_err" style="color: red;"></span>
				</div>
				
				<div id="button_fld" style=" width: 100%; height: 50px;">
					<button type="button"
							id="qnaProductList"
							name="qnaProductList"
							onclick="location.href='${rootPath}/board/qna_product.do/1'"
							class="btn btn-outline-secondary btn-sm" 
							style="width: 80px;">목록</button>
					<button type="button"
							id="pwCheckConfirm"
							name="pwCheckConfirm"
							class="btn btn-outline-secondary btn-sm"
							style="width: 80px; margin-left: 5px;">확인</button>
				</div>
				
			</div>
			
		</form>
		
		<div style="float: left; width: 20%; height: 700px;">
		</div>
		
	</div>
	
</body>
</html>