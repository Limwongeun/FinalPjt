<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	alert("수정이 완료되었습니다.");
	location.href="<%=request.getContextPath()%>/mypage/scheduler/detail.do?mber_schdul_sn=${memberSchedule.mber_schdul_sn}&from=modify"
</script>