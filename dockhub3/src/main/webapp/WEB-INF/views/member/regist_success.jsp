<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
<script>
	alert("회원가입에 성공했습니다.\n 로그인 페이지로 이동합니다.");
	
	window.onload=function(){
		location.href="<%=request.getContextPath()%>/index.do";
// 		$.ajax({
<%-- 			url:"<%=request.getContextPath()%>/getMcode.do?mName=회원목록", --%>
// 			type:"get",
// 			success:function(){
				
// 				window.close();				
// 			}
// 		});		
	}
</script>

</body>