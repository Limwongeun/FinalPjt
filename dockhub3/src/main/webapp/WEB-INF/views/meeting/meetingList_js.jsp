<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="chatMeeting-list-template" >
<table id="chatMeetingTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width: 10%;text-align : center">NO</th>
<th style="width: 30%;text-align : center">회의제목</th>
<th style="width: 20%;text-align : center">주최자</th>
<th style="width: 10%;text-align : center">회의일시</th>
<th style="width: 20%;text-align : center">구성원</th>
<th style="width: 10%;text-align : center">상태</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="6" style="text-align : center" >온라인 회의 일정이 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr style='height : 49px' onclick="OpenWindow('<%=request.getContextPath() %>/pmsproject/meetingDetail.do?mtg_sn={{mtg_sn}}&prjct_sn={{prjct_sn}}','온라인회의상세보기',810,910);">
	<td style="vertical-align:middle;text-align : center">{{mtg_sn}}</td>
	<td style="vertical-align:middle;">{{mtg_title}}</td>
	<td style="vertical-align:middle;text-align : center">{{mber_ncnm}}</td>
	<td style="vertical-align:middle;text-align : center">{{#mtgTime mtg_date}}{{/mtgTime}}</td>
	<td >
		{{#each memList}}
		<div style="position : relative;">

			{{#if mber_photo}}
				<img class="img-circle memImg" style="width : 40px; height : 40px;position:absolute; left : {{#position @index }}{{/position}}px" src="<%=request.getContextPath() %>/member/getPicture.do?picture={{mber_photo }}">
			{{else}}
				<img class="img-circle memImg" style="width : 40px; height : 40px;position:absolute; left : {{#position @index }}{{/position}}px" src="<%=request.getContextPath() %>/resources/images/user.png">					
			{{/if}}
		</div>
		{{/each}}
	</td>
	<td style="vertical-align:middle;text-align : center;">{{#sttus mtg_sttus_code}}{{/sttus}}</td>
</tr>
{{#size @last @index}}{{/size}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="zoomMeeting-list-template" >
<table id="zoomMeetingTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width: 10%;text-align : center">NO</th>
<th style="width: 30%;text-align : center">회의제목</th>
<th style="width: 20%;text-align : center">주최자</th>
<th style="width: 10%;text-align : center">회의일시</th>
<th style="width: 20%;text-align : center">구성원</th>
<th style="width: 10%;text-align : center">상태</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="6" style="text-align : center" >화상 회의 일정이 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr style='height : 49px' onclick="OpenWindow('<%=request.getContextPath() %>/pmsproject/zoomMeetingDetail.do?mtg_sn={{mtg_sn }}&from=list&prjct_sn={{prjct_sn}}','화상회의상세보기',800,770);">
	<td style="vertical-align:middle;text-align : center">{{mtg_sn}}</td>
	<td style="vertical-align:middle;">{{mtg_title}}</td>
	<td style="vertical-align:middle;text-align : center">{{mber_ncnm}}</td>
	<td style="vertical-align:middle;text-align : center">{{#mtgTime mtg_date}}{{/mtgTime}}</td>
	<td >
		{{#each memList}}
		<div style="position : relative;">
			{{#if mber_photo}}
				<img class="img-circle memImg" style="width : 40px; height : 40px;position:absolute; left : {{#position @index }}{{/position}}px" src="<%=request.getContextPath() %>/member/getPicture.do?picture={{mber_photo }}">
			{{else}}
				<img class="img-circle memImg" style="width : 40px; height : 40px;position:absolute; left : {{#position @index }}{{/position}}px" src="<%=request.getContextPath() %>/resources/images/user.png">					
			{{/if}}
		</div>
		{{/each}}

	</td>
	<td style="vertical-align:middle;text-align : center;">{{#sttus mtg_sttus_code}}{{/sttus}}</td>
</tr>
{{#size @last @index}}{{/size}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="chatMeeting-pagination-template" >
<li class="paginate_button page-item">
   <a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-left'></i>
   </a>
</li>
<li class="paginate_button page-item">
   <a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-left'></i>
   </a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
   <a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      {{this}}
   </a>
</li>
{{/each}}

<li class="paginate_button page-item ">
   <a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-right'></i>
   </a>
</li>
<li class="paginate_button page-item">
   <a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-right'></i>
   </a>
</li>   
</script>
<script type="text/x-handlebars-template"  id="zoomMeeting-pagination-template" >
<li class="paginate_button page-item">
   <a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-left'></i>
   </a>
</li>
<li class="paginate_button page-item">
   <a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-left'></i>
   </a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
   <a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      {{this}}
   </a>
</li>
{{/each}}

<li class="paginate_button page-item ">
   <a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-right'></i>
   </a>
</li>
<li class="paginate_button page-item">
   <a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-right'></i>
   </a>
</li>   
</script>
<script>


var chatMeetingPage=1;
var zoomMeetingPage=1;

var prjct_sn = $("#prjct_sn").val();

/* applyRecruit */
function printData(chatMeetingArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(chatMeetingArr);	
	$('#chatMeetingTable').remove();
	target.after(html);
}

function getPage(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData(data.chatMeetingList,$('#chatMeetingList'),$('#chatMeeting-list-template'));
			printPagination(data.pageMaker,$('ul#chatMeetingPagination'),$('#chatMeeting-pagination-template'));
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("getPage오류");
		}
	});

}

function printPagination(pageMaker,target,templateObject){

	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}


/* RecruitMeeting */
function printData2(recruitMeetingArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(recruitMeetingArr);	
	$('#zoomMeetingTable').remove();
	target.after(html);
}

function getPage2(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData2(data.zoomMeetingList,$('#zoomMeetingList'),$('#zoomMeeting-list-template'));
			printPagination2(data.pageMaker,$('ul#zoomMeetingPagination'),$('#zoomMeeting-pagination-template'));
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("getPage2오류");
		}
	});

}

function printPagination2(pageMaker,target,templateObject){

	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}


Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"mtgTime" : function(mtg_date){
		return mtg_date.split("T")[0]+" "+mtg_date.split("T")[1];
		
	},
	"signActive":function(pageNum){
		if(pageNum == chatMeetingPage) return 'active';
	},
	"size" : function(last, index){
		var returnStr = "";
		if (last==true) {
			if (index != 4) {
				var forCnt = (4-index);
				for (var i = 0; i < forCnt; i++) {
				returnStr += "<tr style='pointer-events : none;height : 49px'><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
				}
			}
		}
		return returnStr;
	},
	"position" : function(index){
		return (index*15);
	},
	"sttus" : function(sttus){
		if (sttus == 0) {
			return "<div class='badge bg-warning' style='font-size: 14px;padding : 10px;width : 70px'>대기</div>";
		}else if (sttus == 1) {
			return "<div class='badge bg-success' style='font-size: 14px;padding : 10px;width : 70px'>진행중</div>";
		}else if (sttus == 2) {
			return "<div class='badge bg-primary' style='font-size: 14px;padding : 10px;width : 70px'>완료</div>";
		}
	}
});

/* page upload */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/pmsproject/getChatMeeting/"+prjct_sn+"/"+chatMeetingPage);
	getPage2("<%=request.getContextPath()%>/pmsproject/getZoomMeeting/"+prjct_sn+"/"+zoomMeetingPage); 
 

	$('ul#chatMeetingPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			chatMeetingPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/pmsproject/getChatMeeting/"+prjct_sn+"/"+chatMeetingPage);
		}
		return false;
	});
	$('ul#zoomMeetingPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			zoomMeetingPage=$(this).attr("href");
			getPage2("<%=request.getContextPath()%>/pmsproject/getZoomMeeting/"+prjct_sn+"/"+zoomMeetingPage);
		}
		return false;
	});


}
</script>









