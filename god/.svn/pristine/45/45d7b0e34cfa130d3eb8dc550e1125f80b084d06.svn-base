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
<link rel="stylesheet" href="${rootPath}/resources/css/member/order_success.css">

</head>
<body>
    <div id="wrap">
        <div id="title_wrap">
            <h2>ORDER SUCCESS</h2>
        </div>

        <div id="order_success_title">
            <p>
                <span>고객님의 주문이 완료되었습니다.</span>
                주문내역 및 배송에 관한 안내는<a href="#">주문조회</a>를 통화여 확인 가능합니다.
            </p>
            <div id="order_number_day">
                <p>주문번호 : <b>20200204-0002814</b></p>
                <p>주문일자 : 2020-02-04 16:46:44</p>
            </div>
        </div>

        <div id="pay_info_wrap">
            <div class="order_delivery_title">
                <h3 style="margin: 5px;">결제정보</h3>
            </div>

            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 139px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>최정결제금액</th>
                        <td stlye="font-size: 24px;"><b>{27,500원}</b></td>
                    </tr>

                    <tr>
                        <th>결제수단</th>
                        <td>
                            <b>무통장 입금</b><br>
                            입금자: {000}, 계좌번호: {우리은행 1002-788-940126 ((주)GOD) }
                            <a href="#">인터넷뱅킹 바로가기</a><br>
                            현금영수증 발행:<b>신청안함</b>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 상품 구매리스트 박스 -->
        <div id="order_list_box">
            <div class="order_delivery_title">
                <h3 style="margin: 5px;">주문 상품 정보</h3>
            </div>
            <!-- 상품 구매 리스트 테이블 -->
            <table>
                <caption style="display:none;">기본배송</caption>
                <colgroup>
                    <col style="width:27px;">
                    <col style="width:92px;">
                    <col style="width:auto;">
                    <col style="width:98px;">
                    <col style="width:75px;">
                    <col style="width:98px;">
                    <col style="width:98px;">
                    <col style="width:85px;">
                    <col style="width:98px;">
                </colgroup>

                <thead>
                    <tr>
                        <th>
                            <input type="checkbox"
                                   class="prd_order_all_checkbox"
                                   name="order_all_checkbox">
                        </th>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>판매가</th>
                        <th>수량</th>
                        <th>적립금</th>
                        <th>배송구분</th>
                        <th>배송비</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="prd_detail_center">
                            <input type="checkbox"
                                   class="prd_order_checkbox"
                                   name="prd_order_checkbox">
                        </td>
                        <td class="prd_detail_center">
                            <a href="#">
                                <img src="${rootPath}/resources/css/member/images/order_img.gif">
                            </a>
                        </td>
                        <td class="prd_detail_left">
                            <a href="#">에드가 기모 라운드 니트</a>
                            <div>[옵션:블랙]</div>
                        </td>
                        <td class="prd_detail_center">22,000원</td>
                        <td class="prd_detail_center">1</td>
                        <td class="prd_detail_center">220원</td>
                        <td class="prd_detail_center">기본배송</td>
                        <td class="prd_detail_center">[조건]</td>
                        <td class="prd_detail_center">22,000원</td>
                    </tr>
                </tbody>

                <tfoot>
                    <tr>
                        <td></td>
                        <td colspan="8" style="text-align:right;">
                            <span style="float:left;">
                                [기본배송]
                            </span>
                            상품구매
                            <span>22,000원</span>
                            +배송비
                            <span>2,500원</span>
                            = 합계 :
                            <span>{24,500원}</span>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <!-- //상품 구매 리스트 테이블 -->
        </div>
        <!-- //상품 구매리스트 박스 -->

        <!-- 금액 정보 레이아웃 -->
        <div id="price_info_wrap">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 33.3%;">
                    <col style="width: 33.3%;" class="displaynone">
                    <col style="width: 33.3%;">
                </colgroup>
                <thead>
                    <tr>
                        <th>총 주문 금액<a href="#">내역보기</a></th>
                        <td>총 결제금액</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>{24,500원}</th>
                        <td class="displaynone"></td>
                        <td><b>{24,500원}</b></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //금액 정보 레이아웃 -->

        <!-- 마일리지 금액  테이블 -->
        <div id="all_mileage_price">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 139px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>총 적립예정금액</th>
                        <td>{250원}</td>
                    </tr>

                    <tr>
                        <th>상품별 적립금</th>
                        <td>{250원}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //마일리지 금액  테이블 -->
        <div id="delivery_address_info">
            <div class="order_delivery_title">
                <h3 style="margin: 5px;">배송지 정보</h3>
            </div>

            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 139px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>받으시는분</th>
                        <td>{이용자}</td>
                    </tr>
                    <tr>
                        <th>우변번호</th>
                        <td>{05274}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>{서울시 어딘가에 있는 그곳에}</td>
                    </tr>
                    <tr>
                        <th>일반전화</th>
                        <td>{}</td>
                    </tr>
                    <tr>
                        <th>휴대번호</th>
                        <td>{010-1234-1234}</td>
                    </tr>
                    <tr>
                        <th>배송메시지</th>
                        <th>{}</th>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="btns">
            <span><a href="#">현금 영수증</a></span>
            <!-- 쇼핑계속하기 홈으로,  -->
            <span style="float: right;"><a href="#">쇼핑계속하기</a><a href="#">주문확인하기</a></span>
        </div>

    </div>
</body>
</html>