<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 방문자수 / 페이지뷰</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_visitor.css">

</head>
<body>
<div id="wrap">
    <!-- 좌측 메뉴 -->
    <%@ include file="/resources/common/admin/total_left.jsp" %>

    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 방문자수 / 페이지뷰
        </header>

        <input type="text" style="width: 50px; padding-left: 5px;"> 년
        <input type="text" style="width: 33px; padding-left: 5px;"> 월
        <button type="button" class="btn-outline-secondary btn-sm"
                style="width: 70px; margin-left: 20px;">검색</button>
        <button type="button" class="btn-outline-secondary btn-sm"
                style="float: right; width: 100px;">다운로드</button>
        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - {년}년 {월}월 방문자 수 {방문자 수}명
        </div>
        <!-- 방문자수 테이블 -->
        <table id="visitor_tbl">
            <colgroup>
                <col width=11.2%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%>
            </colgroup>
            <tr class="visitor_tbl_tr1">
                <td>날짜/시간</td>
                <td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td>
                <td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td>
                <td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td>
                <td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr class="visitor_tbl_tr1">
                <td>합계</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
        </table>
        <!-- //방문자수 테이블 -->

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - {년}년 {월}월 페이지 뷰 {페이지 뷰}회
        </div>
        <!-- 페이지뷰 테이블 -->
        <table id="visitor_tbl">
            <colgroup>
                <col width=11.2%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%><col width=3.7%><col width=3.7%><col width=3.7%>
                <col width=3.7%>
            </colgroup>
            <tr class="visitor_tbl_tr1">
                <td>날짜/시간</td>
                <td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td>
                <td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td>
                <td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td>
                <td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td>{yy-mm-dd}</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr class="visitor_tbl_tr1">
                <td>합계</td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
        </table>
        <!-- //페이지뷰 테이블 -->
    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>
