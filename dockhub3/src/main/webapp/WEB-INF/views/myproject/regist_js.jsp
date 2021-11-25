<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
var formData="";
var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
$('body').on('click', '#regGit', function(){
	$('#addGitModal').modal('toggle');
});



function githubIdCheck(){
	var gitId = $('#gitId').val();
	// 아이콘 클래스 초기화
	var icon = $('.gitIdArea').find('i');
	icon.removeClass();
	
	if(gitId.length < 2) return;

	// 해당하는 사용자가 있는지 확인
	var userInfo = getGithubUserInfo(gitId);
	if(userInfo){
		if($('.checkId').length == 0){
			icon.append('<img class="checkId" src='+ contextPath + '/resources/images/checked.png style="width:20px; height: 20px;">');
			
		}
	}else{
		icon.empty();
		icon.append('<img class="checkId" src='+ contextPath + '/resources/images/remove.png style="width:20px; height: 20px;">');
	}
}

// 깃 repo 체크하는 메서드
function githubRepoCheck(){
	var gitId = $('#gitId').val();
	var repoName = $('#repoName').val();
	
	// 아이콘 클래스 초기화
	var icon = $('.gitRepoArea').find('i');
	icon.empty();
	
	if(gitId.length < 2 || repoName.length < 2) return;
	
	var repoInfo = getGithubRepoInfo(gitId, repoName);
	
	if(repoInfo){
		if($('.checkRepo').length == 0){
			icon.append('<img class="checkRepo" src='+ contextPath + '/resources/images/checked.png style="width:20px; height: 20px;">');
		}
		$('#addGitRepoBtn').prop('disabled', false);
	}else{
		icon.empty();
		icon.append('<img class="checkId" src='+ contextPath + '/resources/images/remove.png style="width:20px; height: 20px;">');
	}
}
function getGithubUserInfo(username) {
	var userinfo;
	$.ajax({
		url: 'https://api.github.com/users/' + username,
		method: 'get',
		success: function(res) {
			userinfo = res;
		},
		error: function(xhr, error, msg) {
		},
		dataType: 'json',
		async: false
	});
	return userinfo;
}

function getGithubRepoInfo(username, reponame){
	var repoInfo;
	$.ajax({
		url: 'https://api.github.com/repos/' + username + '/' + reponame,
		method: 'get',
		success: function(res) {
			repoInfo = res;
		},
		error: function(xhr, error, msg) {
		},
		dataType: 'json',
		async: false
	});
	return repoInfo;
}

function saveGithubRepo(){
	
	var gitId = $('#gitId').val();
	var repoName = $('#repoName').val();
	var repo_url = gitId + '/' + repoName;
	// 모달을 일단 닫아준다.
	$('#addGitModal').modal('hide');
	
	// repository값 저장
	var repoo = $('#repo').find('#repooo')
	repoo.text(repo_url);
	var mber_repo = $('#reposito').find('#repos').find('#mber_repo');
	mber_repo.attr("value", repo_url);
}
function picture_go(){
	
	formData = new FormData($('form[role="imageForm"]')[0]);

   var form = $('form[role="imageForm"]');
   var picture = form.find('[name=pictureFile]')[0];
   
   //이미지 확장자 jpg 확인
   var fileFormat=
	      picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
   if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
      alert("이미지는 jpg/jpeg 형식만 가능합니다.");
      picture.value="";      
      return;
   } 
   
   //이미지 파일 용량 체크
   if(picture.files[0].size>1024*1024*1){
      alert("사진 용량은 1MB 이하만 가능합니다.");
      picture.value="";
      return;
   };
   
   
   //업로드 확인변수 초기화 (사진변경)
   form.find('[name="checkUpload"]').val(0);
   
   document.getElementById('inputFileName').value=picture.files[0].name;
   
   if (picture.files && picture.files[0]) {
	      var reader = new FileReader();
	       reader.onload = function (e) {
	           $('div#pictureView')
	              .css({'background-image':'url('+e.target.result+')',
	                 'background-position':'center',
	                 'background-size':'cover',
	                 'background-repeat':'no-repeat'
	                 });
	        }
	      reader.readAsDataURL(picture.files[0]);
	      
	   }

}

function upload_go(){
	//alert("upload btn");
  if($('input[name="pictureFile"]').val()==""){
      alert("사진을 선택하세요.");
      $('input[name="pictureFile"]').click();
      return;
   };   
	   
   
   
   if($('input[name="checkUpload"]').val()==1){
      alert("이미업로드 된 사진입니다.");
      return;      
   }
   
   $.ajax({
	      url:"<%=request.getContextPath()%>/myproject/picture",
	      data:formData,
	      type:'post',
	      processData:false,
	      contentType:false,
	      success:function(data){
	    	  //업로드 확인변수 세팅
	          $('input[name="checkUpload"]').val(1);
	          //저장된 파일명 저장.
	          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
	          $('form[role="form"]  input[name="prjct_photo"]').val(data);	    	  
	    	  alert("사진이 업로드 되었습니다.");
	      },
	      error:function(error){
	          alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	       }
	    });	      
	
}


function regist_go(){
   var uploadCheck = $('input[name="checkUpload"]').val();   
//    if(uploadCheck==0){
//       alert("사진업로드는 필수 입니다");      
//       return;
//    }

	   
   if($('input[name="title"]').val()==""){
      alert("이름은 필수입니다.");
      return;
   }
   
   if($('input[name="startDate"]').val()==""){
	      alert("시작일은 필수입니다.");
	      return;
   }
   if($('input[name="endDate"]').val()==""){
	      alert("종료일은 필수입니다.");
	      return;
   }
   
   var form = $('form[role="form"]');
   form.submit();
}






</script>