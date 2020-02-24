<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/">

<script>
$(document).ready(function() {
    $("[id^=product_]").mousemove(function(e) {

        //console.log("id: "+ e.currentTarget.id);
        $("#"+e.currentTarget.id).find("div.icon").css("opacity", "1.0");
    });

    $("div[id^=product_]").mouseout(function(e) {

		console.log("mouseout");
		//console.log($("div.product_list .list_img").parent().find("div.icon"));

		//$("div[id^=product_]").parent().find("div.icon").css("opacity", "0");


		$("#"+e.currentTarget.id).find("div.icon").css("opacity", "0");

	});
});
</script>
</head>
<body>
    <!-- 전체 레이아웃 -->
    <div id="wrap">
        <!-- 좌우 하단 조절 -->
        <div id="prd_wrap">
            <!-- 상세 검색 박스 및 검색 결과 영역 -->
            <div id="prd_search_wrap">
                <div id="prd_title">
                    <h2>PRODUCT SEARCH</h2>
                </div>
                <!-- 상품 상세 검색 영역 -->
                <div id="prd_search_box_wrap">
                    <!-- 상품 상세 검색 레이아웃 -->
                    <div id="prd_search_box">
                        <!-- 상품 상세 검색 넓이 간격 -->
                        <div id="prd_search_interval">

                            <div class="item">
                                <span>상품분류</span>
                                <select id="category"
                                        class="select_height"
                                        name="category">
                                    <option selected="selected">상품분류 선택</option>
                                    <option value="1">BEST</option>
                                </select>
                            </div>

                            <div class="item">
                                <span>검색조건</span>
                                <select id="search_type"
                                        class="select_height"
                                        name="search_type">
                                    <option value="1">상품명</option>
                                </select>
                                <input type="text"
                                       id="search_box"
                                       class="search_height"
                                       style="position: relative; top: -1px;">
                            </div>

                            <div class="item">
                                <span>제외검색어</span>
                                <input type="text"
                                       id="exemption_search"
                                       class="search_height"
                                       name="exemption_search">
                            </div>

                            <div class="item">
                                <span>인기검색어</span>
                                <p id="popular_wrap">
                                    <a href="#">니트</a>
                                    <a href="#">양털</a>
                                    <a href="#">목폴라</a>
                                    <a href="#">패딩</a>
                                    <a href="#">슬랙스</a>
                                </p>
                            </div>

                            <div class="item">
                                <span>판매가격대</span>
                                <input type="text"
                                       id="sell_price1"
                                       class="search_height"
                                       name="sell_price"> ~
                                <input type="text"
                                       id="sell_price2"
                                       class="search_height"
                                       name="sell_price">
                            </div>

                            <div class="item">
                                <span>검색정렬기준</span>
                                <select id="search_standard"
                                        class="select_height"
                                        name="">
                                    <option value="">::: 기준선택 :::</option>
                                </select>
                            </div>

                            <div style="text-align: center; padding: 30px 0;">
                                <input type="button" id="search_result_btn" name="" value="SEARCH">
                            </div>
                        </div>
                        <!-- //상품 상세 검색 넓이 간격 -->
                    </div>
                    <!-- //상품 상세 검색 레이아웃 -->
                    <div id="prd_wrap">
                        <div id="prd_align">
                            <p id="prd_count">총 <b>133</b> 개 의 상품이 검색되었습니다.</p>
                            <p id="prd_box_button">
                                <a href="#">신상품</a>
                                <a href="#">낮은가격</a>
                                <a href="#">높은가격</a>
                                <a href="#">인기상품</a>
                                <a href="#">이용후기</a>
                            </p>
                        </div>

                        <!-- 검색 상품이 없을경우 -->
                        <div id="prd_search_result_no">
                            <p style="margin-top: 40px;">검색결과가 없습니다.</p>
                            <p>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</p>
                            <p style="margin-top: 20px;">검색어/제외검색어의 입력이 정확한지 확인해 보세요.</p>
                            <p>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</p>
                            <p style="margin-bottom: 40px;">검색 옵션을 다시 확인해 보세요.</p>
                        </div>
                        <!-- //검색 상품이 없을경우 -->

                        <!-- 검색 상품이 존재할경우 -->
                        <ul id="prd_search_result">
    						<li>
                                <!-- 상품 각 영역-->
        						<div id="product_list_1">
        							<div class="list_img">
        								<a href="#"><img src="e17ee8eb1ad9843789a233ba7e0fd7a3.webp"></a>
        							</div>

        							<!-- 돋보기 및 좋아요 이미지 전체 영역 -->
        							<div class="icon">

        								<!-- 이미지 각 영역-->
        								<div class="expand_button">
        									<span>
        										<img src="icon_201911202305133700.png" style="cursor:pointer">
        									</span>
        									<span></span>
        									<div class="option"></div>

        									<div class="like_button">
        										<button type="button">
        											<strong></strong>
        										</button>
        									</div>
        								</div>
        								<!-- //이미지 각 영역-->
        							</div>
        							<!-- //돋보기 및 좋아요 이미지 -->
        						</div>
        						<!-- //상품 각 영역-->

                                <!-- 상품 정보 -->
            					<div class="description_product">
            						<strong class="name_description">
            							<a href="#">
            								<span class="title_description">
            									<span>상품명</span>
            									<!-- <span style="font-size:12pt; color:#222222;">상품명</span> -->
            								</span>

            								<span style="font-size:8pt; color:#222222;">3rd 감사제 기획 울 더블코트</span>
            							</a>
            						</strong>

            						<!-- 상품 색상 및 가격 세일 -->
            						<ul class="info_product">
            							<li>
            								<strong><span>상품색상</span>:</strong>
            								<div class="color_product">
            									<span class="chips" style="background:red"></span>
            									<span class="chips" style="background:brown"></span>
            									<span class="chips" style="background:black"></span>
            									<span class="chips" style="background:gray"></span>
            								</div>
            							</li>

            							<li>
            								<strong><span>판매가</span>:</strong>
            								<span style="font-size:8pt; color:#222222;">39,000원</span>
            							</li>

            							<li>
            								<strong><span>상품세일정보</span>:</strong>
            								<span style="font-size:8pt; color:#222222; font-weight:bold; font-style:italic;"><b>season off 40%</b></span>
            							</li>
            						</ul>
            						<!-- //상품 색상 및 가격 세일 -->
            					</div>
            					<!-- //상품 정보 -->
    						</li>

                            <li>
                                <!-- 상품 각 영역-->
        						<div id="product_list_2">
        							<div class="list_img">
        								<a href="#"><img src="e17ee8eb1ad9843789a233ba7e0fd7a3.webp"></a>
        							</div>

        							<!-- 돋보기 및 좋아요 이미지 전체 영역 -->
        							<div class="icon">

        								<!-- 이미지 각 영역-->
        								<div class="expand_button">
        									<span>
        										<img src="icon_201911202305133700.png" style="cursor:pointer">
        									</span>
        									<span></span>
        									<div class="option"></div>

        									<div class="like_button">
        										<button type="button">
        											<strong></strong>
        										</button>
        									</div>
        								</div>
        								<!-- //이미지 각 영역-->
        							</div>
        							<!-- //돋보기 및 좋아요 이미지 -->
        						</div>
        						<!-- //상품 각 영역-->

                                <!-- 상품 정보 -->
            					<div class="description_product">
            						<strong class="name_description">
            							<a href="#">
            								<span class="title_description">
            									<span>상품명</span>
            									<!-- <span style="font-size:12pt; color:#222222;">상품명</span> -->
            								</span>

            								<span style="font-size:8pt; color:#222222;">3rd 감사제 기획 울 더블코트</span>
            							</a>
            						</strong>

            						<!-- 상품 색상 및 가격 세일 -->
            						<ul class="info_product">
            							<li>
            								<strong><span>상품색상</span>:</strong>
            								<div class="color_product">
            									<span class="chips" style="background:red"></span>
            									<span class="chips" style="background:brown"></span>
            									<span class="chips" style="background:black"></span>
            									<span class="chips" style="background:gray"></span>
            								</div>
            							</li>

            							<li>
            								<strong><span>판매가</span>:</strong>
            								<span style="font-size:8pt; color:#222222;">39,000원</span>
            							</li>

            							<li>
            								<strong><span>상품세일정보</span>:</strong>
            								<span style="font-size:8pt; color:#222222; font-weight:bold; font-style:italic;"><b>season off 40%</b></span>
            							</li>
            						</ul>
            						<!-- //상품 색상 및 가격 세일 -->
            					</div>
            					<!-- //상품 정보 -->
    						</li>

                            <li>
                                <!-- 상품 각 영역-->
        						<div id="product_list_3">
        							<div class="list_img">
        								<a href="#"><img src="e17ee8eb1ad9843789a233ba7e0fd7a3.webp"></a>
        							</div>

        							<!-- 돋보기 및 좋아요 이미지 전체 영역 -->
        							<div class="icon">

        								<!-- 이미지 각 영역-->
        								<div class="expand_button">
        									<span>
        										<img src="icon_201911202305133700.png" style="cursor:pointer">
        									</span>
        									<span></span>
        									<div class="option"></div>

        									<div class="like_button">
        										<button type="button">
        											<strong></strong>
        										</button>
        									</div>
        								</div>
        								<!-- //이미지 각 영역-->
        							</div>
        							<!-- //돋보기 및 좋아요 이미지 -->
        						</div>
        						<!-- //상품 각 영역-->

                                <!-- 상품 정보 -->
            					<div class="description_product">
            						<strong class="name_description">
            							<a href="#">
            								<span class="title_description">
            									<span>상품명</span>
            									<!-- <span style="font-size:12pt; color:#222222;">상품명</span> -->
            								</span>

            								<span style="font-size:8pt; color:#222222;">3rd 감사제 기획 울 더블코트</span>
            							</a>
            						</strong>

            						<!-- 상품 색상 및 가격 세일 -->
            						<ul class="info_product">
            							<li>
            								<strong><span>상품색상</span>:</strong>
            								<div class="color_product">
            									<span class="chips" style="background:red"></span>
            									<span class="chips" style="background:brown"></span>
            									<span class="chips" style="background:black"></span>
            									<span class="chips" style="background:gray"></span>
            								</div>
            							</li>

            							<li>
            								<strong><span>판매가</span>:</strong>
            								<span style="font-size:8pt; color:#222222;">39,000원</span>
            							</li>

            							<li>
            								<strong><span>상품세일정보</span>:</strong>
            								<span style="font-size:8pt; color:#222222; font-weight:bold; font-style:italic;"><b>season off 40%</b></span>
            							</li>
            						</ul>
            						<!-- //상품 색상 및 가격 세일 -->
            					</div>
            					<!-- //상품 정보 -->
    						</li>

                            <li>
                                <!-- 상품 각 영역-->
        						<div id="product_list_4">
        							<div class="list_img">
        								<a href="#"><img src="e17ee8eb1ad9843789a233ba7e0fd7a3.webp"></a>
        							</div>

        							<!-- 돋보기 및 좋아요 이미지 전체 영역 -->
        							<div class="icon">

        								<!-- 이미지 각 영역-->
        								<div class="expand_button">
        									<span>
        										<img src="icon_201911202305133700.png" style="cursor:pointer">
        									</span>
        									<span></span>
        									<div class="option"></div>

        									<div class="like_button">
        										<button type="button">
        											<strong></strong>
        										</button>
        									</div>
        								</div>
        								<!-- //이미지 각 영역-->
        							</div>
        							<!-- //돋보기 및 좋아요 이미지 -->
        						</div>
        						<!-- //상품 각 영역-->

                                <!-- 상품 정보 -->
            					<div class="description_product">
            						<strong class="name_description">
            							<a href="#">
            								<span class="title_description">
            									<span>상품명</span>
            									<!-- <span style="font-size:12pt; color:#222222;">상품명</span> -->
            								</span>

            								<span style="font-size:8pt; color:#222222;">3rd 감사제 기획 울 더블코트</span>
            							</a>
            						</strong>

            						<!-- 상품 색상 및 가격 세일 -->
            						<ul class="info_product">
            							<li>
            								<strong><span>상품색상</span>:</strong>
            								<div class="color_product">
            									<span class="chips" style="background:red"></span>
            									<span class="chips" style="background:brown"></span>
            									<span class="chips" style="background:black"></span>
            									<span class="chips" style="background:gray"></span>
            								</div>
            							</li>

            							<li>
            								<strong><span>판매가</span>:</strong>
            								<span style="font-size:8pt; color:#222222;">39,000원</span>
            							</li>

            							<li>
            								<strong><span>상품세일정보</span>:</strong>
            								<span style="font-size:8pt; color:#222222; font-weight:bold; font-style:italic;"><b>season off 40%</b></span>
            							</li>
            						</ul>
            						<!-- //상품 색상 및 가격 세일 -->
            					</div>
            					<!-- //상품 정보 -->
    						</li>
                        </ul>
                        <!-- //검색 상품이 존재할 경우 -->
                    </div>
                </div>
                <!-- //상품 상세 검색 영역 -->

                <div id="pagination">
        			<a href="#">|처음|</a>
        			<a href="#">◀︎ 이전</a>
        			<a href="#">[1]</a>
        			<a href="#">[2]</a>
        			<a href="#">[3]</a>
        			<a href="#">[4]</a>
        			<a href="#">[5]</a>
        			<a href="#">다음 ▶︎</a>
        			<a href="#">|마지막|</a>
        		</div>
            </div>
            <!-- //상세 검색 박스 및 검색 결과 영역 -->
        </div>
        <!-- //좌우 하단 조절 -->
    </div>
    <!-- //전체 레이아웃 -->
</body>
</html>