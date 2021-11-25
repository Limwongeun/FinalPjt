<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<head>



</head>

<title></title>

<body>

<div class="card card-primary card-outline" style="margin-left: 10px; margin-right: 10px; margin-top: 15px; border-top: 3px solid #282c2f; ">
		<div class="card-body box-profile">
			<div class="text-center" style="font-weight: 600; font-size: 25px; padding-bottom: 18px;">구성원제외 신청 반려</div>
			<form action="excl_refuse.do" method="post" id="submitForm">
				<ul class="list-group list-group-unbordered mb-3">
					<li class="list-group-item"><b></b>
						<textarea rows="" cols="" placeholder="반려 사유를 입력하세요." name="excl_reqst_return_prvonsh" 
						style="margin-top: 0px; margin-bottom: 10px; width:548px; height: 170px;"></textarea>
						<input type="hidden" name="excl_reqst_sn" value="${param.excl_reqst_sn}" />
						<input type="hidden" name="excl_reqst_return_process_de" value="${param.excl_reqst_return_process_de}" />
				</li>
				</ul>
				<div class="modal-footer buttons-on-right" style="border: none; padding-top: 1px;">
						<a href="#" class="btn btn-primary" id="updateProjectRefuseReason" style="background-color: #215287; border: 1px solid #215287;" onclick="fn_save();">저장</a>
					<button class="btn btn-default" type="button" onclick="window.close();">
						<span translate="common.cancel" class="ng-scope">닫기</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#"updateProjectRefuseReason" ').click(function(e) {
				e.preventDefault();

				$("#submitForm").submit();
			})
		})
		function fn_save(){
			$('#submitForm').attr('action','excl_refuse.do').submit();
		}

	</script>
</body>





