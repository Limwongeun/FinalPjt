/*<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<head>
<!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>

<body>
	 <!-- Main content -->
	<section class="content-header">
<!-- 	  	<div class="container-fluid"> -->
<!-- 	  		<div class="row md-2"> -->
<!-- 	  			<div class="col-sm-6"> -->
<!-- 	  				<h1>프로젝트 등록</h1>  				 -->
<!-- 	  			</div> -->
<!-- 	  			<div class="col-sm-6"> -->
<!-- 	  				<ol class="breadcrumb float-sm-right"> -->
<!-- 			        <li class="breadcrumb-item"> -->
<!-- 			        	<a href="list.do"> -->
<!-- 				        	<i class="fa fa-dashboard"></i>프로젝트 -->
<!-- 				        </a> -->
<!-- 			        </li> -->
<!-- 			        <li class="breadcrumb-item active"> -->
<!-- 			        	등록 -->
<!-- 			        </li>		         -->
<!-- 	    	  </ol> -->
<!-- 	  			</div> -->
<!-- 	  		</div> -->
<!-- 	  	</div> -->
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h3 class="card-title p-1">프로젝트 등록</h3>
						<div class ="card-tools">
							<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">생성</option>
							 </select>
							<button type="button" class="btn btn-primary" id="registBtn" style="background-color: #215287; border: 1px solid #215287;" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
						<input type="hidden" name="prjct_photo" id="prjct_photo"/>
						<div class=" input-group justify-content-center">
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid #215287; height: 200px; width: 140px; margin: 0 auto;"></div>
								<div class="mailbox-attachment-info">
									<div class="input-group input-group-sm">
										<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
										<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
										<span class="input-group-append-sm">											
											<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>											
										</span>
									</div>
								</div>
							</div>
							<br />
						  </div>
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
<!-- 								<label for="writer">작성자</label>  -->
								<input type="hidden" id="writer" readonly
									name="writer" class="form-control" value="${member.mber_nm }">
							</div>
						<div class="row form-group">
							<label for="prjct_job_type_code" class="col-sm-3" style="">프로젝트 유형</label>
							<select name="prjct_job_type_code" id ="prjct_job_type_code" class="form-control" style="font-size:0.9em;width: 97%;margin-left: 8px;">
								<option value="0">오픈소스 프로젝트</option>
								<option value="1">교육 프로젝트</option>
								<option value="2">개인 프로젝트</option>
								<option value="3">작업 프로젝트</option>
							</select>						
						</div>

							<div class="row">
								<div class="col-sm-6 form-group" style=" ">
									<label for="content">시작 일자</label>
									<input name="startDate" id="startDate" type="date" style="margin : 10px;">
								</div>
								<div class="col-sm-6 form-group" style="">
<!-- 								<div class="form-group" style="margin : 10px;margin-left : 80px"> -->
									<label for="content">종료 일자</label>
									<input name="endDate" id="endDate" type="date" style="margin : 10px;margin-right: 0px;">
								</div>
							
							</div>
						<div id="repo" class="form-group row">
						   <label for="email" class="col-sm-3" style="" >깃허브 등록</label>   
							<div class="row col-sm-9" style="margin : 0px">
							
							   <div id="repooo" class="input-group input-group-sm" style="border:1px solid lightgrey;width: 345px;height: 32px;">
							   </div>
							  <div class="input-group-sm" style="padding:0px;margin-left: 4px;">
							     <span class="input-group-append-sm">   
							        <button style="float:right;" type="button" id="regGit" class="btn btn-info btn-sm">인증</button>
							      </span>                        
							   </div>                        
							</div>	
						</div>
						<div id="reposito" class="form-group row" style="display : none">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">레퍼지토리</label>
							<div id="repos" class="col-sm-9 input-group-sm">
								<input name="mber_repo" type="text" class="form-control" id="mber_repo" value="">
							</div>
						</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>


<div class="modal fade" id="addGitModal" tabindex="-1" aria-labelledby="addGitModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="addGitModalLabel">Git 저장소 등록</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="gitAddModal labelmodal modal-body container-fluid">
      	<div class="gitIdArea">
	      	<label for="gitId">Github 아이디</label><br/>
	      	<input id="gitId" type="text">
	      	<button class="btn" onclick="githubIdCheck()">확인</button>
	      	<i></i>
      	</div>
      	<div class="gitRepoArea">
	      	<label for="repoName">저장소 이름</label><br/>
	      	<input id="repoName" type="text">
	      	<button class="btn" onclick="githubRepoCheck()">확인</button>
	      	<i></i>
      	</div>
      </div>
      <div class="modal-footer">
      	<button id="addGitRepoBtn" onclick="saveGithubRepo()" class="btn btn-success" disabled>저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" hidden="hidden">Close</button>
      </div>
    </div>
  </div>
</div>

    

<form role="imageForm" action="myproject/picture" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();"
			style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>
<script>
window.onload=function(){
	Summernote_start($('#content')); 
}

function test(obj) {
	let date_4 = new Date(2021, 10, 26);
	var tex = "사내 포털 시스템 개발을 위한 프로젝트입니다."
	if(obj.value==1){
		document.registForm.title.value = "사내 포털 시스템 개발프로젝트";
		$('#content').summernote('editor.insertText',tex);
		
		  document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
		  document.getElementById('endDate').value = date_4.toISOString().substring(0, 10);

	}
}

</script>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<jsp:include page="./regist_js.jsp" />
</body>

    
    