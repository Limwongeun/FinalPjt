<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="projectList" value="${dataMap.projectList }"/>
<head>
  	<!-- Date Range Picker  -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
  
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
  
</head>

<body>
	 <!-- Main content -->
 	<section class="content-header"> 
<!-- 	  	<div class="container-fluid"> -->
<!-- 	  		<div class="row md-2"> -->
<!-- 	  			<div class="col-sm-6"> -->
<!-- 	  				<h1>공고등록</h1>  				 -->
<!-- 	  			</div> -->
<!-- 	  			<div class="col-sm-6"> -->
<!-- 	  				<ol class="breadcrumb float-sm-right"> -->
<!-- 			        <li class="breadcrumb-item"> -->
<!-- 			        	<a href="list.do"> -->
<!-- 				        	<i class="fa fa-dashboard"></i>공고 -->
<!-- 				        </a> -->
<!-- 			        </li> -->
<!-- 			        <li class="breadcrumb-item active"> -->
<!-- 			        	등록  -->
<!-- 			        </li>		         -->
<!-- 	    	  </ol> -->
<!-- 	  			</div> -->
<!-- 	  		</div> -->
<!-- 	  	</div> -->
	</section> 
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h3 class="card-title p-1">공고등록</h3>
						<div class ="card-tools">

							<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">생성</option>
							 </select>


							<button type="button" class="btn btn-primary" id="registBtn" style="background-color: #215287; border: 1px solid #215287;" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm" enctype="multipart/form-data">
							<div class="form-group">
								<label for="pblanc_sj">제 목</label> 
								<input type="text" id="pblanc_sj"
									name='pblanc_sj' class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
								<label for="pblanc_wrter">작성자</label> 
								<input type="text" readonly class="form-control" value="${loginUser.mber_ncnm }">
								<input type="hidden" id="pblanc_wrter" name="pblanc_wrter" class="form-control" value="${loginUser.mber_sn }">
							</div>
							<div class="form-group">
								<label for="pblanc_cn">내 용</label>
								<textarea class="textarea" name="pblanc_cn" id="pblanc_cn" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
							<div class="form-group">
								<label for="prjct_sn">공고 프로젝트</label> 
	                        	<c:if test="${!empty projectList }">
	                        <select class="form-control" name="prjct_sn" id="prjct_sn">
	                        	<c:forEach var="prjct_name" items="${projectList }">
   	                            <option value="${prjct_name.prjct_sn }">${prjct_name.prjct_sj }</option>
	                        	</c:forEach>
							</select>
	                        	</c:if>
	                        	<c:if test="${empty projectList }">
								<input type="text" id="prjct_sn" name='prjct_sn' class="form-control" placeholder="구인 할 프로젝트가 없습니다.">
								
	                        	</c:if>
	                        	</div>
							<div class="form-group">
								<label for="pblanc_bgnde">공고시작일자 </label> 
<!-- 								<input type="datetime-local" id="pblanc_bgnde" name="pblanc_bgnde"> -->
 								<input type="text" id="pblanc_bgnde" name='pblanc_bgnde' class="form-control"> 
							</div>							
							<div class="form-group">
								<label for="pblanc_clos_de">공고마감일자</label>
<!-- 								<input type="datetime-local" id="pblanc_clos_de" name="pblanc_clos_de">  -->
 								<input type="text" id="pblanc_clos_de" name='pblanc_clos_de' class="form-control"> 
							</div>							
							<div class="form-group">								
								<div class="card card-outline card-success" style="border-top: 3px solid #282c2f;" >
									<div class="card-header">
										첨부파일 
									<input type="file" name='uploadFile' id="uploadFile" style="display:none;" multiple/>
									<label for="uploadFile" style="width : 100px; background-color : #10316b; margin : 1px; padding: 1px; color : white; border-radius : 10px; text-align : center; font-weight : 300">업로드</label>
									</div>
									<div class="card-footer fileInput" id="fileInput">
									</div>
								</div>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
window.onload=function(){
	Summernote_start($('#pblanc_cn'));
    target = document.getElementById('uploadFile');
    target.addEventListener('change', function(){
        fileList = "";
        for(i = 0; i < target.files.length; i++){
            fileList += target.files[i].name + '<br>';
        }
        target2 = document.getElementById('fileInput');
        target2.innerHTML = fileList;
    });
}

//날짜 선택
$(function() {
  $('input[name="pblanc_bgnde"]').daterangepicker({
    //timePicker: true,
    //timePicker24Hour:true,
    singleDatePicker: true,
    timePickerIncrement :10,
    //autoUpdateInput: false,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
        format: 'YYYY-MM-DD',     // 일시 노출 포맷
        //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
        applyLabel: "확인",                    // 확인 버튼 텍스트
        cancelLabel: "취소",                   // 취소 버튼 텍스트
        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
  	}
  });
  
  $('input[name="pblanc_clos_de"]').daterangepicker({
    //timePicker: true,
    //timePicker24Hour:true,
    singleDatePicker: true,
    timePickerIncrement :10,
    //autoUpdateInput: false,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
        format: 'YYYY-MM-DD',     // 일시 노출 포맷
        //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
        applyLabel: "확인",                    // 확인 버튼 텍스트
        cancelLabel: "취소",                   // 취소 버튼 텍스트
        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
  	}
  });
});


// function addFile_go(){
// 	//alert("add file btn");
	
// 	// var form=$('<form>');
// 	// $('body').append(form)
// 	// form.submit();

// 	if($('input[name="uploadFile"]').length >=5){
// 		alert("파일추가는 5개까지만 가능합니다.");
// 		return;
// 	}
	
	
// 	var input=$('<input>').attr({"type":"file","name":"uploadFile"})
// 		.css("display","inline"); 
// 	var div=$('<div>').addClass("inputRow");
// 	div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");    		   		
// 	$('.fileInput').append(div);
// }
function regist_go(){
	var form = document.registForm;
	if(form.title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	
	form.submit();
}
</script>


<script>
function test(obj) {
	let date_4 = new Date(2021, 10, 26);
   var tex = "<p>사내 포털 시스템 업무 개발에 필요한 인원을 구합니다.<br/>"
   tex += "개발 필요 스펙:JAVA,ORACLE<br/>"
   tex += "총 필요 인원: 5명<br/>"
 	tex += "담당업무 : DA</p>";
	
	if(obj.value==1){
		document.registForm.pblanc_sj.value = "사내 포털 시스템 개발프로젝트";
		$('#pblanc_cn').summernote('code',tex);
		
		  document.getElementById('pblanc_bgnde').value = new Date().toISOString().substring(0, 10);
		  document.getElementById('pblanc_clos_de').value = date_4.toISOString().substring(0, 10);

	}
}
</script>
</body>








