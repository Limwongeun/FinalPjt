<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
<c:set var="memScheList" value="${sechduleList.memScheList }" /> 
<c:set var="commingScheList" value="${commingDate.commingScheList }" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 부트스트랩 -->
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

<style>
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}

.mypagediv{
width:25%;
float:left;
text-align: center;
text-decoration: none;
color: black;

}
.mypageissue{
width:23%;
float:left;
text-align: center;
background: lightgray;
border-radius: 10px;
margin: 6px;
}

.mypageissue:hover{
background: #e9ecef;
}

.mypagediv:hover{
background: #e9ecef;
}

#calendar td.fc-day-sun {
	color: red;
}

#calendar td.fc-day-sat {
	color: blue;
}

#calendar {
    width: 280px;
    height:300px;
    margin: 0 auto;
    font-size: 3px;
}
#calendar2 {
    width: 280px;
    height:367px;
    margin: 0 auto;
    font-size: 3px;
}
.fc-header-title h2 {
    font-size: .9em;
    white-space: normal !important;
}
.fc-view-month .fc-event, .fc-view-agendaWeek .fc-event {
    font-size: 0;
    overflow: hidden;
    height: 2px;
}
.fc-view-agendaWeek .fc-event-vert {
    font-size: 0;
    overflow: hidden;
    width: 2px !important;
}
.fc-agenda-axis {
    width: 20px !important;
    font-size: .7em;
}

.fc-button-content {
    padding: 0;
}
.fc-event{
height:5px
}

.fc .fc-toolbar-title {
    font-size: 5.75em;
}

.col-sm-8 {
    -ms-flex: 0 0 66.666667%;
    flex: 0 0 66.666667%;
    max-width: 100%;
}

.memImg:hover{
	z-index : 2000000; 
	-webkit-transform : scale(1.2);
	-moz-transform : scale(1.2);
	-ms-transform : scale(1.2);
	-o-transform : scale(1.2);
	transform : scale(1.2);
}
</style>
<script>


function fn_go2(prjct_sn){
	window.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M040000&prjct_sn="+prjct_sn;	
}
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
					left : '',
					center : 'title',
					right : '' //addEventButton추가해야 일정버튼나옴
				},
				businessHours : true,
			  themeSystem: 'bootstrap',

				//클릭이벤트
				eventClick : function(info) {
					//alert(info.event.id);
					var _left = Math.ceil(( window.screen.width - 600 )/2);
				    var _top = Math.ceil(( window.screen.height - 490 )/2); 
					window.open('<%=request.getContextPath()%>/mypage/scheduler/detail.do?mber_schdul_sn='+info.event.id,
							'상세보기',"width=600,height=490,left="+_left+",top="+_top);
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
						url : '<%=request.getContextPath()%>/mypage/scheduler/modifyByDrag' ,
						type: 'get',
						dataType : 'json',
						data:{
							mber_schdul_sn : info.event.id,
							mber_schdul_bgnde : realStart,
							mber_schdul_endde : realEnd
						},
						success: function(data){
							alert("");
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
							url : '<%=request.getContextPath()%>/mypage/scheduler/modifyByDrag' ,
							type: 'get',
							dataType : 'json',
							data:{
								mber_schdul_sn : info.event.id,
								mber_schdul_bgnde : realStart,
								mber_schdul_endde : realEnd
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
					<c:if test="${!empty memScheList }">
					<c:forEach var="list" items="${memScheList }" varStatus="vs">
					<c:if test="${vs.count >1 }">,</c:if>
					{
						id : '${list.mber_schdul_sn }',
						start : '${list.mber_schdul_bgnde }',
						end : '${list.mber_schdul_endde }',
						content : '${list.mber_schdul_cn}',
						writer : '${list.mber_sn}',
						backgroundColor : '${list.mber_schdul_color}',
						allDay : true
					}
				</c:forEach>
				</c:if>
					],
				locale : 'en', //언어 한글로 바꾸기
				selectable : true, // 클릭했을때 색변환 드래그
				editable : true,
				droppable : true, // this allows things to be dropped onto the calendar
			});

	calendar.render();
});

