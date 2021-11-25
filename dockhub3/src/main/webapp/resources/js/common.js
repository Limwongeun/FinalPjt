//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}

//팝업창 닫기
function CloseWindow(parentURL){
	
	if(parentURL){
		window.opener.parent.location.href=parentURL;
	}else{
		window.opener.location.reload(true);	
	}
	
	window.close();
}

function list_go7(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;
//	var prjct_sn;
//	if (!$("#prjct_sn").val()) {
//		 prjct_sn = $("#prjct_sn").val();
//		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
//	}
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//	jobForm.find("[name='perPageNum']").val(10);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
function list_go8(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	if(!page) page=1;
//	var prjct_sn;
//	if (!$("#prjct_sn").val()) {
//		 prjct_sn = $("#prjct_sn").val();
//		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
//	}
	
	jobForm.find("[name='page']").val(page);
//	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='perPageNum']").val(10);
	jobForm.find("[name='searchType']").val('t');
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
//	alert(jobForm.find("[name='searchType']").val())
//	alert(jobForm.find("[name='keyword']").val())
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
// 목록 검색
function list_go(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;
//	var prjct_sn;
//	if (!$("#prjct_sn").val()) {
//		 prjct_sn = $("#prjct_sn").val();
//		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
//	}
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//	jobForm.find("[name='perPageNum']").val(10);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}

//목록 검색
//function list_go6(page,url){
//	if(!url) url="searchList.do";
//	
//	var jobForm=$('#jobForm');
//	
//	if(!page) page=1;
////	var prjct_sn;
////	if (!$("#prjct_sn").val()) {
////		 prjct_sn = $("#prjct_sn").val();
////		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
////	}
//	
//	jobForm.find("[name='page']").val(page);
//	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
////	jobForm.find("[name='perPageNum']").val(10);
//	jobForm.find("[name='searchType']").val('t');
//	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
//	
//	jobForm.attr({
//		action:url,
//		method:'get'
//	}).submit();
//	
//}

function listt_go(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;
//	var prjct_sn;
//	if (!$("#prjct_sn").val()) {
//		 prjct_sn = $("#prjct_sn").val();
//		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
//	}
	
	jobForm.find("[name='page']").val(page);
//	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='perPageNum']").val(10);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}

function list_go2(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;
	
	jobForm.find("[name='page']").val(page);
//	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='perPageNum']").val(10);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}

function list_go3(page, url){
	if(!url) url="projectInviteUserList.do";
	
	var jobForm=$('#jobForm');
	var prjct_sn = $("#prjct_sn").val(); 
	if(!page) page=1;
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val(10);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		data : prjct_sn,
		method:'get'
	}).submit();
	
}




//사용자 사진 출력
function MemberPictureThumb(targetObj, fileName,contextPath){ //(대상, 이미지파일명) 
	
	targetObj.style.backgroundImage="url('"+contextPath+"/member/getPicture.do?picture="+fileName+"')";
	targetObj.style.backgroundPosition="center";
	targetObj.style.backgroundRepeat="no-repeat";
	targetObj.style.backgroundSize="cover";
}

//프로젝트 사진 출력
function ProjectPictureThumb(targetObj, fileName,contextPath){ //(대상, 이미지파일명) 
	
	targetObj.style.backgroundImage="url('"+contextPath+"/pmsproject/getPicture.do?picture="+fileName+"')";
	targetObj.style.backgroundPosition="center";
	targetObj.style.backgroundRepeat="no-repeat";
	targetObj.style.backgroundSize="cover";
}
	
//spring_security redirect loginForm
function AjaxErrorSecurityRedirectHandler(status) {
	if (status == "302") {
		alert("세션이 만료되었습니다.\n로그인 하세요.");
		location.reload();

	} else {
		alert("시스템장애로 실행이 불가합니다.");
		history.go(-1);
	}

}




function fn_go(root){
		location.href=root+".do"; 
	}



var List=[];

$(function(){
	
	var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	$.ajax({
		url:contextPath+"/pmsproject/prjctSjList",
		type:"post",
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				List.push(data[i]);
			}
		},
		error : function(){
//			alert("키워드 가져오기를 실패했습니다.");
		}
	});
	$("#searchInput").autocomplete({  //오토 컴플릿트 시작
		source: List,	// source는 List 배열
		focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		delay: 100,	//autocomplete 딜레이 시간(ms)
		//disabled: true, //자동완성 기능 끄기
	});
})
function goSearch(){
	var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var keyword = $("#searchInput").val();
	$("#closeSearch").trigger('click');
	$('iframe[name="ifr"]').attr("src",contextPath+"/search/searchList.do?keyword="+keyword);
}
// 목록 검색
//function searchlist_go(page,url){
//	if(!url) url="search/searchList.do";
//	
//	var jobForm=$('.form-inline');
//	
//	if(!page) page=1;
////	var prjct_sn;
////	if (!$("#prjct_sn").val()) {
////		 prjct_sn = $("#prjct_sn").val();
////		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
////	}
//	jobForm.find("[name='page']").val(page);
////	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//	jobForm.find("[name='perPageNum']").val(10);
//	jobForm.find("[name='searchType']").val('t');
//	jobForm.find("[name='keyword']").val($("#searchInput").val());
//	
//	jobForm.attr({
//		action:url,
//		method:'get'
//	}).submit();
//	
//}
//목록 검색
function list_go5(code,page,url){
//	if(!url) url="list.do";
//	
//	var jobForm=$('#jobForm');
//	
//	if(!page) page=1;
////	var prjct_sn;
////	if (!$("#prjct_sn").val()) {
////		 prjct_sn = $("#prjct_sn").val();
////		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
////	}
//	
//	jobForm.find("[name='page']").val(page);
//	jobForm.find("[name='type_code']").val(code);
////	jobForm.find("[name='perPageNum']").val(10);
//	jobForm.find("[name='searchType']").val('j');
//	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
//	
//	jobForm.attr({
//		action:url,
//		method:'get'
//	}).submit();
	
}
