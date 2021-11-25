<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<style>

.memImg:hover{
	z-index : 2000000; 
	-webkit-transform : scale(1.2);
	-moz-transform : scale(1.2);
	-ms-transform : scale(1.2);
	-o-transform : scale(1.2);
	transform : scale(1.2);
}
</style>
  <c:if test="${from eq 'regist'}">
  		<script>
			alert("회의 등록에 성공했습니다.\n ");
	    	window.opener.location.reload();	
	    	window.close();
		</script>
  	</c:if> 
 <c:if test="${from eq 'remove'}">
  		<script>
			alert("회의 삭제에 성공했습니다.\n 회의 목록으로 이동합니다.");
	    	window.opener.location.reload();	
	    	window.close();
		</script>
  	</c:if> 
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>회의 관리</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
		        		<button class="btn btn-primary" id="registBtn"onclick="OpenWindow('meetingRegistForm.do?prjct_sn='+${prjct_sn },'회의등록',800,1055);"> 회의 등록</button>
	    	 		</ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	<section class="content container-fluid">
		<div>
			<div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;">
              <div class="card-header">
                <h3 class="card-title">온라인 회의 목록</h3>
              </div>
              <!-- /.card-header -->
	     
	
				<div class="card-body" style="padding-top: 10px;">
                <div class="table-responsive p-0" style="">
				<div id="chatMeetingList">
				
				</div>

              </div>
				<div class='text-center'>
					<ul id="chatMeetingPagination" class="pagination justify-content-center m-0" >
				
					</ul>
				</div>
              </div>
            </div>

		</div>
		<div>
			<div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;">
              <div class="card-header">
                <h3 class="card-title">화상 회의 목록</h3>
              </div>
              <!-- /.card-header -->
	     
	
				<div class="card-body" style="padding-top: 10px;">
                <div class="table-responsive p-0" style="">
				<div id="zoomMeetingList">
				
				</div>

              </div>
				<div class='text-center'>
					<ul id="zoomMeetingPagination" class="pagination justify-content-center m-0" >
				
					</ul>
				</div>
              </div>
            </div>

		</div>
		<input type="hidden" value="${prjct_sn }" name="prjct_sn" id="prjct_sn" />
		<%@ include file="./meetingList_js.jsp" %>	
	</section>
	
	
	
	
<!-- 		<div class="card-body"> -->
<!-- 			<div class="container-fluid"> -->
<!-- 				<span -->
<!-- 					style="margin-left: 17px; margin: auto; margin-top: 30px; text-align: left;"> -->
<!-- 					<h5>온라인 회의 목록</h5> -->
<!-- 				</span> -->
<!-- 				<span style="float: right;"> -->
<%-- 					<button class="btn btn-primary" id="registBtn"onclick="OpenWindow('meetingRegistForm.do?prjct_sn='+${prjct_sn },'회의등록',800,880);"> 회의 등록</button> --%>
<%-- <%-- 					<button class="btn btn-primary" id="registBtn"onclick="OpenWindow('meetingRegistForm.do&prjct_sn='+${prjct_sn },'공지등록',800,700);"> 회의 등록</button> --%> 
<!-- 				</span> -->
<!-- 				<br> -->
<!-- 				<table class="table table-bordered text-center"> -->
<!-- 					<tr style="font-size: 0.95em;"> -->
<!-- 						<th style="width: 10%;">No</th> -->
<!-- 						<th style="width: 10%;">제목</th> -->
<!-- 						<th style="width: 10%;">일 시</th> -->
<!-- 						<th style="width: 10%;">참 여 인 원</th> -->
<!-- 						<th style="width: 10%;">상 태</th> -->
<!-- 					</tr> -->
<%-- 					<c:if test="${empty meetingList }"> --%>
<!-- 						<tr> -->
<!-- 							<td colspan="6"><strong>해당 내용이 없습니다.</strong></td> -->
<!-- 						</tr> -->
<%-- 					</c:if> --%>
<%-- 					<c:forEach items="${meetingList }" var="meetingList" varStatus="status"> --%>
<%-- 						<tr style='font-size:0.85em;cursor:pointer;' onclick="OpenWindow('meetingDetail.do?mtg_sn=${meetingList.mtg_sn }&prjct_sn=${prjct_sn }&from=list','상세보기',800,700);"> --%>
<%-- 							<td>${status.count}</td> --%>
<%-- 							<td>${meetingList.mtg_title}</td> --%>
<%-- 							<td>${meetingList.mtg_date}</td> --%>
<%-- 							<td>${meetingList.user_sn }</td> --%>
<!-- 		    				<td> -->
<%-- 		    					<c:set var ="code" value="${meetingList.mtg_sttus_code}"/> --%>
<%-- 		    					<c:choose> --%>
<%-- 		    						<c:when test="${code eq 0 }"> --%>
<!-- 		    							<span class="badge bg-danger">대기</span> -->
<%-- 		    						</c:when> --%>
<%-- 		    						<c:when test="${code eq 1 }"> --%>
<!-- 			    						<span class="badge bg-success">진행중</span> -->
<%-- 		    						</c:when> --%>
<%-- 		    						<c:when test="${code eq 2 }"> --%>
<!-- 			    						<span class="badge bg-warning">취소</span> -->
<%-- 		    						</c:when> --%>
<%-- 		    						<c:when test="${code eq 3 }"> --%>
<!-- 			    						<span class="badge bg-primary">진행중</span> -->
<%-- 		    						</c:when> --%>
<%-- 		    					</c:choose> --%>
		    				
<!-- 		    				</td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->


<!-- 	<section> -->
<!-- 		<div class="card-body"> -->
<!-- 			<div class="container-fluid"> -->
<!-- 				<span -->
<!-- 					style="margin-left: 17px; margin: auto; margin-top: 30px; text-align: left;"> -->
<!-- 					<h5>화상 회의 목록</h5> -->
<!-- 				</span> -->
<!-- 				<table class="table table-bordered text-center"> -->
<!-- 					<tr style="font-size: 0.95em;"> -->
<!-- 						<th style="width: 10%;">No</th> -->
<!-- 						<th style="width: 10%;">제목</th> -->
<!-- 						<th style="width: 10%;">일 시</th> -->
<!-- 						<th style="width: 10%;">주 최 자</th> -->
<!-- 						<th style="width: 10%;">구 성 원</th> -->
<!-- 						<th style="width: 10%;">상 태</th> -->
<!-- 					</tr> -->
<%-- <%-- 					<c:if test="${empty  }"> --%>
<%-- 					<tr> --%>
<!-- 							<td colspan="6"><strong>해당 내용이 없습니다.</strong></td> -->
<!-- 						</tr> -->
<%-- <%-- 					</c:if> --%>
<%--  				<c:forEach items="" var=""> --%>
<!-- 						<tr style='font-size: 0.85em;'> -->
<!-- 							<td></td> -->
<!-- 							<td></td> -->
<!-- 							<td></td> -->
<!-- 							<td></td> -->
<!-- 							<td></td> -->
<!-- 		    				<td class="project-actions text-right"> -->
<!-- 	    					<span style="margin-right: 20px;"> -->
<!-- 	                      	</td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

</body>
