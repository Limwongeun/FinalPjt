<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dutyChargeList" value="${dataMap.dutyChargeList}"/>
<c:set var="mileList" value="${mileMap.mileList}"/>

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
<!-- main content -->
<section class="content-header" style="overflow-x:hidden;">
	<!-- start row -->
	<div class="row justify-content-center">
		<div class="col-md-9"   >
			<!-- start card -->
			<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
				<!-- start header -->
				<div class="card-header">
					<h2 class="card-title p-1">이슈 등록</h2>

					
				<!-- end header -->
				</div>
				<!-- start card body -->
				<div class="card-body pad">
					<form role="form" method="post" action="regist.do" name="registForm">
						<div class="form-group">
							<label for="issue_title">이슈 제목</label>
							<input class="form-control" id="issue_title" name="issue_title" type="text" style="margin-left: 100px;
							margin-top: -37px; width: 81%;" placeholder="제목을 입력하세요">
						</div>
						<div class="form-group">
								<label for="prjct_sn">단위 업무</label> 
	                        	<c:if test="${!empty dutyChargeList }">
	                        <select class="form-control" name="unit_job_sn" id="unit_job_sn" style="margin-left: 100px;
							margin-top: -37px; width: 81%;">
	                        	<option value="" selected>단위업무를 선택하세요</option>
	                        	<c:forEach var="dutyChargeList" items="${dutyChargeList }">
   	                            <option value="${dutyChargeList.unit_job_sn }">${dutyChargeList.unit_job_nm }</option>
	                        	</c:forEach>
							</select>
	                        	</c:if>
                       	</div>
						<div class="form-group">
								<label for="prjct_sn">마일스톤</label> 
	                        	<c:if test="${!empty mileList }">
	                        <select class="form-control" name="mile_no" id="mile_no" style="margin-left: 100px;
							margin-top: -37px; width: 81%;">
	                        	<option value="" selected>마일스톤을 선택하세요</option>
	                        	<c:forEach var="mileList" items="${mileList }">
   	                            <option value="${mileList.mile_no }">${mileList.mile_title}</option>
	                        	</c:forEach>
							</select>
	                        	</c:if>
                       	</div>
						<div class="form-group">
							<label for="prjct_sn">중요도</label> 
								<select class="form-control" id="issue_ipcr_se_code" name="issue_ipcr_se_code"
								style="margin-left: 100px; margin-top: -37px; width: 81%;">
									<option value="" selected>중요도를 선택하세요</option>
									<option value="0">낮음</option>
									<option value="1">보통</option>
									<option value="2">높음</option>
									<option value="3">심각</option>
<!-- 									<option value="" selected>중요도를 선택하세요</option> -->
<!-- 									<option value="0" -->
<%-- 										<c:if test="${dutyChargeList.issue_ipcr_se_code eq 0 }">selected="selected"</c:if>>낮음</option> --%>
<!-- 									<option value="1" -->
<%-- 										<c:if test="${dutyChargeList.issue_ipcr_se_code eq 1 }">selected="selected"</c:if>>보통</option> --%>
<!-- 									<option value="2" -->
<%-- 										<c:if test="${dutyChargeList.issue_ipcr_se_code eq 2 }">selected="selected"</c:if>>높음</option> --%>
<!-- 									<option value="3" -->
<%-- 										<c:if test="${dutyChargeList.issue_ipcr_se_code eq 3 }">selected="selected"</c:if>>심각</option> --%>
								</select>
						</div>
						<div class="form-group">
							<label for="issue_content">설 명 </label>   			
							<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">생성</option>
							 </select>
							<textarea class="textarea" name="issue_content" id="issue_content" rows="20"
						     placeholder="1000자 내외로 작성하세요." style="display: none;" ></textarea>
						</div>
						<div class="form-group">
							<label for="issue_startdate">참고자료</label>
							<input class="form-control" type="file" name="" id="">
						</div>
					
						<div class ="card-tools" style="text-align: right;">
							<button type="button" class="btn btn-primary" id="registBtn" style=" background-color: #215287; border: 1px solid #215287;" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="window.close();">취 소</button>
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
window.onload=function(){
	Summernote_start($('#issue_content')); 
}
function regist_go(){
	var form = document.registForm;
	if(form.issue_title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	if(form.issue_ipcr_se_code.value==""){
		alert("중요도 선택은 필수입니다.");
		return;
	}
	form.submit();
	document.registForm.submit();	
}
 </script>
 
 <script>
 function test(obj) {
		let date_4 = new Date(2021, 10, 26);
	   var tex = "<p>요구사항 정의서 수정중 발생한 이슈<br/>"
	   tex += "요구사항 정의서 수정중 이슈가 발생했습니다<br/>"
	 	tex += "참고해주세요<br/>";
	 	tex += "</p>";
		
		if(obj.value==1){
			document.registForm.issue_title.value = "요구사항 정의서 수정중 발생한 이슈";
			$('#issue_content').summernote('code',tex);
			

		}
	}

 </script>
</body>
</html>