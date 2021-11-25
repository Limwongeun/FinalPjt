<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="fileList" value="${dataMap.fileList }" />

<head></head>

<title>게시판목록</title>

<body>
<script>
window.onload= function(){
	$("#deleteFile").hide();
	$("#delete").val("");
}
function myfileDownload(){
	$("input[name=checkFile]:checked").each(function(){
		var filesave_sn = $(this).val();
 		alert(filesave_sn); 
		location.href="<%=request.getContextPath() %>/myFile/getFile.do?filesave_sn="+filesave_sn;
	
	});
	$("input[name=checkFile]:checked").prop("checked", false);
}

function byteCalculations(bytes) {
	var bytes = parseInt(bytes);
	var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
	var e = Math.floor(Math.log(bytes)/Math.log(1024));
	if(e == "-Infinity") return "0 "+s[0]; 
	else 
	return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];
}
function deleteFile(){

	$("input[name=checkFile]:checked").each(function(){
		var filesave_sn = $(this).val();
		$.ajax({
			url:"<%=request.getContextPath()%>/filesave/deleteNode?id="+filesave_sn,
			type:"post",
			success : function(){
			
			var page = $("#filePage").val();	
			location.href="<%=request.getContextPath()%>/myFile/list.do";
				
			},
			error : function(){
				alert("파일삭제가 실패했습니다.");
			}
		});
		

	})
	
	$("input[name=checkFile]:checked").prop("checked", false);

}
function checkCr(check){
	
	var arr=[];
	$("input[name=checkFile]:checked").each(function(){
		var filesave_sn = $(this).val();
		arr.push(filesave_sn);		
	});
	
	$.ajax({
	   url : "<%=request.getContextPath()%>/filesave/getCrtr",
	   data : JSON.stringify(arr),
	   type : "post",
	   contentType:"application/json",
	   success : function(data){
	   		if (data == "ok") {
		   		$("#deleteFile").show();						
			}else if(data =="no"){
				$("#deleteFile").hide();				
			}
	   },
	   error : function(error){
		   error.printStackTrace();
		  	
	   	 	//AjaxErrorSecurityRedirectHandler(error.status);
	   }
	}); 
	
}

</script>
	<c:if test="${from eq 'regist'}">
		<script>
			alert("게시판 등록이 성공했습니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>파일보관함</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>파일보관함
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	목록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
    <section class="content">		
		<div class="card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-primary" id="download" onclick="myfileDownload();"style="background-color : #10316b;border : none;">다운로드</button>				
				<button type="button" class="btn btn-primary" id='deleteFile' name='deleteFile' onClick="deleteFile();" style="background-color : #10316b;border : none;">삭제하기</button>				
				<div id="keyword" class="card-tools" style="width:550px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
					  		onchange="list_go();">
					  		<option value="10" >정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  		<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
					  		
					  	</select>						
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'p' ? 'selected':'' }>프로젝트</option>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="list_go(1);" style="background-color : #10316b;"
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body">
				<table class="table table-bordered table-hover">				
					<tr>
						<th style="width : 30px; text-align : center;"></th>
						<th style="width : 60px; text-align : center;">종류</th>
						<th>이름</th>
						<th>프로젝트</th>
						<th style="width : 100px; text-align : center;">크기</th> 
						<th style="width : 200px;">수정일시</th> 
					</tr>			
					<c:if test="${empty fileList }" >
						<tr>
							<td colspan="6">
								<strong>파일이 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${fileList }" var="file" varStatus="st">
					
						<tr style='font-size:0.85em;'>
							<td><input type="checkbox" name="checkFile" class="checkFile" onchange="checkCr(this)"value="${file.filesave_sn}"></td>
							<td style="text-align : center;">
								<c:choose>
									<c:when test ="${file.filesave_ty eq 'png'|| file.filesave_ty eq 'JPG'|| file.filesave_ty eq 'PNG'}">
									<i class="far fa-file-image fa-lg " style="color : dodgerblue"></i>
									
									</c:when>
									<c:when test ="${file.filesave_ty == 'txt' || file.filesave_ty == 'TXT'}">
									<i class="far fa-file-alt fa-lg "></i>
									</c:when>
									<c:when test ="${file.filesave_ty == 'pdf' || file.filesave_ty == 'pdf'}">
									<i class="far fa-file-pdf fa-lg " style="color : crimson"></i>
									</c:when>
									<c:when test ="${file.filesave_ty == 'doc' || file.filesave_ty == 'docx'|| file.filesave_ty == 'DOC' || file.filesave_ty == 'DOCX'||file.filesave_ty =='hwp' || file.filesave_ty == 'HWP'}">
									<i class="far fa-file-word fa-lg" style="color : tomato"></i>
									</c:when>
									<c:when test ="${file.filesave_ty == 'xls' || file.filesave_ty == 'xlsx'|| file.filesave_ty == 'XLS' || file.filesave_ty == 'XLSX'}">
									<i class="far fa-file-excel fa-lg" style="color : olivedrab"></i>
									</c:when>
									<c:when test ="${file.filesave_ty == 'ppt' || file.filesave_ty == 'pptx'|| file.filesave_ty == 'PPT' || file.filesave_ty == 'PPTX'}">
									<i class="far fa-file-powerpoint fa-lg" style="color : chocolate"></i>
									</c:when>
								</c:choose>
							</td>
							<td >${file.filesave_nm}</td>
							<td>${file.prjct_sj}</td>
							<td id='filesize${st.count }'></td>
							<td>${file.filesave_update_time }</td>
							<script>
								$("#filesize${st.count }").html(byteCalculations(${file.filesize }))
							</script>
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>				
			</div>
		</div>
		
    </section>
    <!-- /.content -->

</body>







