<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">그룹 등록</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="<%=request.getContextPath()%>/mygroup/regist.do" name="registForm">
                <div class="card-body">
                  <div class="form-group">
                    <label for="group_nm">그룹명</label>
                    <input type="text" class="form-control" name="group_nm" id="group_nm">
                  </div>
                  <div class="form-group">
                    <label for="mber_schdul_bgnde">활성 여부</label>
                       <select class="form-control" name="group_actvty_at_code" id="group_actvty_at_code">
                            <option value="0">비활성</option>
                            <option value="1" selected="selected">활성</option>
                      </select>
                  </div>
                  <div class="form-group">
                    <label for="group_othbc_at_code">공개 여부</label>
                       <select class="form-control" name="group_othbc_at_code" id="group_othbc_at_code">
                            <option value="0">비공개</option>
                            <option value="1" selected="selected">공개</option>
                            <option value="2">그룹원</option>
                      </select>                  
                      </div>
                  <div class="form-group">
                        <label>작업 유형</label>
                       <select class="form-control" name="group_job_type_code" id="group_job_type_code">
                            <option value="0">오픈소스 프로젝트</option>
                            <option value="1">교육 프로젝트</option>
                            <option value="2">개인 프로젝트</option>
                            <option value="3">작업 프로젝트</option>
                        </select>
                      </div>
                    <!--   <input type="hidden" id="mber_sn" name="mber_sn" value="1">  -->
                      <input type="hidden" id="mber_sn" name="mber_sn" value="${loginUser.mber_sn }">
                  <div class="form-group">
                    <label for="group_cn">그룹 설명</label>
                    <textarea class="form-control" id="group_cn" name="group_cn"></textarea>
                  </div>
                  </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">저장</button>
                  						&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn" id="cancelBtn" onclick="CloseWindow();">취 소</button>
                </div>
              </form>
            </div>

	
<script>


//날짜 선택

	function regist_go(){
		document.registForm.submit();
	}
</script>
</body>
</html>