<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<!-- 서머노트 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css" />
	<!-- 부트스트랩 -->
	<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
	<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
	<!-- Date Range Picker  -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
<script type="text/javascript">

$(document).ready(function(){
	
})

function modify_go(){
	$('#detailForm').attr('action','updateIssueForm.do');
	$('#detailForm').submit();
}

function delete_go(){
	if(confirm("이슈를 삭제하시겠습니까?")){
		$('#detailForm').attr('action','deleteIssue.do');
		$('#detailForm').submit();
	}
}

function end_go(){
	if(confirm("이슈를 종료하시겠습니까?")){
		$('#detailForm').attr('action','endIssue.do');
		$('#detailForm').submit();
	}
}

function reIssue_go(){
	if(confirm("이슈를 재시작 하시겠습니까?")){
		$('#detailForm').attr('action','reIssue.do');
		$('#detailForm').submit();
	}
}
function reload(){
    window.opener.location.reload();
    window.close();
}
</script>


<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form id="detailForm" name="detailForm" style="overflow-x: hidden;">         
		<section class="content-header">

		</section>
   
<!-- main content -->
<section class="content content-fluid">
	<!-- start row -->
	<div class="row justify-content-center">
		<div class="col-md-9" >
			<!-- start card -->
			<div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;" >
				<!-- start header -->
				<div class="card-header">
					<div class="col-sm-12">
						<h1 style="font-size: 1.2em; ">#${detailIssue.issue_sn}의 이슈 [${detailIssue.issue_title}]</h1>
					</div>
					<div class="row" style="">
						<c:set var ="imp" value="${detailIssue.issue_sttus_code}"/> 
		
						<div class="col-sm-6" style="">
							<c:choose>
								<c:when test="${imp eq 0 }">
									<span class="badge bg-danger" style="">close</span>
								</c:when>
								<c:when test="${imp eq 1 }">
									<span class="badge bg-primary" style="">open</span>
								</c:when>
							</c:choose>
							|
							${detailIssue.mber_ncnm} &nbsp;
							<fmt:formatDate pattern="yyyy-MM-dd" value="${detailIssue.issue_regdate}"/>&nbsp;
							댓글 ${detailIssue.replyCnt}
						</div> 
						<div class="col-sm-4" style="">  
							<c:set var ="title" value="${detailIssue.mile_title}"/>
							<c:choose>
								<c:when test="${title eq null }">
									<strong>등록된 마일스톤이 없습니다.</strong>
								</c:when>
								<c:when test="${title ne null }">
									마일스톤 : ${title}
								</c:when>	
							</c:choose>
						</div>
						<div class="col-sm-2" style="">
							<c:set var ="sttus" value="${detailIssue.issue_ipcr_se_code}"/>중요도 : 
							<c:choose>
								<c:when test="${sttus eq 0 }">
									<span class="badge bg-info" style="">낮음</span>
								</c:when>
								<c:when test="${sttus eq 1 }">
									<span class="badge bg-success" style="">보통</span>
								</c:when>
								<c:when test="${sttus eq 2 }">
									<span class="badge bg-warning" style="">높음</span>
								</c:when>
								<c:when test="${sttus eq 3 }">
									<span class="badge bg-danger" style="">심각</span>
								</c:when>
							</c:choose>
						</div> 
					</div>
				</div>
				<!-- start card body -->
				<div class="card-body">
					<div class="form-group col-sm-12">
						<label for="issue_content"></label>
					<div style="border: solid 1px white;"><c:out value="${detailIssue.issue_content}" escapeXml="false"/></div>
					</div>
						<div class="form-group">
							<label for="">첨부파일</label>
							<h6>첨부파일이 없습니다.</h6>
						</div>
					
						<div class ="card-tools" style="text-align: right;">
							<c:set var ="imp" value="${detailIssue.issue_sttus_code}"/> 
								<c:choose>
									<c:when test="${imp eq 0 }">
										<button type="button" class="btn btn-outline-secondary" id="modifyBtn" onclick="reIssue_go();" style="margin-right: 20px;">이슈 재시작</button>
									</c:when>
									<c:when test="${imp eq 1 }">
										<button type="button" class="btn btn-secondary" id="modifyBtn" style=" background-color: #6c757d; border-color: #6c757d;"onclick="end_go();">이슈종료</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
									</c:when>
								</c:choose>
							<button type="button" class="btn btn-warning" id="modifyBtn" style=" background-color: #80bffb; border-color: #80bffb; color: white;" onclick="modify_go();">수 정</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="removeBtn" style="background: #215287; border-color: #215287; "  onclick="delete_go();">삭 제</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary" id="cancelBtn"  onclick="reload();" style="">닫 기</button>
						</div>
						<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${detailIssue.prjct_sn}"> 
						<input type="hidden" name ="issue_sn" id="issue_sn" value="${detailIssue.issue_sn}"> 
				<!-- end card body -->	
				</div>
				<!-- start card footer -->
				<div class="card-footer">
					<!-- The time line -->
					<div class="timeline" style="margin-bottom : 10px">
						<!-- timeline time label -->
						<div class="" id="repliesDiv" >
							<span class="" style=" color: black; border: 1px solid black; border-radius: 5px;">댓글 목록</span>							
						</div>
					</div>
					<div class='text-center'>
						<ul id="pagination" class="pagination justify-content-center m-0" >
						</ul>
					</div>
					<br>
					<div class="row">
					
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginUser.mber_ncnm }"> 
						<input class="form-control" type="text"	placeholder="댓글을 입력하세요." id="newReplyText" style="width: 560px;margin-left: 25px;">
						
						<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();" style="margin-left : 15px; background: #215287; border:1px solid #215287;">댓글 등록</button>
						
						<input type="hidden" name="prjct_sn" value="${detailIssue.prjct_sn }" />
							
					</div>
				<!--end card footer  -->
				</div>
			<!-- end card -->	
			</div>
		</div>
	<!-- end row -->	
	</div>
