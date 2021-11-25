<%@page import="kr.or.ddit.dto.KnowhowVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
function loadNextList(){
	console.log("key : " + key);
	
}
// function scrollTest(knh_no){
// 	var repPage = $("#replyPage-"+knh_no).val()
// 	var repEndPage = $("#replyEndPage-"+knh_no).val()
// 	var scTop = $(this).scrollTop()
	
// 	if(repPage < repEndPage){
// 		console.log("ㅎㅎ")
// 		console.log(scTop)
// 	}
// }

// 댓글 무한 스크롤(div영역)
// window.onload = function(){
// window.onresize = function(){

	$(".timeline").scroll(function(){
		if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight){
			console.log("스크롤 값 : " + $(this).scrollTop())
			// 해당 노하우 게시글 번호
			var knh_no = $(this).find("#replyKnhNo").val()
			// 해당 div 영역의 page 정보
			var rePage = $(this).find(".replyPage").val()
// 			console.log(rePage)
			// 해당 댓글의 마지막 page 정보
			var reEndPage = $(this).find(".replyEndPage").val()
// 			console.log(reEndPage)
			// 현재 페이지가 마지막 페이지보다 작을 경우 불러오기
			if(parseInt(rePage) < parseInt(reEndPage)){
				$.ajax({
					url : "<%=request.getContextPath()%>/knowhowReplies/"+knh_no+"/"+rePage,
					contentType : "json",
					success : function(repData){
// 						console.log(repData)
						var code = addReply(repData);
						rePage = repData.repPage
						$("#replyPage-"+knh_no).attr("value", rePage)
						$("#repliesDiv-"+knh_no).append(code);
					},
					error : function(){
						alert("댓글 정보 받기 실패")
					}
				})
			} else {
				alert("마지막 댓글 페이지입니다.")
			}
		}
	})
// }

function repRegist(mber_sn, knh_no){
	var mber_sn = mber_sn;
	var knh_no = knh_no;
	var knowhow_replytext = $("#replytext-"+knh_no).val();
	var page = 	$("#replyPage-"+knh_no).val();
	console.log("페이지? : " + page)
	console.log("스크롤 값2 :  " + $("#repDiv-"+knh_no).scrollTop() )
	if(!knowhow_replytext){
		alert("내용 입력은 필수입니다.")
		return;
	}
	
	var data={
			"knowhow_replyer" : mber_sn,
			"knh_no" : knh_no,
			"knowhow_replytext" : knowhow_replytext,
			"page" : page
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/knowhowReplies/regist",
		type : "post",
		data : JSON.stringify(data),
		contentType : 'application/json',
		success : function(repData){
// 			console.log(repData)
			var code = registReply(repData, knh_no);
			$("#repliesDiv-"+knh_no).remove();
			$("#repDiv-"+knh_no).append(code);
			$("#replyPage-"+knh_no).attr("value", page)
			$("#replyEndPage-"+knh_no).attr("value", repData.endPage)
			$("#replytext-"+knh_no).val("");
			alert("댓글이 등록 됐습니다.")
		},
		error : function(){
			alert("댓글 등록 실패")
		},
		complete : function(){
			console.log("댓글 등록")
			$("#repDiv-"+knh_no).animate( { scrollTop : 0 }, 0 );
		}
	})
	
}

function replyModifyModal_go(reply_no, knh_no){
	$('div#modifyModal div.modal-body #knowhow_reply_content').val($('div#'+reply_no+'-replytext').text());
	$('div#modifyModal div.modal-header h4.modal-title').text(reply_no);
	$('div#modifyModal div.modal-header input#modal-knhNo').val(knh_no)
}

function replyModify_go(){
	var knowhow_replytext = $('div#modifyModal div.modal-body #knowhow_reply_content').val()
	var reply_no = $('div#modifyModal div.modal-header h4.modal-title').text()
	var knh_no = $('div#modifyModal div.modal-header input#modal-knhNo').val()
	var page = $("#repliesDiv-"+knh_no).find(".replyPage").val()
	
	var modiData = {
		"knowhow_reply_no" : reply_no,
		"knh_no" : knh_no,
		"knowhow_replytext" : knowhow_replytext,
		"page" : page
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/knowhowReplies/modify",
		data : JSON.stringify(modiData),
		type : "PUT",
		contentType : 'application/json',
		success : function(modifyData){
// 			console.log(modifyData)
			var code = registReply(modifyData, knh_no);
			$("#repliesDiv-"+knh_no).remove();
			$("#repDiv-"+knh_no).append(code);
			$("#replyPage-"+knh_no).attr("value", page)
			$("#replyEndPage-"+knh_no).attr("value", modifyData.endPage)
			$("#replytext-"+knh_no).val("");
			alert("댓글이 수정 됐습니다.")
		},
		error : function(){
			alert("수정 실패")
		},
		complete : function(){
			$('#modifyModal').modal('hide');
		}
	})
}

