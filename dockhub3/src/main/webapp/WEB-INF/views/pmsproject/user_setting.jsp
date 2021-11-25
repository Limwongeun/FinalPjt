<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cri" value="${pageMaker.cri }" />

<head>
<script type="text/javascript">
	document.ready(function(){
		
		
	})

</script>


</head>

<title>구성원</title>

<body>
	<form>
		<div class="row">
			<span style="margin-left: 17px;">
				<h4>구성원 담당업무 관리</h4>
			</span>
			<div class="col-sm-12">
				<div class="card-header with-border"
					style="text-align: right; border: none; margin-top: -50px; margin-right: -5px;">
					<button type="button" onclick="location.href='projectProfile.do';"
						id="modifyBtn" class="btn btn-primary">저 장</button>
				</div>
	
				<!-- 구성원 목록-->
				<div class="row">
					<c:forEach items="${projectUser }" var="project" varStatus="status">
						<div class="col-md-3" style='font-size: 0.85em; cursor: pointer;'>
							
							<div class="info-box">
								<span class="info-box-icon bg-info"> <img
									src="<%=request.getContextPath()%>/member/mber_photo.do"
									class="brand-image img-circle elevation-3" alt="User Image">
								</span>
								<div class="info-box-cont ent">
									<span class="info-box-text">닉네임 : ${project.mber_ncnm }</span>
									<span class="info-box-text">이  름 : ${project.mber_nm }</span> 
									<span class="info-box-text">담당역할 : ${project.role_nm }</span>
									<select id="rollSelect${status.index}" name="rollSelect">
										<option value="166" <c:if test="${project.role_sn eq 166 }">selected="selected"</c:if> >PL</option>
										<option value="169" <c:if test="${project.role_sn eq 169 }">selected="selected"</c:if>>DA</option>
										<option value="167" <c:if test="${project.role_sn eq 167 }">selected="selected"</c:if>>AA</option>
										<option value="168" <c:if test="${project.role_sn eq 168 }">selected="selected"</c:if>>TA</option>
										<option value="170" <c:if test="${project.role_sn eq 170 }">selected="selected"</c:if>>UA</option>
<%-- 										<option value="6" <c:if test="${project.role_sn eq 6 }">selected="selected"</c:if>>비활성화</option> --%>
									</select>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</form>
</body>

