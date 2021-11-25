<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
   <c:if test="${from eq 'remove' }" >
    <script>
   		alert("삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
   </c:if>
   
	<script type="text/javascript">
		function change_parent_url(url) {
			window.location.href = url;
		}
	</script>   
	

  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:750px;">
	<section class="content-header" style="padding-bottom: 2px;padding-left: 107px;">
		<c:if test="${recruit.pblanc_wrter eq mber_sn}">
			<div>
				<a href="javascript:change_parent_url('');"
					style="padding: 5px 10px 5px 9px; display: inline-block; transition: all 0.1s; float: left;color : black;border : 2px solid #282c2f; background-color : #282c2f;border-radius : 3px;color : white;border-bottom : 0px">
					상세보기</a>
			</div>
			<div>
				<a href="javascript:change_parent_url('<%=request.getContextPath()%>/myRecruit/applyManage?pblanc_sn='+${recruit.pblanc_sn });"
					style="padding: 5px 10px 5px 10px; display: inline-block; border-radius: 10px; transition: all 0.1s;color : black; ">
					신청 관리</a>
			</div>
		</c:if>
	</section>
	 
      <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h3 class="card-title" style="margin-top: 7px;">공고 상세보기</h3>
						<div class="card-tools">
						<c:if test="${recruit.pblanc_wrter eq mber_sn}">
							<button type="button" id="modifyBtn" class="btn btn-warning" style=" background-color: #80bffb; border-color: #80bffb; color: white;" onclick="modify_go();">수 정</button>						
						    <button type="button" id="removeBtn" class="btn btn-danger" style="background: #215287; border-color: #215287; "onclick="remove_go();">삭 제</button>
<!-- 							<button type="button" id="modifyBtn" class="btn btn-warning" style="background: #84a7d3; border: 1px solid #84a7d3; color: white;" onclick="modify_go();">수 정</button>						 -->
<!-- 						    <button type="button" id="removeBtn" class="btn btn-danger" style="background: #4f559f; border: 1px solid #4f559f; color: white;" onclick="remove_go();">삭 제</button> -->
						</c:if>
						    <button type="button" id="listBtn" class="btn btn-default" style="border-color: #ddd; " onclick="CloseWindow();">닫 기</button>
					    </div>
					</div>
					<div class="card-body">
						<input type="hidden" name="pblanc_stts_code" id="pblanc_stts_code"value="${recruit.pblanc_stts_code }"/>
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
							<input type="text" class="form-control" id="title" readonly disabled value="${recruit.pblanc_sj }" />							
						</div>
						<div class="row">	
							<div class="form-group col-sm-6" >
								<label for="writer">작성자</label>
								<input type="hidden" id="writer" value="${recruit.pblanc_wrter }"/>
								<input type="text" class="form-control" readonly value="${recruit.mber_ncnm }"/>
							</div>		
							<div class="form-group col-sm-6" >
								<label for="viewcnt">조회수</label>
								<input type="text" class="form-control" id="viewcnt" readonly value="${recruit.pblanc_rdcnt }"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6" >
								<label for="regDate">모집 시작 일시</label>
								<input type="text" class="form-control" id="startDate" readonly 
										value="${recruit.pblanc_bgnde } 9시"/>
<%-- 									value="<fmt:formatDate value="${recruit.pblanc_rgsde }" pattern="yyyy-MM-dd" />" /> --%>
								<input type="hidden" id="pblanc_bgnde" name="pblanc_bgnde" value="${recruit.pblanc_bgnde }">
							</div>
							<div class="form-group col-sm-6" >
								<label for="regDate">모집 마감 일시</label>
								<input type="text" class="form-control" id="endDate" readonly 
										value="${recruit.pblanc_clos_de } 17시"/>
<%-- 									value="<fmt:formatDate value="${recruit.pblanc_rgsde }" pattern="yyyy-MM-dd" />" /> --%>
								<input type="hidden" id="pblanc_clos_de" name="pblanc_clos_de" value="${recruit.pblanc_clos_de }">
								
							</div>
						</div>
								
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id="content" style="height : 300px; border : 1px solid lightgrey; border-radius : 5px; padding : 10px; overflow-y:scroll">${recruit.pblanc_cn }</div>
						</div>
						<div class="form-group col-sm-12">
							<label for="project">프로젝트</label>
							<input type="text" class="form-control" id="project" value="${recruit.prjct_sj }" readonly />
							<button class="btn btn-primary" onclick="window.open('<%=request.getContextPath()%>/pmsproject/recruitInfo?prjct_sn=${recruit.prjct_sn }&mber_sn=${loginUser.mber_sn }','새창','width=1200, height=750')">프로젝트 정보</button>
							<input type="hidden" name="prjct_sn" id="prjct_sn" value="${recruit.prjct_sn }" >
							
						</div>
						<div class="form-group col-sm-12">
							<div class="card card-outline card-success" style="border-top: 3px solid #282c2f;">
								<div class="card-header">
									첨부파일
								</div>			
								<div class="card-footer" style="min-height : 100px">
									<div class="row">
										<c:forEach items="${attachList }" var="attach">
											<div class="col-md-6 col-sm-4 col-xs-12"  style="cursor:pointer;"
												 onclick="location.href='<%=request.getContextPath()%>/getFile.do?file_sn=${attach.file_sn }&file_ordr=${attach.file_ordr }'">
												<div class="info-box">	
												 	<span class="info-box-icon bg-yellow">
														<i class="fa fa-copy"></i>
													</span>
													<div class="info-box-content">
														<span class ="info-box-text">
															<%-- <fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd" /> --%>	
														</span>
														<span class ="info-box-number">${attach.file_nm }</span>
													</div>
												</div>
											 </div>							
										</c:forEach>
									</div>
								</div>				
							</div>
						</div>
						<div class="form-group col-sm-12">
						<c:if test="${recruit.pblanc_wrter ne mber_sn}">
							<button type="button" id="joinBtn" class="btn btn-primary" style="border: 0px; display : block; width : 100px;margin : auto;"onclick="joinPro()">참 여</button>	
						</c:if>
						</div>						
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<form role="form">
	<input type="hidden" name="pblanc_sn" id="pblanc_sn"value="${recruit.pblanc_sn }" />
</form>
<script>
var formObj = "";
window.onload=function(){
	formObj = $("form[role='form']");
}

function modify_go(){
	//alert("click modify btn");
	formObj.attr('action','modifyForm.do').submit();
}
function remove_go(){
	//alert("click remove btn");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer)	formObj.attr({'action':'remove.do',
							  'method':'post'}).submit();
}
function joinPro(){
	
// 	var date = new Date();
	 
//     var year = date.getFullYear(); //년도
//     var month = date.getMonth()+1; //월
//     var day = date.getDate(); //일
 
//     if ((day+"").length < 2) {// 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
//         day = "0" + day;
//     }
 
//     var getToday = year+"-"+month+"-"+day; // 오늘 날짜 (2017-02-07)
	
// 	var pblanc_bgnde = $("#pblanc_bgnde").val();
// 	if (pblanc_bgnde.split("-")[0]>getToday.split("-")[0]) {
// 		alert("접수 기간이 아닙니다.");
// 		return;
// 	}else if(pblanc_bgnde.split("-")[0]==getToday.split("-")[0]
// 	&& pblanc_bgnde.split("-")[1]>getToday.split("-")[1]){
// 		alert("접수 기간이 아닙니다.");
// 		return;
// 	}else if(pblanc_bgnde.split("-")[0]==getToday.split("-")[0]
// 	&& pblanc_bgnde.split("-")[1]==getToday.split("-")[1]
// 	&& pblanc_bgnde.split("-")[2]>getToday.split("-")[2]){
// 		alert("접수 기간이 아닙니다.");
// 		return;
// 	}
	

// 	var pblanc_clos_de = $("#pblanc_clos_de").val();
// 	if (pblanc_clos_de.split("-")[0]<getToday.split("-")[0]) {
// 		alert("접수 기간이 아닙니다.");
// 		return;
// 	}else if(pblanc_clos_de.split("-")[0]==getToday.split("-")[0]
// 	&& pblanc_clos_de.split("-")[1]<getToday.split("-")[1]){
// 		alert("접수 기간이 아닙니다.");
// 		return;
// 	}else if(pblanc_clos_de.split("-")[0]==getToday.split("-")[0]
// 	&& pblanc_clos_de.split("-")[1]==getToday.split("-")[1]
// 	&& pblanc_clos_de.split("-")[2]<getToday.split("-")[2]){
// 		alert("접수 기간이 아닙니다.");
// 		return;
// 	}
	var pblanc_stts_code = $("#pblanc_stts_code").val();
	if (pblanc_stts_code != '1') {
		alert("접수 기간이 아닙니다.");
		return;
	}
	var prjct_sn = $("#prjct_sn").val();
	var pblanc_sn = $("#pblanc_sn").val();
	//프로젝트 참여 여부 확인
	$.ajax({ 
		url : "joinRecruit.do?prjct_sn="+prjct_sn+"&pblanc_sn="+pblanc_sn,
		method : "get",	
		success : function(result){
			
		  if(result == "duplicated"){
	         alert("이미 참여중인 프로젝트입니다.");
	      }else if(result == "apply"){
	         alert("이미 신청한 공고입니다.");
	      }else{
	    	 OpenWindow('applyForm.do?pblanc_sn='+pblanc_sn,'신청',800,700);
	    	 
	      }
		},
	    error:function(error){
	      alert("시스템장애로 가입이 불가합니다.");
	    }
	});
}






</script>

</body>








