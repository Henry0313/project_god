<%-- <!-- spring security post 전송시 403 문제 패치 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>

<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/> --%>

<c:set var="jquery" value="${rootPath}/resources/js/jQuery/3.4.1/jquery-3.4.1.min.js" />
<c:set var="jqueryui_css" value="${rootPath}/resources/js/jQueryUI/1.12.1/jquery-ui.min.css" />
<c:set var="jqueryui_js" value="${rootPath}/resources/js/jQueryUI/1.12.1/jquery-ui.min.js"  />
<c:set var="bootstrap_css" value="${rootPath}/resources/js/bootstrap/4.4.1/css/bootstrap.min.css"/>
<c:set var="bootstrap_js" value="${rootPath}/resources/js/bootstrap/4.4.1/js/bootstrap.min.js" />
<c:set var="popper_js" value="${rootPath}/resources/js/bootstrap/popper/popper.min.js" />
<c:set var="summernote_css" value="${rootPath}/resources/summernote-master/dist/summernote-lite.css" />
<c:set var="summernote_js" value="${rootPath}/resources/summernote-master/dist/summernote-lite.js" />

<!-- jQuery : 3.4.1 -->
<script src="${jquery}" charset="UTF-8"></script>

<!-- jQuery UI css/js : 1.12.1 -->
<link rel="stylesheet" href="${jqueryui_css}">
<script src="${jqueryui_js}" charset="UTF-8"></script>

<!-- bootstrap css/js -->
<link rel="stylesheet" href="${bootstrap_css}" > 
<script src="${bootstrap_js}" charset="UTF-8"></script> 

<!-- popper -->
<script src="${popper_js}" charset="UTF-8"></script> 

<!-- editor tool summernote css/js -->
<link rel="stylesheet" href="${summernote_css}" >
<script src="${summernote_js}" charset="UTF-8"></script>

<!-- rootPath js -->
<script>
	var rootPath="${pageContext.request.contextPath}";
</script>

<!-- <script>
//jQuery
$(document).ready(function(){
   
    // spring  security post 전송시 403 에러 대처 패치
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
   
    $(function() {
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });
});
</script> -->
