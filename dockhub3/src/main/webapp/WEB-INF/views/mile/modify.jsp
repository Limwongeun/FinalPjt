<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>

<!-- Date Range Picker  -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 

<!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>

 <body>  
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
<!-- 	  				<h1>수정하기</h1>  				 -->
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
  <!-- Main content -->
    <section class="content container-fluid">
<!-- 		<div class="row"> -->
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
				
					<div class="card-header row" style="margin-left: 0px; margin-right: 0px;">
						<h4 class="col-md-8">마일스톤 수정</h4>
						<div class="col-md-4">
							<div class="float-right">
								<button type="button" class="btn btn-warning" id="modifyBtn" style="background: #84a7d3; border: 1px solid #84a7d3; color:white;" onclick="modify_go();">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default " id="cancelBtn" onclick="CloseWindow();">취 소</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify.do?mile_no=${milestone.mile_no }" name="modifyForm">
							<input type="hidden" name="mile_no"  id="mile_no" value="${milestone.mile_no }">
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" name='mile_title' class="form-control" value="${milestone.mile_title}">
							</div>
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly	name="mile_wrter" class="form-control"  value="${milestone.mile_wrter}">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="mile_content" id="content" rows="3"
									placeholder="500자 내외로 작성하세요.">${fn:escapeXml(milestone.mile_content) }</textarea>						
							</div>
							<div class="form-group">
								<label for="mile_state_code">상 태</label>		
								<select name="mile_state_code" class="form-control" style="font-size:0.9em;">
									<option value="1">OPEN</option>
									<option value="0">CLOSE</option>
								</select>					
							</div>
							
							<div class="form-group">
								<label for="mile_startdate">시작일</label> 
								<input type="text" id="mile_startdate" name="mile_startdate" class="form-control"  value="${milestone.mile_startdate}">
							</div>
							<div class="form-group">
								<label for="mile_enddate">종료일</label> 
								<input type="text" id="mile_enddate" name="mile_enddate" class="form-control"  value="${milestone.mile_enddate}">
							</div>
							<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
						</form>
					</div><!--end card-body  -->
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
    
    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
     
    <script>
//     	window.onload=function(){
//     		Summernote_start($("#content"));
//     	}
    	
     	
    	function modify_go(){
    		$("form[role='form']").submit();
    	}
    	
    	$(function() {
    		  $('input[name="mile_startdate"]').daterangepicker({
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
    		        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
    		        	]}
    		  });
    		  
    		  $('input[name="mile_enddate"]').daterangepicker({
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
    		        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
    		        	]}
    		  });
    		  

    		});
    	
    </script>
</body>





