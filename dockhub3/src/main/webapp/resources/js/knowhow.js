	
	var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	// 무한스크롤
	// 스크롤 감지 - 전체(맨아래)
	window.addEventListener('scroll', () => {
// 		alert('scroll');
		let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
		let windowHeight = window.innerHeight; // 스크린 창
		let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x
		// 현재 로드 된 페이지 번호
		var page = $("#page").val()
//		console.log(page)
		// 리스트의 마지막 페이지 번호
		var endPage = $(".container-fluid").find('#endPage').val()
		if(scrollLocation + windowHeight >= fullHeight){
			// 현재 페이지가 endPage보다 적을 경우 다음 페이지 로딩
			if(parseInt(page) < parseInt(endPage)){
				console.log("막페 : " + endPage);
				console.log("지금 페 : " + page);
				$.ajax({
					url : page,
					type : "get",
					contentType : "json",
					success : function(data){
//						console.log(data);
						addCode(data);
						$(".container-fluid").find("#page").attr("value", data.page);
//						console.log("불러온 페이지 : " + data.page)
					},
					error : function(){
						alert("실패")
					}
				})
			} else {
				alert("마지막 페이지 입니다.")
			}
		}
	})
	
//		$(".timeline").scroll(function(){
//		console.log("ㅇ")
//		if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight){
//			console.log("스크롤 값 : " + $(this).scrollTop())
//			// 해당 노하우 게시글 번호
//			var knh_no = $(this).find("#replyKnhNo").val()
//			// 해당 div 영역의 page 정보
//			var rePage = $(this).find(".replyPage").val()
//			// 해당 댓글의 마지막 page 정보
//			var reEndPage = $(this).find(".replyEndPage").val()
//// 			console.log(reEndPage)
//			// 현재 페이지가 마지막 페이지보다 작을 경우 불러오기
//			if(parseInt(rePage) < parseInt(reEndPage)){
//				$.ajax({
//					url : contextPath/knh_no/rePage,
//					contentType : "json",
//					success : function(repData){
//// 						console.log(repData)
//						var code = addReply(repData);
//						rePage = repData.repPage
//						$("#replyPage-"+knh_no).attr("value", rePage)
//						$("#repliesDiv-"+knh_no).append(code);
//					},
//					error : function(){
//						alert("댓글 정보 받기 실패")
//					}
//				})
//			} else {
//				alert("마지막 댓글 페이지입니다.")
//			}
//		}
//	})
	
	
	
