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
<div >
	 <!-- Main content -->
	<section class="content-header">
<!-- 	  	<div class="container-fluid"> -->
<!-- 	  	</div> -->
	</section>
	 
  <!-- Main content -->
 
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h3 class="card-title p-1">참여 신청 상세보기</h3>
							<div class ="card-tools">
								<c:if test="${from ne 'meeting' }">
									<button type="button" class="btn btn-primary" id="applyBtn" onclick="acceptApply(${recruitApply.pblanc_sport_sn });">수 락</button>
									<button type="button" class="btn btn-warning" id="cancelBtn" onclick="refuseApply(${recruitApply.pblanc_sport_sn });" >거 절</button>
								</c:if>
									<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();" >닫기</button>
							</div>
					</div><!--end card-header  -->
					
					
					
			<div class="card-body" style="padding-bottom : 0px">
				<input type="hidden" id="mber_sn" name="mber_sn" value="${member.mber_sn }">
					<div class="form-group row" style="width: 520px; margin-left: 11px;
">
						<div  style="margin: 0 auto;margin-bottom : 20px">
							<c:choose>
								<c:when test="${member.mber_photo eq null }">
									<img style="border: 1px solid green; height: 200px; width: 200px; "src="<%=request.getContextPath() %>/resources/images/project.JPG">
								</c:when>
								<c:otherwise>
									<img  style="border: 1px solid green; height: 200px; width: 200px; "src="<%=request.getContextPath() %>/member/getPicture.do?picture=${member.mber_photo }">
								</c:otherwise>
							</c:choose>
	<%-- 							<div id="pictureView" data-id="${member.mber_id}" --%>
	<!-- 								style="border: 1px solid green; height: 200px; width: 200px; margin: 0 auto;"></div> -->
	<!-- 						</div> -->
						</div>

					<div class="form-group row">
						<label for="mber_nm" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_nm"
								name="mber_nm" readonly="readonly" value="${member.mber_nm }">
						</div>
						<label for="mber_ncnm" class="col-sm-2 col-form-label">닉네임</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_ncnm"
								name="mber_ncnm" readonly="readonly"
								value="${member.mber_ncnm }">
						</div>
					</div>
					<div class="form-group row">
						<label for="mber_moblphon_no" class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_moblphon_no"
								name="mber_moblphon_no" readonly="readonly"
								value="${member.mber_moblphon_no }">
						</div>

						<label for="mber_repo" class="col-sm-2 col-form-label">GIT</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_repo"
								name="mber_repo" readonly="readonly"
								value="${member.mber_repo }">
						</div>
					</div>
					<div class="form-group row">
						<label for="mber_career_code" class="col-sm-2 col-form-label">경력</label>
						<div class="col-sm-4">
							<c:set var="career_code" value="${member.mber_career_code }"/>
						<c:choose>
							<c:when test="${career_code eq 0 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="학생">
							</c:when>
							<c:when test="${career_code eq 1 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="1~3년">
							</c:when>
							<c:when test="${career_code eq 2 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="3~5년">
							</c:when>
							<c:when test="${career_code eq 3 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="5년 이상">
							</c:when>
							<c:when test="${empty career_code }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="">
							
							</c:otherwise>
						</c:choose>
							<input type="hidden" class="form-control" id="mber_career_code"
								name="mber_career_code" readonly="readonly"
								value="${member.mber_career_code }">
						</div>

						<label for="pblanc_sport_role" class="col-sm-2 col-form-label">역할선택</label>
						<div class="col-sm-4">
						<c:choose>
							<c:when test="${recruitApply.pblanc_sport_role eq 0}">
								<input type="text" class="form-control" id="pblanc_sport_role" name="pblanc_sport_role" readonly="readonly" value="DA">
							</c:when>
							<c:when test="${recruitApply.pblanc_sport_role eq 1}">
								<input type="text" class="form-control" id="pblanc_sport_role" name="pblanc_sport_role" readonly="readonly" value="AA">
							</c:when>
							<c:when test="${recruitApply.pblanc_sport_role eq 2}">
								<input type="text" class="form-control" id="pblanc_sport_role" name="pblanc_sport_role" readonly="readonly" value="TA">
							</c:when>
							<c:when test="${recruitApply.pblanc_sport_role eq 3}">
								<input type="text" class="form-control" id="pblanc_sport_role" name="pblanc_sport_role" readonly="readonly" value="UA">
							</c:when>
						</c:choose>
						</div>
					</div>
				</div>
					<div class="card-body pad" style="padding-top : 0px">
						<input type="hidden" name="pblanc_sport_sn" id="pblanc_sport_sn" value="${recruitApply.pblanc_sport_sn }">
						<input type="hidden" name="pblanc_sn" id="pblanc_sn" value="${recruitApply.pblanc_sn }">
