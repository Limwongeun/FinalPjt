<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<title>아이디 찾기 완료</title>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Font Awesome Icons -->
<link rel="stylesheet"   href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
   
<!-- include summernote css/js -->
<link href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css" rel="stylesheet">

<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">


<body class="hold-transition login-page">
<c:forEach items="${memList }" var="member">
<c:if test="${!empty memList }">
<div>
회원님의 아이디는  ${member.mber_id} 입니다.
<br><br>
<button class="btn btn-lg btn-primary" type="button" onclick="javascript:fn_findPw();">비밀 번호 찾기</button>
<button class="btn btn-lg btn-info" type="button" onclick="javascript:fn_main();">로그인 화면</button>

</div>
</c:if>
</c:forEach>
<c:if test="${empty memList }" >
<div>
해당 정보에 맞는 아이디가 없습니다.
<br>
<br>
<button class="btn btn-lg btn-primary" type="button" onclick="javascript:fn_findPw();">비밀 번호 찾기</button>
<button class="btn btn-lg btn-info" type="button" onclick="javascript:fn_main();">로그인 화면</button>

</div>
</c:if>   

<script>   
	function fn_main() {
		   window.location.href = '/ddit'
		   
		}
	function fn_findPw() {
		   window.location.href = '#'
		   
		}
</script>
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<!-- summernote Editor -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.js"></script>

<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

</body>
</html>




