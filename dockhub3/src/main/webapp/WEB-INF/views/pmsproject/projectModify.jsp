<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>프로젝트 정보 수정</title>
</head>

<body>
    <!-- Date Range Picker  -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
    

    <br>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <div class="card-icon">
                    <h3 class="card-title">프로젝트 정보 수정</h3>

                </div>
            </div>
            <div class="card-body">
                <form role="form" class="form-horizontal" action="projectModify.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="prjct_sn" name="prjct_sn" value="${project.prjct_sn }"> 
                    <input type="hidden" id="oldPhoto" name="oldPhoto" value="${project.prjct_photo }">

                    <div class="form-group">
                        <input type="file" id="inputFile" onchange="changePicture_go();" name="prjct_photo" style="display: none" />
                        <div class="col-md-12" style="margin-left: auto;">
                            <div id="pictureView" data-id="${project.prjct_sn}" style="border: 1px solid green; height: 200px; width: 200px; margin: 0 auto;"></div>
                            <div class="input-group input-group-sm" style="width: 25%; margin-left: 36%;">
                                <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
                                <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled value="${project.prjct_photo.split('\\$\\$')[1] }" /> 
                                <input class="form-control" type="hidden" id="uploadPicture" name="uploadPicture" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" style="margin-left: 5%">
                        <label for="prjct_sj" class="col-sm-2 col-form-label">프로젝트 명</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="prjct_sj" name="prjct_sj" value="${project.prjct_sj }" readonly>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-left: 5%">

                        <label for="prjct_cn" class="col-sm-2 col-form-label">프로젝트 설명</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="prjct_cn" name="prjct_cn" rows="3">${project.prjct_cn }</textarea>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-left: 5%">
                        <label for="prjct_endde" class="col-sm-2 col-form-label">프로젝트 마감일</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="prjct_endde" name="prjct_endde" value="${project.prjct_endde }">
                        </div>
                    </div>
                    <div class="form-group row" style="margin-left: 5%">

                        <label for="prjct_actvty_sttus_code" class="col-sm-2 col-form-label">프로젝트 상태</label>
                        <div class="col-sm-8"> 
                           	<c:set value="${project.prjct_othbc_at_code }" var="atCode"/>
                           	<c:set value="${project.prjct_actvty_sttus_code }" var="sttusCode"/>
                        
                            <select name="prjct_actvty_sttus_code" class="form-control" style="font-size: 0.9em;">

                                <option value="0" ${sttusCode == 0 ? "selected" : "" }>비활성</option>
                                <option value="1" ${sttusCode == 1 ? "selected" : "" }>활성</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group row" style="margin-left: 5%">
                        <label for="prjct_othbc_at_code" class="col-sm-2 col-form-label">공개
                            범위</label>
                        <div class="col-sm-8">
                            <select name="prjct_othbc_at_code" class="form-control" style="font-size: 0.9em;">
                                <option value="0" ${atCode == 0 ? "selected" : "" }>비공개</option>
                                <option value="1" ${atCode == 1 ? "selected" : "" }>공개</option>
                            </select>

                        </div>
                    </div>
                </form>
                <div class="col text-center">
                    <button type="button" class="btn btn-primary btn" style="float: inherit;" onclick="modify_go(${member.mber_sn})">저장</button>
                    <button type="button" id="cancelBtn" onclick="history.go(-1);" class="btn btn-default ">취&nbsp;&nbsp;소</button>

                </div>

            </div>
        </div>
    </div>

    <script>
    
    window.onload=function(){
    	ProjectPictureThumb($('#pictureView')[0],'${project.prjct_photo}',
			'<%=request.getContextPath()%>');
		Summernote_start($("#prjct_cn"));

    }  

    function  changePicture_go(){
    	//alert("click picture btn");
    	var picture = $('input#inputFile')[0];
    	
    	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
    	
    	//이미지 확장자 jpg 확인
    	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
    		alert("이미지는 jpg 형식만 가능합니다.");
    		return;
    	} 
    	//이미지 파일 용량 체크
    	if(picture.files[0].size>1024*1024*1){
    		alert("사진 용량은 1MB 이하만 가능합니다.");
    		return;
    	};

    	document.getElementById('inputFileName').value=picture.files[0].name;
    	
    	if (picture.files && picture.files[0]) {
    		 var reader = new FileReader();
    		 
    		 reader.onload = function (e) {
    	        	//이미지 미리보기	        	
    	        	$('div#pictureView')
    	        	.css({'background-image':'url('+e.target.result+')',
    					  'background-position':'center',
    					  'background-size':'cover',
    					  'background-repeat':'no-repeat'
    	        		});
    	        }
    	        
    	       reader.readAsDataURL(picture.files[0]);
    	} 
    	
    	// 이미지 변경 확인
    	$('input[name="uploadPicture"]').val(picture.files[0].name);
    	
    }

    
        function modify_go() {
            var form = $('form[role="form"]');	
                form.submit();
        }


        //날짜 선택
        $(function() {
            $('input[name="prjct_endde"]').daterangepicker({
                //timePicker: true,
                //timePicker24Hour:true,
                singleDatePicker: true,
                //timePickerIncrement :10,
                //autoUpdateInput: false,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'YYYY-MM-DD', // 일시 노출 포맷
                    //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
                    applyLabel: "확인", // 확인 버튼 텍스트
                    cancelLabel: "취소", // 취소 버튼 텍스트
                    daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                }
            });
        });
    </script>
        <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
</body>

</html>