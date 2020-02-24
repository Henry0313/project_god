<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 상품 등록</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_product_regi.css">

<script>

//카테고리 선택 셀렉트 박스에 데이터 넣기
$(document).ready(function(){
	
	//ProductListController에서 데이터 받기
	var jsonData = JSON.parse('${categoryList}');
	console.log(jsonData);
	
	var cateList1 = new Array();
	var cateObj1 = new Object();
	
	//1차 카테고리 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	
		if(jsonData[i].cateLev == "0") {
			cateObj1 = new Object();  //초기화
			cateObj1.cateCode = jsonData[i].cateCode;
			cateObj1.cateName = jsonData[i].cateName;
			cateList1.push(cateObj1);
		}
	}
	
	//1차 카테고리 셀렉트 박스에 데이터 삽입
	var cateSelect1 = $("select.category1")
	
	for(var i = 0; i < cateList1.length; i++) {
		cateSelect1.append("<option value='" + cateList1[i].cateCode + "'>"
	   						+ cateList1[i].cateName + "</option>"); 
	}
	
	$(document).on("change", "select.category1", function(){

		var cateList2 = new Array();
		var cateObj2 = new Object();
		 
		// 2차 카테고리 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		  
			if(jsonData[i].cateLev == "1") {
				cateObj2 = new Object();  //초기화
				cateObj2.cateCode = jsonData[i].cateCode;
				cateObj2.cateName = jsonData[i].cateName;
				cateObj2.cateRef = jsonData[i].cateRef;
				
				cateList2.push(cateObj2);
			}
		}
		 
		//2차 카테고리 셀렉트 박스에 데이터 삽입
		var cateSelect2 = $("select.category2");

		/* for(var i = 0; i < cateList2.length; i++) {
			cateSelect2.append("<option value='" + cateList2[i].cateCode + "'>"
	      					   + cateList2[i].cateName + "</option>");
		}  */
		cateSelect2.children().remove();

		$("option:selected", this).each(function(){
		  
		    var selectVal = $(this).val();
		    
		    cateSelect2.append("<option value='" + selectVal + "'>2차 카테고리 전체</option>");
		  
		    for(var i = 0; i < cateList2.length; i++) {
		    	if(selectVal == cateList2[i].cateRef) {
		    		cateSelect2.append("<option value='" + cateList2[i].cateCode + "'>"
		         						+ cateList2[i].cateName + "</option>");
		    	}
		  	}
		});
	});
});


$(function() {
    
    var count1 = 0;
 
    $("#addColorBtn").click(function() {
 
        var newContent = '<div id="row_' + count1 + '" style="margin-bottom: 10px;">' +
							 '<input type="text" id="productColor" name="productColor" placeholder="ex) red" style="width: 100px; height: 30px; margin-right: 5px; padding-left: 5px; font-size: 10pt;">' +
						     '<button id="deleteColorBtn' + (count1++) + '"' +
						    		 'name="deleteColorBtn"' +
									 'type="button"' +
						    		 'class="btn-outline-secondary btn-sm"' +
						    		 'style="width: 100px; height: 30px; margin: 0 20px; font-size: 10pt;">항목 삭제</button>' +
						 '</div>';
        $("div[id=forms1]:last-child").append(newContent);
    });
	
	$("div").on('click', 'button[id^=deleteColorBtn]' , function(e) {
		 
	    var id = e.currentTarget.id;

	    var targetId = "row_"+id.substring("deleteColorBtn".length, id.length);
	    $("div[id=forms1] div[id="+targetId+"]").remove();
	});
	
    var count2 = 0;
    
    $("#addSizeBtn").click(function() {
 
        var newContent = '<div id="row_' + count2 + '" style="margin-bottom: 10px;">' +
							 '<input type="text" id="productSize" name="productSize" placeholder="ex) 95" style="width: 100px; height: 30px; margin-right: 5px; padding-left: 5px; font-size: 10pt;">' +
						     '<button id="deleteSizeBtn' + (count2++) + '"' +
						    		 'name="deletesizeBtn"' +
									 'type="button"' +
						    		 'class="btn-outline-secondary btn-sm"' +
						    		 'style="width: 100px; height: 30px; margin: 0 20px; font-size: 10pt;">항목 삭제</button>' +
						 '</div>';
        $("div[id=forms2]:last-child").append(newContent);
    });
	
	$("div").on('click', 'button[id^=deleteSizeBtn]' , function(e) {
		 
	    var id = e.currentTarget.id;

	    var targetId = "row_"+id.substring("deleteSizeBtn".length, id.length);
	    $("div[id=forms2] div[id="+targetId+"]").remove();
	});

})