function replyRemove_go(){
	var reply_no = $('div#modifyModal div.modal-header h4.modal-title').text()
	var knh_no = $('div#modifyModal div.modal-header input#modal-knhNo').val()
	var page = $("#repliesDiv-"+knh_no).find(".replyPage").val()
	
	var removeData = {
		"knh_no" : knh_no,
		"knowhow_reply_no" : reply_no,
		"page" : page
	}
	var res = confirm("댓글을 삭제 하시겠습니까?");
	if(res == true){
		$.ajax({
			url : "<%=request.getContextPath()%>/knowhowReplies/remove",
			type : "delete",
			data : JSON.stringify(removeData),
			contentType : 'application/json',
			success : function(remData){
// 				console.log(remData)
				var code = registReply(remData, knh_no);
				$("#repliesDiv-"+knh_no).remove();
				$("#repDiv-"+knh_no).append(code);
				$("#replyPage-"+knh_no).attr("value", page)
				$("#replyEndPage-"+knh_no).attr("value", remData.endPage)
				$("#replytext-"+knh_no).val("");
				alert("댓글이 삭제 되었습니다.")
			},
			error : function(){
				alert("삭제 실패")
			},
			complete : function(){
				$('#modifyModal').modal('hide');
			}
		})
	} else {
		alert("댓글 삭제를 취소하셨습니다.")
	}
	
}

function addReply(replyData){
	var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var mber_sn = $("#loginUser").val();
	var repCode = "";
	$.each(replyData.replyList, function(i, reply){
		repCode += '				<div class="user-block">' 
		repCode += '					<img src="'+contextPath+'/member/getPictureBySn/' + reply.knowhow_replyer + '" class="img-circle img-bordered-sm"/>'
		repCode += '				</div>'
		repCode += '				<div class="timeline-item" id="'+reply.knowhow_reply_no+'-successModify">'
		repCode += '					<span class="time">'
										if(!reply.updatedate){
											repCode += '						<i class="far fa-clock"></i>' + reply.regdate + ''
										} else {
											repCode += '						<i class="far fa-clock"></i>' + reply.updatedate + ''
										}
										if(mber_sn == reply.knowhow_replyer){
		repCode += '						<a class="btn btn-primary btn-xs ' + reply.knowhow_reply_no + '-a" id="modifyReplyBtn" data-knowhow_reply_no="' + reply.knowhow_reply_no + '" onclick="replyModifyModal_go(' + reply.knowhow_reply_no + ','+reply.knh_no+');" style="display:' + reply.knowhow_replyer + ';" data-replyer="' + reply.knowhow_replyer + '" data-toggle="modal" data-target="#modifyModal">수정</a>'
										}
		repCode += '					</span>'
		repCode += '					<h3 class="timeline-header" style="font-weight: bold;">'
		repCode += '						<strong style="display:none;">' + reply.knowhow_reply_no + '</strong>'
		repCode += '						' + reply.mber_ncnm + '' 
		repCode += '					</h3>'
		repCode += '					<div class="timeline-body" id="' + reply.knowhow_reply_no + '-replytext">'+ reply.knowhow_replytext + '</div>'
		repCode += '				</div>'
		repCode += '				<div style="height: 4px"></div>'
	})
	
	return repCode;
}

function registReply(replyData, knhNo){
	var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var mber_sn = $("#loginUser").val();
	var replyCode = "";
	replyCode += '			<div class="time-label" id="repliesDiv-'+ knhNo + '">'
	replyCode += '			<input type="hidden" class="replyPage" id="replyPage-'+knhNo+'" value="1">'
	replyCode += '			<input type="hidden" id="replyKnhNo" value="'+knhNo+'">'
	replyCode += '			<input type="hidden" class="replyEndPage" id="replyEndPage-'+knhNo+'" value="'+replyData.endPage +'">'
	$.each(replyData.replyList, function(i, reply){
		replyCode += '				<div class="user-block">' 
		replyCode += '					<img src="'+contextPath+'/member/getPictureBySn/' + reply.knowhow_replyer + '" class="img-circle img-bordered-sm"/>'
		replyCode += '				</div>'
		replyCode += '				<div class="timeline-item" id="'+reply.knowhow_reply_no+'-successModify">'
		replyCode += '					<span class="time">'
										if(!reply.updatedate){
											replyCode += '						<i class="far fa-clock"></i>' + reply.regdate + ''
										} else {
											replyCode += '						<i class="far fa-clock"></i>' + reply.updatedate + ''
										}
										if(mber_sn == reply.knowhow_replyer){
		replyCode += '						<a class="btn btn-primary btn-xs ' + reply.knowhow_reply_no + '-a" id="modifyReplyBtn" data-knowhow_reply_no="' + reply.knowhow_reply_no + '" onclick="replyModifyModal_go(' + reply.knowhow_reply_no + ',' + knhNo + ');" style="display:' + reply.knowhow_replyer + ';" data-replyer="' + reply.knowhow_replyer + '" data-toggle="modal" data-target="#modifyModal">수정</a>'
										}
		replyCode += '					</span>'
		replyCode += '					<h3 class="timeline-header" style="font-weight: bold;">'
		replyCode += '						<strong style="display:none;">' + reply.knowhow_reply_no + '</strong>'
		replyCode += '						' + reply.mber_ncnm + '' 
		replyCode += '					</h3>'
		replyCode += '					<div class="timeline-body" id="' + reply.knowhow_reply_no + '-replytext">'+ reply.knowhow_replytext + '</div>'
		replyCode += '				</div>'
		replyCode += '				<div style="height: 4px"></div>'
	})
	replyCode += '				<input type="hidden" id="knhNo"value="'+replyData.replyList.knh_no+'">'
	replyCode += '			</div>'
	return replyCode;
}
</script>