<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<head>
<script type="text/javascript">
// 	document.ready(function(){
// 		var abc = "${exclUserDetail.sttus}";
		
// 	})
</script>
</head>

<title></title>

<body>

<div class="card card-primary card-outline" style="margin-left: 10px; margin-right: 10px; margin-top: 15px; border-top: 3px solid #282c2f;">
              <div class="card-body box-profile">
              <div class="text-center" style="font-weight: 600; font-size: 25px; padding-bottom: 18px;">구성원제외 신청 상세</div>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>신청자</b> <a class="float-right">${exclUserDetail.mber_ncnm }</a>
                  </li>
                  <li class="list-group-item">
                    <b>신청일자</b> <a class="float-right">${exclUserDetail.apply_date }</a>
                  </li>
<!--                   <li class="list-group-item"> -->
<%--                     <b>처리요청일자</b> <a class="float-right">${exclUserDetail.excl_rqestde }</a> --%>
<!--                   </li> -->
                  <li class="list-group-item">
                    <b>담당역할</b> <a class="float-right">${exclUserDetail.role_nm }</a>
                  </li>
                  <li class="list-group-item">
                    <b>제외신청 사유</b> <a class="float-right">${exclUserDetail.excl_prvonsh }</a>
                  </li>
                  
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
	<div style="text-align: right;">
		<button type="button" onclick="window.close();" class="btn btn-default" style="margin-right: 18px;">닫기</button>
	</div>

</body>