// 에디터
$(document).ready(function() {
  $('#productContent').summernote({
      height: 200,
  });
});
</script>
<script>
$(document).ready(function() {
	$("#regiBtn").click(function() {
		var name = $("#productName").val();
		var content = $("#productContent").val();
		if (name == "") {
			alert("제목을 입력하세요.");
			document.regiForm.productName.focus();
			return;
		}
		if (content == "") {
			alert("내용을 입력하세요.");
			document.regiForm.productContent.focus();
			return;
		}
		document.regiForm.action="${rootPath}/admin/product_regi_proc.do";
		document.regiForm.submit();
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
            | 상품 등록
        </header>

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 상품 정보 입력
        </div>

		<form:form id="regiForm"
			  	   name="regiForm"
			  	   method="post"
			  	   modelAttribute="productDTO"
			  	   enctype="multipart/form-data">
		
	        <div>
				<!-- 카테고리 선택 -->
				<!-- 1차 카테고리 -->
	            <select class="category1" style="width: 180px; height: 30px;">
	                <option value="">1차 카테고리 선택</option>
	            </select>&nbsp;&nbsp;
	   			<!-- 2차 카테고리 -->
	            <select class="category2" name="cateCode" style="width: 180px; height: 30px;">
	                <option value="">2차 카테고리 선택</option>
	            </select>
	            
	            <!-- 상품명 입력 -->
	            <input type="text"
	            	   id="productName"
	            	   name="productName" 
	            	   placeholder="상품명을 입력하세요." 
	            	   style="width: 400px; margin-left: 10px;">
	        </div>
	
	        <!-- 상품 정보 입력 폼 -->
	        <table id="info_input_tbl">
	            <colgroup>
	                <col width=15%>
	            </colgroup>
	            <tr>
	            	<!-- 판매가격 -->
	                <td class="tbl1">
	                    <span style="color: red;">*</span> 판매 가격
	                </td>
	                <td>
	                    <input type="text" 
	                    	   id="productPrice2"
	                    	   name="productPrice2"
	                    	   style="width: 100px;"> 원
	                </td>
	                <!-- 원가 -->
	                <td class="tbl1" style="padding: 0 30px;">
						원가
	                </td>
	                <td>
	                    <input type="text" 
	                    	   id="productPrice1"
	                    	   name="productPrice1"
	                    	   style="width: 100px;"> 원
	                </td>
	                <!-- 상품재고 -->
	                <td class="tbl1">
						현재 재고
	                </td>
	                <td style="border-right: none;">
	                    <input type="text" 
	                    	   id="productQuan"
	                    	   name="productQuan"
	                    	   style="width: 100px;"> 개
	                </td>
	            </tr>
	            <tr>
	                <td class="tbl1">
	                    <span style="color: red;">*</span> 배송비
	                </td>
	                <td class="tbl2" colspan="5" style="border-right: none; padding-top: 20px;">
	                    <label for="basic_d">
	                        <input type="radio" 
	                        	   id="productDeliveryFee" 
	                        	   name="productDeliveryFee"
	                        	   value="Y">
								&nbsp;&nbsp;기본 배송비 적용
	                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <label for="free_d">
	                        <input type="radio" 
	                        	   id="productDeliveryFee" 
	                        	   name="productDeliveryFee"
	                        	   value="N">
								&nbsp;&nbsp;무료 배송
	                    </label>
	                </td>
	            </tr>
	            <tr>
	                <td class="tbl1">
	                    <span style="color: red;">*</span> 옵션
	                </td>
	                <td class="tbl2" colspan="5" style="border-right: none;">
	                    <!-- 색상 -->
	                    <div style="height: 40px;">
	                        <div style="float: left; width: 10%; padding: 5px 0 0 10px; font-size: 10pt; text-align: center">
	                        	색상&nbsp;
	                        </div>
	                        <div style="float: left; width: 15%; height: 30px; font-size: 10pt;">
		                        <button id="addColorBtn"
		                        		name="addColorBtn"
		                        		type="button" 
		                        		class="btn-outline-secondary btn-sm"
		                        		style="width: 100px; height: 30px; font-size: 10pt;">항목 추가</button>
		                    </div> <br>
	                    </div>
	                    <div>
	                        <!-- 폼 추가되는 곳 -->
	       					<div id="forms1" style="padding: 0 10%;"></div>
	                    </div>
	                    
	                    <div style="width: 100%; height: 30px;">
	                    </div>
	                    
	                    <!-- 사이즈 -->
	                    <div style="height: 40px;">
	                        <div style="float: left; width: 10%; padding: 5px 0 0 10px; font-size: 10pt; text-align: center">
	                        	사이즈&nbsp;
	                        </div>
	                        <div style="float: left; width: 15%; height: 30px; font-size: 10pt;">
		                        <button id="addSizeBtn"
		                        		name="addSizeBtn"
		                        		type="button" 
		                        		class="btn-outline-secondary btn-sm"
		                        		style="width: 100px; height: 30px; font-size: 10pt;">항목 추가</button>
		                    </div> <br>
	                    </div>
	                    <div>
	                        <!-- 폼 추가되는 곳 -->
	       					<div id="forms2" style="padding: 0 10%;"></div>
	                    </div>
	                </td>
	            </tr>
	        </table>
	        <!-- //상품 정보 입력 폼 -->
	
	        <!-- 이미지 업로드 폼 -->
	        <div id="image_upload_tbl">
	            <div style="display: table-row; width: 100%;">
	                <div class="image_cell1">
	                    <span style="color: red;">*</span> 상품 대표 이미지<br>600*600
	                </div>
	                <div class="image_cell2">
						<input type="file" 
							   id="productImg" 
							   name="productImg"
							   class="form-control" 
							   title="첨부 파일을 입력하십시오"
							   style="height:50px; padding-top: 9px" />
	                </div>
	            </div>
	            <div style="display: table-row; width: 100%;">
	                <div class="image_cell1">
	                    <span style="color: red;">*</span> 리스트 이미지<br>480*620
	                </div>
	                <div class="image_cell2">
						<input type="file" 
							   id="productListImg" 
							   name="productListImg"
							   class="form-control" 
							   title="첨부 파일을 입력하십시오"
							   style="height:50px; padding-top: 9px" />
	                </div>
	            </div>
	        </div>
	
	        <!-- 상품 상세 정보 -->
	        <div style="margin-bottom: 30px;">
	            <div class="sub_title">
	                - 상품 상세 정보
	            </div>
	
	            <!-- 에디터 -->
	            <div class="summernote">
		            <textarea id="productContent" name="productContent"></textarea>
	            </div>
	        </div>
	
	        <!-- 상품 노출 여부 -->
	        <div style="margin: 10px 0;">
	            <span style="color: red;">*</span> 상품 노출 여부 &nbsp;&nbsp;: &nbsp;&nbsp;
	            <label for="disp">
	                <input type="radio" 
	                	   id="productInfo" 
	                	   name="productInfo" 
	                	   value="D"
	                	   checked> 진열
	            </label>&nbsp;&nbsp;&nbsp;&nbsp;
	            <label for="hid">
	                <input type="radio" 
	                	   id="productInfo" 
	                	   name="productInfo" 
	                	   value="H"> 숨김
	            </label>&nbsp;&nbsp;&nbsp;&nbsp;
	            <label for="sold_out">
					<input type="radio" 
	                	   id="productInfo" 
	                	   name="productInfo" 
	                	   value="S"> 품절
	            </label>
	        </div>
		
			<!-- 등록/취소 버튼 -->
	        <div style="width: 100%; text-align: center;">
				<input type="submit"
					   id="regiBtn"
					   class="btn btn-outline-secondary btn-sm"
					   value="등록" 
					   style="width: 50px; margin-right: 20px;">
				<button id=""
						type="button" 
						class="btn btn-outline-secondary btn-sm" 
						onclick=""
						style="width: 50px;">취소</button>
	        </div>
	        
		</form:form>
	
    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>