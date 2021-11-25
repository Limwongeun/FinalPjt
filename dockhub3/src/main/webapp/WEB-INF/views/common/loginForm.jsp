<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<title>로그인</title>


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


<body class="hold-transition login-page" style="background-color: #282c2f;">
<div class="login-box">
      <div class="login-logo">
<!--          <a href="#"><b>관리자 로그인</b></a> -->
		
      </div>
      <!-- /.login-logo -->
               <div style=" margin: 0 auto; width: 72%; margin-bottom: 33px; margin-top: -10px; margin-bottom: 13px;">
               	<img src="<%=request.getContextPath() %>/resources/images/logo3.png" style="width: 200px; margin-left: 10%;">
               	<img src="<%=request.getContextPath() %>/resources/images/logo33.png" style="width: 200px; margin-left: 10%; margin-top: -25px;">
               </div>
      <div class="card">
       <div class="card-body login-card-body" style="border-radius: 10px; background-color: #ccfff28c;">
<!--          <p class="login-box-msg">Sign in to start your session</p> -->

         <form action="<%=request.getContextPath() %>/common/login.do"   method="post">
            <div class="form-group has-feedback">
               <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요." value="${pastID }">
               <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
               <input type="password" class="form-control" name="pwd" id="pwd" placeholder="패스워드를 입력하세요."  value="">
               <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
<!--                <div class="col-sm-8"> -->
<!--                   <div class="checkbox icheck"><label> <input type="checkbox" name="rememberMe" value="check"> Remember Me</label> </div> -->
<!--                </div> -->
               <!-- /.col -->
               <div class="col-sm-4">
                  <button type="submit" class="" style=" background: #205e8d; border: none; border-radius: 4px; padding: 11px; box-shadow: none; text-shadow: none; outline: none; width: 319px; color: white; font-weight: 600; ">로그인</button>
               </div>
               <!-- /.col -->
            </div>
         </form>

         
		 <div style="float:left; width: 197px; float: left; margin-top: 7px;">
	         <a href="findIdForm" style="font-weight:bold; color: #282c2f">아이디 찾기</a> 
	         <a style="font-weight:bold;">/</a> 
	         <a href="#" style="font-weight:bold; color: #282c2f">패스워드 찾기</a><br>
	         <select id = "sel" onchange="javascript:test(this);">
		         <option value="0" selected="selected">선택</option>
		         <option value="1" >PL</option>
		         <option value="2">MEM1</option>
		         <option value="3">MEM2</option>
	         </select>
         </div> 
         <div class="" style="float:right; margin-right: 2px; margin-top: 6px;">
         <form action="<%=request.getContextPath() %>/member/registForm.do" method="post">
            <button type="submit" class="" style="border: 1px solid #282c2f; border-radius: 8px; margin-top: 3px;">회원가입</button>
         </form>
         </div>

      </div>
      <!-- /.login-box-body -->
     </div>   
   </div>
   <!-- /.login-box -->
   



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

<c:if test="${!empty message }" >

<script>   
   alert("${message}");  

</script>

</c:if>
<script type="text/javascript">

function test(obj) {
		if(obj.value==1){
			document.getElementById("id").value = "dockhubpl@gmail.com";
			document.getElementById("pwd").value = "dockhub12!";
		}
		if(obj.value==2){
			document.getElementById("id").value = "dockhubmem@gmail.com";
			document.getElementById("pwd").value = "dockhub12!";
		}
		if(obj.value==3){
			document.getElementById("id").value = "dockmem2@gmail.com";
			document.getElementById("pwd").value = "dockhub12!";
		}
		if(obj.value==4){
			document.getElementById("id").value = "dockmem3@gmail.com";
			document.getElementById("pwd").value = "dockhub12!";
		}
	} 
</script>
</body>
</html>




