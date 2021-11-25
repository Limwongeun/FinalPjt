<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="myRecruit-list-template" >
<table id="myRecruitTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width: 8%;text-align : center">NO</th>
<th style="width: 27%;text-align : center">공고제목</th>
<th style="width: 25%;text-align : center">프로젝트명</th>
<th style="width: 8%;text-align : center">신청자수</th>
<th style="width: 16%;text-align : center">공고마감일자</th>
<th style="width: 16%;text-align : center">업데이트일자</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="6" style="text-align : center">작성한 공고가 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr style="height : 49px" onclick="OpenWindow('<%=request.getContextPath() %>/notification/detail.do?pblanc_sn={{pblanc_sn}}&from=list','상세보기',800,780);">
	<td style="vertical-align:middle;text-align : center">{{pblanc_sn}}</td>
	<td style="vertical-align:middle;">{{pblanc_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{prjct_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{apply_cnt}}</td>
	<td style="vertical-align:middle;text-align : center;">{{pblanc_clos_de}}</td>
	<td style="vertical-align:middle;text-align : center;">{{pblanc_updde}}</td>
</tr>
{{#size @last @index}}{{/size}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="recruitMeeting-list-template" >
<table id="recruitMeetingTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width : 10%;text-align : center">NO</th>
<th style="width : 20%;text-align : center">공고 제목</th>
<th style="width : 20%;text-align : center">프로젝트명</th>
<th style="width : 10%;text-align : center">신청자</th>
<th style="width : 7%;text-align : center">신청역할</th>
<th style="width : 18%;text-align : center">면접일시</th>
<th style="width : 15%;text-align : center">면접</th>
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
<tr >
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_sn}}</td>
	<td style="vertical-align:middle;text-align : center;"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{pblanc_sj}}</td>
	<td style="vertical-align:middle;text-align : center;"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{prjct_sj}}</td>
	<td style="vertical-align:middle;text-align : center"  onclick="OpenWindow('<%=request.getContextPath() %>/myRecruit/applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}&from=meeting','신청 상세보기',800,850);">{{mber_ncnm}}</td>
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
<th style="width: 28%;text-align : center">공고 제목</th>
<th style="width: 28%;text-align : center">프로젝트명</th>
<th style="width :17%;text-align : center">신청자</th>
<th style="width: 7%;text-align : center">신청역할</th>
<th style="width: 10%;text-align : center">상태</th>
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
<tr >
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_sn}}</td>
	<td style="vertical-align:middle;text-align : center">{{pblanc_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{prjct_sj}}</td>
	<td style="vertical-align:middle;text-align : center">{{mber_ncnm}}</td>
	<td style="vertical-align:middle;text-align : center">{{#roleBtn pblanc_sport_role}}{{/roleBtn}}</td>
	<td style="vertical-align:middle;text-align : center;">{{#result pblanc_sport_sttus_code}}{{/result}}</td>
</tr>
{{#size3 @last @index}}{{/size3}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="recruitMeeting-pagination-template" >
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
var myRecruitPage=1;
var recruitMeetingPage=1;
var meetingResultPage=1;
var mber_sn = $("#mber_sn").val();
function printData(myRecruitArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(myRecruitArr);	
	$('#myRecruitTable').remove();
	target.after(html);
}

function getPage(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData(data.myRecruitList,$('#myRecruitList'),$('#myRecruit-list-template'));
			if (data.myRecruitList.length!=0) {
				printPagination(data.pageMaker,$('ul#myRecruitPagination'),$('#myRecruit-pagination-template'));
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
			printData2(data.recruitMeetingList,$('#recruitMeetingList'),$('#recruitMeeting-list-template'));
			if (data.recruitMeetingList.length!=0) {
				
				printPagination2(data.pageMaker,$('ul#recruitMeetingPagination'),$('#recruitMeeting-pagination-template'));
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
			printData3(data.meetingResultList,$('#meetingResultList'),$('#meetingResult-list-template'));
			if (data.meetingResultList.length!=0) {
				
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


function acceptRecruit(pblanc_sport_sn){
	confirm("신청을 수락하시겠습니까?")
	if (confirm) {
		$.ajax({
			url:"<%=request.getContextPath()%>/myRecruit/acceptRecruit.do?pblanc_sport_sn="+pblanc_sport_sn,	
			type:"post",
			contentType:"application/json",
			success:function(res){
				if (res=="OK") {
					location.reload();
				}
			},
			error:function(error){
	// 			AjaxErrorSecurityRedirectHandler(error.status);		
				alert("업데이트 acceptRecruit 오류");
			}
		});
		
	}
}
function refuseRecruit(pblanc_sport_sn){
	$.ajax({
		url:"<%=request.getContextPath()%>/myRecruit/refuseRecruit.do?pblanc_sport_sn="+pblanc_sport_sn,	
		type:"post",
		contentType:"application/json",
		success:function(res){
			if (res=="OK") {
				location.reload();
			}
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("업데이트 refuseRecruit 오류");
		}
	});
}

function meetingGo(pblanc_sport_sn){
	/* 업데이트 미팅 완료 합격 탈락 */
	OpenWindow('https://192.168.45.59:9001?from=open','화상회의시작',1300,420);
	$.ajax({
		url:"<%=request.getContextPath()%>/myRecruit/updateEndMeeting.do?pblanc_sport_sn="+pblanc_sport_sn,	
		type:"post",
		contentType:"application/json",
		success:function(res){
			if (res=="OK") {
				location.reload();
			}
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("업데이트 endMeeting 오류");
		}
	});
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
		if(pageNum == myRecruitPage) return 'active';
	},
	"signActive2":function(pageNum){
		if(pageNum == recruitMeetingPage) return 'active';
	},
	"signActive3":function(pageNum){
		if(pageNum == meetingResultPage) return 'active';
	},

	"sttusLabel" : function(pblanc_sport_sttus_code){
		if (pblanc_sport_sttus_code == 0) {
			return "<div class='badge bg-warning' style='font-size: 14px; padding: 10px'>대기</div>";
		}else if (pblanc_sport_sttus_code == 2) {
			return "<div class='badge bg-warning' style='font-size: 14px;padding: 10px'>면접 대기</div>";
		}else if (pblanc_sport_sttus_code == 1) {
			return "<div class='badge bg-danger' style='font-size: 14px;padding: 10px'>서류 탈락</div>";
		}else if (pblanc_sport_sttus_code == 5) {
			return "<div class='badge bg-danger' style='font-size: 14px;padding: 10px'>불합격</div>";
		}else if (pblanc_sport_sttus_code == 3) {
			return "<div class='badge bg-success' style='font-size: 14px;padding: 10px'>면접완료</div>";
		}else if (pblanc_sport_sttus_code == 4) {
			return "<div class='badge bg-primary' style='font-size: 14px;padding: 10px'>합격</div>";
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
			return '<button type="button" class="btn btn-block btn-secondary btn-sm" onclick="meetingGo('+pblanc_sport_sn+')">면접</button>';
		}else if (pblanc_sport_sttus_code == 3) {
			return '<button type="button" class="btn btn-block btn-secondary btn-sm"style="background-color : #10316b;display: inline;width: 40%;margin: 0 auto; margin-right : 10px" onclick="acceptRecruit('+pblanc_sport_sn+')">합격</button><button type="button" class="btn btn-block btn-secondary btn-sm"style="display: inline;width: 40%;margin: 0 auto;"onclick="refuseRecruit('+pblanc_sport_sn+')">탈락</button>';
			
		}
	},
	"result" : function(pblanc_sport_sttus_code){
		if (pblanc_sport_sttus_code == 4) {
			return "<div class='badge bg-primary' style='font-size: 14px;padding: 10px'>합격</div>"; 
		}else if (pblanc_sport_sttus_code == 5) {
			return "<div class='badge bg-danger' style='font-size: 14px;padding : 10px'>불합격</div>";
		}
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
	"size2" : function(last, index){
		var returnStr = "";
		if (last==true) {
			if (index != 4) {
				var forCnt = (4-index);
				for (var i = 0; i < forCnt; i++) {
				returnStr += "<tr style='pointer-events : none;height : 56.7px'><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
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
				returnStr += "<tr style='pointer-events : none;height : 59px'><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
				}
			}
		}
		return returnStr;
	}
});





/* page upload */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/myRecruit/getMyRecruit/"+mber_sn+"/"+myRecruitPage);


 	getPage2("<%=request.getContextPath()%>/myRecruit/getRecruitMeeting/"+recruitMeetingPage); 
 	getPage3("<%=request.getContextPath()%>/myRecruit/getMeetingResult/"+meetingResultPage);

	$('ul#myRecruitPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			myRecruitPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/myRecruit/getMyRecruit/"+mber_sn+"/"+myRecruitPage);
		}
		return false;
	});
	$('ul#recruitMeetingPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			recruitMeetingPage=$(this).attr("href");
			getPage2("<%=request.getContextPath()%>/myRecruit/getRecruitMeeting/"+recruitMeetingPage);
		}
		return false;
	});
	$('ul#meetingResultPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			meetingResultPage=$(this).attr("href");
			getPage3("<%=request.getContextPath()%>/myRecruit/getMeetingResult/"+meetingResultPage);
		}
		return false;
	});
	
	
	
}
</script>









