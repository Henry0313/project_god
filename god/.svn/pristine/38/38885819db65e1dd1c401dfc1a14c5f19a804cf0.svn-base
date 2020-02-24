<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 상품 리스트</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_product_list.css">

<script>

// 검색
function search() {
    
   $("#page").val("1");
   // alert(""+$("#page").val());
   
   document.getElementById('searchProc').submit();
	      
}

// 상세검색열기 버튼 누르면 옵션 출력
function view() {

    var con = document.getElementById("search_detail");
    if (con.style.display == 'none') {
        con.style.display = 'block';
    } else {
        con.style.display = 'none';
    }

    var info = document.getElementById("class_info");
    if (info.style.display == 'none') {
        info.style.display = 'block';
    } else {
        info.style.display = 'none';
    }
}

// 상세검색열기 버튼 열기/닫기 변경
function change() {

    var sbtn = document.getElementById("search_detail_btn");
    if (sbtn.innerHTML == '상세검색닫기▲') {
        sbtn.innerHTML = '상세검색열기▼';
    } else {
        sbtn.innerHTML = '상세검색닫기▲';
    }
}

// 데이트피커
$(document).ready(function(){
    $( "#search_date1,#search_date2" ).datepicker({
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat:'yy-mm-dd',
    });

    $('#search_date1').datepicker("option", "maxDate", 'today'); //오늘 이전만 선택할 수 있게
    $('#search_date1').datepicker("option", "onClose", function (selectedDate){
        $("#search_date2").datepicker( "option", "minDate", selectedDate );
    });

    $('#search_date2').datepicker();
    $('#search_date2').datepicker("option", "minDate", $("#sdate").val()); //시작일 부터 선택할 수 있게
    $('#search_date2').datepicker("option", "maxDate", 'today'); //오늘까지만 선택할 수 있게

});

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
		    cateSelect2.append("<option value=''>2차 카테고리 전체</option>");
		  
		    for(var i = 0; i < cateList2.length; i++) {
			    	if(selectVal == cateList2[i].cateRef) {
			    		cateSelect2.append("<option value='" + cateList2[i].cateCode + "'>"
			         						+ cateList2[i].cateName + "</option>");
			    	}
		  	}
		});
	});
	
	// 상품 진열 상태 변경 (하단버튼)
	// 진열
	$("#dUpdateBtn").click(function(){
  		var confirm_val = confirm("진열 상태로 변경하시겠습니까?");
  
		if (confirm_val) {
			$("input[class='checkBox']:checked").each(function(){
				$('#dProductId').val($(this).attr('data-productId'));
			});
		}
		document.dForm.action="${rootPath}/admin/dUpdate_product.do";
		document.dForm.submit();
	 });
	
	// 숨김
	$("#hUpdateBtn").click(function(){
  		var confirm_val = confirm("숨김 상태로 변경하시겠습니까?");
  
		if (confirm_val) {
			$("input[class='checkBox']:checked").each(function(){
				$('#hProductId').val($(this).attr('data-productId'));
			});
		}
		document.hForm.action="${rootPath}/admin/hUpdate_product.do";
		document.hForm.submit();
	 });
});

