<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<br>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<div class="card-icon">
					<h3 class="card-title">개인 정보 조회</h3>

				</div>
			</div>

			<div class="card-body">
				<form action="">
					<input type="hidden" id="mber_sn" name="mber_sn" value="${member.mber_sn }">
					<div class="form-group row">
						<div class="col-md-12" style="margin-left: auto;">
							<div id="pictureView" data-id="${member.mber_id}"
								style="border: 1px solid #282c2f; height: 250px; width: 200px; margin: 0 auto;"></div>
						</div>
					</div>
					<br>

					<div class="form-group row" style="margin-left: 5%">
						<label for="mber_nm" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_nm"
								name="mber_nm" readonly="readonly" value="${member.mber_nm }">
						</div>
						<label for="mber_ncnm" class="col-sm-2 col-form-label">닉네임</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_ncnm"
								name="mber_ncnm" readonly="readonly"
								value="${member.mber_ncnm }">
						</div>
					</div>
					<br>
					<div class="form-group row" style="margin-left: 5%">
						<label for="mber_moblphon_no" class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_moblphon_no"
								name="mber_moblphon_no" readonly="readonly"
								value="${member.mber_moblphon_no }">
						</div>

						<label for="mber_repo" class="col-sm-2 col-form-label">GIT</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_repo"
								name="mber_repo" readonly="readonly"
								value="${member.mber_repo }">
						</div>
					</div>
					<br>
					<div class="form-group row" style="margin-left: 5%">
						<label for="mber_brthdy" class="col-sm-2 col-form-label">생년월일</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mber_brthdy"
								name="mber_brthdy" readonly="readonly"
								value="${member.mber_brthdy }">
						</div>
						<label for="mber_sexdstn" class="col-sm-2 col-form-label">성별</label>
						<div class="col-sm-4">
						<c:set var="sexdstn" value="${member.mber_sexdstn }"/>
						<c:choose>
							<c:when test="${sexdstn eq 0 }">
								<input type="text" class="form-control" id="mber_sexdstnview"
									name="mber_sexdstnview" readonly="readonly"
									value="여성">
							</c:when>
							<c:when test="${sexdstn eq 1 }">
								<input type="text" class="form-control" id="mber_sexdstnview"
									name="mber_sexdstnview" readonly="readonly"
									value="남성">
							</c:when>
							<c:when test="${empty sexdstn }">
								<input type="text" class="form-control" id="mber_sexdstnview"
									name="mber_sexdstnview" readonly="readonly"
									value="">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mber_sexdstnview"
									name="mber_sexdstnview" readonly="readonly"
									value="">
							</c:otherwise>
						</c:choose>
								<input type="hidden" class="form-control" id="mber_sexdstn"
									name="mber_sexdstn" readonly="readonly"
									value="${member.mber_sexdstn }">
						</div>
					</div>
					<br>
					<div class="form-group row" style="margin-left: 5%">
						<label for="mber_career_code" class="col-sm-2 col-form-label">경력</label>
						<div class="col-sm-4">
							<c:set var="career_code" value="${member.mber_career_code }"/>
						<c:choose>
							<c:when test="${career_code eq 0 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="학생">
							</c:when>
							<c:when test="${career_code eq 1 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="1~3년">
							</c:when>
							<c:when test="${career_code eq 2 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="3~5년">
							</c:when>
							<c:when test="${career_code eq 3 }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="5년 이상">
							</c:when>
							<c:when test="${empty career_code }">
							<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mber_career_codeview"
								name="mber_career_codeview" readonly="readonly"
								value="">
							
							</c:otherwise>
						</c:choose>
							<input type="hidden" class="form-control" id="mber_career_code"
								name="mber_career_code" readonly="readonly"
								value="${member.mber_career_code }">
						</div>
						<label for="mber_sttus_code" class="col-sm-2 col-form-label">프로젝트
							참여 유무</label>
						<div class="col-sm-4">
							<c:set var="sttus_code" value="${member.mber_sttus_code }"/>
						<c:choose>
							<c:when test="${sttus_code eq 0 }">
							<input type="text" class="form-control" id="mber_sttus_codeview"
								name="mber_sttus_codeview" readonly="readonly"
								value="비활성">
							</c:when>
							<c:when test="${sttus_code eq 1 }">
							<input type="text" class="form-control" id="mber_sttus_codeview"
								name="mber_sttus_codeview" readonly="readonly"
								value="활성">
							</c:when>
							<c:when test="${sttus_code eq 2 }">
							<input type="text" class="form-control" id="mber_sttus_codeview"
								name="mber_sttus_codeview" readonly="readonly"
								value="초대 거부">
							</c:when>
							<c:when test="${empty sttus_code }">
							<input type="text" class="form-control" id="mber_sttus_codeview"
								name="mber_sttus_codeview" readonly="readonly"
								value="">
							</c:when>
						</c:choose>
							<input type="hidden" class="form-control" id="mber_sttus_code"
								name="mber_sttus_code" readonly="readonly"
								value="${member.mber_sttus_code }">
						</div>
					</div>
				</form>
				<br>
				<div class="col text-center">
					<button type="button" class="btn btn-primary btn"
						style="float: inherit;" onclick="modify_go(${member.mber_sn })">수정</button>
						<c:set value="${param.from }" var="as"/>
						<c:choose>
							<c:when test="${as eq 'aside' }"> <button class="btn btn-default btn" onclick="window.close()">닫기</button> </c:when>
						</c:choose>
				</div>

			</div>
		</div>
	</div>
<script>
window.onload=function(){
    MemberPictureThumb(document.querySelector('[data-id="${member.mber_id}"]'),'${member.mber_photo}','<%=request.getContextPath()%>');
    <c:if test="${param.from eq 'modify'}" >
    alert("수정이 완료 되었습니다.");
    
	 </c:if>
}
function modify_go(no){
	location.href="modifyForm.do?mber_sn="+no;
	formObj.attr('action','modifyForm.do').submit();
} 
</script>
</body>
</html>