<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>

 <body>  
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
<!-- 	  				<h1>수정하기</h1>  				 -->
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
  <!-- Main content -->
    <section class="content container-fluid">
<!-- 		<div class="row"> -->
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header row" style="margin-left: 0px; margin-right: 0px;">
						<h4 class="col-md-8">노하우 수정</h4>
						<div class="col-md-4">
							<div class="float-right">
								<button type="button" class="btn btn-warning" id="modifyBtn" style=" background-color: #84a7d3; border-color: #84a7d3; color: white;"onclick="modify_go();">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default " id="cancelBtn" onclick="CloseWindow();">취 소</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify.do" name="modifyForm">
							<input type="hidden" name="knh_no" value="${knowhow.knh_no }" />
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" name='knh_title' class="form-control" value="${knowhow.knh_title}">
							</div>
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly	name="mber_sn" class="form-control"  value="${knowhow.mber_sn}">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>		
								<textarea class="form-control" name="knh_content" id="content" rows="3"
									placeholder="500자 내외로 작성하세요.">${fn:escapeXml(knowhow.knh_content) }</textarea>						
							</div>
						</form>
					</div><!--end card-body  -->
					
				</div><!-- end card -->			
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
    
    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
     
    <script>
    	window.onload=function(){
    		Summernote_start($("#content"));
    	}
    	
     	
    	function modify_go(){
    		$("form[role='form']").submit();
    	}
    </script>
</body>





