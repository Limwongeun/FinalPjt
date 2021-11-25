<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="proPrjct-list-template" >
<table id="chatMeetingTable" class="table table-hover text-nowrap" style="width: 99%;">
<thead>
<tr style="font-size:0.95em;">
	<th style="width: 10%;text-align : center">NO</th>
	<th style="width: 10%;text-align : center">프로젝트</th>
	<th style="width: 30%;text-align : center">기간</th>
	<th style="width: 10%;text-align : center">진행률</th>
	<th style="width: 20%;"></th>
	<th style="width: 20%;text-align : center">구성원</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="6">
		<div style="padding : 20px; height : 50px; text-align : center">진행중인 프로젝트가 없습니다.</div>		
	</td>
</tr>
{{/if}}
{{#each .}}
<tr onclick="fn_go2({{prjct_sn}});">
	<td style="vertical-align:middle;text-align : center">{{rownum}}</td>
	<td style="vertical-align:middle;text-align : center">{{prjct_sj }}</td>
	<td style="vertical-align:middle;text-align : center">{{prjct_bgnde }}~{{prjct_endde }}</td>
	<td style="vertical-align:middle;text-align : center; width : 30px">{{#proPercent dutyPro issuePro }}{{/proPercent}}%</td>
	<td style="vertical-align:middle;">
		<div class="progress progress-m" style="margin:5px; ">
		<div class="progress-bar progress-bar-danger" style="background-color : #10316b;width: {{#proPercent dutyPro issuePro }}{{/proPercent}}%;"></div>
		</div>
	
	</td>
	<td style="padding-top : 3px">
		{{#each memList}}
	    	<div style="position : relative;left : 10%">
				{{#if mber_photo}}

				    <img class="img-circle memImg" style="width : 40px; height : 40px;position:absolute; left : {{#position @index }}{{/position}}px" src="<%=request.getContextPath() %>/member/getPicture.do?picture={{mber_photo }}">
				{{else}}
		   			<img class="img-circle memImg" style="width : 40px;height : 40px;position:absolute; left : {{#position @index }}{{/position}}px"src="<%=request.getContextPath() %>/resources/images/user.png">					

				{{/if}}
	    
		</div>
		{{/each}}
	</td>
</tr>
{{#size @last @index}}{{/size}}
{{/each}}
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="proPrjct-pagination-template" >
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
var proPrjctPage=1;
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
			printData(data.projectList,$('#proPrjctList'),$('#proPrjct-list-template'));
			printPagination(data.pageMaker,$('ul#proPrjctPagination'),$('#proPrjct-pagination-template'));
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

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"signActive":function(pageNum){
		if(pageNum == proPrjctPage) return 'active';
	},
	"proPercent" : function(dutyPro, issuePro){
		return ((dutyPro+issuePro)/2);
	},
	"position" : function(index){
		return (index*15);
	},
	"size" : function(last, index){
		var returnStr = "";
		if (last==true) {
			if (index != 4) {
				var forCnt = (4-index);
				for (var i = 0; i < forCnt; i++) {
				returnStr += "<tr style='pointer-events : none;height : 51px'><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
				}
			}
		}
		return returnStr;
	}
	
})

/* page upload */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/myproject/getProProject/"+proPrjctPage);
	$('ul#proPrjctPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			proPrjctPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/myproject/getProProject/"+proPrjctPage);
		}
		return false;
	});
}
</script>









