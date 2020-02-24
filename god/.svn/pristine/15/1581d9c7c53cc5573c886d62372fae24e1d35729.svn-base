<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 회원정보 상세</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- Daum 주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_member_detail.css">

<script>
// Daum 주소
function searchPost() {

    new daum.Postcode({

        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 3단계 : 해당 필드들에 정보 입력
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memberZip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('memberAddressBasic').value = fullAddr;
        }
    }).open();
};
</script>

<script>
// 수정 버튼 알림창
function update() {
    alert("수정이 완료되었습니다.");
}

// 로그인 기록 보기 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $(".log_hstry_btn").click(function() {
        $("#modal").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
        $('body').css("overflow", "scroll");
    });
});

// 구매 내역 보기 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal2").hide();

    //모달 출력
    $(".buy_hstry_btn").click(function() {
        $("#modal2").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal2").hide();
        $('body').css("overflow", "scroll");
    });
});

// 적립금 적립 내역 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal3").hide();

    //모달 출력
    $(".save_hstry_btn").click(function() {
        $("#modal3").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal3").hide();
        $('body').css("overflow", "scroll");
    });
});

</script>
</head>
<body>

<div id="wrap">
    <!-- 좌측 메뉴 -->
    <%@ include file="/resources/common/admin/member_left.jsp" %>
    
    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 회원정보 상세 보기
        </header>

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 가입 정보
        </div>

        <!-- 가입정보 테이블 -->
        <table id="join_info_tbl">
            <tr>
                <td class="tbl1">아이디</td>
                <td class="tbl2">{아이디}</td>
            </tr>
            <tr>
                <td class="tbl1">비밀번호</td>
                <td class="tbl2">
                    <input type="password" placeholder="비밀번호 입력">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="password" placeholder="비밀번호 확인">
                </td>
            </tr>
            <tr>
                <td class="tbl1">이름</td>
                <td class="tbl2">{이름}</td>
            </tr>
            <tr>
                <td class="tbl1">주소</td>
                <td class="tbl2" style="line-height: 35px;">
                    <input type="text"
                           id="memberZip"
                           name="memberZip"
                           maxlength="5"
                           pattern="\d{5}"
                           readonly
                           style="width: 80px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button"
                           id="joinAddressSearchBtn"
                           name="joinAddressSearchBtn"
                           class="btn btn-outline-secondary btn-sm"
                           value="우편번호 검색"
                           onClick="searchPost()"
                           style="width: 110px;"><br>
                    <input type="text"
                           id="memberAddressBasic"
                           name="memberAddressBasic"
                           pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
                           maxlength="200"
                           size="50"
                           title="기본주소를 입력하십시오"
                           readonly
                           style="width: 350px;">
                    <input type="text"
                           id="memberAddressDetail"
                           name="memberAddressDetail"
                           pattern="[\w | \W | 가-힣 | / | -]{2,100}"
                           maxlength="100"
                           size="50"
                           title="상세주소를 입력하십시오"
                           style="width: 250px;">
                </td>
            </tr>
            <tr>
                <td class="tbl1">연락처</td>
                <td class="tbl2">
                    <input type="text"
                           id="memberPhone"
                           maxlength="13"
                           pattern="01\d{1}-\d{3,4}-\d{4}"
                           size="15"
                           value="{연락처}"
                           style="padding: 0 5px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    SMS 수신 여부 &nbsp;&nbsp;:&nbsp;&nbsp;
                    <label class="radio" for="sms_yes">
                        <input type="radio" id="sms_yes" name="sms" checked>
                        &nbsp;&nbsp;수신&nbsp;&nbsp;
                    </label>
                    <label for="sms_no">
                        <input type="radio" id="sms_no" name="sms">
                        &nbsp;&nbsp;거부
                    </label>
                </td>
            </tr>
            <tr>
                <td class="tbl1">이메일</td>
                <td class="tbl2">
                    <input type="text"
                           id="memberEmail"
                           pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"
                           size="25"
                           maxlength="50"
                           value="{이메일}"
                           style="width: 250px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    메일 수신 여부 &nbsp;&nbsp;:&nbsp;&nbsp;
                    <label class="radio" for="mail_yes">
                        <input type="radio" id="mail_yes" name="mail" checked>
                        &nbsp;&nbsp;수신&nbsp;&nbsp;
                    </label>
                    <label for="mail_no">
                        <input type="radio" id="mail_no" name="mail">
                        &nbsp;&nbsp;거부
                    </label>
                </td>
            </tr>
            <tr>
                <td class="tbl1">생년월일</td>
                <td class="tbl2">{년} 년 {월} 월 {일} 일</td>
            </tr>
            <tr>
                <td class="tbl1">평생회원</td>
                <td class="tbl2">
					<label class="radio" for="forever_yes">
						<input type="radio" id="forever_yes" name="forever">
							&nbsp;&nbsp;동의함&nbsp;&nbsp;
					</label>
					<label for="forever_no">
						<input type="radio" id="forever_no" name="forever">
							&nbsp;&nbsp;동의안함
                    </label>
                </td>
            </tr>
        </table>
        <!-- //가입정보 테이블 -->

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 이용/운영 정보
        </div>

        <!-- 이용/운영 정보 테이블 -->
        <table id="use_info_tbl">
            <tr>
                <td class="tbl1">가입일</td>
                <td class="tbl2">{년}-{월}-{일} {시:분:초}</td>
                <td class="tbl1">회원 등급</td>
                <td class="tbl2">
                    <!-- 등급 셀렉트 박스 -->
                    <select id="select_box">
                        <option>&nbsp;&nbsp;&nbsp;5</option>
                        <option>&nbsp;&nbsp;&nbsp;4</option>
                        <option>&nbsp;&nbsp;&nbsp;3</option>
                        <option>&nbsp;&nbsp;&nbsp;2</option>
                        <option>&nbsp;&nbsp;&nbsp;1</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="tbl1">방문횟수</td>
                <td class="tbl2">
                    {방문횟수} 회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button"
                            class="log_hstry_btn btn btn-outline-secondary btn-sm"
                            style="width: 130px;">로그인 기록 보기</button>
                </td>
                <td class="tbl1">최근 로그인</td>
                <td class="tbl2">{년}-{월}-{일} {시:분:초}</td>
            </tr>
            <tr>
                <td class="tbl1">총 구매 금액</td>
                <td class="tbl2">
                    {총 구매 금액} 원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button"
                            class="buy_hstry_btn btn btn-outline-secondary btn-sm"
                            style="width: 120px;">구매 내역 보기</button>
                </td>
                <td class="tbl1">적립금</td>
                <td class="tbl2">
                    {적립금} 원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button"
                            class="save_hstry_btn btn btn-outline-secondary btn-sm"
                            style="width: 130px;">적립금 적립 내역</button>
                </td>
            </tr>
        </table>
        <!-- //이용/운영 정보 테이블 -->

        <!-- 하단부 버튼들 -->
        <div id="bottom_btns">
            <div style="float: left; width: 47%;">
                <button type="button"
                        class="bottom_btn1 btn btn-outline-secondary btn-sm">회원 탈퇴</button>
                <button type="button" class="bottom_btn2 btn btn-outline-secondary btn-sm"
                        onclick="update()">수정</button>
            </div>
            <div style="float: right; width: 47%">
                <button type="button"
                        class="bottom_btn1 btn btn-outline-secondary btn-sm">취소</button>
                <button type="button"
                        class="bottom_btn2 btn btn-outline-secondary btn-sm">목록 보기</button>
            </div>
        </div>

        <!-- 로그인 기록 보기 팝업창 폼 -->
        <div id="modal">
            <!-- 로그인 기록 보기 팝업창 -->
            <div id="modal_">
                <!-- 팝업창 제목 -->
                <div id="modal_header">
                    <div style="float: left; font-size: 16pt;">| 로그인 기록</div>
                    <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                        close
                    </a>
                </div>
                <!-- 팝업창 본문 -->
                <div id="modal_content">
                    <div>- &nbsp;&nbsp;계정 : {아이디}</div>
                    <!-- 로그인 기록 표시 박스 -->
                    <div id="modal_content_id">
                        <table style="width: 100%;">
                            <tr>
                                <td>{년}-{월}-{일} {시}:{분}:{초}</td>
                            </tr>
                            <tr>
                                <td>2020-01-15 18:06:23</td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <!-- //로그인 기록 표시 박스 -->
                </div>
                <!-- //팝업창 본문 -->

                <!-- 팝업창 하단부 -->
                <div id="modal_footer">
                    <button type="button" class="modal_close_btn btn btn-outline-secondary btn-sm" style="width: 80px;">닫기</button>
                </div>
            </div>
            <!-- //로그인 기록 보기 팝업창 -->
        </div>
        <!-- //로그인 기록 보기 팝업창 폼 -->

        <!-- 구매 내역 보기 팝업창 폼 -->
        <div id="modal2">
            <!-- 구매 내역 보기 팝업창 -->
            <div class="modal_2">
                <!-- 팝업창 제목 -->
                <div class="modal_header2">
                    <div style="float: left; font-size: 16pt;">| 구매 내역</div>
                    <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                        close
                    </a>
                </div>
                <!-- 팝업창 본문 -->
                <div class="modal_content2">
                    <div>- &nbsp;&nbsp;계정 : {아이디}</div>

                    <!-- 구매 내역 표시 박스 -->
                    <div class="modal_content_id2">
                        <!-- 테이블 -->
                        <table class="buy_hstry_tbl">
                            <colgroup>
                                <col width="43px">
                                <col width="133px">
                                <col width="223px">
                                <col width="132px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <td>번호</td>
                                    <td>주문일</td>
                                    <td>주문 상품</td>
                                    <td>결제 금액</td>
                                </tr>
                            </thead>
                        </table>
                        <!-- 테이블 안 스크롤용 div -->
                        <div class="buy_hsrty_s">
                            <!-- 테이블 바디 -->
                            <table class="buy_hstry_tbl2">
                                <colgroup>
                                    <col width="43px">
                                    <col width="133px">
                                    <col width="223px">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>{번호}</td>
                                        <td>{년-월-일}</td>
                                        <td>{주문 상품}</td>
                                        <td>{결제 금액} 원</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- //테이블 바디 -->
                        </div>
                        <!-- //테이블 안 스크롤용 div -->
                    </div>
                    <!-- //구매 내역 표시 박스 -->
                </div>
                <!-- //팝업창 본문 -->

                <!-- 팝업창 하단부 -->
                <div id="modal_footer2">
                    <button type="button" class="modal_close_btn btn btn-outline-secondary btn-sm" style="width: 80px;">닫기</button>
                </div>
            </div>
            <!-- //구매 내역 보기 팝업창 -->
        </div>
        <!-- //구매 내역 보기 팝업창 폼 -->

        <!-- 적립금 적립 내역 팝업창 폼 -->
        <div id="modal3">
            <!-- 적립금 적립 내역 팝업창 -->
            <div class="modal_2">
                <!-- 팝업창 제목 -->
                <div class="modal_header2">
                    <div style="float: left; font-size: 16pt;">| 적립금 적립 내역</div>
                    <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                        close
                    </a>
                </div>
                <!-- 팝업창 본문 -->
                <div class="modal_content2">
                    <div>- &nbsp;&nbsp;계정 : {아이디}</div>
                    <!-- 적립 내역 표시 박스 폼 -->
                    <div style="width: 100%; height: 300px;">
                        <!-- 적립 내역 표시 박스 -->
                        <div class="modal_content_id2">
                            <!-- 테이블 헤더 -->
                            <table class="buy_hstry_tbl">
                                <colgroup>
                                    <col width="43px">
                                    <col width="133px">
                                    <col width="223px">
                                    <col width="132px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td>번호</td>
                                        <td>적립일</td>
                                        <td>적립 내용</td>
                                        <td>적립금</td>
                                    </tr>
                                </thead>
                            </table>
                            <!-- 테이블 안 스크롤용 div -->
                            <div class="buy_hsrty_s">
                                <!-- 테이블 바디 -->
                                <table class="buy_hstry_tbl2">
                                    <colgroup>
                                        <col width="43px">
                                        <col width="133px">
                                        <col width="223px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td>{번호}</td>
                                            <td>{년-월-일}</td>
                                            <td>{적립 내용}</td>
                                            <td>{적립금} point</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- //테이블 바디 -->
                            </div>
                            <!-- //테이블 안 스크롤용 div -->
                        </div>
                        <!-- //적립내역 표시 박스 -->
                    </div>
                    <!-- //적립내역 표시 박스 폼 -->
                </div>
                <!-- //팝업창 본문 -->

                <!-- 팝업창 하단부 -->
                <div id="modal_footer3">
                    <button type="button" class="modal_close_btn btn btn-outline-secondary btn-sm" style="width: 80px;">닫기</button>
                </div>
            </div>
            <!-- //적립금 적립 내역 팝업창 -->
        </div>
        <!-- //적립금 적립 내역 팝업창 폼 -->
    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>