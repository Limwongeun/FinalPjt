<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="myRecruitApply-list-template" >
<table id="myRecruitApplyTable" class="table table-hover text-nowrap" >
<thead>
<tr style="font-size:0.95em;">
<th style="width: 10%;text-align : center">NO</th>
<th style="width: 40%;text-align : center">신청자</th>
<th style="width: 10%;text-align : center">신청 역할</th>
<th style="width: 30%;text-align : center">신청 일자</th>
<th style="width: 10%;text-align : center">선택</th>
</tr>
</thead>
<tbody>
{{#if .}}

{{else}}
<tr>
	<td colspan="5"  style="text-align : center">신청자가 존재하지 않습니다.</td>
</tr>
{{/if}}
{{#each .}}
<tr onclick="">
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_sn}}</td>
	<td style="vertical-align:middle;text-align : center">{{mber_ncnm}}</td>
	<td style="vertical-align:middle;text-align : center">{{#roleBtn pblanc_sport_role}}{{/roleBtn}}</td>
	<td style="vertical-align:middle;text-align : center">{{pblanc_sport_de}}</td>
	<td style="vertical-align:middle;text-align : center">
	<button type="button" class="btn btn-block btn-secondary btn-sm" onclick="OpenWindow('applyDetail.do?pblanc_sport_sn={{pblanc_sport_sn}}','신청 상세보기',800,850);">상세보기</button>
	</td>
</tr>
{{#size @last @index}}{{/size}}
{{/each}}
</tbody>
</table>
</script>

<script type="text/x-handlebars-template"  id="myRecruitApply-pagination-template" >
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


var myRecruitApplyPage=1;

var pblanc_sn = $("#pblanc_sn").val();
function printData(myRecruitApplyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(myRecruitApplyArr);	
	$('#myRecruitApplyTable').remove();
	target.after(html);
}

function getPage(pageInfo){	 
	$.ajax({
		url:pageInfo,	
		type:"post",
		contentType:"application/json",
		success:function(data){
			printData(data.myRecruitApplyList,$('#myRecruitApplyList'),$('#myRecruitApply-list-template'));
			if (data.myRecruitApplyList.length!=0) {
				printPagination(data.pageMaker,$('ul#myRecruitApplyPagination'),$('#myRecruitApply-pagination-template'));
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


Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"signActive":function(pageNum){
		if(pageNum == myRecruitApplyPage) return 'active';
	},
	"sttusLabel" : function(pblanc_sport_sttus_code){
		if (pblanc_sport_sttus_code == 0) {
			return "<div class='badge bg-warning' style='font-size: 14px;padding: 10px'>대기</div>";
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
	}
});





/* page upload */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/myRecruit/getMyRecruitApply/"+pblanc_sn+"/"+myRecruitApplyPage);
 	
	$('ul#myRecruitApplyPagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			myRecruitPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/myRecruit/getMyRecruitApply/"+pblanc_sn+"/"+myRecruitApplyPage);
		}
		return false;
	});

}
</script>









