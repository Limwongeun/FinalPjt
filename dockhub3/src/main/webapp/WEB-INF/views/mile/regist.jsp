<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
	<!-- 서머노트 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css" />
	<!-- 부트스트랩 -->
	<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
	<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
	<!-- Date Range Picker  -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<meta charset="UTF-8">
<title></title>
</head>
<body>
   <section class="content-header">
<!--         <div class="container-fluid"> -->
<!--            <div class="row md-2"> -->
<!--               <div class="col-sm-6"> -->
<!--                  <h1>마일스톤 등록</h1>               -->
<!--               </div> -->
<!--            </div> -->
<!--         </div> -->
   </section>
   
<!-- main content -->
<section style="height: auto; width: 98%;">
	<!-- start row -->
	<div class="row justify-content-center">
		<div class="col-md-9" style="max-width:960px;">
			<!-- start card -->
			<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
				<!-- start header -->
				<div class="card-header">
					<h3 class="card-title p-1">마일스톤 등록</h3>
				    <select onchange="javascript:test(this);">
						<option value="0" selected="selected"></option>
						<option value="1">생성</option>
				    </select>
				<!-- end header -->
				</div>
				<!-- start card body -->
				<div class="card-body pad">
					<form role="form" method="post" action="regist.do" name="registForm">
						<div class="form-group">
							<label for="mile_title">제 목</label>
							<input class="form-control" id="mile_title" name="mile_title" type="text">
						</div>
						<div class="form-group">
							<label for="mile_content">설 명</label>
							<input class="form-control" id="mile_content" name="mile_content" type="text">
<!-- 							<textarea class="textarea" name="mile_content" id="mile_content" rows="20" -->
<!-- 						     placeholder="1000자 내외로 작성하세요." style="display: none;" ></textarea> -->
						</div>
						<div class="form-group">
							<label for="mile_startdate">시작일</label>
							<input class="form-control" type="text" name="mile_startdate" id="mile_startdate">
						</div>
					
						<div class="form-group">
							<label for="mile_enddate">마감일</label>
							<input class="form-control" type="text" name="mile_enddate" id="mile_enddate">
						</div>
					
						<div class ="card-tools" style="text-align: right;">
							<button type="button" class="btn btn-primary" id="registBtn" style="background-color: #215287; border: 1px solid #215287;" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();" >취 소</button>
						</div>
						<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}"> 
					</form>
				<!-- end card body -->	
				</div>
				<!-- start card footer -->
				<div class="card-footer" style="display:none">
				<!--end card footer  -->
				</div>
			<!-- end card -->	
			</div>
		</div>
	<!-- end row -->	
	</div>
</section>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<script>
// window.onload=function(){
// 	Summernote_start($('#mile_content')); 
// }
//날짜 선택
$(function() {
  $('input[name="mile_startdate"]').daterangepicker({
//     timePicker: true,
    //timePicker24Hour:true,
    singleDatePicker: true,
//     timePickerIncrement :10,
    //autoUpdateInput: false,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
        format: 'YYYY-MM-DD',     // 일시 노출 포맷
        //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
        applyLabel: "확인",                    // 확인 버튼 텍스트
        cancelLabel: "취소",                   // 취소 버튼 텍스트
        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
        	]}
  });
})
$(function() {
  $('input[name="mile_enddate"]').daterangepicker({
//     timePicker: true,
    //timePicker24Hour:true,
    singleDatePicker: true,
//     timePickerIncrement :10,
    //autoUpdateInput: false,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
        format: 'YYYY-MM-DD',     // 일시 노출 포맷
        //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
        applyLabel: "확인",                    // 확인 버튼 텍스트
        cancelLabel: "취소",                   // 취소 버튼 텍스트
        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
        	]}
  });
})

function regist_go(){
	var form = document.registForm;
	if(form.title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	form.submit();
	document.registForm.submit();	
}

function test(obj) {
	let date_4 = new Date(2021, 10, 26);
    var tex = "<p>DB에서 발생한 이슈입니다. 신속한 처리 부탁드립니다.<br/></p>";
//     tex += "개발 필요 스펙:JAVA,ORACLE<br/>"
//     tex += "총 필요 인원: 5명<br/>"
//  	tex += "담당업무 : DA</p>";
	
	if(obj.value==1){
		document.registForm.mile_title.value = "사내 포털 시스템 개발프로젝트";
		document.registForm.mile_content.value = "DB에서 발생한 이슈입니다. 신속한 처리 부탁드립니다.";

	}
}



 </script>
</body>
</html>