</section>
</form>
    <!-- Reply content -->
<!--     <section class="content container-fluid"> -->
<!--     	reply component start  -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-9"> -->
<!-- 				<div class="card card-info">					 -->
<!-- 					<div class="card-body"> -->
<!-- 						The time line -->
<!-- 						<div class="timeline"> -->
<!-- 							timeline time label -->
<!-- 							<div class="time-label" id="repliesDiv"> -->
<!-- 								<span class="bg-green">댓글 목록</span>							 -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class='text-center'> -->
<!-- 							<ul id="pagination" class="pagination justify-content-center m-0" > -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="card-footer"> -->
<%-- 						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginUser.mber_ncnm }">  --%>
<!-- 						<input class="form-control" type="text"	placeholder="댓글을 입력하세요." id="newReplyText"> -->
<!-- 						<br/> -->
<!-- 					<button type="button" class="btn btn-outline-secondary" id="cancelBtn" onclick="reload();" style="float: right; margin-left: 20px;">닫 기</button> -->
<!-- 					<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();" style="float: right;">댓글 등록</button> -->
<%-- 						<input type="hidden" name="prjct_sn" value="${detailIssue.prjct_sn }" /> --%>
						
<%-- <%-- 						<input type="hidden" name="mber_sn" value="${detailIssue.mber_sn }" /> --%> 
<!-- 					</div>				 -->
<!-- 				</div>			 -->
				
<!-- 			</div>end col-md-12 -->
<!-- 		</div>end row -->
<!--     </section> -->
  <!-- /.content-wrapper -->

<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="issue_reply_content" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="replyModBtn" onclick="replyModify_go();">수정</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<form role="form">
	<input type="hidden" name=issue_sn value="${detailIssue.issue_sn }" />
</form>
<script>
	<c:if test="${from eq 'modify'}" >
		alert("정상적으로 수정되었습니다.");	
		window.opener.location.reload();
	</c:if>
	<c:if test="${from eq 'remove'}" >
		alert("삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</c:if>
	

	function replyModify_go(){
		var formObj = $("form[role='form']");
// 		alert("click modify btn");
		formObj.attr({
			'action':'modifyForm.do',
			'method':'post'
		});
		formObj.submit();
	}
	function remove_go(){
		var formObj = $("form[role='form']");
		//alert("click remove btn");
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove.do");
			formObj.attr("method", "post");
			formObj.submit();
		}
	}
 	
	
</script>

<%@ include file="./reply_js.jsp" %>
</body>
