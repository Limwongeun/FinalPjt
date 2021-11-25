<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

<!-- Date Range Picker  -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 

<!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>

 <body>
 <style>
.userNm:hover{
	background-color : #E0E0E0;
	cursor: pointer;
}
</style>  
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
<!-- 	  				<h1>수정하기</h1>  				 -->
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
  <!-- Main content -->
    <section class="content container-fluid">
<!-- 		<div class="row"> -->
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info">
					<div class="card-header row">
						<h4 class="col-md-8">미팅 수정</h4>
						<div class="col-md-4">
							<div class="float-right">
								<button type="button" class="btn btn-warning" id="modifyBtn" onclick="modify_go();">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default " id="cancelBtn" onclick="history.go(-1);">취 소</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify.do?prjct_sn=${prjct_sn }&mtg_sn=${meeting.mtg_sn }" name="modifyForm">
							<input type="hidden" name="mtg_sn"  id="mtg_sn" value="${meeting.mtg_sn }">
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" name='mtg_title' class="form-control" value="${meeting.mtg_title}">
							</div>
<!-- 							<div class="form-group"> -->
<!-- 								<label for="writer">작성자</label>  -->
<%-- 								<input type="text" id="writer" readonly	name="mile_wrter" class="form-control"  value="${meeting.mile_wrter}"> --%>
<!-- 							</div> -->
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="mtg_content" id="content" rows="3"
									placeholder="500자 내외로 작성하세요.">${fn:escapeXml(meeting.mtg_content) }</textarea>						
							</div>
							
							<div class="form-group">
								<label for="mtg_date">회의시작일시</label>
								<input type="hidden" name="mtgdate" id="mtgdate" value="${meeting.mtg_date }"/>
								<input type="datetime-local" id="mtg_date" name='mtg_date' class="form-control" value="${meeting.mtg_date}"> 
							</div>
							<div class="form-group">
								<label for="user">구성원 선택</label> <br/>
								<div style="border : 1px solid lightgrey; padding: 10px; border-radius : 10px">
								
									<c:forEach items="${userList }" var="user">
										<div class="userNm" style="display:inline-block; width : 230px; height : 30px;z-index=0" onclick="OpenWindow('projectProfile.do?prjct_sn=${prjct_sn }&mber_sn=${user.mber_sn }','상세보기',450,510);">
										
											<input type='checkbox' name='user' value='${user.user_sn }' onclick="event.cancelBubble=true"/> ${user.mber_ncnm }
										</div>
									</c:forEach>
									<input type="hidden" value="${memList }" name="meetingMem" id="meetingMem"/>
<%-- 									<c:forEach items="${userList }" var="user"> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${user.user_sn eq loginUserSn }"> --%>
<!-- 												<div class="userNm" style="display:inline-block; width : 230px; height : 30px;z-index=0"> -->
<%-- 													<input type='checkbox' name='user' checked readonly value='${user.user_sn }' onclick="event.cancelBubble=true; return false" /> ${user.mber_ncnm } --%>
<!-- 												</div>										 -->
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												<c:forEach items="${memList }" var="meetingMem"> --%>
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${meetingMem.user_sn eq user.user_sn }"> --%>
<%-- 															<div class="userNm" style="display:inline-block; width : 230px; height : 30px;z-index=0" onclick="OpenWindow('projectProfile.do?prjct_sn=${prjct_sn }&mber_sn=${user.mber_sn }','상세보기',450,510);"> --%>
<%-- 																<input type='checkbox' name='user' checked value='${user.user_sn }' onclick="event.cancelBubble=true"/> ${user.mber_ncnm } --%>
<!-- 															</div> -->
<%-- 														</c:when> --%>
<%-- 														<c:otherwise> --%>
<%-- 															<div class="userNm" style="display:inline-block; width : 230px; height : 30px;z-index=0" onclick="OpenWindow('projectProfile.do?prjct_sn=${prjct_sn }&mber_sn=${user.mber_sn }','상세보기',450,510);"> --%>
<%-- 																<input type='checkbox' name='user' value='${user.user_sn }' onclick="event.cancelBubble=true"/> ${user.mber_ncnm } --%>
<!-- 															</div> -->
<%-- 														</c:otherwise> --%>
<%-- 													</c:choose> --%>
<%-- 												</c:forEach> --%>

<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
<%-- 									</c:forEach>	 --%>
									<input type="hidden" name="userArr" value=""/>
								</div>					
							</div>	
							<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
						</form>
					</div><!--end card-body  -->
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
    
    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
     
    <script>

    	window.onload = function(){
    		Summernote_start($("#content"));
	    	
//      		var mtgdate = $("#mtgdate").val();
//     		var arr = mtgdate.split("T");
//      		$("#mtg_date").val(arr[0]+" "+arr[1]);
//      		var arr =[];
//      		arr = $("#memList").val();
//      		console.log($("#memList").val())
     		
    	}
     	
    	function modify_go(){

    		$("form[role='form']").submit();
    		
    	}
    	
//     	$(function() {
//     		  $('input[name="mtg_date"]').daterangepicker({
//     		    //timePicker: true,
//     		    //timePicker24Hour:true,
//     		    singleDatePicker: true,
//     		    timePickerIncrement :10,
//     		    //autoUpdateInput: false,
//     		    startDate: moment().startOf('hour'),
//     		    endDate: moment().startOf('hour').add(32, 'hour'),
//     		    locale: {
//     		        format: 'YYYY-MM-DD',     // 일시 노출 포맷
//     		        //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
//     		        applyLabel: "확인",                    // 확인 버튼 텍스트
//     		        cancelLabel: "취소",                   // 취소 버튼 텍스트
//     		        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
//     		        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
//     		        	]}
//     		  });
    		  
    		  

//     		});
    	
    </script>
</body>





