<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
  	<!-- Date Range Picker  -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
  
</head>

<body>
<style>
.userNm:hover{
	background-color : #E0E0E0;
	cursor: pointer;
}
</style>
<!-- 	 Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1></h1>  				
	  			</div>
	  			<div class="col-sm-6">
<!-- 	  				<ol class="breadcrumb float-sm-right"> -->
<!-- 			        <li class="breadcrumb-item"> -->
<!-- 			        	<a href="list.do"> -->
<!-- 				        	<i class="fa fa-dashboard"></i>회의 -->
<!-- 				        </a> -->
<!-- 			        </li> -->
<!-- 			        <li class="breadcrumb-item active"> -->
<!-- 			        	등록  -->
<!-- 			        </li>		         -->
<!-- 	    	  </ol> -->
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="">
				<div class="card card-outline card-info" style="border-top: 3px solid #215287;">
					<div class="card-header">
						<h3 class="card-title p-1">회의등록</h3>
						
						<div class ="card-tools">
							<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">온라인 회의</option>
								<option value="2">화상 회의</option>
							 </select>
							<button type="button" class="btn btn-primary" id="registBtn" style="background-color: #215287; border: 1px solid #215287;" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="meetingRegist.do" name="registForm" id="registForm">
							<div class="form-group">
								<label for="mtg_title">제 목</label> 
								<input type="text" id="mtg_title"
									name="mtg_title" class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<input id="prjct_sn" name="prjct_sn" type="hidden" value="${prjct_sn }">
							<input id="user_sn" name="user_sn"type="hidden" value="${loginUser.mber_sn }">
		
							<div class="form-group">
								<label for="user_sn">주최자</label> 
								<input type="text" id="user_nm" readonly
									name="user_nm" class="form-control" value="${loginUser.mber_ncnm }">
							</div>
							<div class="form-group">
								<label for="mtg_content">내 용</label>
								<textarea class="textarea" name="mtg_content" id="mtg_content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
							<div class="form-group">
								<label for="mtg_date">회의시작일시 </label> 
								<input type="datetime-local" id="mtg_date" name='mtg_date' class="form-control">
							</div>	
							<div class="form-group">
								<label for="mtg_type_code">회의 유형 </label> 
								<select name="mtg_type_code" id ="mtg_type_code" class="form-control">
									<option value="0">온라인 채팅 회의</option>
									<option value="1">화상 회의</option>
								</select>						
							</div>	
							<div class="form-group">
								<label for="user">구성원 선택</label> <br/>
								<div style="border : 1px solid lightgrey; padding: 10px; border-radius : 10px">
									<c:forEach items="${userList }" var="user">
										<c:choose>
											<c:when test="${user.user_sn eq loginUserSn }">
												<div class="userNm" style="display:inline-block; width : 230px; height : 30px;z-index=0">
													<input type='checkbox' name='user' checked readonly value='${user.user_sn }' onclick="event.cancelBubble=true; return false" /> ${user.mber_ncnm }
												</div>										
											</c:when>
											<c:otherwise>
												<div class="userNm" style="display:inline-block; width : 230px; height : 30px;z-index=0" onclick="OpenWindow('projectProfile.do?prjct_sn=${prjct_sn }&mber_sn=${user.mber_sn }','상세보기',450,510);">
													<input type='checkbox' name='user'  value='${user.user_sn }' onclick="event.cancelBubble=true"/> ${user.mber_ncnm }
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>	
									<input type="hidden" name="userArr" value=""/>
								</div>					
							</div>	
	
							<%-- <div class="form-group">
								<label for="meeting_user">참 여 인 원</label> 
								<c:forEach var="user" items="${userList }">
								<input type="checkbox" id="meeting_user" name="meeting_user" class="chk" value="${user.user_sn }">
								</c:forEach>
							</div>							 --%>
										
<!-- 							<div class="form-group">								 -->
<!-- 								<div class="card card-outline card-success"> -->
<!-- 									<div class="card-header"> -->
<!-- 										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5> -->
<!-- 										&nbsp;&nbsp;<button class="btn btn-xs btn-primary" -->
<!-- 										onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button> -->
<!-- 									</div>									 -->
<!-- 									<div class="card-footer fileInput"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
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
	Summernote_start($('#mtg_content')); 
}

//날짜 선택
// $(function() {
//   $('input[name="mtg_date"]').daterangepicker({
//     //timePicker: true,
//     //timePicker24Hour:true,
//     singleDatePicker: true,
//     //timePickerIncrement :10,
//     //autoUpdateInput: false,
//     startDate: moment().startOf('hour'),
//     endDate: moment().startOf('hour').add(32, 'hour'),
//     locale: {
//         format: 'YYYY-MM-DD',     // 일시 노출 포맷
//         //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
//         applyLabel: "확인",                    // 확인 버튼 텍스트
//         cancelLabel: "취소",                   // 취소 버튼 텍스트
//         daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
//         monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
//         	]}
//   });
  

// });



function regist_go(){
/* 	var arr = [];
	$('input:checkbox[name=user]:checked').each(function(){
		arr.push(this.value);
	});
	$("userArr").val(arr); */
	var form = document.registForm;
	if(form.mtg_title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	
	form.submit();
}

function test(obj) {
	var tex = "<p>11월 4주차 ";
	if(obj.value==1){
		tex += "정기 온라인 회의 입니다.<br/><br/>";
		tex+="회원 여러분들은 많은 참가 부탁드립니다.<br/><br/></p>";
		document.registForm.mtg_title.value = "11월 4주 정기 온라인 회의";
		$('#mtg_content').summernote('code',tex);
		document.registForm.mtg_type_code.value = 0;

	}
	if(obj.value==2){
		tex += "정기 화상 회의 입니다.<br/><br/>";
		tex+="회원 여러분들은 많은 참가 부탁드립니다.<br/><br/></p>";
		document.registForm.mtg_title.value = "11월 4주 정기  화상 회의";
		$('#mtg_content').summernote('code',tex);
		document.registForm.mtg_type_code.value = 1;
		

	}
}
</script>
  
</body>








