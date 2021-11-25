<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}
</style>
</head>
<body>
	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})
		});
	</script>
	<!-- main content -->
	<form role="form" method="post" action="modify.do" id=modifyForm
		name="modifyForm">
		<section class="content-header" style="overflow-x: hidden;">
			<!-- start row -->
			<div class="row justify-content-center">
				<div class="col-md-12">
					<!-- start card -->
					<div class="card-header py-3">
						<div class="container">
							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">단위업무</li>
								<li class="tab-link" data-tab="tab-2">히스토리</li>
							</ul>
						</div>
						<!-- start card body -->
						<div class="card-body pad" style="margin-right: 12px;">
							<div class="form-group">
								<label>단위업무명</label> <input class="form-control" readonly type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;" value="${detailDutyCharge.unit_job_nm}">
							</div>
							<div class="form-group">
								<label>프로젝트명</label> <input class="form-control" readonly type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;" value="${detailDutyCharge.prjct_sj}">
							</div>
							<div class="form-group">
								<label> 담&nbsp&nbsp&nbsp당&nbsp&nbsp&nbsp자</label> <input class="form-control" readonly type="text"
									style="margin-left: 100px; margin-top: -37px; width: 85%; text-align: center;" value="${detailDutyCharge.mber_ncnm}">
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
								<label for="unit_job_pro"> 완&nbsp료&nbsp율(%)</label>
								<select id="unit_job_pro" name="unit_job_pro" style="margin-left: 39%; border: none;">
									<option value="0"
										<c:if test="${detailDutyCharge.unit_job_pro eq '0' }">selected="selected"</c:if>>0%</option>
									<option value="10"
										<c:if test="${detailDutyCharge.unit_job_pro eq '10' }">selected="selected"</c:if>>10%</option>
									<option value="20"
										<c:if test="${detailDutyCharge.unit_job_pro eq '20' }">selected="selected"</c:if>>20%</option>
									<option value="30"
										<c:if test="${detailDutyCharge.unit_job_pro eq '30' }">selected="selected"</c:if>>30%</option>
									<option value="40"
										<c:if test="${detailDutyCharge.unit_job_pro eq '40' }">selected="selected"</c:if>>40%</option>
									<option value="50"
										<c:if test="${detailDutyCharge.unit_job_pro eq '50' }">selected="selected"</c:if>>50%</option>
									<option value="60"
										<c:if test="${detailDutyCharge.unit_job_pro eq '60' }">selected="selected"</c:if>>60%</option>
									<option value="70"
										<c:if test="${detailDutyCharge.unit_job_pro eq '70' }">selected="selected"</c:if>>70%</option>
									<option value="80"
										<c:if test="${detailDutyCharge.unit_job_pro eq '80' }">selected="selected"</c:if>>80%</option>
									<option value="90"
										<c:if test="${detailDutyCharge.unit_job_pro eq '90' }">selected="selected"</c:if>>90%</option>
									<option value="100"
										<c:if test="${detailDutyCharge.unit_job_pro eq '100' }">selected="selected"</c:if>>100%</option>
								</select>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-3">
											<label style="vertical-align: sub;">시&nbsp작&nbsp일&nbsp자</label>
										</div>
										<div class="col-sm-9">
											<input class="form-control" readonly type="text" style="text-align: center; width: 90%; margin-left: 16%;"
												value="${fn:substring(detailDutyCharge.unit_job_bgnde,0,10) }" />
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-3">
											<label style="vertical-align: sub; margin-left: 20%;">종&nbsp료&nbsp일&nbsp자</label>
										</div>
										<div class="col-sm-9">
											<input class="form-control" readonly type="text" style="text-align: center; width: 90%; margin-left: 21%;"
												value="${fn:substring(detailDutyCharge.unit_job_endde,0,10) }" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="content" style="margin-top: 10px;">&nbsp&nbsp메&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp모</label>
								<div class="form-group col-sm-12" style="margin-top: -3%;">
									<label for="unit_job_cn"></label>
									<textarea class="textarea" name="unit_job_cn" id="unit_job_cn" rows="4" cols="54" placeholder="내용을 입력하세요."
										style="margin-left: 16%; margin-top: -7%;"><c:out value="${detailDutyCharge.unit_job_cn}" /></textarea>
								</div>
								<!-- end card body -->
							</div>
							<!-- start card footer -->
							<div class="card-tools" style="text-align: right;">
								<button type="button" class="btn btn-primary" id="modifyBtn" onclick="modify_go();">저 장</button>&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-danger" id="cancelBtn" onclick="window.close();">취 소</button>
							</div>
							<input type="hidden" name="unit_job_sn" id="unit_job_sn" value="${detailDutyCharge.unit_job_sn}">
							<div class="card-footer" style="display: none">
							<!--end card footer  -->
							</div>
							<!-- end card -->
						</div>
					</div>
					<!-- end row -->
				</div>
		</section>
	</form>
	<script>
		function modify_go() {
			var form = document.modifyForm;
			form.submit();
		}
	</script>
</body>
</html>