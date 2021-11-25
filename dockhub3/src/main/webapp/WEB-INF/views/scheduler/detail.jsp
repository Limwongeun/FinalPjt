<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<title>일정 상세보기</title>

<body>
    <c:if test="${from eq 'modify' }">
        <script>
            alert("수정되었습니다.");
            window.opener.location.reload();
        </script>
    </c:if>


    <c:if test="${from eq 'remove' }">
        <script>
            alert("삭제되었습니다.");
            window.opener.location.reload();
            window.close();
        </script>
    </c:if>
    <!-- Content Header (Page header) -->


    <!-- Main content -->
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-outline card-primary">
                    <div class="card-header">
                        <h3 class="card-title">상세보기</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group col-sm-12">
                            <label for="title">일정명</label>
                            <input type="text" class="form-control" id="mber_schdul_nm " value="${memberSchedule.mber_schdul_nm }" readonly />
                        </div>
                        <div class="col-sm-12 row">
                            <div class="form-group col-sm-4">
                                <label for="writer">회원</label>
                                <input type="text" class="form-control" id="mber_sn " value="${memberSchedule.mber_sn }" readonly />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="regDate">시작일</label>
                                <c:set var="bgnde" value="${memberSchedule.mber_schdul_bgnde }" />

                                <input type="text" class="form-control" id="mber_schdul_bgnde" value=" ${fn:substring(bgnde,0,16) }" readonly />
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="regDate">종료일</label>
                                <c:set var="endde" value="${memberSchedule.mber_schdul_endde }" />

                                <input type="text" class="form-control" id="mber_schdul_endde" value="${fn:substring(endde,0,16) }" readonly />
                            </div>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="mber_schdul_cn">내 용</label>
                            <div style="overflow-y:scroll;width: 100%;height: 80px;">${memberSchedule.mber_schdul_cn }</div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="button" id="listBtn" class="btn btn-primary" style="float: right;" onclick="CloseWindow();">닫기 </button>
                    <button type="button" id="removeBtn" class="btn btn-danger" style="float: right;" onclick="submit_go('remove.do','${memberSchedule.mber_schdul_sn}');">삭제</button>
                    <button type="button" id="modifyBtn" class="btn btn-warning" style="float: right;" onclick="submit_go('modifyForm.do','${memberSchedule.mber_schdul_sn}');">수정</button>

                </div>
            </div><!-- end card -->
        </div><!-- end col-md-12 -->
        </div><!-- end row  -->

    </section>

    <script>
        function submit_go(url, mber_schdul_sn) {
            //alert(url);
            location.href = url + "?mber_schdul_sn=" + mber_schdul_sn;
        }
    </script>
</body>
