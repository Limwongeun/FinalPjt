<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="applyRecruit-list-template" >
<table id="applyRecruitTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width: 8%;text-align : center">NO</th>
<th style="width: 27%;text-align : center">공고제목</th>
<th style="width: 25%;text-align : center">프로젝트명</th>
<th style="width: 8%;text-align : center">신청역할</th>
<th style="width: 16%;text-align : center">공고마감일자</th>
<th style="width: 16%;text-align : center">상태</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="6" style="text-align : center" >신청한 공고가 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr style='height : 49px' onclick="OpenWindow('<%=request.getContextPath() %>/notification/detail.do?pblanc_sn={{pblanc_sn}}&from=list','상세보기',800,780);">
	<td style="vertical-align:middle;text-align : center">{{pblanc_sn}}</td>
	<td style="vertical-align:middle;">{{pblanc_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{prjct_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{#roleBtn pblanc_sport_role}}{{/roleBtn}}</td>
	<td style="vertical-align:middle;text-align : center;">{{pblanc_clos_de}}</td>
	<td style="vertical-align:middle;text-align : center;">{{#sttusLabel pblanc_sport_sttus_code}}{{/sttusLabel}}</td>
</tr>
{{#size @last @index}}{{/size}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="recruitMeeting-list-template" >
<table id="recruitMeetingTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em; height : 49px">
<th style="width : 10%;text-align : center">NO</th>
<th style="width : 25%;text-align : center">공고 제목</th>
<th style="width : 25%;text-align : center">프로젝트명</th>
<th style="width : 8%;text-align : center">신청역할</th>
<th style="width : 16%;text-align : center">면접일시</th>
<th style="width : 16%;text-align : center">면접</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="7"  style="text-align : center">면접 일정이 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr style='height : 49px'>
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_sn}}</td>
	<td style="vertical-align:middle;text-align : center;"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{pblanc_sj}}</td>
	<td style="vertical-align:middle;text-align : center;"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{prjct_sj}}</td>
	<td style="vertical-align:middle;text-align : center"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{#roleBtn pblanc_sport_role}}{{/roleBtn}}</td>
	<td style="vertical-align:middle;text-align : center"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{#meetingTime pblanc_meeting_time}}{{/meetingTime}}</td>
	<td style="vertical-align:middle;text-align : center;">{{#sttus pblanc_sport_sttus_code pblanc_sport_sn}}{{/sttus}}</td>

</tr>
{{#size2 @last @index}}{{/size2}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="meetingResult-list-template" >
<table id="meetingResultTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width: 10%;text-align : center">NO</th>
<th style="width: 25%;">공고 제목</th>
<th style="width: 25%;text-align : center">프로젝트명</th>
<th style="width: 8%;text-align : center">신청역할</th>
<th style="width: 16%;text-align : center">신청 일자</th>
<th style="width: 16%;text-align : center">상태</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="6"  style="text-align : center">면접 결과가 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr style='height : 49px' onclick="OpenWindow('<%=request.getContextPath() %>/notification/detail.do?pblanc_sn={{pblanc_sn}}&from=list','상세보기',800,780);">
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_sn}}</td>
	<td style="vertical-align:middle;">{{pblanc_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{prjct_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{#roleBtn pblanc_sport_role}}{{/roleBtn}}</td>
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_de}}</td>
	<td style="vertical-align:middle;text-align : center;">{{#result pblanc_sport_sttus_code}}{{/result}}</td>
</tr>
{{#size3 @last @index}}{{/size3}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="applyRecruit-pagination-template" >
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
<script type="text/x-handlebars-template"  id="meetingResult-pagination-template" >
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
<li class="paginate_button page-item {{signActive3 this}} ">
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
<script type="text/x-handlebars-template"  id="myRecruit-pagination-template" >
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
<li class="paginate_button page-item {{signActive2 this}} ">
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


var applyRecruitPage=1;
var recruitMeetingPage=1;
var meetingResultPage=1;
var mber_sn = $("#mber_sn").val();
// var pblanc_sn = $("#pblanc_sn").val();

/* applyRecruit */
function printData(applyRecruitArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(applyRecruitArr);	
	$('#applyRecruitTable').remove();
	target.after(html);
}

function getPage(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData(data.applyRecruitList,$('#applyRecruitList'),$('#applyRecruit-list-template'));
			if (data.applyRecruitList.length!=0) {
				printPagination(data.pageMaker,$('ul#applyRecruitPagination'),$('#applyRecruit-pagination-template'));
				
			}
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
	$('#recruitMeetingTable').remove();
	target.after(html);
}

function getPage2(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData2(data.applyMeetingList,$('#recruitMeetingList'),$('#recruitMeeting-list-template'));
			if (data.applyMeetingList.length!=0) {
				printPagination2(data.pageMaker,$('ul#recruitMeetingPagination'),$('#myRecruit-pagination-template'));
				
			}
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
/* RecruitMeeting */
function printData3(meetingResultArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(meetingResultArr);	
	$('#meetingResultTable').remove();
	target.after(html);
}

function getPage3(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData3(data.myMeetingResultList,$('#meetingResultList'),$('#meetingResult-list-template'));
			if (data.myMeetingResultList.length!=0) {
				printPagination3(data.pageMaker,$('ul#meetingResultPagination'),$('#meetingResult-pagination-template'));
			}
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("getPage3오류");
		}
	});

}

function printPagination3(pageMaker,target,templateObject){

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
	"signActive":function(pageNum){
		if(pageNum == applyRecruitPage) return 'active';
	},
	"signActive2":function(pageNum){
		if(pageNum == recruitMeetingPage) return 'active';
	},
	"signActive3":function(pageNum){
		if(pageNum == meetingResultPage) return 'active';
	},
	"sttusLabel" : function(pblanc_sport_sttus_code){
		if (pblanc_sport_sttus_code == 0) {
			return "<div class='badge bg-warning' style='font-size: 14px;padding : 10px;width : 70px'>대기</div>";
		}else if (pblanc_sport_sttus_code == 2) {
			return "<div class='badge bg-warning' style='font-size: 14px;padding : 10px;width : 70px'>면접 대기</div>";
		}else if (pblanc_sport_sttus_code == 1) {
			return "<div class='badge bg-danger' style='font-size: 14px;padding : 10px;width : 70px'>서류 탈락</div>";
		}else if (pblanc_sport_sttus_code == 5) {
			return "<div class='badge bg-danger' style='font-size: 14px;padding : 10px;width : 70px'>불합격</div>";
		}else if (pblanc_sport_sttus_code == 3) {
			return "<div class='badge bg-success' style='font-size: 14px;padding : 10px;width : 70px'>면접완료</div>";
		}else if (pblanc_sport_sttus_code == 4) {
			return "<div class='badge bg-primary' style='font-size: 14px;padding : 10px;width : 70px'>합격</div>";
		}
	},
	"roleBtn" : function(pblanc_sport_role){
		if (pblanc_sport_role == 0) {
			return '<button type="button" class="btn btn-block btn-default btn-sm">DA</button>';
		}else if (pblanc_sport_role == 1) {
			return '<button type="button" class="btn btn-block btn-default btn-sm">AA</button>';
		}else if (pblanc_sport_role == 2) {
			return '<button type="button" class="btn btn-block btn-default btn-sm">TA</button>';
		}else if (pblanc_sport_role == 3) {
			return '<button type="button" class="btn btn-block btn-default btn-sm">UA</button>';
		}
	},
	"meetingTime" : function(pblanc_meeting_time){
		return pblanc_meeting_time.split("T")[0]+" "+pblanc_meeting_time.split("T")[1];
		
	},
	"sttus" : function(pblanc_sport_sttus_code,pblanc_sport_sn){
		if (pblanc_sport_sttus_code == 2) {
			return '<button type="button" class="btn btn-block btn-primary btn-sm" style="width:70px;margin: auto;" onclick="meetingGo2('+pblanc_sport_sn+')">면접 참여</button>';
		}else if (pblanc_sport_sttus_code == 3) {
			return '<button type="button" class="btn btn-block btn-secondary btn-sm"style="width:70px;margin: auto;">면접 완료</button>';		
		}
	},
	
	"result" : function(pblanc_sport_sttus_code){
		if (pblanc_sport_sttus_code == 4) {
			return '<button type="button" class="btn btn-block btn-primary btn-sm" style="width:70px;margin: auto;">합격</button>'; 
		}else if (pblanc_sport_sttus_code == 5) {
			return '<button type="button" class="btn btn-block btn-danger btn-sm" style="width:70px;margin: auto;">불합격</button>';
		}
	},
	"size" : function(last, index){
		var returnStr = "";
		if (last==true) {
			if (index != 4) {
				var forCnt = (4-index);
				for (var i = 0; i < forCnt; i++) {
				returnStr += "<tr style='pointer-events : none;height : 59px'><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
				}
			}
		}
		return returnStr;
	},
	"size2" : function(last, index){
		var returnStr = "";
		if (last==true) {
			if (index != 4) {
				var forCnt = (4-index);
				for (var i = 0; i < forCnt; i++) {
				returnStr += "<tr style='pointer-events : none;height : 55.67px'><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
				}
			}
		}
		return returnStr;
	},
	"size3" : function(last, index){
		var returnStr = "";
		if (last==true) {
			if (index != 4) {
				var forCnt = (4-index);
				for (var i = 0; i < forCnt; i++) {
				returnStr += "<tr style='pointer-events : none;height : 55.67px'><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
				}
			}
		}
		return returnStr;
	}
});
function meetingGo2(){
	OpenWindow('https://192.168.45.59:9001?from=join','화상회의참여',1300,420);
}
/* page upload */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/myRecruit/getApplyRecruit/"+mber_sn+"/"+applyRecruitPage);
	getPage2("<%=request.getContextPath()%>/myRecruit/getApplyMeeting/"+recruitMeetingPage); 
 	getPage3("<%=request.getContextPath()%>/myRecruit/getApplyMeetingResult/"+meetingResultPage);

	$('ul#applyRecruitPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			applyRecruitPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/myRecruit/getApplyRecruit/"+mber_sn+"/"+applyRecruitPage);
		}
		return false;
	});
	$('ul#recruitMeetingPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			recruitMeetingPage=$(this).attr("href");
			getPage2("<%=request.getContextPath()%>/myRecruit/getApplyMeeting/"+recruitMeetingPage);
		}
		return false;
	});
	$('ul#meetingResultPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			meetingResultPage=$(this).attr("href");
			getPage3("<%=request.getContextPath()%>/myRecruit/getApplyMeetingResult/"+meetingResultPage);
		}
		return false;
	});

}
</script>