// 상품 수정 조회
function viewProduct(productId){
    
    var form = document.getElementById("productForm");
    var url = "<c:url value='/admin/viewProduct.do'/>";
    url = url + "?productId=" + productId;
    
    form.action = url;
    form.submit(); 
}

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
            <b>| 상품 리스트</b>
        </header>
		
		<form method="post" id="searchProc" action="${rootPath}/admin/productListbySearch.do">
	        <!-- 검색 전체  -->
	        <div id="search_area">
	
	            <!-- 검색 폼 -->
	            <div id="search_form">
	            
	            		<!-- 현재 페이지 (hidden) -->
	            		<input type="hidden" id="page" name="page" value="${pageVO.page}"/>
	            		
	                <!-- 입력 박스 -->
	                <input type="text" name="search_word" placeholder="상품명을 입력해주세요."
	                		   style="width: 300px; height: 30px; padding: 0 15px;
	               	 			  border: 1px solid rgb(141,141,141); font-size: 12px;"> &nbsp;
	
	                <!-- 검색 버튼 -->
	                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="search()" style="width: 80px;">검색</button>
	
	            </div>
	            <!-- //검색 폼 -->
				
	            <!-- 상세 검색 열기 버튼 -->
	            <a id="search_detail_btn" href="javascript:view();" onclick="change()">상세검색열기▼</a> <br><br>
	
	            <!-- 분리 선 + 상세 검색 옵션 + 버튼 -->
	            <div id="search_detail" style="display: none; text-align: center">
	
	                <!-- 중간 분리 선 -->
	                <div id="sepa"> </div> <br>
					
					
	                <!-- 상세 검색 옵션 -->
	                <table id="search_detail_op">
	                    <tr class="detail_tr">
	                        <!-- 카테고리 선택 -->
	                        <td align = "right">
	                            카테고리 선택 &nbsp;&nbsp;
	                        </td>
	                        
	                        <td align = "left">
	                        	
	                        	<select id="search_kind1" name="search_kind1" class="category1" style="width: auto;">
	                                <option value="">1차 카테고리 전체</option>
	                            </select> &nbsp;&nbsp;
	                            <select id="search_kind2" name="search_kind2" class="category2" style="width: auto;">
	                            	<option value="">2차 카테고리 전체</option>
	                            </select>
		                        
	                        </td>
	                        
	                        <!-- 공간띄우기용 셀 -->
	                        <td style="width: 60px;"></td>
	                        
	                        <!-- 판매 가격 -->
	                        <td align = "right">
	                            판매 가격 &nbsp;&nbsp;
	                            <input type="number" class="text_box" name="search_price1"> 원 &nbsp;~ &nbsp;
	                            <input type="number" class="text_box" name="search_price2"> 원
	                        </td>
	                    </tr>
	                    <tr class="detail_tr">
	                    
	                        <!-- 상품 등록일 -->
	                        <td align = "right">
	                            상품 등록일 &nbsp;&nbsp;
	                        </td>
	                        <td align = "left">
	                            <input type="text" id="search_date1" name="search_date1" style="margin-right: 10px;"> ~
	                            <input type="text" id="search_date2" name="search_date2" style="margin-left: 10px;">
	                        </td>
	                        <td></td>
	                        
	                        <!-- 진열 여부 -->
	                        <td align = "left" style="padding-top: 7px;">
	                            진열 여부 &nbsp;&nbsp;
	                            <label for="all_">
	                                <input type="radio" id="all_" name="search_info" checked value=""> 전체
	                            </label> &nbsp;&nbsp;
	                            <label for="disp">
	                                <input type="radio" id="disp" name="search_info" value="D"> 진열
	                            </label> &nbsp;&nbsp;
	                            <label for="hid">
	                                <input type="radio" id="hid" name="search_info" value="H"> 숨김
	                            </label> &nbsp;&nbsp;
	                            <label for="sold_out">
	                                <input type="radio" id="sold_out" name="search_info" value="S"> 품절
	                            </label>
	                        </td>
	                    </tr>
	                </table>
	                <!-- //상세 검색 옵션 -->
	
	                <!-- 상세 검색 버튼 -->
	                <button type="button"
	                			onclick="search()"
	                			class="btn btn-outline-secondary btn-sm"
	                			style="width: 100px;">상세 검색</button>
	            </div>
	            <!-- //상세 검색 -->
	            
	        </div>
	        <!-- //검색 전체 -->
	    </form>
	    
	    
	    <c:if test="${not empty productList && pageVO.productListCount > 0}">
		
	        <!-- 검색 수 표시 -->
	        <c:if test="${search_YN != 'search'}">
	        	<div>총 등록 상품 : ${pageVO.productListTotCount}개</div>
	        </c:if>
	        <c:if test="${search_YN == 'search'}">
				<div>총 등록 상품 : ${pageVO.productListTotCount}개 / 검색된 상품 : ${pageVO.productListCount}개</div>
			</c:if>
	        	
        		<form id="productForm" name="productForm" method="post">
        		
			        <!-- 검색 결과 테이블 -->
			        <table id="search_list">
			            <tr class="list1">
			                <td>선택</td>
			                <td>번호</td>
			                <td>상품 이미지</td>
			                <td>카테고리와 상품명</td>
			                <td>판매 가격</td>
			                <td>상태와 재고</td>
			                <td>등록일</td>
			                <td>조회수</td>
			                <td>수정</td>
			            </tr>
			            <c:forEach var="row" items="${productList}" varStatus="st">
				            <tr class="list2">
				                <td>
				                    <input type="checkbox"
				                    	   name="checkBox"
				                    	   class="checkBox"
				                    	   data-productId="${row.productId}"/>
				                </td>
				                <td>${row.productId}</td>
				                <td><img src="${rootPath}/image/thumbnail/${row.productThumImg}" style="width: 130px; height: auto;"/></td>
				                <td>
				                	<a href="${rootPath}/products/product_detail.do?productId=${row.productId}"
				                	   target="_blank">
				                		${row.cateCode}<br>${row.productName}
				                	</a>
				                </td>
				                <td><fmt:formatNumber value="${row.productPrice2}" pattern="###,###,###" />원</td>
				                <td>${row.productInfo}<br>${row.productQuan}개</td>
				                <td><fmt:formatDate value="${row.productDate}" pattern="yyyy-MM-dd" /></td>
				                <td>${row.productReadCount}회</td>
				                <td>
			                			<button onClick="viewProduct(${row.productId})"
				                   			class="update_btn btn-outline-secondary btn-sm"
				                   			style="width: 50px;">수정</button>
				                </td>
				            </tr>
				        </c:forEach>
			        </table>
			        <!-- //검색 결과 테이블 -->
		        </form>
				
		        <!-- 하단 버튼들 -->
		        <div style="margin-bottom: 50px;">
		        		
		        		<!-- 삭제 -->
			        <button type="button"
			        		id="deleteBtn"
			        		class="btn-outline-secondary btn-sm"
			        		style="width: 70px; margin-right: 10px;">삭제</button>
			        <script>
					$("#deleteBtn").click(function(){
				  		var confirm_val = confirm("정말 삭제하시겠습니까?");
				  
						if (confirm_val) {
							var checkArr = new Array();
						 
							$("input[class='checkBox']:checked").each(function(){
								checkArr.push($(this).attr("data-productId"));
							});
						  
							$.ajax({
								url : rootPath + "/admin/delete_product.do",
								type : "post",
								data : { checkBox : checkArr },
								success : function(){
									location.href = rootPath + "/admin/admin_product_list.do/1";
								}
							});
					 	} 
					 });
					</script>
					
					<!-- 진열 -->
					<form method="post" id="dForm" name="dForm" style="display: contents">
						<input type="hidden" id="dProductId" name="productId" value="" />
						<input type="hidden" name="productInfo" value="D" />
				        <button type="button"
				        			id="dUpdateBtn"
				        			class="btn-outline-secondary btn-sm" 
				        			style="width: 70px; margin-right: 10px;">진열</button>
				        	
				    </form>
					
					<!-- 숨김 -->
					<form method="post" id="hForm" name="hForm" style="display: contents">
						<input type="hidden" id="hProductId" name="productId" value="" />
						<input type="hidden" name="productInfo" value="H" />
				        <button type="button"
				        			id="hUpdateBtn"
				        			class="btn-outline-secondary btn-sm"
				        			style="width: 70px; margin-right: 10px;">숨김</button>
		        		</form>
		        </div>
	
	        <!-- Paging -->
	        <!-- 페이징 모듈 외장화 -->
			<c:if test="${search_YN != 'search'}">
				<%@ include file="paging/product_paging.jspf" %>
			</c:if>
			<c:if test="${search_YN == 'search'}">
				<%@ include file="paging/product_paging_search.jspf" %>
			</c:if>
		</c:if>
		
		<!-- 등록글 없을 경우 -->
		<c:if test="${empty productList || pageVO.productListCount==0}">
			<!-- 검색 수 표시 -->
	        <div>검색된 상품 : ${pageVO.productListCount}개</div>
			<div style="margin-top: 100px; text-align: center;">등록된 글이 없습니다.</div>
		</c:if>

    </div>
</div>
</body>
</html>
