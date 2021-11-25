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
	
	fn_tab("A");
});
</script>
<script>
function modify_go(){
	$('#detailForm').attr('action','modifyForm.do');
	$('#detailForm').submit();
}

function fn_tab(gubun){
	var url = "";
	if(gubun == 'A'){
		url = "detail.do";
	}else{
		url = "dutyChargeHis.do";
	}
	
	jQuery.post(
			url,
		    {unit_job_sn : $("#unit_job_sn").val()},
		  function(responseText){
		     jQuery("#resultDiv").html(responseText);
		   },
		"html"
		 );
}
</script>	
	<!-- main content -->
	<form id="detailForm" name="detailForm">
		<section class="content-header" style="overflow-x: hidden;">
			<!-- start row -->
			<div class="row justify-content-center">
				<div class="col-md-12">
					<!-- start card -->
					<div class="card-header py-3">
						<div class="container">
							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1" onclick="fn_tab('A');">단위업무</li>
								<li class="tab-link" data-tab="tab-2" onclick="fn_tab('B');">히스토리</li>
							</ul>
						</div>
						<div id="resultDiv" class="card-body pad">
						
						</div>
							<!-- start card footer -->
<!-- 						<div class="card-tools" style="text-align: right;"> -->
<!-- 							<button type="button" class="btn btn-primary" id="registBtn" -->
<!-- 								onclick="modify_go();">수 정</button> -->
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							<button type="button" class="btn btn-danger" id="cancelBtn" -->
<!-- 								onclick="window.close();">닫 기</button> -->
<!-- 						</div> -->
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
</body>
</html>