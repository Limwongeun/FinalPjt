<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>회원등록</title>

<body>

	<!-- Content Wrapper. Contains page content -->
<div >
<!--   	 <section class="content-header"> -->
<!-- 	  	<div class="container-fluid"> -->
<!-- 	  		<div class="row md-2"> -->
<!-- 	  			<div class="col-sm-6"> -->
<!-- 	  				<h1>회원가입</h1>  				 -->
<!-- 	  			</div> -->
<!-- 	  		</div> -->
<!-- 	  	</div> -->
<!--   	</section> -->
	<!-- Main content -->
	<section class="content register-page">
		<div class="register-box">
			<div class="login-logo">
    			<a href="<%=request.getContextPath()%>/member/registForm.do"><b>회원가입</b></a>
  			</div>
			<!-- form start -->
			<div class="card">				
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/member/regist.do" method="post">						
						<input type="hidden" name="mber_photo" id="mber_photo"/>
						<div class="input-group mb-3">
						
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;"></div>
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
						
<!-- 						<div class="form-group row"> -->
<!-- 						   <label for="id" class="col-sm-3" style="font-size:0.9em;" > -->
<!-- 						      <span style="color:red;font-weight:bold;">*</span>아이디</label>    -->
<!-- 						  <div class="col-sm-9 input-group input-group-sm"> -->
<!-- 						     <input name="mber_id"  -->
<!-- 						        onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" -->
<!-- 						     type="text" class="form-control" id="id" placeholder="13글자 영문자,숫자 조합"> -->
<!-- 						     <span class="input-group-append-sm">    -->
<!-- 						        <button type="button" onclick="idCheck_go();"  class="btn btn-info btn-sm btn-append">중복확인</button> -->
<!-- 						      </span>                         -->
<!-- 						   </div>                         -->
<!-- 						</div> -->
							
<!-- 						<div class="form-group row"> -->
<!-- 						   <label for="id" class="col-sm-3" style="font-size:0.9em;" > -->
<!-- 						      <span style="color:red;font-weight:bold;">*</span>아이디</label>    -->
<!-- 						  <div class="col-sm-9 input-group input-group-sm"> -->
<!-- 						     <input name="mber_id"  -->
<!-- 						        onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" -->
<!-- 						     type="text" class="form-control" id="id" placeholder="13글자 영문자,숫자 조합"> -->
<!-- 						     <span class="input-group-append-sm">    -->
<!-- 						        <button type="button" onclick="idCheck_go();"  class="btn btn-info btn-sm btn-append">중복확인</button> -->
<!-- 						      </span>                         -->
<!-- 						   </div>                         -->
<!-- 						</div> -->
												
						<div class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">
							  <span style="color:red;font-weight:bold;">*</span>아이디</label>
							<div class="col-sm-9 input-group-sm">
								<input name="mber_id" type="text" class="form-control" id="mber_id" placeholder="DockHub에서 사용할 이메일 입력">
							</div>
						</div>	
						
						<div class="form-group row">
						   <label for="pwd" class="col-sm-3" style="font-size:0.9em;">
						     <span style="color:red;font-weight:bold;">*</span>패스워드</label>
						   <div class="col-sm-9 input-group-sm">                        
						      <input class="form-control" name="mber_password" type="password" id="mber_password"  onchange="check_pw()"
						            placeholder="20글자 영문자,숫자,특수문자 조합" />
						   </div>
						   <span id="check1"></span>
						</div>
						
						<div class="form-group row">
						   <label for="pwd" class="col-sm-3" style="font-size:0.9em;">
						     <span style="color:red;font-weight:bold;">*</span>패스워드 확인</label>
						   <div class="col-sm-9 input-group-sm">                        
						      <input class="form-control" name="mber_password2" type="password" id="mber_password2" onchange="check_pw()" />
						      <span id="check"></span>   
						   </div>
						</div>

						<div class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">
							  <span style="color:red;font-weight:bold;">*</span>이름</label>
							<div class="col-sm-9 input-group-sm">
								<input name="mber_nm" type="text" class="form-control" id="mber_nm" >
							</div>
						</div>	
						
						<div class="form-group row">
						   <label for="email" class="col-sm-3" style="font-size:0.9em;" >
						      <span style="color:red;font-weight:bold;">*</span>닉네임</label>   
						  <div class="col-sm-9 input-group input-group-sm">
						     <input name="mber_ncnm" 
						        onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);"
						     type="text" class="form-control" id="mber_ncnm" placeholder="13글자 영문자,숫자 조합">
						     <span class="input-group-append-sm">   
						        <button type="button" onclick="idCheck_go();"  class="btn btn-info btn-sm btn-append">중복확인</button>
						      </span>                        
						   </div>                        
						</div>





						<div class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">전화번호</label>
							<div class="col-sm-9 input-group-sm">
								<input name="mber_moblphon_no" type="text" class="form-control" id="mber_moblphon_no" >
							</div>
						</div>	
						
						<div id="repo" class="form-group row">
						   <label for="email" class="col-sm-4" style="font-size:0.9em;" >깃허브 등록</label>   
						   <div id="repooo" class="col-sm-5 input-group input-group-sm">
						   </div>
						  <div class="col-sm-3 input-group input-group-sm">
						     <span class="input-group-append-sm">   
						        <button style="float:right;" type="button" id="regGit" class="btn btn-info btn-sm">인증</button>
						      </span>                        
						   </div>                        
						</div>

						<div id="reposito" class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">레퍼지토리</label>
							<div id="repos" class="col-sm-9 input-group-sm">
								<input name="mber_repo" type="text" class="form-control" id="mber_repo" value="">
							</div>
						</div>

						

						<div class="form-group row">
							<label for="authority" class="col-sm-3" style="font-size:0.9em;" >경력</label>
							<div class="col-sm-9">
								<select name="mber_career_code" class="form-control" style="font-size:0.9em;">
									<option value="0">학생</option>
									<option value="1">1~3년</option>
									<option value="2">3~5년</option>
									<option value="3">5년 이상</option>
								</select>
							</div>
						</div>	
						  
						
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="email" class="col-sm-3" style="font-size:0.9em;">생일</label> -->
<!-- 							<div class="col-sm-9 input-group-sm"> -->
<!-- 								<input name="mber_brthdy" type="email" class="form-control" id="mber_brthdy" > -->
<!-- 							</div> -->
<!-- 						</div>		 -->
						
						<div class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">생일</label>
							<div class="col-sm-9 input-group-sm">
