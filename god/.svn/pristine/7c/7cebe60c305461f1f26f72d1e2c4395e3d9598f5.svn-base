<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 공지사항</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_notice.css">

</head>
<body>
<div id="wrap">
    <!-- 좌측 메뉴 -->
    <div id="left">
        <h5>사내 게시판</h5>
        <div id="sub_menu">
            &nbsp; <a href="${rootPath}/admin/admin_notice.do">- 공지사항</a><br>
            &nbsp; <a href="${rootPath}/admin/admin_web_improve.do">- 웹 사이트 개선</a>
        </div>
    </div>
    <!-- 우측 본문 -->
    <div id="container">
        <!-- 현재창 title -->
        <header>
            | 공지사항
        </header>

        <div style="width: 687px; margin: 0 auto;">
            <select id="select_box">
                <option value="제목+내용">제목+내용</option>
                <option value="제목">제목</option>
                <option value="내용">내용</option>
            </select>
            <input type="text" placeholder="내용을 입력하세요!" style="width: 500px; height: 30px; margin: 0 10px; padding: 0 5px;">
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="" style="float: right; width: 70px;">검색</button>
        </div>

        <table id="notice_tbl">
            <tr style="background-color: rgb(203,203,203);">
                <td>번호</td>
                <td>제목</td>
                <td>작성일</td>
            </tr>
            <tr>
                <td>{번호}</td>
                <td>{제목}</td>
                <td>{yyyy-mm-dd}</td>
            </tr>
        </table>

        <div style="text-align: right;">
            <button type="button" class="btn btn-outline-secondary btn-sm" 
            		onclick="location.href='${rootPath}/admin/admin_notice_write.do'" 
            	    style="width: 70px;">글쓰기</button>
        </div>

        <!-- Paging -->
        <div id="pagination">
            <a href="#">|처음|</a> &nbsp;&nbsp;&nbsp;
            <a href="#">◀︎ 이전</a>&nbsp;
            <a href="#">[1]</a>&nbsp;
            <a href="#">[2]</a>&nbsp;
            <a href="#">[3]</a>&nbsp;
            <a href="#">[4]</a>&nbsp;
            <a href="#">[5]</a>&nbsp;
            <a href="#">다음 ▶︎</a> &nbsp;&nbsp;&nbsp;
            <a href="#">|마지막|</a>
        </div>

    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>