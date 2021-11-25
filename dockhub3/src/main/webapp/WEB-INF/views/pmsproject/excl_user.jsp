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

<div class="card card-primary card-outline" style="margin-left: 10px; margin-right: 10px; margin-top: 15px; border-top: 3px solid #282c2f;">
		<div class="card-body box-profile">
			<div class="text-center" style="font-weight: 600; font-size: 25px; padding-bottom: 18px;">구성원제외 신청</div>
			<form action="excl_user.do" method="post" id="submitForm">
				<ul class="list-group list-group-unbordered mb-3">
					<li class="list-group-item"><b></b>
						<textarea rows="" cols="" placeholder="제외 사유를 입력하세요." id="excl_prvonsh" name="excl_prvonsh" 
						style="margin-top: 0px; margin-bottom: 10px; width:548px; height: 170px;"></textarea>
						<input type="hidden" name="excl_applcnt" value="${param.excl_applcnt}" />
						<input type="hidden" name="prjct_sn" value="${param.prjct_sn}" />
				</li>
				</ul>
	
				<div class="modal-footer buttons-on-right" style="border-top: hidden;">
				<select onchange="javascript:test(this);">
					<option value="0" selected="selected"></option>
					<option value="1">생성</option>
				 </select>
						<a href="#" class="btn btn-primary" id="insertProjectExclReason" style="background-color: #215287; border: 1px solid #215287;" onclick="fn_save();">등 록</a>
					<button class="btn btn-default" type="button" onclick="window.close();">
						<span translate="common.cancel" class="ng-scope">닫 기</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#insertProjectExclReason").click(function(e) {
				e.preventDefault();

				$("#submitForm").submit();
			})
		})
		function fn_save(){
			$('#submitForm').attr('action','excl_user.do').submit();
		}
		
		function test(obj){
			var text = "업무 경험 증진을 위해서  개인 사정으로 이번달 말에 제외 되고자 하니 검토해주시기 바랍니다. 담당 업무에 관해서는 citron님에게 전달 하였으니 인수인계시 확인 해 주시기 바랍니다. 프로젝트의 마무리를 함께 하지 못하게 되어 죄송합니다."; 
			if(obj.value==1){
				$('#excl_prvonsh').val(text);

			}
		}

	</script>
</body>





