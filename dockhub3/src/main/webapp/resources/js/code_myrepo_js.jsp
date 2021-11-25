<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
// 프로젝트에 속한 저장소들을 불러오는 함수
var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
function openModal(){
	$('#addGitModal').modal('toggle');
}
function loadRepositoryList() {
	console.log(contextPath)
	$.ajax({
		url: contextPath + '/mypage/repo',
		method: 'get',
		success: function(res) {
// 			alert("성공")
			console.log(res)
			var hasGit = false;
			$.each(res, function(i, v) {
				// git 저장소가 있으면 loadGit 함수를 호출한다.
//				if (v.REPO_TYPE == 'git') {
				if(v.mber_repo){
					gitRepoUrl = v.mber_repo;
					console.log(gitRepoUrl)
					var repoHeader = $('.git').find('.repoInfo').children('a');
					repoHeader.attr('href', 'https://github.com/' + gitRepoUrl);
					repoHeader.attr('onclick', 'window.open(this.href); return false;');
					repoHeader.find('span').text(gitRepoUrl);
					repoHeader.text(gitRepoUrl)
					// Github 연동 취소하는 버튼도 넣어준다.
					$('.git').find('.repoInfo').find('.gitUrl').append('<button id="removeGit" class="btn btn-sm btn-danger" onclick="removeGit()"; style="vertical-align: middle";">연동해제</button>')
					
					loadGit(gitRepoUrl);
					hasGit = true;
				}
			});
			if(!hasGit){
				$('.repoHeader').find('.repoInfo').find('.repoOwner').hide();
				var fileNavHeader = $('.git').find('.fileNavHeader').children('span');
				// 깃 저장소 등록 버튼 만들기
				fileNavHeader.html('<p>연결된 Git 저장소가 없습니다. <button id="regGit" onclick="openModal();" class="btn btn-sm btn-success">등록하기</button>');
			}
		},
		error: function() {
// 				alert("실패")
				var repoOwner = $('.repoHeader').find('.repoInfo').find('.repoOwner')
				console.log(repoOwner)
				$('.repoHeader').find('.repoInfo').find('.repoOwner').hide();
				var fileNavHeader = $('.git').find('.fileNavHeader').children('span');
				// 깃 저장소 등록 버튼 만들기
				fileNavHeader.html('<p>연결된 Git 저장소가 없습니다. <button id="regGit" onclick="openModal();" class="btn btn-sm btn-success">등록하기</button>');
		},
		dataType: 'json'
	})
	
}

//사용 언어에 대해 통계를 내주는 함수
function loadLanguageInfo(gitRepoUrl) {
	$.ajax({
		url: 'https://api.github.com/repos/' + gitRepoUrl + '/languages',
		method: 'get',
		success: function(languages) {
			var keys = Object.keys(languages);
			var langs = [];
			var counts = [];
			var total = 0;
			var otherlangTotal = 0;
			// 주요 언어는 최대 4개까지 표시 할 것.
			var primaryLanCount = (keys.length < 4 ? keys.length : 4);
			for(i=0; i< primaryLanCount ; i++){
				var key = keys[i];
				var value = languages[keys[i]];
				langs.push(key);
				counts.push(value);
				total = total + value;
			}
			// 언어가 4개 이상일 경우에는, 기타 언어들의 값을 합쳐 otherLang으로 표기한다.
			if(keys.length > 4){
				for(i = primaryLanCount; i<keys.length; i++ ){
					var value = languages[keys[i]];
					total = total + value;
					otherlangTotal = otherlangTotal + value;
				}
				langs.push('Others');
				counts.push(otherlangTotal);
			}
			var languageDiv = $('.repoHeader').find('.languageInfo').find('span');
			for(i=0; i<langs.length; i++){
				var lanTag = langs[i] + ' : ' + Math.round(counts[i]/total*1000)/10 +'%<br/>' ; 
				languageDiv.append(lanTag);
			}
		},
		error: function(xhr, error, msg) {
		},
		dataType: 'json',
	});
}

