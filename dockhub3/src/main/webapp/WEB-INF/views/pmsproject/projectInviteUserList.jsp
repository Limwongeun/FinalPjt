<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<head>
<script type="text/javascript">
		$(document).ready(function() {

			$('#inviteSearch').click(function(e) {
				e.preventDefault();

				$("#submitForm").submit();
			})
		})

		function inviteUser(invite,mber_sn) {
			$('#mber_sn').val(mber_sn);
			
			var role_sn = $("#role_sn"+invite+ " option:selected").val();
			$('#lastRoleSn').val(role_sn);
			
			$('#submitForm').attr('action', 'insertPjtUser.do').submit();
		}
	</script>
</head>
<title></title>

<body>
	<section class="content-header" >
	</section>
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-primary card-outline" style="border-top: 3px solid #282c2f;">
<!-- 					<div class="card-body box-profile"> -->
						<div class="card-header" style="">
							<h3 class="card-title" style="margin-top: 7px;">구성원 초대하기</h3>
							<div class="card-tools">
						    	<button type="button" id="listBtn" class="btn btn-default" style="border-color: #ddd;" onclick="CloseWindow();">닫 기</button>
					    	</div>
						</div>
						<div class="card-body" style="height: 600px;">
						<div id="keyword" class="card-tools">
								<div style="display: none;">
									<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go3();">
										<option value="10" >정렬개수</option>				  		
									</select>
								</div>
							</div>
							<form action="projectInviteUserList.do" method="post" id="submitForm">
							<!-- 검색은 대부분 post로 -->
							<div class="form-inline" style="margin-bottom: 20px; float: right;">
								<div class="input-group" data-widget="">
									<input type="text" name="search" placeholder="닉네임을 검색하세요" class="form-control form-control-sidebar" aria-label="Search">
									<input type="hidden" name="prjct_sn" value="${prjct_sn}" />
									<input type="hidden" id="mber_sn" name="mber_sn" value="" />
									<input type="hidden" id="lastRoleSn" name="lastRoleSn" value="" />
									<div class="input-group-append"></div>
								</div>
								<a href="#" class="btn btn-primary" id="inviteSearch" onclick="searchFunction();">검색</a>
							</div>
							<table class="table table-bordered text-center">
								<tr style="font-size: 0.95em;">
									<th style="width: 10%;">닉네임</th>
									<th style="width: 10%;">이 름</th>
									<th style="width: 10%;">역 할</th>
									<th style="width: 10%;">초 대</th>
								</tr>
								<c:if test="${empty projectInviteList }">
									<tr>
										<td colspan="4"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${projectInviteList }" var="result" varStatus="status">
									<tr style='font-size: 0.85em;'>
										<td>${result.mber_ncnm }</td>
										<td>${result.mber_nm }</td>
										<td>
											<select name="role_sn" id="role_sn${status.index}">
												<option value="169">DA</option>	
												<option value="167">AA</option>	
												<option value="168">TA</option>	
												<option value="170">UA</option>	
											</select>
										</td>
										<td><a href="#" onclick="inviteUser('${status.index}','${result.mber_sn}');" id="invite">초대</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
						</div>
						
<!-- 					</div> -->
					<div class="card-footer">
			<%@ include file="/WEB-INF/views/common/pagination4.jsp" %>
		</div>
	</div>
			</div>
		</div>
	</section>

	
	
<!-- 	<div class="modal-footer buttons-on-right"> -->
<!-- 		<button class="btn btn-default" type="button" onclick="window.close();"> -->
<!-- 			<span translate="common.cancel" class="ng-scope">닫기</span> -->
<!-- 		</button> -->
<!-- 	</div> -->
</body>