<!-- 								<input name="mber_brthdy" type="email" class="form-control" id="mber_brthdy" > -->
								<select name="mber_brthdy">
								  <%for(int i=2021; i>=1900; i--){ %>
								  <option value="<%=i %>"><%=i %></option>
								  <%} %>
								</select>년&nbsp;
								<select name="mber_brthdy">
								  <%for(int i=1; i<=12; i++){ %>
								  <option value="<%=i %>"><%=i %></option>
								  <%} %>
								</select>월&nbsp;
								<select name="mber_brthdy">
								  <%for(int i=1; i<=31; i++){ %>
								  <option value="<%=i %>"><%=i %></option>
								  <%} %>
								</select>일								
								
							</div>
						</div>		
						  
						
						<div class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;"><span style="color:red;font-weight:bold;">*</span>성별</label>
							<div class="col-sm-9 input-group-sm">
<!-- 								<input name="mber_sexdstn" type="email" class="form-control" id="mber_sexdstn" > -->
<!-- 								<input name="남" type="radio" value="남"> -->
<!-- 								<input name="여" type="radio" value="여"> -->
									<input  name="mber_sexdstn" type="radio" value="1" >남자&nbsp;&nbsp;&nbsp;
		 							<input  name="mber_sexdstn" type="radio" value="0">여자
							</div>
						</div>		
																	
						
						 
						<div class="card-footer">
							<div class="row">								
								<div class="col-sm-6">
									
									<button type="button" id="registBtn" onclick="regist_go();return false;" class="btn btn-info">등&nbsp;&nbsp;록</button>
							 	</div>
							 	
							 	<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="history.go(-1);"
										class="btn btn-default float-right">취&nbsp;&nbsp;소</button>
								</div>
								
							
							</div>
						</div>
					</form>					
				</div><!-- register-card-body -->
			</div>
		</div>
	</section>		<!-- /.content -->
</div>
<!-- /.content-wrapper -->
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



<form role="imageForm" action="member/picture" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();"
			style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>


<jsp:include page="./js/regist_js.jsp" />
</body>
