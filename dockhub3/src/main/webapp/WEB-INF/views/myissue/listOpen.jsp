<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="issue-list-template" >

<div class="issueLi">

<div class="card-body" style='height: 550px;'>
<table class="table table-bordered text-center">
	<tr style="font-size: 0.95em;">
		<th style="width: 18%;">프로젝트명</th>
		<th style="width: 23%;">이슈 제목</th>
		<th style="width: 17%;">마일스톤</th>
		<th style="width: 8%;">중요도</th>
		<th style="width: 10%;">댓글</th>
	</tr>
{{#if .}}
{{else}}
<tr>
	<td colspan="7"><strong>해당 내용이 없습니다.</strong></td>
</tr>
{{/if }}
{{#each .}}
	<tr style='font-size: 0.85em;'>
		<td>{{prjct_sj}}</td>
		<td onclick="OpenWindow('<%=request.getContextPath() %>/issue/detail.do?issue_sn={{issue_sn}}','이슈등록',1050,850,'detail')";
			style='text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;'>{{issue_title}}</td>
		<td style='text-align: center; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;'>{{mile_title}}</td>
		<td>{{#issueLabel issue_ipcr_se_code}}{{/issueLabel}}</td>
		<td>{{replyCnt}}</td>
	</tr>
{{/each}}
</table>

</div>
</script>

<script type="text/x-handlebars-template"  id="issue-pagination-template" >
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
var filePage=1;
function getPage(pageInfo){
   $.ajax({
	   url : pageInfo,
	   type : "post",
	   contentType:"application/json",
	   success : function(data){
	   		printData(data.issueList,$('#issueDiv'),$('#issue-list-template'));
	   		printPagination(data.pageMaker,$('ul#pagination'),$('#issue-pagination-template'));
	   		
	   },
	   error : function(error){
		   //e.printStackTrace();
		   alert("에러다임마");
// 	   	 	AjaxErrorSecurityRedirectHandler(error.status);
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
	
	
	var template = Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
	
}
function printData(replyArr,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	
	$(".issueLi").remove();
	target.after(html);
	}
//open눌렀을때 리스트 출력
function openOpen(){
	$("#filePage").val(1);
	$('.issueLi').empty();
	var mber_sn = $("#mber_sn").val();
	getPage("<%=request.getContextPath()%>/mypage/listOpen/"+mber_sn+"/"+1);
}
//close눌렀을때 리스트 출력
function openClose(){
	$("#filePage").val(1);
	$('.issueLi').empty();
	var mber_sn = $("#mber_sn").val();
	getPage("<%=request.getContextPath()%>/mypage/listClose/"+mber_sn+"/"+1);
}

//내 이슈만 보기
// function fn_myCheck(mber_sn){
	
// 	$("#filePage").val(1);
// 	$('.issueLi').empty();
// 	var prjct_sn = $("#prjct_sn").val();
<%-- 	getPage("<%=request.getContextPath()%>/issue/listOpen/"+prjct_sn+"/"+1+"/"+1); --%>
	
// }

//핸들바 함수
Handlebars.registerHelper({
	   "prettifyDate":function(timeValue){ //Handlebars에 날짜출력함수 등록
	      var dateObj = new Date(timeValue);
	      var year   = dateObj.getFullYear(); //4자리
	      var month   = dateObj.getMonth()+1; //0부터이므로 +1
	      var date   = dateObj.getDate(); //date는 날짜 day는 요일
	      return year+"/"+month+"/"+date;
	   },

	   "signActive":function(pageNum){
		   var page = $("#filePage").val();
	      if(pageNum==page) return 'active';
	   },
	   "issueLabel" : function(issue_ipcr_se_code){
			if (issue_ipcr_se_code == "0") {
				return "<div class='badge bg-info' style='font-size: 12px; width: 50px; height: 20px;'>낮음</div>"
			} else if(issue_ipcr_se_code == "1"){
				return "<div class='badge bg-success' style='font-size: 12px; width: 50px; height: 20px;'>보통</div>"
			} else if(issue_ipcr_se_code == "2"){
				return "<div class='badge bg-warning' style='font-size: 12px; width: 50px; height: 20px;'>높음</div>"
			} else if(issue_ipcr_se_code == "3"){
				return "<div class='badge bg-danger' style='font-size: 12px; width: 50px; height: 20px;'>심각</div>"
			} 
	   }

	   
	}) 
 

window.onload= function(){
	var mber_sn = $("#mber_sn").val();
	getPage("<%=request.getContextPath()%>/mypage/listOpen/"+mber_sn+"/"+filePage);
	
	
	/* pagenation 에 클릭이벤트를 주되 나올때  li, a를 거쳐서 나오면 실행해달라 */
	   $('ul.pagination').on('click','li a',function(event){
	      // $(this) : event.currentTarget 여기서는 a(currentTarget), li, pagination(target) 
	      if($(this).attr("href")){
	         filePage=$(this).attr("href");
	        
	         $("#filePage").val(filePage);
	 		 getPage("<%=request.getContextPath()%>/mypage/listOpen/"+mber_sn+"/"+filePage);			
	      return false;
      	}
      });
}

</script>
