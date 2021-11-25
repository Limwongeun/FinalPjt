<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<!-- Date Range Picker  -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<meta charset="UTF-8">
<title></title>
<style type="text/css">
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li{
  display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current{
	display: inherit;
}
</style>
</head>
<body>
<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});
</script>
<script>
function modify_go(){
	$('#detailForm').attr('action','modifyForm.do');
	$('#detailForm').submit();
}

</script>	
	<!-- main content -->
	<form id="detailForm" name="detailForm">
		<section class="content-header" style="overflow-x: hidden;">
			<!-- start row -->
			<div class="row justify-content-center">
				<div class="col-md-12">
					<!-- start card -->
						<!-- start card body -->
						<div class="card-body pad" style="margin-right: 1px;">
							<div class="form-group">
								<label>단위업무명</label> <input class="form-control" readonly
									type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;"
									value="${detailDutyCharge.unit_job_nm}">
							</div>
							<div class="form-group">
								<label>프로젝트명</label> <input class="form-control" readonly type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;"
									value="${detailDutyCharge.prjct_sj}">
							</div>
							<div class="form-group">
								<label> 담&nbsp&nbsp&nbsp당&nbsp&nbsp&nbsp자</label> <input
									class="form-control" readonly type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;"
									value="${detailDutyCharge.mber_ncnm}">
							</div>
							<div class="form-group">
								<label for="issue_title"> 업&nbsp무&nbsp상&nbsp태</label>
								<div class="form-control" readonly style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;">
									<c:choose>
										<c:when test="${detailDutyCharge.myst eq '지연'}">
											<div class="badge bg-danger" style="font-size: 12px; width: 50px; height: 20px;">${detailDutyCharge.myst }</div>
										</c:when>
										<c:when test="${detailDutyCharge.myst eq '진행'}">
											<div class="badge bg-success" style="font-size: 12px; width: 50px; height: 20px;">${detailDutyCharge.myst }</div>
										</c:when>
										<c:when test="${detailDutyCharge.myst eq '시작전'}">
											<div class="badge bg-warning" style="font-size: 12px; width: 50px; height: 20px;">${detailDutyCharge.myst }</div>
										</c:when>
										<c:when test="${detailDutyCharge.myst eq '종료'}">
											<div class="badge bg-primary" style="font-size: 12px; width: 50px; height: 20px;">${detailDutyCharge.myst }</div>
										</c:when>
									</c:choose>
								</div>
							</div>
							<div class="form-group">
								<label> 완&nbsp료&nbsp율(%)</label> <input class="form-control"
									readonly type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;"
									value="${detailDutyCharge.unit_job_pro}">
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-3">
											<label style="vertical-align: sub;">
												시&nbsp작&nbsp일&nbsp자</label>
										</div>
										<div class="col-sm-9">
											<input class="form-control" readonly type="text"
												style="text-align: center; width: 90%; margin-left: 25%;"
												value="${fn:substring(detailDutyCharge.unit_job_bgnde,0,10) }" />
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-3">
											<label style="vertical-align: sub; margin-left: 30%;">종&nbsp료&nbsp일&nbsp자</label>
										</div>
										<div class="col-sm-9">
											<input class="form-control" readonly type="text" style="text-align: center; width: 90%; margin-left: 28%;"
												value="${fn:substring(detailDutyCharge.unit_job_endde,0,10) }" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="content" style="margin-top: 10px;">&nbsp&nbsp메&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp모</label>
								<div class="form-group col-sm-12" style="margin-top: -3%;">
									<label for="unit_job_cn"></label>
									<c:if test="${!empty detailDutyCharge.unit_job_cn}">
										<div style="overflow-y:scroll;width: 109%;height: 80px;">
											<c:out value="${detailDutyCharge.unit_job_cn}" escapeXml="false" />
									</c:if>
										</div>
									<c:if test="${empty detailDutyCharge.unit_job_cn }">
										<div style="border: solid 1px white; text-align: center; width: 107%;">
											<div><strong>해당 내용이 없습니다.</strong></div>
										</div>
									</c:if>

								</div>
								<!-- end card body -->
							</div>
							<div class="card-tools" style="text-align: right;">
								<button type="button" class="btn btn-primary" id="registBtn" onclick="modify_go();">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-outline-secondary" id="cancelBtn" onclick="window.close();">닫 기</button>
							</div>
							<input type="hidden" name="unit_job_sn" id="unit_job_sn" value="${detailDutyCharge.unit_job_sn}">
						<div class="card-footer" style="display: none">
							<!--end card footer  -->
						</div>
						<!-- end card -->
				</div>
				<!-- end row -->
			</div>
		</section>
	</form>
</body>
</html>