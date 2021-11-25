<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
	alert("단위 업무 등록을 성공했습니다.");
	window.location.href="<%=request.getContextPath()%>/pmsDuty/dutycharge?prjct_sn=${prjct_sn}"
</script>