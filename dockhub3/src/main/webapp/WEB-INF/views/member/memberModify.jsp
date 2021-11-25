<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                    <h3 class="card-title">개인 정보 수정 </h3>

                </div>
            </div>
            <div class="card-body">
                <form role="form" class="form-horizontal" action="modify.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="mber_sn" name="mber_sn" value="${member.mber_sn }">
                    <input type="hidden" id="mber_id" name="mber_id" value="${member.mber_id }">
                    <input type="hidden" id="oldPhoto" name="oldPhoto" value="${member.mber_photo }">

                    <div class="form-group row">
                        <input type="file" id="inputFile" onchange="changePicture_go();" name="mber_photo" style="display: none" />
                        <div class="col-md-12" style="margin-left: auto;">
                            <div id="pictureView" data-id="${member.mber_sn}" style="border: 1px solid #282c2f; height: 250px; width: 200px; margin: 0 auto;"></div>
                            <div class="input-group input-group-sm" style="width: 25%; margin-left: 36%;">
                                <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
                                <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled value="${member.mber_photo.split('\\$\\$')[1] }" />
                                <input id="mber_photo" class="form-control" type="hidden" id="uploadPicture" name="uploadPicture" />
                            </div>
                        </div>
                    </div>
                    <br>

                    <div class="form-group row" style="margin-left: 5%">
                        <label for="mber_nm" class="col-sm-2 col-form-label"><span style="color: red; font-weight: bold;">*</span>이름</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="mber_nm" name="mber_nm" value="${member.mber_nm }">
                        </div>
                        <label for="mber_ncnm" class="col-sm-2 col-form-label"><span style="color: red; font-weight: bold;">*</span>닉네임</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="mber_ncnm" name="mber_ncnm" value="${member.mber_ncnm }" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);">
                            <span class="input-group-append-sm">
                                <button type="button" onclick="idCheck_go();" class="btn btn-info btn-sm btn-append">중복확인</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-left: 5%">
                        <label for="pwd" class="col-sm-2 col-form-label"><span style="color: red; font-weight: bold;">*</span>비밀번호</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="mber_password" name="mber_password" onchange="check_pw()" placeholder="20글자 영문자,숫자,특수문자 조합">
                        </div>
                        <span id="check1"></span> <label for="pwd" class="col-sm-2 col-form-label"><span style="color: red; font-weight: bold;">*</span>비밀번호 확인</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="mber_password2" onchange="check_pw()" name="mber_password2">
                        </div>
                        <span id="check"></span>

                    </div>
                    <br>
                    <div class="form-group row" style="margin-left: 5%">
                        <label for="mber_moblphon_no" class="col-sm-2 col-form-label">전화번호</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="mber_moblphon_no" name="mber_moblphon_no" value="${member.mber_moblphon_no }">
                        </div>
                        <label for="mber_repo" class="col-sm-2 col-form-label">GIT</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="mber_repo" name="mber_repo" value="${member.mber_repo }"> <span class="input-group-append-sm">
                                <button type="button" id="regGit" class="btn btn-info btn-sm">인증</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-left: 5%">
                        <label for="mber_brthdy" class="col-sm-2 col-form-label">생년월일</label>
                        <div class="col-sm-4">
                                <c:set value="${member.mber_brthdy }" var="brthdy" />
                            <select name="mber_brthdy">
                                <%
									for (int i = 2021; i >= 1900; i--) {
								%>
								<c:set value="<%=i %>" var="year"/>
                                <option ${fn:substring(brthdy,0,4) == year ? "selected" : "" } value="<%=i%>"><%=i%></option>
                                <%
									}
								%>
                            </select>년&nbsp; <select name="mber_brthdy">
                                <%
									for (int i = 1; i <= 12; i++) {
										
								%>
								<c:set value="<%=i %>" var="month"/>
                                <option ${fn:substring(brthdy,4,6) == month ? "selected" : "" } value="<%=i%>"><%=i%></option>
                                <%
									}
								%>
								
                            </select>월&nbsp; <select name="mber_brthdy">
                                <%
									for (int i = 1; i <= 31; i++) {
								%>
								<c:set value="<%=i %>" var="day"/>
                                <option ${fn:substring(brthdy,6,8) == day ? "selected" : "" } value="<%=i%>"><%=i%></option>
                                <%
									}
								%>
                            </select>일
                        </div>
                        <label for="mber_sexdstn" class="col-sm-2 col-form-label">성별</label>
                        <div class="col-sm-4">
                            <select name="mber_sexdstn" class="form-control" style="font-size: 0.9em;">
                                <c:set value="${member.mber_sexdstn }" var="sexdstn" />
                                <c:choose>
                                    <c:when test="${sexdstn eq 0 }">
                                        <option value="0" selected="selected">여성</option>
                                        <option value="1">남성</option>
                                    </c:when>
                                    <c:when test="${sexdstn eq 1 }">
                                        <option value="0">여성</option>
                                        <option value="1" selected="selected">남성</option>
                                    </c:when>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="form-group row" style="margin-left: 5%">
                        <label for="mber_career_code" class="col-sm-2 col-form-label">경력</label>
                        <div class="col-sm-4">
                            <select name="mber_career_code" class="form-control" style="font-size: 0.9em;">
                                <c:set value="${member.mber_career_code }" var="career" />
                                <c:choose>
                                    <c:when test="${career eq 0 }">
                                        <option value="0" selected="selected">학생</option>
                                        <option value="1">1~3년</option>
                                        <option value="2">3~5년</option>
                                        <option value="3">5년 이상</option>
                                    </c:when>
                                    <c:when test="${career eq 1 }">
                                        <option value="0">학생</option>
                                        <option value="1" selected="selected">1~3년</option>
                                        <option value="2">3~5년</option>
                                        <option value="3">5년 이상</option>
                                    </c:when>
                                    <c:when test="${career eq 2 }">
                                        <option value="0">학생</option>
                                        <option value="1">1~3년</option>
                                        <option value="2" selected="selected">3~5년</option>
                                        <option value="3">5년 이상</option>
                                    </c:when>
                                    <c:when test="${career eq 3 }">
                                        <option value="0">학생</option>
                                        <option value="1">1~3년</option>
                                        <option value="2">3~5년</option>
                                        <option value="3" selected="selected">5년 이상</option>
                                    </c:when>
                                </c:choose>
                            </select>
                        </div>
                        <label for="mber_sttus_code" class="col-sm-2 col-form-label">프로젝트
                            참여 유무</label>
                        <div class="col-sm-4">
                            <select name="mber_sttus_code" class="form-control" style="font-size: 0.9em;">

                                <c:set value="${member.mber_sttus_code }" var="sttus" />
                                <c:choose>
                                    <c:when test="${sttus eq 0 }">
                                        <option value="0" selected="selected">비활성</option>
                                        <option value="1">활성</option>
                                        <option value="2">초대 거부</option>
                                    </c:when>
                                    <c:when test="${sttus eq 1 }">
                                        <option value="0">비활성</option>
                                        <option value="1" selected="selected">활성</option>
                                        <option value="2">초대 거부</option>
                                    </c:when>
                                    <c:when test="${sttus eq 2 }">
                                        <option value="0">비활성</option>
                                        <option value="1">활성</option>
                                        <option value="2" selected="selected">초대 거부</option>
                                    </c:when>
                                </c:choose>
                            </select>
                        </div>
                    </div>

                </form>
                <br>
                <div class="col text-center">
                    <button type="button" class="btn btn-primary btn" style="float: inherit; background-color: #215287; border: 1px solid #215287; " onclick="modify_go(${member.mber_sn})">저&nbsp;&nbsp;장</button>
                    <button type="button" id="cancelBtn" onclick="history.go(-1);" class="btn btn-default ">취&nbsp;&nbsp;소</button>

                </div>

            </div>
        </div>
    </div>

    <!-- /.content-wrapper -->
    <div class="modal fade" id="addGitModal" tabindex="-1" aria-labelledby="addGitModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="addGitModalLabel">Git 저장소 등록</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="gitAddModal labelmodal modal-body container-fluid">
                    <div class="gitIdArea">
                        <label for="gitId">Github 아이디</label><br /> <input id="gitId" type="text">
                        <button class="btn" onclick="githubIdCheck()">확인</button>
                        <i></i>
                    </div>
                    <div class="gitRepoArea">
                        <label for="repoName">저장소 이름</label><br /> <input id="repoName" type="text">
                        <button class="btn" onclick="githubRepoCheck()">확인</button>
                        <i></i>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="addGitRepoBtn" onclick="saveGithubRepo()" class="btn btn-success" disabled>저장</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" hidden="hidden">Close</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="./js/regist_js.jsp" />
    <jsp:include page="./js/modify_js.jsp" />
</body>

</html>