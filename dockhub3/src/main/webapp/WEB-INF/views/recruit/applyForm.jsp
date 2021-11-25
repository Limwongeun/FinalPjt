<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="projectList" value="${dataMap.projectList }"/>
<head>
  	<!-- Date Range Picker  -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
  
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
  
</head>

<body>
	 <!-- Main content -->
	<section class="content-header">
<!-- 	  	<div class="container-fluid"> -->
<!-- 	  	</div> -->
	</section>
	 
  <!-- Main content -->
  
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h3 class="card-title p-1">참여 신청</h3>
						<div class ="card-tools">						
						<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">생성</option>
							 </select>
							<button type="button" class="btn btn-primary" id="applyBtn" onclick="apply_go();">제 출</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="apply.do" name="applyForm" enctype="multipart/form-data">
						<input type="hidden" name="pblanc_sn" id="pblanc_sn" value="${recruit.pblanc_sn }">
							<div class="form-group">
								<label for="prjct_sj">공고 프로젝트</label> 
								<input type="hidden" id="prjct_sn" name='prjct_sn' value="${recruit.prjct_sn }">
								<input type="text" class="form-control" id="project" value="${recruit.prjct_sj }" readonly />
	                        </div>
	                        <div>
	                        	<label for="pblanc_sport_role">역할선택</label> 
	                        	<select name="pblanc_sport_role" id="pblanc_sport_role" style="width : 100px; margin-left : 20px">
									<option value="0" selected>DA</option>	
									<option value="1">AA</option>	
									<option value="2">TA</option>	
									<option value="3">UA</option>	
								</select>
	                        </div>
<!-- 	                        <div> -->
<!-- 	                        	<label for="pblanc_apply_meeting_time">면접 가능 시간 </label>  -->
<!-- 								<textarea name="pblanc_apply_meeting_time" id="pblanc_apply_meeting_time" rows="3" cols="64" -->
<!-- 								placeholder="면접 가능 시간을 적어주세요. &#13;&#10;예) 평일 6~8시(화요일 제외), 매주 토요일 4~6시, 월수금 6~8시"></textarea> -->
<!-- 	                        </div> -->
							<div class="form-group">
								<label for="content">자기소개 및 경력</label>
								<textarea class="textarea" name="content" id="content" rows="20" style="display: none;"></textarea>
							</div>

						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
window.onload=function(){
	Summernote_start($('#content'));
}

function apply_go(){
	var form = document.applyForm;
	var meeting = $("#meeting_time").val();
	if(meeting==""){
		alert("면접가능 시간은 필수입니다.");
		return;
	}
 	form.submit();
}

function test(obj) {
	var tex = "<p>안녕하세요. DA 경력 1년 입니다. <br/><br/>";
	tex+="꼭 게시판 이어야 할 이유는 없지만, 구인을 하는쪽이나 구직을 하는 입장에서 서로 이해하기 편한 기능일 수 있습니다.<br/> <br/>처음 시작은 로그인을 하지 않는 공개된 게시판을 만들어 보면 됩니다.";
	tex+="사실 경력직이 아닌 이상 처음 사회생활을 시작하는데 있어서 뭔가 화려하거나 새로운 기술을 썼다는 것보다는 어느 정도의 기본기를 갖추었는지, 어느 정도 완성도를 가지고 있는지 살펴봅니다.<br/><br/> 그 합일점에서는 복잡한 요구사항을 설명해야 하는 새로운 프로젝트 보다는 게시판이 코드를 검토하는 사람의 입장으로 접근이 좀 더 쉬울 수 있습니다.<br/> <br/>실제로 이력서를 보고, 다른 사람의 코드를 살펴보는 시간은 정말 길어봐야 10분 이상 가지지 않습니다.";
	tex+="어떤 게시판을 만들지 요구사항을 조금 상세하게 적습니다.";
	tex+="처음 뼈대를 잡아보고 하나씩 추가/변형 시켜 나가보면 됩니다.<br/><br/> 한번에 완벽하게 만들 필요는 없습니다. </p>";
// 	tex += "";
// 	tex += "\n<br> test아아</br>";
// 	tex += "<p> test아아</p>";
// 	tex += "<pre> test아아</pre>";
	if(obj.value==1){
		
		$('#knh_content').summernote('editor.insertText',tex);
		

	}
}

</script>
  
</body>








