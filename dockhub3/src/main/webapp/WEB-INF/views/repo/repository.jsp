<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/codemirror.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/blackboard.css">
<script src="<%=request.getContextPath()%>/resources/js/codemirror.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/javascript.js"></script>



<script>
   window.onload=function(){
	   
      // 페이지 준비되면 모든 저장소 정보를 불러온다.
      loadRepositoryList();
   }
</script>
<input id="prjctSn" type="hidden" value="${prjct_sn }">
<c:set var="plInfo" value="${plInfo }"/>
<section class="content-header">
  	<div class="container-fluid">
  		<div class="row md-2">
  			<div class="col-sm-6">
  				<h1>코드 공유</h1>
  			</div>
  			<div class="col-sm-6" style="text-align:right;">
  				
  				<h4 class="breadcrumb-item active">${project.prjct_sj }</h4>
  			</div>
  		</div>
  	</div>
</section>
<div class="container-fluid">
	<div class="git">
	<!--    <div class="repoInfo"> -->
	<!--       Git Repository : <a></a> -->
	<!--    </div> -->
			<div class="repoHeader">
			<div class="row">
				<div class="repoInfo col-md-9" style="vertical-align: middle;">
					<div class="githubimg" style="display: inline; width: 60px;">
						<img src="<%=request.getContextPath() %>/resources/images/githubLogo.png" style="width: 60px; height: 60px; margin-top: 10px; margin-left: 10px; ">
					</div>
						<h2 style="display: inline; vertical-align: middle;">&nbsp;GitHub Repository : </h2>
						<a style="font-size: 1.7em; vertical-align: middle;"></a>
						<div style="display: inline;" class="gitUrl"></div>
		            <div style="display: inline;"></div>
		            <div class="repoOwner" style="font-size: 1.5em; text-align:center;">Repository 관리자 : [PL] ${plInfo}</div>
						
				</div>
				         
				<div class="languageInfo col-md-3" style="float:right; vertical-align: middle; display: inline;">
					<span style="vertical-align: middle; margin-top: 10px;"></span>
	            </div>
			</div>
		</div> 
		<hr/>
		<div class="fileNavHeader" style="margin-left: 10px;">
	      <span  style="cursor: pointer;"></span>
	   </div><hr/>
	   <div class="fileNavBody">
	   </div>
	   <div id="codeTemplates">
	      <div class="fileObj" style="/*border:1px solid red;*/ margin-left:20px; float:left; width:1000px;">
	         <div class="filename-text" onclick="intoRepo(this);" style="display:inline;  cursor: pointer;">
	            <div class="filename" style="float:left; ">
	               <i></i>
	            </div>
	         </div>
	         <div class="filesize" style="float:right; width:500px;">
	            <div class="filesize-text"></div>
	         </div>
	      </div>
	   </div>
	</div>
</div>
	
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
	      	<button class="btn" onclick="gitIdCheck()">확인</button>
	      	<i></i>
      	</div>
      	<div class="gitRepoArea">
	      	<label for="repoName">저장소 이름</label><br/>
	      	<input id="repoName" type="text">
	      	<button class="btn" onclick="gitRepoCheck()">확인</button>
	      	<i></i>
      	</div>
      </div>
      <div class="modal-footer">
      	<button id="addGitRepoBtn" onclick="saveGitRepo()" class="btn btn-success" disabled>저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" hidden="hidden">Close</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="/resources/js/code_repo_js.jsp" %>