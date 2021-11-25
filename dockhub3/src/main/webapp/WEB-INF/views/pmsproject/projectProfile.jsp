<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<head>
<script type="text/javascript">
	$(document).ready(function() {
		
		<c:if test="${message ne null}">
			alert("${message}");
			window.opener.location.reload();
			window.close();
		</c:if>

		$("#userAuthorChange").click(function(e) {
			e.preventDefault();

			$("#submitForm").submit();
		})
	})
	function fn_save(){
		$('#submitForm').attr('action','userAuthorChange.do').submit();
	}

</script>
</head>

<title>구성원 프로필</title>

<body>
	<form action="userAuthorChange.do" method="post" id="submitForm">
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="card-body" style="margin-left: -20px;">
						<p style="font-size: 22px; font-weight: 600; margin-bottom: -5px; text-align: center;">구성원 프로필</p>
					</div>
				</div>
			</div>
		</section>
		<div class="card card-primary card-outline" style="margin-left: 10px; margin-right: 10px; border-top: 3px solid #282c2f;">
			<div class="card-body box-profile">
				<div class="text-center">
				<c:choose>
					<c:when test="${projectInvite.mber_photo eq null}">
						<img class="profile-user-img img-fluid img-circle"
						src="<%=request.getContextPath() %>/resources/images/user.png"
						alt="No image">
					</c:when>
					<c:otherwise>
					<img class="profile-user-img img-fluid img-circle"
						src="<%=request.getContextPath() %>/member/getPicture.do?picture=${projectInvite.mber_photo }"
						alt="No image" style="border: none;">
					</c:otherwise>
				</c:choose>
				
					
				</div>
				<h3 class="profile-username text-center">${projectInvite.mber_ncnm }</h3>
				<ul class="list-group list-group-unbordered mb-3">
					<li class="list-group-item"><b>이름</b> <a class="float-right">${projectInvite.mber_nm }</a>
					</li>
					<li class="list-group-item"><b>담당역할</b> 
					<a class="float-right">
					<c:choose>
						<c:when test="${author eq 0 }">
							<c:choose>
								<c:when test="${projectInvite.role_sn ne 166}">
									<select id="rollSelect${status.index}" name="role_sn">
										<option value="169"
											<c:if test="${projectInvite.role_sn eq 169 }">selected="selected"</c:if>>DA</option>
										<option value="167"
											<c:if test="${projectInvite.role_sn eq 167 }">selected="selected"</c:if>>AA</option>
										<option value="168"
											<c:if test="${projectInvite.role_sn eq 168 }">selected="selected"</c:if>>TA</option>
										<option value="170"
											<c:if test="${projectInvite.role_sn eq 170 }">selected="selected"</c:if>>UA</option>
								</select>
								</c:when>
								<c:otherwise>
									<option value="166"
											<c:if test="${projectInvite.role_sn eq 166 }">selected="selected"</c:if>>PL</option>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${projectInvite.role_sn eq 166 }">PL</c:when>
								<c:when test="${projectInvite.role_sn eq 169 }">DA</c:when>
								<c:when test="${projectInvite.role_sn eq 167 }">AA</c:when>
								<c:when test="${projectInvite.role_sn eq 168 }">TA</c:when>
								<c:when test="${projectInvite.role_sn eq 170 }">UA</c:when>
							</c:choose>							
						</c:otherwise>
					</c:choose>
					
					
					
					</a>
					</li>
					<li class="list-group-item"><b>Git-Hub Repository</b> <a
						class="float-right">${projectInvite.mber_repo }</a></li>
				</ul>
				<div style="text-align: right;">
					<c:if test="${author eq '0' }">
						<a href="#" class="btn btn-primary" id="userAuthorChange" onclick="fn_save();">저장</a> 
					</c:if>
					<input type="hidden" name="prjct_sn" value="${projectInvite.prjct_sn}" /> 
					<input type="hidden"name="mber_sn" value="${projectInvite.mber_sn}" />
					<button type="button" onclick="window.close();"
						class="btn btn-default">닫기</button>
				</div>
			</div>
			<!-- /.card-body -->
		</div>
	</form>
</body>





