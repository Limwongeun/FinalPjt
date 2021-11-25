<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi" >
	<div class="user-block">
		<img src="<%=request.getContextPath()%>/member/getPicture?picture={{mber_photo}}" class="img-circle img-bordered-sm"/>
    </div>
	
 	<div class="timeline-item" >
  		<span class="time">
    		<i class="fa fa-clock"></i>{{prettifyDate issue_reply_regdate}}
	 		<a class="btn btn-primary btn-xs {{issue_reply_no}}-a" id="modifyReplyBtn" data-issue_reply_no={{issue_reply_no}}
				onclick="replyModifyModal_go('{{issue_reply_no}}');"				
				style="display:{{VisibleByLoginCheck mber_ncnm}}; padding:initial; font-size: inherit; color:white; font-weight: 600;"
	    		data-issue_replyer={{mber_ncnm}} data-toggle="modal" data-target="#modifyModal">&nbsp수정&nbsp</a>
  		</span>
	
  		<h3 class="timeline-header"><strong style="display:none;">{{issue_reply_no}}</strong>{{mber_ncnm}}</h3>
  		<div class="timeline-body" id="{{issue_reply_no}}-issue_reply_content">{{issue_reply_content}} </div>
	</div>
</div>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="reply-pagination-template" >
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
var replyPage=1;

function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.replyLi').remove();
	target.after(html);
}

function getPage(pageInfo){
	$.ajax({
		url:pageInfo,
		type:"get",
		contentType:"application/json",
		success:function(data){
			printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
			printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
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
	"VisibleByLoginCheck":function(issue_replyer){
		var result="none";		
		if(issue_replyer == "${loginUser.mber_ncnm}") result="visible";		
		return result;						  
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
});

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



function replyRegist_go(){
	//alert("click add btn");
	
	var issue_replyer=$('#newReplyWriter').val();
	var issue_reply_content=$('#newReplyText').val();
	var issue_sn=$('input[name="issue_sn"]').val();
	var prjct_sn=$('input[name="prjct_sn"]').val();
// 	var mber_sn=$('input[name="mber_sn"]').val();
	
	if(!issue_reply_content){
		alert("내용은 필수입니다.");
		return;
	}
	
	//alert(replyer+":"+replytext+":"+issue_sn);
	var data={
			"issue_sn":""+issue_sn+"",
			"issue_replyer":issue_replyer,
			"issue_reply_content":issue_reply_content,
			"prjct_sn":prjct_sn
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(page){
			alert('댓글이 등록되었습니다.\n마지막 페이지로 이동합니다.');			
			getPage("<%=request.getContextPath()%>/replies/"+issue_sn+"/"+page); //리스트 출력
			replyPage=page;
			$('#newReplyText').val("");				
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status); //응답번호가 들어간다.
		}
	});
}

//댓글 수정
function replyModifyModal_go(issue_reply_no){
// 	alert(issue_reply_no);
	//var replytext = $('div#'+issue_reply_no+'-replytext').text()
	//var replyer = $('a.'+issue_reply_no+'-a').attr('data-replyer');
	
	//alert("issue_reply_no:"+issue_reply_no+"\nissue_replyer:"+issue_replyer+"\nissue_reply_content:"+issue_reply_content);
	
	$('div#modifyModal div.modal-body #issue_reply_content').val($('div#'+issue_reply_no+'-issue_reply_content').text());
	$('div#modifyModal div.modal-header h4.modal-title').text(issue_reply_no);
}

function replyModify_go(){
// 	alert('reply modify modal btn');
	var issue_reply_no=$('.modal-title').text();
	var issue_reply_content=$('#issue_reply_content').val();
	console.log(issue_reply_no);
	console.log(issue_reply_content);
	
	var sendData={
			issue_reply_no:issue_reply_no,
			issue_reply_content:issue_reply_content
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+issue_reply_no,
		type:"put",
		headers:{			
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(result){
			alert("수정되었습니다.");			
			getPage("<%=request.getContextPath()%>/replies/${detailIssue.issue_sn}/"+replyPage);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}

function replyRemove_go(){
	//alert("click remove btn");
	
	var issue_reply_no=$('.modal-title').text();
	//alert(issue_reply_no);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/${detailIssue.issue_sn}/"+issue_reply_no+"/"+replyPage,
		type:"delete",
		headers:{			
			"X-HTTP-Method-Override":"DELETE"
		},
		success:function(page){
			alert("삭제되었습니다.");
			getPage("<%=request.getContextPath()%>/replies/${detailIssue.issue_sn}/"+page);
			replyPage=page;
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}


/* page upload */
window.onload=function(){
	getPage("<%=request.getContextPath()%>/replies/${detailIssue.issue_sn}/"+replyPage);
	
	$('ul.pagination').on('click','li a',function(event){
		//alert("click page number");
		// $(this) : event.currentTarget
		if($(this).attr("href")) {
			replyPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/replies/${detailIssue.issue_sn}/"+replyPage);
		}
		return false;
	});
}


</script>