function addCode(data){
//	console.log(data);
	var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var mber_sn = $("#loginUser").val();
	var code = "";
	var knowhowList = data.knowhowList
	var pageMaker = data.pageMaker
	$.each(data.knowhowList, function (i, knowhowList) {
		var knowhow = knowhowList
		console.log(knowhow.likeExist)
		
		code += '<div class="col-md-10" style="float: none; margin: 0 auto;">'
		code += '	<div class="card card-widget">'
		code += '		<div class="card-header">'
		code += '			<div class="user-block">'
		code += '				<img class="img-circle" src="'+contextPath+'/member/getPictureBySn/' + knowhow.mber_sn + '">'
		code += '				<span class="knowhow-title" style="width: 500px; margin-left: 10px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;">'
		code += '					' + knowhow.knh_title + ''
		code += '				</span>'
		code += '				<span class="description">' + knowhow.knh_regDate + '</span>'
		code += '			</div>'
		code += '			<div class="card-tools">'
		code += '				<span class="knowhow-nm">작성자 : ' + knowhow.mber_ncnm + '</span> <br>'
		var knowhowmber_sn = knowhow.mber_sn
		if(mber_sn == knowhowmber_sn){
			code += '					<button type="button" class="btn btn-primary btn-sm" id="registBtn" onclick="OpenWindow(`modifyForm.do?knh_no='+ knowhow.knh_no + '`,`노하우 수정`,800,740);">수정</button>'
			code += '					<button type="button" id="removeBtn" class="btn btn-warning btn-sm" onclick="remove_go(' + knowhow.knh_no + ');">삭제</button>'
		}
		code += '			</div>'
		code += '		</div>'
		code += '		<div class="row card-body" style="padding-right: 7px; padding-top: 0px; padding-bottom: 0px; height: 400px;">'
		code += '			<div class="card-body col-md-7">'
		code += '				<div id="knh_content" style="height: 320px; overflow: auto; padding-right: 15px;">'
		code += '					'+ knowhow.knh_content + ''
		code += '				</div>'
		code += '				<div class="row" style="padding-top: 10px;">'
								if(knowhow.likeExist == 0){
		code += '					<button type="button" id="likeBtn-'+knowhow.knh_no+'" class="col-md-2 btn btn-default btn-sm" onclick="like_go('+knowhow.knh_no+','+knowhow.knh_likeCnt+')">'
		code += '						<i class="far fa-thumbs-up"></i><div id="like-'+knowhow.knh_no+'" style="float:right;"> '+knowhow.knh_likeCnt+' 좋아요</div>'
		code += '					</button>'
								}else{
		code += '					<button type="button" style="background-color:#8C8C8C;" id="likeBtn-'+knowhow.knh_no+'" class="col-md-2 btn btn-default btn-sm" onclick="like_go('+knowhow.knh_no+','+knowhow.knh_likeCnt+')">'
		code += '						<i class="far fa-thumbs-up"></i><div id="like-'+knowhow.knh_no+'" style="float:right;"> '+knowhow.knh_likeCnt+' 좋아요</div>'
		code += '					</button>'
								}
		if(knowhow.replyMap){
			code += '				<div class="col-md-10" style="font-size:medium; color:#6F6F6F; text-align : right;">'+knowhow.replyMap.replyNum+'개의 댓글이 있습니다.</div>'
		}
		code += '				</div>'
		code += '			</div>'
		code += '			<div class="card-body col-md-5" style="background-color: #F6F6F6; height: 400px; ">'
		code += '				<div style="border-radius:0.25rem; background-color:#dee2e6;bottom:0;left:45px;margin:0;position:absolute;top:30px;width:4px;height : 300px"></div>'
		code += '				<div class="timeline" id="repDiv-'+knowhow.knh_no+'" style="height: 300px; overflow:auto; margin:7px;" >'
		code += '					<div class="time-label" id="repliesDiv-' + knowhow.knh_no + '" >'
		code += '					<input type="hidden" class="replyPage" id="replyPage-'+knowhow.knh_no+'" value="1">'
		code += '					<input type="hidden" id="replyKnhNo" value=' + knowhow.knh_no + '>'
		if(knowhow.replyMap){
			code += '					<input type="hidden" class="replyEndPage" id="replyEndPage-' + knowhow.knh_no + '" value="' + knowhow.replyMap.replyPageMaker.endPage + '">'
		} else {
			code += '					<input type="hidden" class="replyEndPage" id="replyEndPage-' + knowhow.knh_no + '" value="">'
		}
		
			if(knowhow.replyMap){
//				console.log(knowhow)
				var reply_list = knowhow.replyMap.replyList;
//				console.log(reply_list)
				$.each(reply_list, function (i, replyList) {
					var err2 = replyList.knowhow_reply_no
					if(knowhow.knh_no == replyList.knh_no){
						code += '								<div class="user-block">'
						code += '									<img src="'+contextPath+'/member/getPictureBySn/' + replyList.knowhow_replyer + '" class="img-circle img-bordered-sm"/>'
						code += '								</div>'
						code += '								<div class="timeline-item" id="'+replyList.knowhow_reply_no+'-successModify">'
						code += '									<span class="time">'
						code += '										<i class="far fa-clock"></i>' + replyList.regdate + ''	
																	if(mber_sn == replyList.knowhow_replyer){
						code += '										<a class="btn btn-primary btn-xs ' + replyList.knowhow_reply_no + '-a" id="modifyReplyBtn" data-knowhow_reply_no="' + replyList.knowhow_reply_no + '" onclick="replyModifyModal_go(' + err2 + ','+replyList.knh_no+');" style="display:'+replyList.knowhow_replyer+';" data-replyer="'+replyList.knowhow_replyer+'" data-toggle="modal" data-target="#modifyModal">수정</a>'
																	}
						code += '									</span>'
						code += '									<h3 class="timeline-header" style="font-weight: bold;">'
						code += '										<strong style="display:none;">' + replyList.knowhow_reply_no + '</strong>'
						code += '										' + replyList.mber_ncnm + ''
						code += '									</h3>'
						code += '					<div class="timeline-body" id="' + replyList.knowhow_reply_no + '-replytext">'+ replyList.knowhow_replytext + '</div>'
						code += '								</div>'
						code += '								<div style="height: 4px"></div>'
					}
				})
			}
		code += '						<input type="hidden" id="knhNo"value="' + knowhow.knh_no + '">'
		code += '					</div>'
		code += '				</div>'
		code += '				<form>'
		code += '					<div class="img-push" style="text-align: center;">'
		code += '						<input id="replytext-'+knowhow.knh_no+'" type="text" style="width:250px; border: 1px lightgray solid; "class="form-control-sm"placeholder="댓글을 입력하세요.">'
		code += '						<button onclick="repRegist('+mber_sn+', '+knowhow.knh_no+');" style="vertical-align: top;" class="btn btn-success btn-sm btn-append">등록</button>'
		code += '					</div>'
		code += '				</form>'
		code += '			</div>'
		code += '		</div>'
		code += '	</div>'
		code += '</div>'
	})
//		document.getElementById('addBottom').append(code);
 		$('#addBottom').append(code);
// 		alert("성공")
}
	


	
	
	function goTop(){
		var page = $(".container-fluid").find("#page").val()
//		console.log(page)
		$("html, body").animate({ scrollTop: 0 }, "fase");
		return false;
	}
	
	function like_go(knh_no,likeCnt) {
		var mber_sn = $("#loginUser").val()
		
	    $.ajax({
	    	url : contextPath+"/knowhow/like?knh_no="+knh_no+"&mber_sn="+mber_sn+"&likeCnt="+likeCnt,
	    	success : function(res){
	    		if(res > likeCnt){
	    			$("#likeBtn-"+knh_no).attr("style","background-color:#8C8C8C;")
	    			$("#likeBtn-"+knh_no).attr("onclick","like_go("+knh_no+","+res+")")
	    			$("#likeBtn-"+knh_no).find("#like-"+knh_no).text(res+" 좋아요")
	    		} else {
	    			$("#likeBtn-"+knh_no).attr("style","background-color:#F6F6F6;")
	    			$("#likeBtn-"+knh_no).attr("onclick","like_go("+knh_no+","+res+")")
	    			$("#likeBtn-"+knh_no).find("#like-"+knh_no).text(res+" 좋아요")
	    		}
	    	},
	    	error : function(){
	    		alert("실패")
	    	}
	    })
	}


     var formObj = "";
     window.onload = function() {
         formObj = $("form[role='form']");
         
         
     }

     function modify_go() {
         //alert("click modify btn");
         formObj.attr('action', 'modifyForm.do').submit();
     }

     function remove_go(no) {
         //alert("click remove btn");
         var answer = confirm("정말 삭제하시겠습니까?");
         if (answer)
             location.href = "remove.do?knh_no=" + no;
         /* formObj.attr({'action':'remove.do',
         					  'method':'post'}).submit(); */
     }
     
 	
		