<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="groupList" value="${dataMap.groupList }" />
<c:set var="chiefList" value="${dataMap.chiefList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="inviteList" value="${inviteMap.inviteList }"/>
<c:set var="cri" value="${pageMaker.cri }" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
</head>

<body>
    <c:if test="${from eq 'regist'}">
        <script>
            alert("등록에 성공했습니다.");
            window.opener.location.reload();
            window.close();
        </script>
    </c:if>
    <c:if test="${from eq 'remove'}">
        <script>
            alert("삭제에 성공했습니다.");
            window.opener.location.reload();
            window.close();
        </script>
    </c:if>
    <section class="content-header" style="border-top: 1px solid #dee2e6; margin-top: 20px;">
        <div class="container-fluid">
            <div class="row md-2">
                <div class="col-sm-6">
                    <h1>My Group</h1>
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
                <div id="keyword" class="card-tools">
                    <div class="input-group row">
                        <select class="form-control col-md-4" name="searchType" id="searchType" style="max-width: 167px; width: 100%;">
                            <option value="tw">전체</option>
                            <option value="t" selected="selected">그룹이름</option>
                            <option value="w">CHIEF</option>
                        </select> <input class="form-control" type="text" name="keyword" value="" style="max-width: 193px; width: 100%;">
                        <span class="input-group-append" style="margin-right: 2%">
                            <button class="btn btn-primary" type="button" onclick="listt_go(1,'main.do');" data-card-widget="search">
                                <i class="fa fa-fw fa-search"></i>
                            </button>
                        </span> <span style="float: right; margin-left: 47%;">
                            <button class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','등록',800,700);">
                                그룹 생성</button>
                        </span>
                    </div>


                </div>
                <%-- 					<button class="btn btn-primary" id="registBtn"onclick="OpenWindow('meetingRegistForm.do&prjct_sn='+${prjct_sn },'공지등록',800,700);"> 회의 등록</button> --%>
                <br> <input type="hidden" name="mber_sn" id="mber_sn" value="${loginUser.mber_sn }">
                <table class="table table-bordered text-center">
                    <tr style="font-size: 0.95em;">
                        <th style="width: 10%;">No</th>
                        <th style="width: 10%;">그 룹 명</th>
                        <th style="width: 10%;">CHIEF</th>
                        <th style="width: 10%;">그룹원</th>
                        <th style="width: 10%;">그룹 유형</th>
                    </tr>
                    <c:if test="${empty groupList }">
                        <tr>
                            <td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
                        </tr>
                    </c:if>
                    <c:forEach items="${groupList }" var="groupList" varStatus="status">
                        <tr style='font-size: 0.85em; cursor: pointer;' onclick="OpenWindow">
                            <td>${status.count}</td>
                            <td>${groupList.group_nm}</td>
                            <td>${chiefList[status.index].mber_ncnm }</td>
                            <td>${groupList.group_count }</td>
                            <td>
                                <c:set var="code" value="${groupList.group_job_type_code}" />
                                <c:choose>
                                    <c:when test="${code eq 0 }">
                                        오픈 소스 프로젝트
                                    </c:when>
                                    <c:when test="${code eq 1 }">
                                        교육 프로젝트
                                    </c:when>
                                    <c:when test="${code eq 2 }">
                                        개인 프로젝트
                                    </c:when>
                                    <c:when test="${code eq 3 }">
                                        작업 프로젝트
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/common/pagination2.jsp"%>

    </section>


    <section>
        <div class="card-body">
            <div class="container-fluid">
                <span style="margin-left: 17px; margin: auto; margin-top: 30px; text-align: left;">
                    <h4>초대 받은 그룹</h4>
                </span>
                <table class="table table-bordered text-center">
                    <tr style="font-size: 0.95em;">
                        <th style="width: 10%;">No</th>
                        <th style="width: 10%;">그 룹 명</th>
                        <th style="width: 10%;">CHIEF</th>
                        <th style="width: 10%;">그룹원</th>
                        <th style="width: 10%;">작업 유형</th>
                        <th style="width: 10%;">응 답</th>
                    </tr>
              					<c:if test="${empty inviteList }">

                    <tr>
                        <td colspan="6"><strong>초대 받은 그룹이 없습니다.</strong></td>
                    </tr>
                     					</c:if>

                    <c:forEach items="${inviteList }" var="inviteList" varStatus="status">
                    <tr style='font-size: 0.85em;'>
                        <td>${status.count}</td>
                        <td>${inviteList.group_nm }</td>
                        <td>${inviteList.group_chief }</td>
                        <td>${inviteList.group_count }</td>
                        <td>
                         <c:set var="code" value="${inviteList.group_job_type_code }" />
                                <c:choose>
                                    <c:when test="${code eq 0 }">
                                        오픈 소스 프로젝트
                                    </c:when>
                                    <c:when test="${code eq 1 }">
                                        교육 프로젝트
                                    </c:when>
                                    <c:when test="${code eq 2 }">
                                        개인 프로젝트
                                    </c:when>
                                    <c:when test="${code eq 3 }">
                                        작업 프로젝트
                                    </c:when>
                                </c:choose>
                                </td>
                                <td><span style="">
	                          <a class="btn btn-primary btn-sm" onclick="inviteRes(${inviteList.group_invite_sn},'1')">수락</a> &nbsp; &nbsp;
	                          <a class="btn btn-danger btn-sm" onclick="inviteRes(${inviteList.group_invite_sn},'2')">거절</a></span></td>
                    </tr>
                     </c:forEach> 
                </table>
            </div>
        </div>
    </section>
    <script>
    function inviteRes(group_invite_sn,group_invite_sttus){
    	//alert(group_invite_sttus);
    	location.href="inviteRes.do?group_invite_sn="+group_invite_sn+"&group_invite_sttus="+group_invite_sttus;

    }
    </script>
</body>

</html>