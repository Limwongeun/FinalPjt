<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <c:set var="projectList" value="${dataMap.projectList }"/> --%>
<head>
  	<!-- Date Range Picker  -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
  
</head>

<body>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공고수정</h1>  				
	  			</div>
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
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h3 class="card-title">공고수정</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="modifyBtn" style="background-color: #215287; border: 1px solid #215287;" onclick="modify_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify.do" name="modifyForm"  enctype="multipart/form-data">
							<input type="hidden" name="pblanc_sn" value="${recruit.pblanc_sn }" />
							<div class="form-group">
								<label for="pblanc_sj">제 목</label> 
								<input type="text" id="pblanc_sj"
									name='pblanc_sj' class="form-control" value="${recruit.pblanc_sj }">
							</div>							
							<div class="form-group">
								<label for="pblanc_wrter">작성자</label> 
								<input type="hidden" id="pblanc_wrter" name="pblanc_wrter" value="${loginUser.mber_sn }">
								<input type="text"  readonly
									name="pblanc_wrter" class="form-control" value="${recruit.mber_ncnm }">
							</div>
							<div class="form-group">
								<label for="pblanc_cn">내 용</label>
								<textarea class="textarea" name="pblanc_cn" id="pblanc_cn" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;">${recruit.pblanc_cn }</textarea>
							</div>
							<div class="form-group">
								<label for="pblanc_bgnde">공고시작일</label> 
								<input type="text" id="pblanc_bgnde"
									name='pblanc_bgnde' class="form-control" value="${recruit.pblanc_bgnde }">
							</div>							
							<div class="form-group">
								<label for="pblanc_clos_de">공고마감일</label> 
								<input type="text" id="pblanc_clos_de"
									name='pblanc_clos_de' class="form-control" value="${recruit.pblanc_clos_de }">
							</div>							
						<div class="form-group col-sm-12">
							<label for="content">프로젝트</label>
							<div id="content">${recruit.prjct_sj }</div>	
						</div>
						<div class="form-group">								
							<div class="card card-outline card-success" style="border-top: 3px solid #282c2f;">
								<div class="card-header">
									<h5 style="display:inline;line-height:40px;">첨부파일 </h5>
									<input type="file" name='uploadFile' id="uploadFile" style="display:none;" multiple/>
									<label for="uploadFile" style="width : 100px; background-color : #10316b; margin : 5px; padding: 5px; color : white; border-radius : 30px; text-align : center; font-weight : 300">업로드</label>
								</div>
								<div class="card-footer fileInput" id="fileInput">
								<c:forEach items="${attachList }" var="attach">
									${attach.file_nm }						
								</c:forEach>
								</div>
							</div>
						</div>
						<input type="hidden" name="modify" id="modify" value="">
						<input type="hidden" name="file_sn" id="file_sn" value="${recruit.file_sn }">
						</form>
					</div><!--end card-body  -->

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
        $("#modify").val("modify");
    });
}

//날짜 선택
// $(function() {
//   $('input[name="pblanc_bgnde"]').daterangepicker({
//     //timePicker: true,
//     //timePicker24Hour:true,
//     singleDatePicker: true,
//     timePickerIncrement :10,
//     //autoUpdateInput: false,
//     startDate: moment().startOf('hour'),
//     endDate: moment().startOf('hour').add(32, 'hour'),
//     locale: {
//         format: 'YYYY-MM-DD',     // 일시 노출 포맷
//         //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
//         applyLabel: "확인",                    // 확인 버튼 텍스트
//         cancelLabel: "취소",                   // 취소 버튼 텍스트
//         daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
//         monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
//         	]}
//   });
  
//   $('input[name="pblanc_clos_de"]').daterangepicker({
//     //timePicker: true,
//     //timePicker24Hour:true,
//     singleDatePicker: true,
//     timePickerIncrement :10,
//     //autoUpdateInput: false,
//     startDate: moment().startOf('hour'),
//     endDate: moment().startOf('hour').add(32, 'hour'),
//     locale: {
//         format: 'YYYY-MM-DD',     // 일시 노출 포맷
//         //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
//         applyLabel: "확인",                    // 확인 버튼 텍스트
//         cancelLabel: "취소",                   // 취소 버튼 텍스트
//         daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
//         monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
//         	]}
//   });
  

// });



function modify_go(){
	var form = document.modifyForm;
	if(form.title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	
	form.submit();
}
</script>
  
</body>