<!-- 	                        <div> -->
<!-- 	                        	<label for="meeting_time">면접 가능 시간 </label>  -->
<%-- 	                        	<div id="meeting_time" style="height : 100px; border : 1px solid lightgrey; border-radius : 5px; padding : 10px; overflow-y:scroll">${recruitApply.pblanc_apply_meeting_time }</div> --%>
<%-- <%-- 								<div id="meeting_time" style="min-height : 100px; border : 1px solid lightgrey; margin:10px; padding: 5px">${recruitApply.pblanc_apply_meeting_time }</div> --%> 
<!-- 	                        </div> -->
	                        <br>
							<div class="form-group">
								<label for="pblanc_sport_cn">자기소개 및 경력</label>
	                        	<div id="pblanc_sport_cn" style="height : 240px; border : 1px solid lightgrey; border-radius : 5px; padding : 10px; overflow-y:scroll">${recruitApply.pblanc_sport_cn }</div>
<%-- 								<div id="pblanc_sport_cn" style="min-height : 100px; border : 1px solid lightgrey; margin:10px; padding: 5px">${recruitApply.pblanc_sport_cn }</div> --%>
							</div>

					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
		</div>
    </section>
    <!-- /.content -->
</div>



  <div class="modal fade" id="acceptModal" tabindex="-1" aria-labelledby="addGitModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="addGitModalLabel">신청 수락</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="labelmodal modal-body container-fluid">
      	<div class="selectDate">
	      	<label for="meetingDate">날짜 입력</label><br/>
	      	<input id="meetingDate" type="datetime-local">
      	</div>

      </div>
      <div class="modal-footer">
      	<button id="addMeeting" onclick="addMeetingDate(${recruitApply.pblanc_sport_sn })" class="btn btn-success">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" hidden="hidden">Close</button>
      </div>
    </div>
  </div>
</div>







<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
window.onload=function(){
	Summernote_start($('#content'));
	
}

function acceptApply(pblanc_sport_sn){
	$('#acceptModal').modal('toggle');

}

function refuseApply(pblanc_sport_sn){
	if (confirm("신청을 거절 하시겠습니까?") == true) {
		$.ajax({
			url:"refuseApply.do?pblanc_sport_sn="+pblanc_sport_sn,	
			type:"post",
			contentType:"application/json",
			success:function(res){
				opener.location.reload();
				window.close();
			},
			error:function(){
	// 			AjaxErrorSecurityRedirectHandler(error.status);		
				alert("getPage오류");
			}
		});
	}else{
		return;
	}
}
function addMeetingDate(pblanc_sport_sn){
	var meetingDate = $("#meetingDate").val();
	if (!meetingDate) {
		alert("면접 시간을 입력해주세요.");
		return;
	}
	$.ajax({
		url : "addMeetingDate.do?pblanc_sport_sn="+pblanc_sport_sn+"&meeting="+meetingDate,
		type:"post",
		contentType:"application/json",
		success: function(res){
			if(res == "OK"){
				setTimeout(function(){
					opener.location.reload();
					window.close();
				},30);
			} else {
				alert("에러지")
			}
		},
		error : function(){
			alert("면접시간 오류");
		}
	})
	
}
</script>
  
</body>








