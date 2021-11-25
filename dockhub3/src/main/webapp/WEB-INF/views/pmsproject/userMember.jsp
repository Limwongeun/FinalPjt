<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cri" value="${pageMaker.cri }" />

<head>
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
		<div class="container-fluid">
			<div class="row">
				<span style="margin-left: 17px;">
					<h5>구성원 목록</h5>
				</span>
				<div class="col-sm-12">
					<div class="row">
						<c:forEach items="${projectUser }" var="project">
							<div class="col-md-3" style='font-size: 0.85em; cursor: pointer;'
								onclick="OpenWindow('projectProfile.do?prjct_sn=${project.prjct_sn }&mber_sn=${project.mber_sn }','상세보기',450,590);">
								<div class="info-box">
									<span class="info-box-icon bg-info" style="background-color: white!important;">
									<c:choose>
										<c:when test="${project.mber_photo eq null}">
											<img
											src="<%=request.getContextPath() %>/resources/images/user.png"
											class="brand-image img-circle elevation-3" 
											style="width : 60px; height : 60px; margin:10px"
											alt="">
										</c:when>
										<c:otherwise>
											<img
											src="<%=request.getContextPath() %>/member/getPicture.do?picture=${project.mber_photo }"
											class="brand-image img-circle elevation-3" 
											style="width : 60px; height : 60px; margin:10px"
											alt="">
										</c:otherwise>
									</c:choose>
									</span>
									<div class="info-box-cont ent">
										<span class="info-box-text">닉네임 : ${project.mber_ncnm }</span>
										<span class="info-box-text">이 름 : ${project.mber_nm }</span> <span
											class="info-box-text">담당역할 : ${project.role_nm }</span>
									</div>
								</div>
							</div>
						</c:forEach>
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
	<div class="card-header with-border" style="text-align: right; border: none; margin-top: -65px;">
		<button type="button" onclick="OpenWindow('excl_userForm.do?prjct_sn=${prjct_sn}','신청',600,430);"
			class="btn btn-primary">신 청</button>
	</div>


	<section>
		<div class="card-body">
			<div class="container-fluid">
				<span
					style="margin-left: 17px; margin: auto; margin-top: 30px; text-align: center;">
					<h5>구성원 제외 신청</h5>
				</span>
				<table class="table table-bordered text-center">
					<tr style="font-size: 0.95em;">
						<th style="width: 10%;">No</th>
						<th style="width: 10%;">신청일자</th>
						<th style="width: 10%;">처리일자</th>
						<th style="width: 10%;">처리상태</th>
					</tr>
					<c:if test="${empty exclProcessUser }">
						<tr>
							<td colspan="4"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${exclProcessUser }" var="exclProcessUser"
						varStatus="status">
						<tr style='font-size: 0.85em;'
							onclick="OpenWindow('excl_process_accept_user_detail.do?excl_reqst_sn=${exclProcessUser.excl_reqst_sn }','상세보기',500,380)";>
							<td>${status.count}</td>
							<td>${exclProcessUser.apply_date}</td>
							<td>${exclProcessUser.excl_reqst_return_process_de}</td>
							<td>${exclProcessUser.sttus}</td>
							<!-- 	    					<span style="margin-right: 20px;"> -->
							<%-- 	                          <a class="btn btn-primary btn-sm" onclick="OpenWindow('excl_accept.do?excl_reqst_sn=${exclList.excl_reqst_sn}&user_sn=${exclList.user_sn}&prjct_sn=${prjct_sn}&role_sn=${exclList.role_sn}&excl_applcnt=${exclList.excl_applcnt}','상세보기',600,600);">수락</a> --%>
							<%-- 	                          <a class="btn btn-danger btn-sm" onclick="OpenWindow('excl_refuseForm.do?excl_reqst_sn=${exclList.excl_reqst_sn}','상세보기',600,400);">반려</a></span> --%>
							<!-- 	                      	</td> -->
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>

</body>