//gitHub 에서 저장소 정보 받아오는 메서드
function getGitRepoInfo(username, reponame){
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
function getGitUserInfo(username) {
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

function gitIdCheck(){
	var gitId = $('#gitId').val();

	// 아이콘 클래스 초기화
	var icon = $('.gitIdArea').find('i');
	icon.removeClass();

	if(gitId.length < 2) return;

	// 해당하는 사용자가 있는지 확인
	var userInfo = getGitUserInfo(gitId);
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
function gitRepoCheck(){
	var gitId = $('#gitId').val();
	var repoName = $('#repoName').val();
	
	// 아이콘 클래스 초기화
	var icon = $('.gitRepoArea').find('i');
	icon.empty();
	
	if(gitId.length < 2 || repoName.length < 2) return;
	
	var repoInfo = getGitRepoInfo(gitId, repoName);
	
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

// 깃 저장소 등록 메서드
function saveGitRepo(){
	
	var gitId = $('#gitId').val();
	var repoName = $('#repoName').val();
	var repo_url = gitId + '/' + repoName;
	
	// 모달을 일단 닫아준다.
	$('#addGitModal').modal('hide');
	
	// 해당 깃 정보로 저장소를 저장한다.
	$.ajax({
		url: contextPath + '/mypage/regist.do',
		method: 'get',
		data : {
			'repo_url' :repo_url 
		},
		success: function(res) {
			if(res == "OK"){
				setTimeout(function(){
					location.reload();
				},30);
				loadRepositoryList()
			} else {
				alert("에러지")
			}
		},
		error: function(xhr, error, msg) {
			console.log(xhr, error, msg)
		},
		dataType: 'text',
		async: false
	});
	
}

function removeGit(){
	$.ajax({
		url: contextPath + '/mypage/remove.do',
		success: function(){
			removeButton();
			var fileNavBody = $('.git').find('.fileNavBody');
			fileNavBody.empty();
			var repoHeader = $('.git').find('.repoInfo').children('a');
			$('.languageInfo').empty();
			repoHeader.empty();
			loadRepositoryList();
			setTimeout(function(){
				location.reload();
			},30);
//			$('.repoHeader').find('.repoInfo').find('.repoOwner').hide();
		},
		error: function(){
			alert("삭제 실패")
		}
	})
	
}

function intoRepo(divEl){
		
		var type = $(divEl).attr('data-type');
//		alert(type)
//		console.log(type)
		var path = $(divEl).attr('data-path');
//		console.log(path)
		if (type == 'dir') {
			loadFilesFromGit(gitRepoUrl, path);
		}else{
//			openFileFromUrl(download_url);
			loadJavaFile(gitRepoUrl, path);
//			console.log(decodeURIComponent(atob(file.content)))
		}
}
function removeButton(){
	$('#removeGit').remove();
}
function codemirror(){
	var readOnlyCodeMirror = CodeMirror.fromTextArea(document.getElementById('codesnippet_readonly'), {
        mode: "javascript",
        scrollbarStyle: null,
        theme: "blackboard",
        lineNumbers: true,
        readOnly: true
    });
	
}
function loadJavaFile(gitRepoUrl, path){
	$.ajax({
		url: 'https://raw.githubusercontent.com/' + gitRepoUrl + '/master' + (path ? '/' + path : ''),
		method: 'get',
		success: function(contents) {
			var fileNavBody = $('.git').find('.fileNavBody');
			fileNavBody.empty();
// 			fileNavBody.append("<xmp style='word-wrap: break-word; white-space: pre-wrap; background-color: #353535; color: white; border: 3px solid gray;'>" + contents + "</xmp>")
			fileNavBody.append('<textarea style="hight:300px;" cols="50" id="codesnippet_readonly">' + contents + '</textarea>')
			codemirror();		
			fileNavBody.find('.CodeMirror').attr('style','font-size:15px; height:610px;');

			// fileNavHeader를 select 한 후, basePath를 보여준다.
			var fileNavHeader = $('.git').find('.fileNavHeader').children('span');
			// 보고 있는 폴더가 basePAth 일 경우에는 해당 요소에서 filename-text 클래스를 제외시켜준다.
			var basePath = $('<a '+ (path? 'class="filename-text"' : '') +' data-type="dir" style="cursor: pointer;" onclick="location.reload();">'+gitRepoUrl+'</a>');
			fileNavHeader.html(basePath);
		
			//	지금 보고있는 경로가 Base 폴더가 아닐 경우에는 뒤로 가기 폴더를 만들어준다.
			if (path) {
				var fileBox = $('#codeTemplates').children('.fileObj').clone();
	
				var filenameElement = fileBox.find('.filename-text');
	//			fileBox.children('.filename').children('i').addClass('icon-folder');
				fileBox.addClass('baseFolder');
	
				parentPath = path.lastIndexOf('/') == -1 ? null : path.substring(0, path.lastIndexOf('/'));
	
				filenameElement.attr('data-type', 'dir');
				filenameElement.attr('data-path', parentPath);
				filenameElement.attr('href', "https://github.com/" + gitRepoUrl + (parentPath ? '/' + parentPath : ''));
	
				fileNavBody.append(fileBox);
				
				// path 가 null 이 아닐 경우에는 현재까지의 경로를 표시
				paths = path.split('/');
				pathLength = paths.length;
				for(i=0; i<pathLength; i++ ){
					var pathTag = $('#codeTemplates').find('.filename-text').clone();
					pathTag.attr('data-type', 'dir');
					pathTagDir='';
					for(j=0; j<=i; j++){
						pathTagDir = pathTagDir + (j==0?'':'/') + paths[j];
					}
					pathTag.attr('data-path', pathTagDir)
					pathTag.attr('style', 'display:inline;')
					pathTag.text(paths[i]);
					fileNavHeader.append(' / ');
					// 경로의 마지막이면 버튼 비활성화
					if(i == pathLength-1){
						pathTag.removeClass('filename-text');
					}
					fileNavHeader.append(pathTag);
				}
			}
		},
		error : function(){
		}
	})
}




// git 저장소가 있을 경우 해당 정보를 화면에 출력해줍니다.
// 초기 git 관련된 화면들을 불러오는 과정입니다.
function loadGit(gitRepoUrl) {
	// 저장소 파일들 불러와 화면에 쏴주기
	loadFilesFromGit(gitRepoUrl, null);
	loadLanguageInfo(gitRepoUrl);
}


// 깃허브에서 파일들 탐색하는 함수
function loadFilesFromGit(gitRepoUrl, path) {
//	alert(gitRepoUrl)
	$.ajax({
		url: 'https://api.github.com/repos/' + gitRepoUrl + '/contents' + (path ? '/' + path + "?ref=master" : ''),
		method: 'get',
		success: function(contents) {
//			alert("성공")
			console.log(contents)
			// fileNav의 Body를 미리 셀렉트 해서 변수로 지정해둔다.
			var fileNavBody = $('.git').find('.fileNavBody');
			fileNavBody.empty();
			//			 각각의 file에 대해 정보를 입력해 파일탐색기에 한개씩 붙여준다.
			folders = [];
			files = [];
			
			$.each(contents, function(i, file) {
				var fileBox = $('#codeTemplates').children('.fileObj').clone();
//				var fileBox = $('#codeTemplates').children('.fileObj').append("<div class='filename-text'></div><div class='filesize-text'></div>")
//				var fileIcon = file.type == 'file' ? 'doc' : 'folder';
				var fileSize = file.size == 0 ? '' : fileSizeConverter(file.size);
//				console.log(fileSize)
				var filenameElement = fileBox.find('.filename-text');
				
				// 렌더링 해줄 요소를 기입한다.
//				filenameElement.attr("style", "display:inline;")
				filenameElement.text(file.name);
				if(file.type=='dir'){
					filenameElement.append('<img src='+ contextPath + '/resources/images/folder.png style="width:20px; height: 20px; float:left; margin-right: 5px;">')
				} else {
					filenameElement.append('<img src='+ contextPath + '/resources/images/document.png style="width:20px; height: 20px; float:left; margin-right: 5px;">')
				}
//				console.log(file.name)
//				fileBox.children('.filename').children('i').addClass('icon-' + fileIcon);
//				fileBox.children('.filesize').children('.filesize-text').attr("style", "display:inline; float:right;");
				fileBox.children('.filesize').children('.filesize-text').text(fileSize);

				// filenameElement에 클릭시 필요한 데이터들을 기입해준다.
				filenameElement.addClass(file.type);
				filenameElement.attr('data-type', file.type);
				filenameElement.attr('data-path', file.path);
				if (file.type == 'file')
					filenameElement.attr('data-download_url', file.download_url);
				// 파일인지 폴더인지에 따라 각각의 배열에 push 한다.
				(file.type == 'file' ? files : folders).push(fileBox);
			})
			
			// fileNavHeader를 select 한 후, basePath를 보여준다.
			var fileNavHeader = $('.git').find('.fileNavHeader').children('span');
			// 보고 있는 폴더가 basePAth 일 경우에는 해당 요소에서 filename-text 클래스를 제외시켜준다.
			var basePath = $('<a '+ (path? 'class="filename-text"' : '') +' data-type="dir" onclick="location.reload(); removeButton();">'+gitRepoUrl+'</a>');
			fileNavHeader.html(basePath);
			
			
			//	지금 보고있는 경로가 Base 폴더가 아닐 경우에는 뒤로 가기 폴더를 만들어준다.
			if (path) {
				var fileBox = $('#codeTemplates').children('.fileObj').clone();

				var filenameElement = fileBox.find('.filename-text');
				filenameElement.text('..');
				filenameElement.append('<img src='+ contextPath + '/resources/images/folder.png style="width:20px; height: 20px; float:left; margin-right: 5px;">')
//				fileBox.children('.filename').children('i').addClass('icon-folder');
				fileBox.addClass('baseFolder');

				parentPath = path.lastIndexOf('/') == -1 ? null : path.substring(0, path.lastIndexOf('/'));

				filenameElement.attr('data-type', 'dir');
				filenameElement.attr('data-path', parentPath);
				filenameElement.attr('href', "https://github.com/" + gitRepoUrl + (parentPath ? '/' + parentPath : ''));

				fileNavBody.append(fileBox);
				
				// path 가 null 이 아닐 경우에는 현재까지의 경로를 표시
				paths = path.split('/');
				pathLength = paths.length;
				for(i=0; i<pathLength; i++ ){
					var pathTag = $('#codeTemplates').find('.filename-text').clone();
					pathTag.attr('data-type', 'dir');
					pathTagDir='';
					for(j=0; j<=i; j++){
						pathTagDir = pathTagDir + (j==0?'':'/') + paths[j];
					}
					pathTag.attr('data-path', pathTagDir)
					pathTag.attr('style', 'display:inline;')
					pathTag.text(paths[i]);
					fileNavHeader.append(' / ');
					// 경로의 마지막이면 버튼 비활성화
					if(i == pathLength-1){
						pathTag.removeClass('filename-text');
					}
					fileNavHeader.append(pathTag);
				}
				
			}
			// 폴더 - 파일 순으로 출력 해 준다. beforeSend : gitBeforeSend,
			fileNavBody.append(folders);
			fileNavBody.append(files);
		},
		error: function(xhr, error, msg) {
			alert("실패했지롱")
		},
		dataType: 'json',
		async: false
	});
}
function fileSizeConverter(bytes, si = true, dp = 1) {
	var thresh = si ? 1000 : 1024;

	if (Math.abs(bytes) < thresh) {
		return bytes + ' Byte';
	}

	var units = si
		? ['KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
		: ['KiB', 'MiB', 'GiB', 'TiB', 'PiB', 'EiB', 'ZiB', 'YiB'];
	var u = -1;
	var r = 10 ** dp;

	do {
		bytes /= thresh;
		++u;
	} while (Math.round(Math.abs(bytes) * r) / r >= thresh && u < units.length - 1);


	return bytes.toFixed(dp) + ' ' + units[u];
}
</script>