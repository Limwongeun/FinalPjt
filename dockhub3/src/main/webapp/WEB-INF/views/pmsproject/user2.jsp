<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cri" value="${pageMaker.cri }" />

<head>
<script type="text/javascript">
	document.ready(function() {

	})

	function fn_modifyBtn() {

		var url = "updateProjectUser.do";

		jQuery.post(url, {
			prjct_sn : $("#prjct_sn").val()
		}, function(responseText) {
			jQuery("#userDiv").html(responseText);
		}, "html");

	}
</script>
</head>

<title>구성원</title>
<body>
	<form id="ajaxForm" name="ajaxForm">
		<input type="hidden" id="prjct_sn" name="prjct_sn" value="${prjct_sn}" />
	</form>

	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1>구성원</h1>
				</div>
				<div class="col-sm-6">
					<h4 class="breadcrumb-item active"></h4>
				</div>
			</div>
		</div>
	</section>


	<section class="content">
		<div class="container-fluid" id="userDiv">
			<div class="row">
				<span style="margin-left: 17px;">
					<h5>구성원 목록</h5>
				</span>
				<div class="col-sm-12">

					<!-- 구성원 목록-->
					<div class="row">
						<c:forEach items="${projectUser }" var="project">
							<div class="col-md-3" style='font-size: 0.85em; cursor: pointer;' onclick="OpenWindow('projectProfile.do?prjct_sn=${project.prjct_sn }&mber_sn=${project.mber_sn }','상세보기',450,510);">
								<div class="info-box">
									<span class="info-box-icon bg-info"
										style="background-color: white !important;"> <c:choose>
											<c:when test="${project.mber_photo eq null}">
												<img src="<%=request.getContextPath()%>/resources/images/user.png" class="brand-image img-circle elevation-3"
													style="width: 60px; height: 60px; margin: 10px" alt="">
											</c:when>
											<c:otherwise>
												<img src="<%=request.getContextPath() %>/member/getPicture.do?picture=${project.mber_photo }" class="brand-image img-circle elevation-3"
													style="width: 60px; height: 60px; margin: 10px" alt="">
											</c:otherwise>
										</c:choose>
									</span>
									<div class="info-box-cont ent">
										<span class="info-box-text">닉네임 : ${project.mber_ncnm }</span>
										<span class="info-box-text">이 름 : ${project.mber_nm }</span>
										<span class="info-box-text">담당역할 : ${project.role_nm }</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section>
		<div class="card-body">
			<div class="container-fluid">
				<div class="card-header with-border" style="text-align: right; border: none; margin-top: -10px; margin-right: -20px;">
					<button type="button" onclick="OpenWindow('projectInviteUserList.do?prjct_sn=${prjct_sn}','상세보기',768,825);" class="btn btn-primary">초 대</button>
				</div>
				<span style="margin-left: 17px; margin: auto; margin-top: -9px; text-align: center;">
					<h5 style="margin-top: -38px; margin-bottom: 26px;">구성원 초대현황</h5>
				</span>
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-bordered text-center">
							<tr style="font-size: 0.95em;">
								<th colspan="2" style="width: 10%; font-size: 18px;">초대 목록</th>
							<tr>	
							<tr style="font-size: 0.95em;">
								<th style="width: 13%;">닉네임</th>
								<th style="width: 10%;">일자</th>
							</tr>
							<c:if test="${empty projectInvite }">
								<tr>
									<td colspan="2"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${projectInvite }" var="projectInvite">
								<tr style='font-size: 0.85em;'>
									<td>${projectInvite.mber_ncnm }</td>
									<td>${projectInvite.prjct_invite_de}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-bordered text-center">
							<tr style="font-size: 0.95em;">
								<th colspan="2" style="width: 10%; font-size: 18px;">거절 목록</th>
							<tr>	
							<tr style="font-size: 0.95em;">
								<th style="width: 13%;">닉네임</th>
								<th style="width: 10%;">일자</th>
							</tr>
							<c:if test="${empty refuse }">
								<tr>
									<td colspan="2"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${refuse }" var="refuse">
								<tr style='font-size: 0.85em;'>
									<td>${refuse.mber_ncnm }</td>
									<td>${refuse.prjct_invite_res_de }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content-header"
		style="border-top: 1px solid #dee2e6; margin-top: 20px;">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1>구성원 제외</h1>
				</div>
				<div class="col-sm-6">
					<h4 class="breadcrumb-item active"></h4>
				</div>
			</div>
		</div>
	</section>


	<section>
		<div class="card-body">
			<div class="container-fluid">
				<span style="margin-left: 17px; margin: auto; margin-top: 30px; text-align: center;">
					<h5>구성원 제외 신청 목록</h5>
				</span>
				<table class="table table-bordered text-center">
					<tr style="font-size: 0.95em;">
						<th style="width: 10%;">No</th>
						<th style="width: 10%;">신청자</th>
						<th style="width: 10%;">신청일자</th>
<!-- 						<th style="width: 10%;">처리요청일자</th> -->
						<th style="width: 10%;">담당역할</th>
						<th style="width: 10%;">관리</th>
					</tr>
					<c:if test="${empty exclList }">
						<tr>
							<td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${exclList }" var="exclList" varStatus="status">
						<tr style='font-size: 0.85em;'>
							<td>${status.count}</td>
							<td onclick="OpenWindow('excl_user_detail.do?excl_reqst_sn=${exclList.excl_reqst_sn}&user_sn=${exclList.user_sn}','상세보기',420,430);">${exclList.mber_ncnm}</td>
							<td>${exclList.apply_date}</td>
<%-- 							<td>${exclList.excl_rqestde}</td> --%>
							<td>${exclList.role_nm}</td>
							<td class="project-actions text-right"><span style="margin-right: 20px;"> 
								<a class="btn btn-primary btn-sm" onclick="OpenWindow('excl_accept.do?excl_reqst_sn=${exclList.excl_reqst_sn}&user_sn=${exclList.user_sn}&prjct_sn=${prjct_sn}&role_sn=${exclList.role_sn}&excl_applcnt=${exclList.excl_applcnt}','상세보기',430,310);">수락</a>
								<a class="btn btn-danger btn-sm" onclick="OpenWindow('excl_refuseForm.do?excl_reqst_sn=${exclList.excl_reqst_sn}','상세보기',600,400);">반려</a></span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>


	<section>
		<div class="card-body">
			<div class="container-fluid">
				<span style="margin-left: 17px; margin: auto; margin-top: 30px; text-align: center;">
					<h5>구성원 제외 처리 목록</h5>
				</span>
				<table class="table table-bordered text-center">
					<tr style="font-size: 0.95em;">
						<th style="width: 7%;">No</th>
						<th style="width: 10%;">신청자</th>
						<th style="width: 10%;">신청일자</th>
						<th style="width: 10%;">처리일자</th>
						<th style="width: 10%;">처리상태</th>
					</tr>
					<c:if test="${empty exclProcessList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${exclProcessList }" var="exclProcessList" varStatus="status">
						<tr style='font-size: 0.85em;'>
							<td>${status.count}</td>
							<td onclick="OpenWindow('excl_process_accept_detail.do?excl_reqst_sn=${exclProcessList.excl_reqst_sn }','상세보기',450,380)";>${exclProcessList.mber_ncnm}</td>
							<td>${exclProcessList.apply_date}</td>
							<td>${exclProcessList.excl_reqst_return_process_de}</td>
							<td>${exclProcessList.sttus}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>


</body>

