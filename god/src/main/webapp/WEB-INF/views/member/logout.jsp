<%@ page contentType="text/html; charset=UTF-8"	 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	${pageContext.request.userPrincipal.name}<br>
	
	<c:if test="${error eq 'true'}">
		${msg}
	</c:if>
	
	<script>
		alert("로그인 페이지로 이동합니다.");
		location.href="${pageContext.request.contextPath}/login/login.do";
	</script>
	
</body>
</html>