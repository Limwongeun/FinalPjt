<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<head></head>
<title></title>

<body>

	<div class="card card-primary card-outline" style="margin-left: 10px; margin-right: 10px; margin-top: 15px; border-top: 3px solid #282c2f;">
		<div class="card-body box-profile">
			<div class="text-center" style="font-weight: 600; font-size: 25px; padding-bottom: 18px;">인수자 및 인수인계기간 설정</div>
			<form action="excl_accept.do" method="post" id="submitForm">
				<ul class="list-group list-group-unbordered mb-3">
					<li class="list-group-item"><b>인수자</b> <a class="float-right">
						<select name="acptr">
							<!-- 데이터 전송 시 select의 name이 넘어감  -->
							<c:forEach items="${projectExclAccept}" var="result">
								<option value="${result.user_sn}">${result.mber_ncnm}</option>
								<!-- 선택된 option의 value의 값이 넘어감  -->
							</c:forEach>
						</select>
						<!-- 결과적으로  "user_sn=user_sn" 이런식임 -->
					</a></li>
					<li class="list-group-item"><b>인수인계기간</b>
						<div class="form-inline" style="float: right;">
							<div class="input-group">
								<span style="text-align: left;"></span> <input type="date" name="hndvr_period" class="form-control form-control-sidebar"
									style="height: 28px;"> <input type="hidden" name="prjct_sn" value="${exclAccept.prjct_sn}" />
									<input type="hidden" id="role_sn" name="role_sn" value="${param.role_sn}" />
									<input type="hidden" id="excl_applcnt" name="excl_applcnt" value="${param.excl_applcnt}" />
									<input type="hidden" id="user_sn" name="user_sn" value="${param.user_sn}" />
								<div class="input-group-append"></div>
							</div>
						</div>
				</ul>
				<div class="modal-footer buttons-on-right">
					<a href="#" class="btn btn-primary" id="updatePjcExclAccept" style="background-color: #215287; border: 1px solid #215287; "onclick="fn_save();">저장</a>
					<button class="btn btn-default" type="button" onclick="window.close();">
						<span translate="common.cancel" class="ng-scope">닫기</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<!-- /.card-body -->

	<script type="text/javascript">
		$(document).ready(function() {

			$("#updatePjcExclAccept").click(function(e) {
				e.preventDefault();

				$("#submitForm").submit();
			})
		})
		function fn_save() {
			$('#submitForm').attr('action', 'updatePjtUserExcl.do').submit();
		}
	</script>
</body>





