<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<head>
<script type="text/javascript">
	document.ready(function(){
		var abc = "${exclProcesDetail.sttus}";
		
	})
</script>
</head>

<title></title>

<body>

<div class="card card-primary card-outline" style="margin-left: 10px; margin-right: 10px; margin-top: 15px; border-top: 3px solid #282c2f;">
	<c:choose>
		<c:when test="${exclProcesDetail.sttus ne '반려'}">
              <div class="card-body box-profile">
              <div class="text-center" style="font-weight: 600; font-size: 25px; padding-bottom: 18px;">구성원제외 처리 상세</div>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>인수인계기간</b> <a class="float-right">${exclProcesDetail.rqDate }</a>
                  </li>
                  <li class="list-group-item">
                    <b>인계자</b> <a class="float-right">${exclProcesDetail.mber_ncnm1 }</a>
                  </li>
                  <li class="list-group-item">
                    <b>인수자</b> <a class="float-right">${exclProcesDetail.mber_ncnm2 }</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
		</c:when>
		<c:otherwise>
			 <div class="card-body box-profile">
			 <h4 style="text-align: center;">반려 사유</h4>
                <ul class="list-group list-group-unbordered mb-3">
                <li class="list-group-item">
                	<div>
                    <a class="float-left">${exclProcesDetail.excl_prvonsh }</a>
                    </div>
                  </li>
                </ul>
                </div>
		</c:otherwise>
	</c:choose>
            </div>
	<div style="text-align: right;">
		<button type="button" onclick="window.close();" class="btn btn-default" style="margin-right: 18px;">닫기</button>
	</div>

</body>





