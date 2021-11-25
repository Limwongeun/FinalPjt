<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="projectScheduleList" value="${dataMap.projectScheduleList }" /> 
<c:set var="commingScheList" value="${commingDate.commingScheList }" /> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 부트스트랩 -->
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

<style>
@charset "UTF-8";

html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}


#calendar-container {
	position: relative;
	z-index: 1;
	/* margin-left: 200px; */
}

#calendar td.fc-day-sun {
	color: red;
}

#calendar td.fc-day-sat {
	color: blue;
}

#calendar {
	max-width: 1100px;
	margin: 20px auto;
}
</style>

<script>
document.addEventListener('DOMContentLoaded',function() {
			var Calendar = FullCalendar.Calendar;
			var Draggable = FullCalendar.Draggable;
			var calendarEl = document.getElementById('calendar');
			var checkbox = document.getElementById('drop-remove');
			// initialize the calendar
			// -----------------------------------------------------------------
			var calendar = new Calendar(
					calendarEl,
					{
						headerToolbar : {
							left : 'prev,next today',
							center : 'title',
							right : 'addEventButton ,dayGridMonth,timeGridWeek,timeGridDay,listWeek' //addEventButton추가해야 일정버튼나옴
						},
						businessHours : true,
						customButtons : {
							addEventButton : {
								text : '일정 추가',
								click : function() {
								    var _left = Math.ceil(( window.screen.width - 800 )/2);
								    var _top = Math.ceil(( window.screen.height - 800 )/2); 

									window.open('<%=request.getContextPath()%>/pmsproject/scheduleRegistForm.do?prjct_sn='+${param.prjct_sn},
											'일정등록', "width=800,height=800,left="+_left+",top="+_top);
								}
							}
						},
						//클릭이벤트
						eventClick : function(info) {
							//alert(info.event.id);
							var _left = Math.ceil(( window.screen.width - 600 )/2);
						    var _top = Math.ceil(( window.screen.height - 685 )/2); 

							window.open('<%=request.getContextPath()%>/pmsproject/scheduleDetail.do?prjct_schdul_sn='+info.event.id,
									'상세보기',"width=600,height=685,left="+_left+",top="+_top);
						},
						//이벤트 드랍
						 eventDrop: function(info) {
							 //업데이트??
								var testStart = moment(info.event.start); 
								var testEnd = moment(info.event.end);
								var realStart = testStart.format('YYYY-MM-DD');
								var realEnd = testEnd.format('YYYY-MM-DD');
								console.log("testStart: "+testStart.format('YYYY-MM-DD'));
								console.log("testEnd: "+testEnd.format('YYYY-MM-DD'));
								console.log("realStart: "+realStart);
								console.log("realEnd: "+realEnd);
								console.log(info.event.start);
								console.log(info.event.end);
							 	$.ajax({
									url : '<%=request.getContextPath()%>/pmsproject/modifyByDrag' ,
									type: 'get',
									dataType : 'json',
									data:{
										prjct_schdul_sn : info.event.id,
										prjct_schdul_bgnde : realStart,
										prjct_schdul_endde : realEnd
									},
									success: function(data){
										alert(data);
									},
									error : function(xhr){
										console.log(xhr);
									}
								
								});

						 },
						  eventResize: function(info) {
							  //업데이트 ㅠ
							  var testStart = moment(info.event.start); 
								var testEnd = moment(info.event.end);
								var realStart = testStart.format('YYYY-MM-DD');
								var realEnd = testEnd.format('YYYY-MM-DD');
								console.log("testStart: "+testStart.format('YYYY-MM-DD'));
								console.log("testEnd: "+testEnd.format('YYYY-MM-DD'));
								console.log("realStart: "+realStart);
								console.log("realEnd: "+realEnd);
								console.log(info.event.start);
								console.log(info.event.end);
							 	$.ajax({
									url : '<%=request.getContextPath()%>/pmsproject/modifyByDrag' ,
									type: 'get',
									dataType : 'json',
									data:{
										prjct_schdul_sn : info.event.id,
										prjct_schdul_bgnde : realStart,
										prjct_schdul_endde : realEnd
									},
									success: function(data){
										alert(data);
									},
									error : function(xhr){
										console.log(xhr);
									}
								
								});
						  },
						//공휴일
						googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", // Google API KEY
						eventSources : [
						// 대한민국의 공휴일
						{
							googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
							className : "koHolidays",
							color : "#cc0000",
							textColor : "#FFFFFF"
						} ],
						//일정 등록
						events : [
							<c:if test="${!empty projectScheduleList }">
							<c:forEach var="list" items="${projectScheduleList }" varStatus="vs">
							<c:if test="${vs.count >1 }">,</c:if>
							{
								id : '${list.prjct_schdul_sn }',
								title : '${list.prjct_schdul_nm }',
								start : '${list.prjct_schdul_bgnde }',
								end : '${list.prjct_schdul_endde }',
								content : '${list.prjct_schdul_cn}',
								writer : '${list.user_sn}',
								backgroundColor : '${list.prjct_schdul_color}',
								<c:if test="${prjct_allday == 0}">
								allDay : false
								</c:if>
								<c:if test="${prjct_allday == 1}">
								allDay : true
								</c:if>
							}
						</c:forEach>
						</c:if>
							],
						locale : 'ko', //언어 한글로 바꾸기
						selectable : true, // 클릭했을때 색변환 드래그
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar
					});

			calendar.render();
		});
</script>
<script>
</script>
</head>
<body >
	<c:if test="${from eq 'regist'}" >
		<script>
    	alert("일정 등록이 성공했습니다."); 
    	window.opener.location.reload();	
    	window.close();
    	</script>
    </c:if>
    
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	<div class="card collapsed-card">
              <div class="card-header border-transparent">
                <h3 class="card-title">다가오는 일정</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" default="collapse">
                    <i class="fas fa-plus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0" style="display: none;">
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>제목</th>
                      <th>내용</th>
                      <th>시작일</th>
                    </tr>
                    </thead>
                    <tbody>
					<c:if test="${!empty commingScheList }">
                    <c:forEach var="comminglist" items="${commingScheList }" varStatus="vs">
                    <tr>
                      <td>${comminglist.prjct_schdul_nm }</td>
                      <td>${comminglist.prjct_schdul_cn } </td>
                      <td><c:set var="bgnde" value="${comminglist.prjct_schdul_bgnde }"/>
                      ${fn:substring(bgnde,0,10) }
                      </td>
                    </tr>
                    	 </c:forEach>
                   	 </c:if> 
       	 					<c:if test="${empty commingScheList }">
       	 					<tr>
								<td colspan="3">
									<strong>다가오는 일정이 없습니다.</strong>
								</td>
							</tr>
  	                    	 </c:if> 
                   	 
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
            </div>
</body>
<script>
/* var test='';
console.log(test); */
</script>
</html>