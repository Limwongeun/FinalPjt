<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/include/style.jsp" />
<jsp:include page="/WEB-INF/views/include/js.jsp"/>
<sitemesh:write property="head"/>
<style type="text/css">
body{
	font-family: Noto Sans KR;
}
</style>
</head>
<body>

<sitemesh:write property="body" />


</body>
</html>