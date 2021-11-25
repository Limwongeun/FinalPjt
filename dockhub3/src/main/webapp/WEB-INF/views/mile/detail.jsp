<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
.tabs {
    position: relative;
    padding: 0;
    list-style: none;
}
.tab {
    float: left;
    padding: 10px 0;
}
.tab label { /* 탭 헤더 */
    position: relative;
    background: #eee;
    padding: 8px 20px;
    border: 1px solid #ccc;
    line-height: 13px;
}
.tab [type="radio"] {
    display: none;
}
.tab .content { /* 탭 컨텐츠 */
    display: none;
    position: absolute;
    background: white;
    top: 39px; /*탭 헤더 아래쪽으로 위치 이동 */
    left: 0;
    right: 0;
    padding: 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
}
.tab [type="radio"]:checked ~ label {
    background: white;
    border-bottom: 1px solid white;
    z-index: 2; /* 선택한 탭 헤더를 앞으로 옮겨 컨텐츠 테두리 선에 가려지지 않도록 처리 */
    line-height: 10px;
    
}
.tab [type="radio"]:checked + label + .content {
    z-index: 1;
    display: block;
    line-height: 25px;
    margin-top: 18px;
    padding: 20px 20px 20px 20px;
    height: 450px;
    overflow: auto;
}
</style>
</head>

<body>

  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:812px;">
   
   
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>상세보기</h1>  				
	  			</div>
<!-- 	  			<div class="col-sm-6"> -->
<!-- 	  				<ol class="breadcrumb float-sm-right"> -->
<!-- 			        <li class="breadcrumb-item"> -->
<!-- 			        	<a href="list.do"> -->
<!-- 				        	<i class="fa fa-dashboard"></i>자유게시판 -->
<!-- 				        </a> -->
<!-- 			        </li> -->
<!-- 			        <li class="breadcrumb-item active"> -->
<!-- 			        	상세보기 -->
<!-- 			        </li>		         -->
<!-- 	    	  </ol> -->
<!-- 	  			</div> -->
	  		</div>
	  	</div>
	</section>
	 
   
      <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info" style="border:none;"> 
					<div class="card-header">
						<div class="card-tools">
							<button type="button" class="btn btn-secondary" id="modifyBtn" style=" background-color: #6c757d; border-color: #6c757d;" onclick="history.go(-1);">뒤 로</button>
							<button type="button" id="modifyBtn" class="btn btn-warning" style=" background-color: #80bffb; border-color: #80bffb; color: white;" onclick="OpenWindow('<%=request.getContextPath() %>/mile/modifyForm.do?prjct_sn=${prjct_sn }&mile_no=${milestone.mile_no }','마일스톤수정',800,760,'modifyForm');">수 정</button>						
						    <button type="button" id="listBtn" class="btn btn-primary" style="background: #215287; border-color: #215287; " onclick="OpenWindow('<%=request.getContextPath() %>/mile/issueRegistForm.do?prjct_sn=${prjct_sn }&mile_no=${milestone.mile_no}','이슈등록',800,700,'registForm');">New Issue</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
<%-- 							<input type="text" class="form-control" id="title" readonly disabled value="${milestone.mile_title }" />							 --%>
							<div style="font-size: 19px; font-weight: 400;">${milestone.mile_title }</div>						
						</div>
						<div class="row">	
<!-- 							<div class="form-group col-sm-4" > -->
<!-- 								<label for="writer">작성자</label> -->
<%-- 								<input type="text" class="form-control" id="writer" readonly value="${milestone.mile_wrter }"/> --%>
<!-- 							</div>		 -->
							
<!-- 							<div class="form-group col-sm-4" > -->
<!-- 								<label for="regDate">작성일</label> -->
<!-- 								<input type="text" class="form-control" id="regDate" readonly  -->
<%-- 									value="<fmt:formatDate value="${milestone.mile_startdate }" pattern="yyyy-MM-dd" />" /> --%>
							
<!-- 							</div> -->
<!-- 							<div class="form-group col-sm-4" > -->
<!-- 								<label for="viewcnt">조회수</label> -->
<%-- 								<input type="text" class="form-control" id="viewcnt" readonly value="${milestone.viewcnt }"/> --%>
<!-- 							</div> -->
						</div>		
						<div class="form-group col-sm-12">
							
								<div class="progress" style="margin:10px; margin-left:40px; margin-right:40px;">
				                  <div class="progress-bar bg-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="border-radius:6px; width: ${(milestone.closeissue/(milestone.openissue+milestone.closeissue))*100}%; background-color: #116592!important; ">
<!-- 				                    <span class="sr-only">20% Complete</span> -->
				                  </div>
				                </div>
									<div style="width: 125px; float: left; margin-left:40px;">
										<c:if test="${(milestone.openissue/(milestone.openissue+milestone.closeissue)) eq 'NaN'}">
											<c:out value="0%"/>
										</c:if>
										<c:if test="${(milestone.openissue/(milestone.openissue+milestone.closeissue)) ne 'NaN'}">
											<fmt:formatNumber type="number" maxFractionDigits="0" value="${(milestone.closeissue/(milestone.openissue+milestone.closeissue))*100}" />%  진행됨
										</c:if>
					                </div>
							
							<div style="float:left; width:13%;">${milestone.openissue } open </div>
							<div style="float:left; width:13%;">${milestone.closeissue } close </div><br/>
							<div style="margin-left:40px; margin-right:40px; margin-top: 15px; font-size: 18px; font-weight:300;">${milestone.mile_content } </div>
							
							
							
							
							
