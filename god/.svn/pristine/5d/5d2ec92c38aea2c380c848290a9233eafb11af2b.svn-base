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
<link rel="stylesheet" href="${rootPath}/resources/css/member/find_id_pw.css">
<script>

function selectBtn(findSelect) {

    var email_find = document.getElementById("email_input");
    var phone_find = document.getElementById("phone_input");
    var email_fld = document.getElementById("email_fld");
    var phone_fld = document.getElementById("phone_fid");

    if( findSelect == "0") {
        email_find.style.display = "block";
        phone_find.style.display = "none";
        phone_fld.value = "";
        $("#email_fld").attr("required", true);
        $("#phone_fid").attr("required", false);
    }
    else {
        email_find.style.display = "none";
        phone_find.style.display = "block";
        email_fld.value = "";
        $("#email_fld").attr("required", false);
        $("#phone_fid").attr("required", true);
    }
}
</script>
</head>
<body>
<div id=wrap>
    <div id="find_wrap">
        <div id="find_title">
            <h2>FIND PW</h2>
        </div>
        <div id="find_type">
            Find Type :
            <input type="radio" id="email_select" name="find_pick" onclick="selectBtn('0');" checked>
            <label>Email Find</label>
            <input type="radio" id="phone_select" name="find_pick" onclick="selectBtn('1');">
            <label>Phone Find</label>
        </div>
        <form id="findPw" name="findPw" action="${rootPath}/member/find_pw_proc.do" method="POST">
	        <div id="find_text_wrap">
	            <div style="margin-bottom: 20px;">
	                <label class="id_pW_style">ID</label>
	                <input type="text"
	                	   name="memberId" 
	                	   class="id_pw_input" 
	                	   pattern="[a-zA-Z]{1}[a-zA-Z0-9]{7,19}"
	                	   required 
	                	   placeholder=" USER ID">
	            </div>
	
	            <div style="margin-bottom: 20px;">
	                <label class="id_pW_style">NAME</label>
	                <input type="text"
	                	   name="memberName" 
	                	   class="id_pw_input"
	                	   pattern="[가-힣]{2,20}"
	                	   required 
	                	   placeholder=" USER NAME">
	            </div>
	
	            <div id="email_input" style="display: block;">
	                <label class="id_pW_style">EMAIL</label>
	                <input type="text" 
	                	   id="email_fld" 
	                	   name="memberEmail"
	                	   class="id_pw_input"
	                	   pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"
	                	   required 
	                	   placeholder=" USER EMAIL">
	            </div>
	
	            <div id="phone_input" style="display: none;">
	                <label class="id_pW_style">PHONE</label>
	                <input type="text" 
	                	   id="phone_fid"
	                	   name="memberCellphone" 
	                	   class="id_pw_input" 
	                	   pattern="01\d{1}-\d{3,4}-\d{4}"
	                	   placeholder=" USER PHONE">
	            </div>
	        </div>
	
	        <div id="find_btn">
	            <input type="submit"
		               id="FindBtn"
		               name="FindBtn"
		               value="Find PW">
	            <a href="${rootPath}/member/find_id.do">Find ID?</a>
	        </div>
        </form>
    </div>
</div>
</body>
</html>