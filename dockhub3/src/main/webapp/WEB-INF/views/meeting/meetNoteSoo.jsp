<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700;800&display=swap');


body{
   font-family: 'Nanum Myeongjo', serif;
}

<%-- #back::after{
    content: "";
    background: url(<%=request.getContextPath()%>/resources/logo.png);
    background-size: contain;
    opacity: 0.15;
    position: fixed;
    top: 42px;
    left: 0px;
    right: 0px;
    bottom: 0px;
} --%>


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
</head>
<body>
<!-- <button type="button" class="btn bg-gradient-secondary btn-sm" id="btn" style="text-align: right;">pdf 다운로드</button> -->
<!-- <hr id="hr"/> -->
<br>
  <div class="row no-print">
      <div class="col-12">
                  <button type="button" class="btn bg-gradient-secondary float-right" style="margin-right: 30px;" id="print" onclick="window.print()">
                    <i class="fas fa-print"></i> Print
                    </button>
                  <button type="button" class="btn btn-primary float-right" style="margin-right: 20px;" id="btn">
                    <i class="fas fa-download"></i> Generate PDF
                  </button>
                </div>
       </div><br>
<div class="" style="width:80%; height:90%; margin-left: 10%; margin-top:10%; border-width: thin; border-color: gray; 
background-position: bottom;
border-style: solid;
background-image: url('<%=request.getContextPath() %>/resources/logo3.png');" id="back">
              <!-- title row -->
              
              <div class="row">
                <div class="col-12">
                  <h1 style="text-align: center;margin-top: 10%;">
                    재학증명서
                  </h1>
                </div>
              </div>
              <br>
              
              
              <!-- info row -->
              <div class="" >
                <div class="" style="margin-left: 10%;margin-top: 30%;">
                  <h5>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; ${loginUser.name }</h5>
                  <h5>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; ${loginUser.id }</h5>
                  <h5>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${dataMap.dept2}" /></h5>
                  <h5>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${dataMap.dept}" /></h5>
                  <h5>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; ${grade }&nbsp;학년&nbsp;&nbsp;<c:out value="${dataMap.status}" /></h5><br>
                </div>
              </div>
              <!-- /.row -->

              <!-- Table row -->
                <div class="" style="text-align: center;margin-top: 30%;" >
                    <h4>위의 사실을 증명함.</h4><br>
                <h5 id="today"></h5>
                <h5>HS 대학교</h5>
                </div>

</div>   
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>

   var today = new Date();
   var year = today.getFullYear();
   var month = ('0' + (today.getMonth() + 1)).slice(-2);
   var day = ('0' + today.getDate()).slice(-2);
   var dateString = year + '년' + month  + '월' + day + '일';
   
   document.getElementById('today').innerHTML=dateString;
   
$('#btn').click(function(){
   
    //숨기기
      document.getElementById('btn').style.display = "none";     
      document.getElementById('print').style.display = "none";     
    
//현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
html2canvas(document.body, {
  onrendered: function(canvas) {
 
    // 캔버스를 이미지로 변환
    var imgData = canvas.toDataURL('image/png');
     
    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    var imgHeight = canvas.height * imgWidth / canvas.width;
    var heightLeft = imgHeight;
     
        var doc = new jsPDF('p', 'mm');
        var position = 0;
        
         // 첫 페이지 출력
         doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
         <%-- doc.addImage(<%=request.getContextPath()%>/resources/logo.png , 'PNG', 15,40,500,500); --%>
         heightLeft -= pageHeight;
         
       
       
        // 파일 저장
        doc.save('재학증명서.pdf');
        }
   });
});
</script>
</body>

</html>>