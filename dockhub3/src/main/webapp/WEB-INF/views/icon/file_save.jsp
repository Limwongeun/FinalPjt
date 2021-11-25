<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<!-- <!-- <style> -->
<!-- /*     #my_modal { */ -->
<!-- /*         display: none; */ -->
<!-- /*         width: 500px; */ -->
<!-- /*         height : 300px;  */ -->
<!-- /*         padding: 20px 60px; */ -->
<!-- /*         background-color: #fefefe; */ -->
<!-- /*         border: 1px solid #888; */ -->
<!-- /*         border-radius: 3px; */ -->
<!-- /*     } */ -->

<!-- /*     #my_modal .modal_close_btn { */ -->
<!-- /*         position: absolute; */ -->
<!-- /*         top: 10px; */ -->
<!-- /*         right: 20px; */ -->
<!-- /*     } */ -->
<!-- <!-- </style> -->

</head>
<body>

 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>파일보관함</h1>  				
	  			</div>
	  			<div class="col-sm-6" style="text-align:right;">
	  				<h4 class="breadcrumb-item active">보관함</h4>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 
   	<section class="content">
   	<div class="container-fluid">
 		<div class="row" style="padding : 5px;">
 			<div class="col-sm-3 card card-info">
				
				<div id="tree" style="padding-top: 10px; min-height : 83vh"> </div> 			
		  	
		    </div>
			<div class="col-sm-9">
				<div class="card card-info">					
					<div class="card-body" style="padding: 30px; min-height : 83vh">
					<div class="row">
					<div style="font-size : 1.3em; display : inline">파일 보관함</div><div id="fileName" style="display : inline; font-size : 1.3em"></div>					
					</div>
					<!-- <button id="popup_open_btn">파일업로드</button> -->
					<!-- <input type="button" id='checkall' name='checkall' onClick="fileDownload();" value="다운로드" /> -->
					<div style="padding : 10px; height : 60px;">
					<div style="float : left;">
						<button type="button" class="btn btn-block btn-primary" id='checkall' name='checkall' style="background-color : #10316b; width :110px; border : 0px; margin-right : 10px" onClick="fileDownload();">다운로드</button>
					</div>
					<div style=" width : 120px; float : left;">
						<form id="ajaxForm" method="post" enctype="multipart/form-data">
					   		<button type="button" class="btn btn-block btn-primary" style="background-color : #10316b; width :110px; border : 0px;" onClick="ajaxFileUploadm();">업로드</button>
							
								 <input type="file" name='uploadFile' id='uploadFile' onChange="ajaxFileChangem();" style="display:none; " multiple/><br/>
						<!-- 		단위업무 : <input type='text' name="unit_job_sn" id="unit_job_sn"/><br/> -->
							<input type="hidden" id="nodeId" name="nodeId" value="">
							<input type="hidden" id="parent" name="parent" value="">
						<!-- 	<input type="hidden" id="delete" name="delete" value=""> -->
							<input type="hidden" id="filePage" name="filePage"value="1">
							<%-- <input type="hidden" id="prjct_sn" name="prjct_sn" value="${project.prjct_sn }"> --%>
							<input type="hidden" id="mber_sn" name="mber_sn" value="${mber_sn }">
						</form>
					</div>
					<div style=" float : left;">
						<button type="button" class="btn btn-block btn-primary" id='deleteFile' name='deleteFile' style="background-color : #10316b; width :110px; border : 0px;  margin-right : 10px" onClick="deleteFile1();">삭제하기</button>
					</div>
					</div>
					<div style="margin-left: 400px; margin-top: -60px;">
					<div class="input-group row" style="padding : 10px;">						
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" style="width: 120px";/>
						<span class="input-group-append" >
							<button class="btn btn-primary" type="button"  
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					   		<button type="button" class="btn btn-block btn-primary" style="width :110px; border : 0px; margin-left : 10px" onClick="window.close()">닫기</button>
					</div>											
						
					</div>
					
							<div id="filesDiv">
							</div>
							
							
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0" >
								
							</ul>
						</div>
					</div>
							
				</div>	
		    </div>
 		
 		</div>
 	</div>
   	</section>




<!-- <div id="my_modal"> -->
<%-- 	<form action="<%=request.getContextPath() %>/filesave/regist.do" method="post" enctype="multipart/form-data"> --%>
<!-- 		파일 : <input type="file" name='uploadFile' id='uploadFile' multiple/><br/> -->
<!-- <!-- 		단위업무 : <input type='text' name="unit_job_sn" id="unit_job_sn"/><br/> --> 
<!-- 		<input type="submit" value="전송" /> -->
<!-- 	<input type="hidden" id="nodeId" name="nodeId" value=""> -->
<!-- 	<input type="hidden" id="filePage" name="filePage"value="1"> -->
<%-- 	<input type="hidden" id="prjct_sn" name="prjct_sn" value="${project.prjct_sn }"> --%>
<!-- 	</form> -->
<!--     <a class="modal_close_btn">닫기</a> -->
<!-- </div>> -->

   	
   	
<form role="form">
	<input type="hidden" id="from" value="">
	<%-- <input type="hidden" id="prjct_sn" value="${project.prjct_sn }"> --%>

</form>



<div id="tree">

</div> 


<%@ include file="./file_js.jsp" %>



</body>