document.addEventListener('DOMContentLoaded',function() {
	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendar.Draggable;
	var calendarEl = document.getElementById('calendar2');
	var checkbox = document.getElementById('drop-remove');
	// initialize the calendar
	// -----------------------------------------------------------------
	var calendar = new Calendar(
			calendarEl,
			{
				headerToolbar : {
					left : '',
					center : '',
					right : '' //addEventButton추가해야 일정버튼나옴
				},
				businessHours : true,
				customButtons : {
					addEventButton : {
						text : '일정 추가',
						click : function() {
						    var _left = Math.ceil(( window.screen.width - 585 )/2);
						    var _top = Math.ceil(( window.screen.height - 685 )/2); 

							window.open('<%=request.getContextPath()%>/mypage/scheduler/registForm.do',
									'일정등록',"width=585,height=685,left="+_left+",top="+_top);
						}
					}
				},
			  themeSystem: 'bootstrap',
			  listDayFormat:false,
			  initialView: 'listWeek',
				//클릭이벤트
				eventClick : function(info) {
					//alert(info.event.id);
					var _left = Math.ceil(( window.screen.width - 600 )/2);
				    var _top = Math.ceil(( window.screen.height - 685 )/2); 
					window.open('<%=request.getContextPath()%>/mypage/scheduler/detail.do?mber_schdul_sn='+info.event.id,
							'상세보기',"width=600,height=685,left="+_left+",top="+_top);
				},
				//이벤트 드랍
				 eventDrop: function(info) {
					 //업데이트??
					var testStart = moment(info.event.start); 
					var testEnd = moment(info.event.end);
					var realStart = testStart.format('YYYY-MM-DD');
					var realEnd = testEnd.format('YYYY-MM-DD');
				 	$.ajax({
						url : '<%=request.getContextPath()%>/mypage/scheduler/modifyByDrag' ,
						type: 'get',
						dataType : 'json',
						data:{
							mber_schdul_sn : info.event.id,
							mber_schdul_bgnde : realStart,
							mber_schdul_endde : realEnd
						},
						success: function(data){
							alert("");
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
							url : '<%=request.getContextPath()%>/mypage/scheduler/modifyByDrag' ,
							type: 'get',
							dataType : 'json',
							data:{
								mber_schdul_sn : info.event.id,
								mber_schdul_bgnde : realStart,
								mber_schdul_endde : realEnd
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
					<c:if test="${!empty memScheList }">
					<c:forEach var="list" items="${memScheList }" varStatus="vs">
					<c:if test="${vs.count >1 }">,</c:if>
					{
						id : '${list.mber_schdul_sn }',
						title : '${list.mber_schdul_nm }',
						start : '${list.mber_schdul_bgnde }',
						end : '${list.mber_schdul_endde }',
						content : '${list.mber_schdul_cn}',
						writer : '${list.mber_sn}',
						backgroundColor : '${list.mber_schdul_color}',
						<c:if test="${mber_allday == 0}">
						allDay : false
						</c:if>
						<c:if test="${mber_allday == 1}">
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

anychart.onDocumentReady(function() {

	anychart.theme('lightBlue');
	// create pie chart with passed data
	var chart = anychart.pie([ [ '종료', $("#eee").val() ],
			[ '지연', $("#ddd").val() ], [ '진행', $("#ppp").val() ],
			[ '대기', $("#www").val() ] ]);

	// set chart title text settings
	chart.title('단위업무')
	// set chart radius
	.radius('43%')
	// create empty area in pie chart
	.innerRadius('30%');

	// set container id for the chart
	chart.container('container');
	// initiate chart drawing
	chart.draw();

	var chart2 = anychart.pie([ [ 'CLOSE', $("#ccc").val() ],
			[ 'OPEN', $("#ooo").val() ] ]);

	// set chart title text settings
	chart2.title('이슈')
	// set chart radius
	.radius('43%')
	// create empty area in pie chart
	.innerRadius('30%');

	// set container id for the chart
	chart2.container('container2');
	// initiate chart drawing
	chart2.draw();

});
</script>
</head>
<body>
	<input type="hidden" id="eee" value="${eee }">
	<input type="hidden" id="ddd" value="${ddd }">
	<input type="hidden" id="ppp" value="${ppp }">
	<input type="hidden" id="www" value="${www }">
	<input type="hidden" id="ooo" value="${ooo }">
	<input type="hidden" id="ccc" value="${ccc }">


	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1>마이페이지</h1>

				</div>
				<div class="col-sm-6" style="text-align:right;"></div>
			</div>
		</div>
	</section>
	 
	 
   	<section class="content">
	   	<div class="container-fluid">
	   		
	   		<div class="card">
	        	<div class="card-header" >
	        		<div style="float: left; background:#1ABC9C;color: white; border-radius: 10px; font-size: 12px; padding: 3px;">TODAY</div>
	                <h3 class="card-title" style="margin-bottom: 0px;"> &nbsp;
					<% Calendar cal = Calendar.getInstance(); %>
					<%= cal.get(Calendar.YEAR) %>.<%= cal.get(Calendar.MONTH)+1 %>.<%= cal.get(Calendar.DATE) %>
	                </h3>
	              	<div class="card-tools" style="float:right">
	              	</div>
	            </div>
	              <!-- /.card-header -->
	            <div class="card-body" style="padding: 5px">
<%-- 	            	<div class="mypagediv"><a href="#">내 일감<br>${selectDutychargeCount } 개</a></div> --%>
	            	<div class="mypagediv" onclick="location.href='<%=request.getContextPath()%>/mypage/dutycharge';" style="cursor: pointer; border-right:1px solid rgba(0,0,0,.125);">내 일감<br>${selectDutychargeCount } 개</div>
	            	<div class="mypagediv" onclick="location.href='#';" style="cursor: pointer; border-right:1px solid rgba(0,0,0,.125);">프로젝트 수<br>${projectCount } 개</div>
	            	<div class="mypagediv" onclick="location.href='<%=request.getContextPath()%>/mypage/issue';" style="cursor: pointer; border-right:1px solid rgba(0,0,0,.125);">내 이슈<br>${issueCount } 개</div>
	            	<div class="mypagediv" onclick="location.href='<%=request.getContextPath()%>/mypage/list';" style="cursor: pointer;">내 산출물<br>${selectFileCount } 개</div>
	            </div>
	              <!-- /.card-body -->
			</div>
			
	            
	 		  	<div class="card card-outline card-primary" style="width: 70%; float: left; margin-right: 6px; border-top: 3px solid #282c2f;">
	              <div class="card-header">
	                <h3 class="card-title">참여 프로젝트</h3>
	              	<div class="card-tools" style="float:right">
	              	</div>
	                <!-- /.card-tools -->
	              </div>
	              <div class="card-body" style="padding: 5px">
	              	<div class="mypageissue" onclick="location.href='#';" style=" cursor:pointer; ">프로젝트 수<br>${projectCount } 개</div>
	                <div class="mypageissue" onclick="location.href='<%=request.getContextPath()%>/mypage/issue';" style=" cursor:pointer;">전체 이슈<br>${issueCount } 개</div>
	        		<div class="mypageissue" onclick="location.href='<%=request.getContextPath()%>/mypage/issue';" style=" cursor:pointer;">open 이슈<br>${issueOpen } 개</div>
	        		<div class="mypageissue" onclick="location.href='<%=request.getContextPath()%>/mypage/issue';" style=" cursor:pointer;">close 이슈<br>${issueClose } 개</div>
	        	 </div>	
	        		<div style="height: 576px; float:left;">
		        		<table class="table table-hover text-nowrap" style="cursor:pointer;">
		                  <thead>
		                    <tr>
		                      <th style="width: 50px;text-align : center">NO</th>
		                      <th style="width: 120px;text-align : center">프로젝트</th>
		                      <th style="width: 200px;text-align : center">기간</th>
		                      <th style="width: 105px;text-align : center">진행률</th>
		                      <th style="width: 300px;"></th>
		                      <th style="width: 200px;text-align : center">구성원</th>
		                    </tr>
		                  </thead>
		                  <tbody>
			        		<c:forEach var="project" items="${projectList }" varStatus="status">
			        		  <tr onclick="fn_go2(${project.prjct_sn});">
		                      <td style="vertical-align:middle;text-align : center">${status.index+1 }</td>
		                      <td style="vertical-align:middle;text-align : center">${project.prjct_sj }</td>
		                      <td style="vertical-align:middle; text-align:center; width:25%; font-size:13px;">${project.prjct_bgnde }~${project.prjct_endde }</td>
							  <td style="vertical-align:middle;text-align : center; width : 30px">${(project.dutyPro+project.issuePro)/2 }%</td>
		                        <td style="vertical-align:middle;">
		                      	 <div class="progress progress-m" style="margin:5px; ">
		                          <div class="progress-bar progress-bar-danger" style="background-color : #10316b;width: ${(project.dutyPro+project.issuePro)/2 }%;"></div>
		                         </div>
		                        </td>
		                        <td>
<!-- 			                        <div style="position : relative;left : 10%"> -->
			                        <div style="position : relative;">
				                        <c:forEach var ="member" items="${project.memList }" varStatus="mStatus" end="3">
				                        	<c:choose>
												<c:when test="${member.mber_photo eq null }">
												
													<img class="img-circle memImg" style="width:30px;height:30px; margin-top:-5px; position:absolute; left:${mStatus.index *15}px;" src="<%=request.getContextPath() %>/resources/images/user.png">					
												</c:when>
												<c:otherwise>
							                        <img class="img-circle memImg" style="width:30px;height:30px; margin-top:-5px; position:absolute; left:${mStatus.index *15}px;" src="<%=request.getContextPath() %>/member/getPicture.do?picture=${member.mber_photo }">
												</c:otherwise>
											</c:choose>
				                        </c:forEach>
			                        </div>
		                        </td>
		                    </tr>
			        		</c:forEach>
		                  </tbody>
		        		</table>
	        		</div>
	        		
	              <!-- /.card-header -->
	              <div class="card-body" style="padding-top: 10px;">
	                <div class="card-body table-responsive p-0">
	              	</div>
	              </div>
	            </div>
	      
	      
	      
	      
	      
	      
	   		<div class="card card-outline card-primary" style="width: 287px; border-top: 3px solid #282c2f;">
	        	<div class="card-header" >
	                <h3 class="card-title">내 일정</h3>
	              	<div class="card-tools" style="float:right">
	              	</div>
	            </div>
	              <!-- /.card-header -->
	            <div class="card-body" style="padding: 5px">
	            	<div id='calendar'></div>
	            	<div id='calendar2'></div>
	            </div>
	              <!-- /.card-body -->
			</div>	      
	 		
	 		
	   		<div class="card" style="width:100%;">
	        	<div class="" >
<!-- 	                <h3 class="card-title">1234567890</h3> -->
	              	<div class="card-tools" style="float:right">
	              	</div>
	            </div>
	              <!-- /.card-header -->
	            <div class="card-body" style="padding: 5px">
	            
	            	
				<div class="col-sm-8">
					<div class="card-body"style="border: 1px solid lightgrey; height: 380px; padding: 5px; padding-left: 40px; padding-right: 40px">
						<div class="row" style="height: 100%;">
							<div class="col-sm-6" id="container"></div>
							<div class="col-sm-6" id="container2"></div>
						</div>
					</div>
				</div>	            	
	            </div>
	              
			</div>
			
			
<!-- 			<div class="card"> -->
<!--               <div class="card-header" > -->
<!--                 <h3 class="card-title"> -->
<!--                   초대받은 프로젝트 -->
<!--                 </h3> -->
<!--               </div> -->
<!--               <div class="card-body" style="padding: 5px"> -->
<!--               </div> -->
<!--             </div> -->
			
	 		
	 	</div>
   	</section>

</body>
</html>