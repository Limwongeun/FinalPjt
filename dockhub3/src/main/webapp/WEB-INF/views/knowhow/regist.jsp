<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<head>
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>



<title>노하우 등록</title> 

<body> 
   <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
    		<div class="row mb-2">
    			<div class="col-sm-6">
<!-- 	      			<h1>노하우</h1> -->
	      		</div>	      		
	    	
	       		
<!-- 	       		<div class="col-sm-6"> -->
<!-- 			      <ol class="breadcrumb float-sm-right"> -->
<!-- 			        <li class="breadcrumb-item"><a href="list.do"><i class="fa fa-dashboard"></i>노하우</a></li> -->
<!-- 			        <li class="breadcrumb-item active">글등록</li>		         -->
<!-- 			      </ol> -->
<!-- 		      	</div> -->
	     	</div>	     	
      	</div>
    </section>

    <section class="content container-fluid">
<!-- 		<div class="row"> -->
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
					<div class="card-header">
						<h4>글등록</h4>
					</div><!--end card-header  -->
					<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group">
								<label for="mber_sn">작성자</label> 
								<input type="text" id="mber_ncnm" 
									name="mber_ncnm" class="form-control" value="${loginUser.mber_ncnm }" readonly="readonly">
 								<input type="hidden" id="mber_sn" readonly
									name="mber_sn" class="form-control" value="${loginUser.mber_sn }">
						<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">생성</option>
							 </select>
							</div>
							
							<div class="form-group">
								<label for="knh_title">제 목</label> 
								<input type="text" id="knh_title"
									name='knh_title' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="form-group">
								<label for="knh_content">내 용</label>
								<textarea class="form-control" name="knh_content" id="knh_content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
							</div>
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
					<div class="card-footer">
						<button type="button" class="btn btn-primary" id="registBtn" style="background-color: #215287; border: 1px solid #215287;" onclick="regist_go();">등 록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default" id="cancelBtn" style="border-color: #ddd;" onclick="CloseWindow();">취 소</button>
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
 	<script>   
    	window.onload=function(){
			Summernote_start($('#knh_content'));	
			

		 	$('.fileInput').on('change','input[type="file"]',function(event){
		 		if(this.files[0].size>1024*1024*40){
		 			alert("파일 용량이 40MB를 초과하였습니다.");
		 			this.value="";
		 			$(this).click();		 			
		 			return false;
		 		} 
	    	});
			
			$('div.fileInput').on('click','div.inputRow > button',function(event){
		 		$(this).parent('div.inputRow').remove();
		 	});
		}
    </script>
    
    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
    
    <script>
    	function addFile_go(){
    		//alert("add file btn");
    		
    		// var form=$('<form>');
    		// $('body').append(form)
    		// form.submit();
	
    		if($('input[name="uploadFile"]').length >=5){
    			alert("파일추가는 5개까지만 가능합니다.");
    			return;
    		}
    		
    		
    		var input=$('<input>').attr({"type":"file","name":"uploadFile"})
    			.css("display","inline"); 
    		var div=$('<div>').addClass("inputRow");
    		div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");    		   		
    		$('.fileInput').append(div);
    	}
    
    
    
    	function regist_go(){
    		var files = $('input[name="uploadFile"]');
    		for(var file of files){
    			console.log(file.name+" : "+file.value);
    			if(file.value==""){
    				alert("파일을 선택하세요.");
    				file.focus();
    				file.click();
    				return;
    			}
    		}	
    		
    		if($("input[name='knh_title']").val()==""){ //form.title.value
    			alert("제목은 필수입니다.");
    			$("input[name='knh_title']").focus();
    			return;
    		}
    	
    		console.log(knh_title);
    		console.log(knh_content);
    		console.log(mber_sn);
    		document.registForm.submit();	
    	}
   
    </script>
    
    <script>
function test(obj) {
	var tex = "<p>무엇을 만들 것인가. 게시판은 좋은 시작이 될 수 있습니다.<br/><br/>";
	tex+="꼭 게시판 이어야 할 이유는 없지만, 구인을 하는쪽이나 구직을 하는 입장에서 서로 이해하기 편한 기능일 수 있습니다.<br/>";
	tex+="사실 경력직이 아닌 이상 처음 사회생활을 시작하는데 있어서 뭔가 화려하거나 새로운 기술을 썼다는 것보다는 어느 정도의 기본기를 갖추었는지, 어느 정도 완성도를 가지고 있는지 살펴봅니다.<br/><br/> 그 합일점에서는 복잡한 요구사항을 설명해야 하는 새로운 프로젝트 보다는 게시판이 코드를 검토하는 사람의 입장으로 접근이 좀 더 쉬울 수 있습니다.<br/> <br/>실제로 이력서를 보고, 다른 사람의 코드를 살펴보는 시간은 정말 길어봐야 10분 이상 가지지 않습니다.";
// 	tex+="어떤 게시판을 만들지 요구사항을 조금 상세하게 적습니다.";
// 	tex+="처음 뼈대를 잡아보고 하나씩 추가/변형 시켜 나가보면 됩니다.<br/><br/> 한번에 완벽하게 만들 필요는 없습니다. </p>";
// 	tex += "";
// 	tex += "\n<br> test아아</br>";
// 	tex += "<p> test아아</p>";
// 	tex += "<pre> test아아</pre>";
	if(obj.value==1){
		document.registForm.knh_title.value = "좋은 포트폴리오 만드는 방법";
		$('#knh_content').summernote('code',tex);
		

	}
}
</script>
    
</body>



