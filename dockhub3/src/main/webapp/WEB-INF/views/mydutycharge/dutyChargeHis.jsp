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
	<form id="detailForm" name="detailForm">
		<section class="content-header" style="overflow-x: hidden;">
			<!-- start row -->
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="card-body pad">
						<div class="form-group">
							<table class="table table-bordered text-center">
								<tr style="font-size: 0.95em;">
									<th style="width: 10%;">수정내용</th>
									<th style="width: 10%;">수정날짜</th>
								</tr>
								<c:if test="${empty dutyChargeHistory }">
									<tr>
										<td colspan="2"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${dutyChargeHistory }" var="his">
									<tr style='font-size: 0.85em;'>
										<td>${his.unit_job_updt_cn }</td>
										<td><c:set var="updde" value="${his.unit_job_updde }" />${fn:substring(updde,0,10) }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<input type="hidden" name="unit_job_sn" id="unit_job_sn" value="${unit_job_sn}">
					<!-- end row -->
				</div>
			</div>
		</section>
	</form>
</body>
</html>