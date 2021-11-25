<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<title>아이디 찾기</title>



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
<div class="container">
  <div class="form-group">
  
  </div>   
   <form id="findIdForm" name="findIdForm" class="form-signin" action="<%=request.getContextPath()%>/findId" method="POST">
      <h2 class="form-findId-heading">아이디 찾기</h2>
      
      <label for="name" class="">이름</label>
      <input type="text" id="name" name="mber_nm" class="form-control" placeholder="가입할 때 입력한 이름을 입력해주세요." required autofocus>
      <br>
      
      <label for="phoneNum" class="">핸드폰 번호</label>
      <input type="text" id="phoneNum" name="mber_moblphon_no" class="form-control" placeholder="핸드폰 번호 입력" required autofocus>
      <button class="btn btn-default" type="button" onclick="javascript:fn_serialNum();">인증번호 받기</button>
      
      <br><br>
      <label for="phoneNum" class="">인증번호 확인</label>
      <input type="text" id="phoneNumCheck" name="phoneNumCheck" class="form-control" placeholder="인증 번호 4자리 숫자 입력" readonly="readonly">
      <button class="btn btn-default" type="button" onclick="javascript:fn_serialNumCheck();">인증번호 확인</button>

      
      <br><br>
      <button class="btn btn-lg btn-primary" type="button" onclick="javascript:fn_findId();">아이디 찾기</button>
      <button class="btn btn-lg btn-info" type="button" onclick="javascript:fn_main();">로그인 화면</button>
      
   </form>
</div><!-- /container -->



<script>   
var checkNum ="";	
var form = document.findIdForm;
var phoneTrue = false;

//아이디 찾기 버튼
function fn_findId(){
   
    console.log("아이디:"+$('#name').val());

   //alert("아이디:"+$('#name').val());
   //alert($('#phoneNum').val());
   if(form.mber_nm.value == ""){
      alert("이름을 입력해주세요.");
      form.mber_nm.focus();
      return;
   }
   if(form.mber_moblphon_no.value == ""){
      alert("휴대폰 번호를 입력해주세요.");
      form.mber_moblphon_no.focus();
      return;
   }
   
   if(!phoneTrue){
	   alert("휴대폰 인증 성공 후 다시 시도해주세요.")
      form.phoneNumCheck.focus();
	   return;
   }
   
   $('#findIdForm').submit();


}


//휴대폰 인증 보내기 버튼
function fn_serialNum() {
   $("#phoneNumCheck").attr('readonly', false); // 버튼 누르면 리드온리 취소
	
		
	var phoneNum = document.getElementById('phoneNum').value;	
		//alert(phoneNum)
		
		$.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/message",
			data: { phoneNum: phoneNum },
			success: function(res) {
			alert(phoneNum+'인증번호: '+res)
			checkNum = res;	
		   //console.log(checkNum);	
			}
		});

   }

//인증번호 확인 버튼
function fn_serialNumCheck() {
	if(form.phoneNumCheck.value==checkNum){
	   alert("인증 번호 일치");	
	   phoneTrue = true;
	   $("#phoneNumCheck").attr('readonly', true); // 버튼 누르면 리드온리 취소

	}else{
		alert("인증번호 불일치");
	}

}

//메인으로 버튼
function fn_main() {
   window.location.href = '/ddit'
   
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




