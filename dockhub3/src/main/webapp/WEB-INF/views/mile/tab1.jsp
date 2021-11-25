<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script type="text/javascript">
        function change_parent_url(url)
        {
        	 window.location.href=url;
        }		
    </script>
<a href="javascript:change_parent_url('<%=request.getContextPath()%>/pmsproject/issue');"> 
	Click here to change parent URL </a>

마일스톤입니다.
<%-- 	<button onclick="location.href='<%=request.getContextPath()%>/issue2/tab2'">이슈</button> --%>
<!-- 	<button  >마일스톤</button> -->
<!-- 	여기는 마일스톤입니다 -->

</body>
</html>