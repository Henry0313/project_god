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
<link rel="stylesheet" href="${rootPath}/resources/css/member/join.css">

<!-- js 외장화 -->
<script src="${rootPath}/js/member/join.js" charset="UTF-8"></script>

<!-- daum 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>

    <!-- 전체 레이이아웃 -->
    <div id="wrap">

        <!-- 회원가입 폼 레이아웃 -->
        <div id="join_wrap">
	        <form id="joinForm" method="POST" action="${rootPath}/member/join_proc.do">
	
	            <!-- 회원가입 입력란 및 혜택 레이아웃 -->
	            <div id="join_div">
	
	                <!-- 혜택 레이아웃 -->
	                <div id="benefit_wrap">
	                    <h3 style="padding-top: 10px;">회원만을 위한혜택</h3>
	                    <div id="benefit">
	                        <table>
	                            <tbody>
	                                <tr>
	                                    <td>앱 설치시 1,000원 쿠폰 지급</td>
	                                    <td>포토리뷰 작성시 최대 50,000원 지급</td>
	                                    <td>5만원 이상 구매시 무료배송</td>
	                                </tr>
	                                <tr>
	                                    <td>카카오툭 친구 추가시 쿠폰 증정</td>
	                                    <td>신규가입시 적립금 3,000원 지급</td>
	                                    <td>회원등급에 따른 스페셜 할인혜택</td>
	                                </tr>
	                                <tr>
	                                    <td>회원가입시 1,000원 당장 지금</td>
	                                    <td>바로가기 설치시 적립금 1,000원 지급</td>
	                                    <td>회원가입자 한정 이벤트 쿠폰 발송</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <!-- //혜택 레이아웃 -->
	                <p style="text-align: right; color: red;"> *필수입력사항</p>
	                <!-- 회원가입 폼 -->                
	                <table>
	                    <caption></caption>
	                    <colgroup>
	                        <col style="width: 150px;">
	                        <col style="width: 1300px;">
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th>아이디<span style="color: red;">*</span></th>
	                            <td>
									<input type="text"
										   id="memberId"
										   name="memberId"
										   class="txt_input"  
										   maxlength="20"
										   pattern="[a-zA-Z]{1}[a-zA-Z0-9]{7,19}"
										   title="아이디는 영문으로 시작하며 영문/숫자 조합하여 8~20자로 입력하십시오"
										   required>
									
									<!-- Id 에러 메세지  -->  
									<span id="memberId_err" class="err_msg"></span>    
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>비밀번호<span style="color: red;">*</span></th>
	                            <td>
									<input type="password"
										   id="memberPw"  
										   name="memberPw"
										   class="txt_input"
										   maxlength="20"
										   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"  
										   required
										   title="패쓰워드는 영문대소문자/특수문자/숫자 조합하여 8~20자로 입력하십시오">
									
									<!-- Pw 에러 메세지  -->  
									<span id="memberPw_err" class="err_msg"></span>	                            
								</td>
	                        </tr>
	                        <tr>
	                            <th>비밀번호확인<span style="color: red;">*</span></th>
	                            <td>
									<input type="password"
										   id="memberPwCheck"  
										   name="memberPwCheck"
										   class="txt_input"
										   maxlength="20"
										   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"  
										   required
										   title="패쓰워드는 영문대소문자/특수문자/숫자 조합하여 8~20자로 입력하십시오">
									
									<!-- PwCheck 에러 메세지  -->  
									<span id="memberPwCheck_err" class="err_msg"></span>	
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>이름<span style="color: red;">*</span></th>
	                            <td>
									<input type="text"
										   id="memberName"
										   name="memberName"
										   class="txt_input"  
										   maxlength="40"
										   pattern="[가-힣]{2,5}"  
										   required
										   title="이름은 한글로 입력하십시오">	                            
								</td>
	                        </tr>
	                        <tr>
	                            <th>주소<span style="color: red;">*</span></th>
	                            <td>
									<input type="text"
										   id="memberZip"
										   name="memberZip"
										   class="txt_input"
										   pattern="\d{5}"  
										   maxlength="5"                                   
										   size="7"
										   readonly>
									<input type="button"
										   id="searchBtn"
										   name="searchBtn"
										   class="txt_input"
										   size="20"
										   value="우편번호"
										   style="width: 80px;"
										   onClick="searchPost()"><br>
									<input type="text"
										   id="memberAddr"  
										   name="memberAddr"
										   class="txt_input"
										   pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
										   maxlength="100"  
										   size="60"                                   
										   title="기본주소를 입력하십시오"
										   readonly>기본주소<br>
									<input type="text"
										   id="memberAddrDetail"  
										   name="memberAddrDetail"
										   class="txt_input"  
										   pattern="[\w | \W | 가-힣 | / | -]{2,100}"
										   maxlength="100"  
										   size="60"
										   title="상세주소를 입력하십시오">상세주소
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>일반전화</th>
	                            <td>
									<input type="text"
										   id="memberPhone"
										   name="memberPhone" 
										   class="txt_input" 
										   maxlength="13"
										   pattern="0\d{1,2}-\d{3,4}-\d{4}"
										   size="15"
										   title="">
									ex) 02-1234-5678	   
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>휴대폰번호<span style="color: red;">*</span></th>
	                            <td>
									<input type="text"
										   id="memberCellphone"
										   name="memberCellphone"  
										   class="txt_input"
										   maxlength="13"
										   pattern="01\d{1}-\d{3,4}-\d{4}"
										   required
										   size="15"
										   title="">
									ex) 010-1234-5678	   
									<!-- 핸드폰번호 에러 메세지 -->    
									<span id="memberCellphone_err" class="err_msg"></span>                        
								</td>
	                        </tr>
	                        <tr>
	                            <th>이메일<span style="color: red;">*</span></th>
	                            <td>
									<input type="text"
										   id="memberEmail"
										   name="memberEmail"
										   class="txt_input"  
										   pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"  
										   size="30"
										   maxlength="40"
										   required
										   title="">
									ex) user@getoutdoor.com	   
									<!-- 이메일 에러 메세지 -->	   
									<span id="memberEmail_err" class="err_msg"></span>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>생년월일<span style="color: red;">*</span></th>
	                            <td>
									<input type="text"
										   id="memberBirth"
										   name="memberBirth"
										   class="txt_input"  
										   pattern="\d{4}-\d{2}-\d{2}"  
										   maxlength="11"
										   required
										   title=""
										   style="width: 80px;">
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	                <!-- //회원가입 폼 -->
	
	            </div>
	            <!-- //회원가입 입력란 및 혜택 레이아웃 -->
	
	            <!-- 약관 동의 체크박스 레이아웃 -->
	            <div>
	                <!-- 전체동의 체크박스 -->
	                <h3>전체 동의</h3>
	                <p id="agreement">
	                    <span>
	                        <input type="checkbox"
	                               id="all_checkbox">&nbsp;이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.
	                    </span>
	                </p>
	                <!-- //전체동의 체크박스 -->
	
	                <!-- 필수 wrap -->
	                <div class="agreement_table" style="margin: 100px 0;">
	
	                    <!-- 필수 체크박스 -->
	                    <div class="agreement_row">
	                        <div class="agreement_cell">
	                            <h3>이용약관 동의</h3>
	                            <div class="agreement_admit_box" style="border-right: 0px;">
	                                <div class="agreement_content_box">
										제1조(목적)
										이 약관은 GetOutDoor (전자상거래 사업자)이 운영하는
										미스터스트릿 사이버 몰(이하 "몰"이라 한다)에서
										제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를
										이용함에 있어 사이버 몰과 이용자의 권리·의무 및
										책임사항을 규정함을 목적으로 합니다.
	                                </div>
	                                <p style="padding-top: 5px;">
	                                    <span>
											이용약관에 동의하십니까?
	                                        <input type="checkbox"
	                                               id="agreeCheck"
	                                               name="agreeCheck"
	                                               class="checkbox"
	                                               style="padding-top: 10px;">동의함
	                                    </span>
	                                </p>
	                            </div>
	                        </div>
	                        <div class="agreement_cell">
	                            <h3>개인정보 수집 및 이용 동의</h3>
	                            <div class="agreement_admit_box">
	                                <div class="agreement_content_box">
										1. 개인정보 수집목적 및 이용목적<br>
											가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
											콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송,
											금융거래 본인 인증 및 금융 서비스<br>
											나. 회원 관리<br>
											회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의
											부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인,
											만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인,
											불만처리 등 민원처리, 고지사항 전달<br>
										2. 수집하는 개인정보 항목 : 이름, 생년월일, 성별, 로그인ID, 비밀번호,
	  										자택 전화번호, 휴대전화번호, 이메일, 14세미만 가입자의 경우 법정대리인의 정보
	                                </div>
									<p style="padding-top: 5px;">
										<span>
											개인정보 수집 및 이용에 동의하십니까?
	                                        <input type="checkbox"
	                                               id="infoCheck"
	                                               name="infoCheck"
	                                               class="checkbox"
	                                               style="padding-top: 10px;">동의함
	                                    </span>
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- //필수 체크박스 -->
	
	                </div>
	                <!-- //필수 wrap -->
	            </div>
	            <!-- //약관 동의 체크박스 레이아웃 -->
	
	            <!-- SMS, 이메일, 평생회원 체크 레이아웃 -->
	            <div>
	                <div class="sms_email_font">
	                    SMS 수신을 동의하십니까?
	                    <input type="checkbox"
							   id="smsCheck"
							   name="smsCheck"
							   class="checkbox">동의함
	                </div>
	                <div class="sms_email_font">
						이메일 수신을 동의하십니까?
						<input type="checkbox"
							   id="emailCheck"
							   name="emailCheck"
							   class="checkbox">동의함
	                </div>
	                <div class="sms_email_font">
						평생 회원가입을 동의하십니까?
						<label class="radio" for="forever_yes">
							<input type="radio"
							   id="foreverCheck"
							   name="foreverCheck"
							   class="checkbox"
							   value="Y">동의함
	                    </label>
						<label for="forever_no">
							<input type="radio"
								   id="foreverCheckNot"
								   name="foreverCheck"
								   class="checkbox"
								   value="N"
								   checked>동의안함
	                    </label>
	                </div>
	                <div style="width:800px; margin:0 auto;">
						평생회원으로 가입하시면 (주)톰어패럴 회원 탈퇴시까지는
						휴면회원으로 전환되지 않으며,	고객님의 개인정보가 탈퇴시까지 안전하게 보관됩니다.<br>
						지금 평생회원으로 가입하시면 쿠폰혜택을 드립니다.
						(쿠폰혜택을 받으신 경우, 3개월간 평생회원을 유지하셔야 합니다.)
	                </div>
	            </div>
	            <!-- //SMS, 이메일, 평생회원 체크 레이아웃 -->
	
	            <!-- 회원가입/취소버튼 -->
	            <div style="text-align: center; padding-top: 30px;">
	                <input type="submit"
	                       id="joinSubmitBtn"
	                       name="joinSubmitBtn"
	                       value="회원가입">
	                <input type="submit"
	                       id="joinResetBtn"
	                       name="joinResetBtn"
	                       value="회원가입 취소">
	            </div>
	            <!-- //회원가입/취소버튼 -->
	            
			</form>
		</div>
        <!-- //회원가입 폼 레이아웃 -->
        
    </div>
    <!-- //전체 레이이아웃 -->
</body>
</html>