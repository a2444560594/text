<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>示例页面</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<style type="text/css">
.demo ul {
	margin: 0 20px;
}	
</style>
</head>
<body class="demo" style="width:1024; min-width: 1024px; padding-left: 20px;">
	
	<label>基础模块</label>
	<ul>
		<li><a class="clickableText" page="">测试</a></li>
	</ul>
	
</body>

<script type="text/javascript">
;(function( $ ) {
	
	var $body = $(".demo");
	$body.on("click", ".clickableText", function() {
		window.open('demoPage?page=' + $(this).attr("page"));
	});
	
})( jQuery );
</script>
</html>