<div style="width:100%; height:500px;">							
<ul class="tabs" style="position: relative; padding: 0; list-style: none;">
    <li class="tab" >
      <input type="radio" id="tab-1" name="tab-group-1" checked>
      <label for="tab-1" >${milestone.openissue } open 
      	<img src="<%=request.getContextPath() %>/resources/images/open.png" style="width: 30px;height: 30px;">
      </label>
      
      <div class="content">
										<c:forEach items="${issueList }" var="issueList">
											<div onclick="OpenWindow('<%=request.getContextPath() %>/issue/detail.do?prjct_sn=${prjct_sn }&issue_sn=${issueList.issue_sn}','이슈등록',750,850,'detail')"; style="float:left; width:100%; background: #e9ecef; font-weight: 300; font-size: 17px; padding:10px; margin-bottom:5px; border-radius:15px;">${issueList.issue_title }<br/>
<%-- 											<td onclick="OpenWindow('<%=request.getContextPath() %>/issue/detail.do?prjct_sn=${prjct_sn }&issue_sn={{issue_sn}}','이슈등록',750,850,'detail')";>{{issue_title}}</td> --%>
												<div style="font-size:14px;">
													<div style="float:left; padding-left:20px; padding-top:5px; font-weight:400; width: 115px;"> #${issueList.issue_sn }의 이슈 </div>
													<div style="float:left; padding-top:5px; font-weight:400;">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${issueList.issue_regdate}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;</div>
													<div style="float:left; padding-top:5px; font-weight:400; margin-left: 12px;"> ${issueList.mber_ncnm}</div>
												</div>
											</div>
<%-- 											<div >중요도 ${issueList.issue_ipcr_se_code}</div> --%>
										</c:forEach>        
      </div>
    </li>
    <li class="tab">
      <input type="radio" id="tab-2" name="tab-group-1">
      <label for="tab-2" >${milestone.closeissue } close
      	<img src="<%=request.getContextPath() %>/resources/images/close.png" style="width: 30px;height: 30px;">
      </label>
      
      <div class="content">
<!--         <p>컨텐츠2</p> -->
										<c:forEach items="${closeList }" var="closeList">
<%-- 											<div style="float:left; width:100%; background: #e9ecef; ">${closeList.issue_title }</div><br/> --%>
											<div onclick="OpenWindow('<%=request.getContextPath() %>/issue/detail.do?prjct_sn=${prjct_sn }&issue_sn=${closeList.issue_sn}','이슈등록',750,850,'detail')";  style="float:left; width:100%; background: #e9ecef; font-weight: 300; font-size: 17px; padding:10px; margin-bottom:5px; border-radius:15px;">${closeList.issue_title }<br/>
												<div style="font-size:14px;">
													<div style="float:left; padding-left:20px; padding-top:5px; font-weight:400; width: 115px;"> #${closeList.issue_sn }의 이슈</div>
													<div style="float:left; padding-top:5px; font-weight:400;">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${closeList.issue_regdate}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;</div>
													<div style="float:left; padding-top:5px; font-weight:400; margin-left: 12px;"> ${closeList.mber_ncnm}</div>
												</div>
											</div>
										</c:forEach>
      </div>
    </li>
</ul>							
</div>							
							
							
							
							
							
							
<!-- 								<div style="background: #e9ecef; padding: 30px; margin: 30px; font-weight: 600;" > -->
<%-- 										<c:forEach items="${issueList }" var="issueList"> --%>
<%-- 											<div style="float:left; width:30%;">${issueList.issue_title }</div><br/> --%>
<%-- 										</c:forEach> --%>
<%-- 										<c:forEach items="${closeList }" var="closeList"> --%>
<%-- 											<div style="float:left; width:30%;">${closeList.issue_title }</div><br/> --%>
<%-- 										</c:forEach> --%>
<!-- 								</div> -->
<%-- 							<input type="text" class="form-control" id="content" readonly disabled value="${milestone.mile_content }" /> --%>
						</div>
												
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->
        
    
  </div>
  <!-- /.content-wrapper -->

<!-- Modal -->
<!-- <div id="modifyModal" class="modal modal-default fade" role="dialog"> -->
<!--   <div class="modal-dialog"> -->
<!--     Modal content -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h4 class="modal-title" style="display:none;"></h4> -->
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button>         -->
<!--       </div> -->
<!--       <div class="modal-body" data-rno> -->
<!--         <p><input type="text" id="replytext" class="form-control"></p> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-info" id="replyModBtn" onclick="replyModify_go();">Modify</button> -->
<!--         <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">DELETE</button> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->


<form role="form">
	<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
	<input type="hidden" name ="issue_sn" id="issue_sn" value="${issue_sn}">
</form>
	
  
<script>
// 	<c:if test="${from eq 'modify'}" >
// 		alert("정상적으로 수정되었습니다.");	
// 		window.opener.location.reload();
// 	</c:if>
// 	<c:if test="${from eq 'remove'}" >
// 		alert("삭제되었습니다.");
// 		window.opener.location.reload();
// 		window.close();
// 	</c:if>

// 	function modify_go(){
// 		var formObj = $("form[role='form']");
// 		//alert("click modify btn");
// 		formObj.attr({
// 			'action':'modifyForm.do',
// 			'method':'post'
// 		});
// 		formObj.submit();
// 	}
 	
    function modify_go(no){
//      	alert("click modify btn");
    	var prjct_sn = $("#prjct_sn").val();
    	location.href="modifyForm.do?mile_no="+no+"&prjct_sn="+prjct_sn;
    	formObj.attr('action','modifyForm.do').submit();
    } 
</script>

<%-- <%@ include file="./reply_js.jsp" %> --%>
 
</body> 
 
 
 
 
 
 
 
 
 
 