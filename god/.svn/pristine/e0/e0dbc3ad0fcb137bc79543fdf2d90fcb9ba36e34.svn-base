<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 수정</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_product_update.css">

<script>
// 작성안한 필드 점검 후 수정
$(document).ready(function() {
	$("#update_product_btn").click(function() {
		
		var code = $("#cateCode").val();
		var name = $("#productName").val();
		var price = $("#productPrice2").val();
		var color = $("#productColor").val();
		var size = $("#productSize").val();
		var quan = $("#productQuan").val();
		var content = $("#productContent").val();
		var info = $("#productInfo").val();
		var delivery = $("#productDeliveryFee").val();
		
		if (code == "") {
			alert("카테고리 코드를 입력하세요.");
			document.viewForm.cateCode.focus();
			return false;
		}
		if (name == "") {
			alert("상품명을 입력하세요.");
			document.viewForm.productName.focus();
			return false;
		}
		if (price == "") {
			("상품 판매 가격을 입력하세요.");
			document.viewForm.productPrice2.focus();
			return false;
		}
		if (color == "") {
			alert("상품 색상을 입력하세요.");
			document.viewForm.productColor.focus();
			return false;
		}
		if (size == "") {
			alert("상품 사이즈를 입력하세요.");
			document.viewForm.productSize.focus();
			return false;
		}
		if (quan == "") {
			alert("상품 재고 수량을 입력하세요.");
			document.viewForm.productQuan.focus();
			return false;
		}
		if (content == "") {
			alert("상품 설명을 입력하세요.");
			document.viewForm.productContent.focus();
			return false;
		}
		if (info == "") {
			alert("상품 진열 여부를 입력하세요.");
			document.viewForm.productInfo.focus();
			return false;
		}
		if (delivery == "") {
			alert("배송비 여부를 입력하세요.");
			document.viewForm.productDeliveryFee.focus();
			return false;
		}
		document.viewForm.action="${rootPath}/admin/update_product.do";
		document.viewForm.submit();
	});
});
</script>

</head>
<body>
<div id="wrap">
    <!-- 좌측 메뉴 -->
    <%@ include file="/resources/common/admin/product_left.jsp" %>

    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            <b>| 상품 수정</b>
        </header>
		
		<!-- Form -->
		<form id="viewForm" name="viewForm" method="post">
		
			<!-- 상품번호 (hidden) -->
			<input type="hidden" name="productId" value="${result.productId}" />
			
			<!-- 상품 컨텐츠 -->
			<div id="content_wrap">
			
				<!-- 상품 이미지 -->
				<div id="product_img">
					<div style="margin-top: 15px; text-align: center;">상품 이미지</div>
					<img src="${rootPath}/resources/image/${result.productImg}"
						 style="width: 100%;
						 		margin: 20px 0;
						 		padding: 10px;">
					
					<!-- 이미지 업로드 폼 -->
			        <div id="image_upload_tbl">
			            <div style="display: table-row; width: 100%;">
			                <div class="image_cell1">
			                    대표<br>이미지
			                </div>
			                <div class="image_cell2">
								<input type="file" 
									   id="productImg" 
									   class="form-control" 
									   title="첨부 파일을 입력하십시오" />
								<div style="text-align: center;">기존 이미지 : ${result.productImg}</div>
								
			                </div>
			            </div>
			            <div style="display: table-row; width: 100%;">
			                <div class="image_cell1">
			                    리스트<br>이미지
			                </div>
			                <div class="image_cell2">
								<input type="file" 
									   id="productListImg" 
									   class="form-control" 
									   title="첨부 파일을 입력하십시오" />
								<div style="text-align: center;">기존 이미지 : ${result.productListImg}</div>
			                </div>
			            </div>
			        </div>
				</div>
				
				<!-- 상품 정보 영역 -->
				<table id="content">
				
					<colgroup>
						<col width=40% />
						<col width=60% />
					</colgroup>
					
					<!-- 카테고리 코드 -->
					<tr>
						<td class="p_title">카테고리 코드</td>
						<td class="p_content">
							<input type="text"
								   id="cateCode"
								   name="cateCode"
								   value="${result.cateCode}" />
						</td>
					</tr>
				
					<!-- 상품명 -->
					<tr>
						<td class="p_title">상품명</td>
						<td class="p_content">
							<input type="text"
								   id="productName"
								   name="productName"
								   value="${result.productName}" />
						</td>
					</tr>
					
					<!-- 상품 판매 가격 -->
					<tr>
						<td class="p_title">PRICE</td>
						<td class="p_content">
							<input type="text"
								   id="productPrice2"
								   name="productPrice2"
								   value="${result.productPrice2}" />
						</td>
					</tr>
					
					<!-- 상품 색상 -->
					<tr>
						<td class="p_title">색상</td>
						<td class="p_content">
							<input type="text"
								   id="productColor"
								   name="productColor"
								   value="${result.productColor}" />
						</td>
					</tr>
					
					<!-- 상품 사이즈 -->
					<tr>
						<td class="p_title">사이즈</td>
						<td class="p_content">
							<input type="text"
								   id="productSize"
								   name="productSize"
								   value="${result.productSize}" />
						</td>
					</tr>
						
					<!-- 상품 재고 수량 -->
					<tr>
						<td class="p_title">상품 재고 수량</td>
						<td class="p_content">
							<input type="text"
								   id="productQuan"
								   name="productQuan"
								   value="${result.productQuan}" />
						</td>
					</tr>
					
					<!-- 상품 설명 -->
					<tr>
						<td class="p_title">상품 설명</td>
						<td class="p_content">
							<textarea id="productContent" name="productContent">${result.productContent}</textarea>
						</td>
					</tr>
					
					<!-- 상품 진열 여부 -->
					<tr>
						<td class="p_title">상품 진열 여부<br>
							<span style="font-size: 9pt;">(진열 : D / 숨김 : H / 품절 : S)</span>
						</td>
						<td class="p_content">
							<input type="text" name="productInfo" value="${result.productInfo}" />
						</td>
					</tr>
					
					<!-- 상품 배송비 여부 -->
					<tr>
						<td class="p_title">상품 배송비 여부<br>
							<span style="font-size: 9pt;">(기본-2500원 : Y / 무료 : N)</span>
						</td>
						<td class="p_content"><input type="text" name="productDeliveryFee" value="${result.productDeliveryFee}" /></td>
					</tr>
				</table>
			</div>
			
			<!-- 리스트 버튼 -->
			<div style="float: left; width: 50%; text-align: left;">
				<button type="button"
						id="list_btn"
						onclick="location.href='${rootPath}/admin/admin_product_list.do/1'"
						class="btn btn-outline-dark"
						style="width: 100px;">LIST</button>
			</div>
			
			<!-- 수정 버튼 -->
			<div style="float: right; width: 50%; text-align: right;">
				<button id="update_product_btn"
						class="update_btn btn btn-outline-dark"
						style="width: 100px;">수정 완료</button>
			</div>
			
		</form>

    </div>
</div>
</body>
</html>