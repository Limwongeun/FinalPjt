<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="knowhowList" value="${dataMap.knowhowList }" />
 

<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="<%=request.getContextPath()%>/resources/js/knowhow.js"></script>
	<style>
 		.timeline::before {
		    display : none;
		} 
		.timeline::-webkit-scrollbar,#knh_content::-webkit-scrollbar {
			width: 3px;
		}
		.timeline::-webkit-scrollbar-track,#knh_content::-webkit-scrollbar-track {
			background-color: transparent;
			}
		.timeline::-webkit-scrollbar-thumb,#knh_content::-webkit-scrollbar-thumb {
			border-radius: 3px;
			background-color: gray;
		}
		.timeline::-webkit-scrollbar-button ,#knh_content::-webkit-scrollbar-button{
			width: 0;
			height: 0;
		}
	</style>
</head>
<body>
	<c:if test="${from eq 'remove' }">
		<script>
			alert("삭제되었습니다.");
			location.reload();
		</script>
	</c:if>

	<c:if test="${from eq 'regist'}">
		<script>
			alert("노하우 등록에 성공했습니다.\n노하우 페이지로 이동합니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
	<!-- 다음 페이지 불러올 키 값 저장 -->
	<input type="hidden" id="key" value='<%=session.getAttribute("key")%>'>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1>노하우 게시판</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">

					</ol>
				</div>
			</div>
		</div>
	</section>
    <!-- Main content -->
    <input type="hidden" id="loginUser" value="${loginUser.mber_sn }"> 
	<section class="content">
		<div class="card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width: 600px;">
					<div class="input-group row">
						<select hidden="true" class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go();">
							<option value="10">정렬개수</option>
							<option value="20" ${cri.perPageNum==20 ? 'selected' :''}>20개씩</option>
							<option value="50" ${cri.perPageNum==50 ? 'selected' :''}>50개씩</option>
							<option value="100" ${cri.perPageNum==100 ? 'selected' :''}>100개씩</option>
						</select>
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected' :'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected' :'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected' :'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected' :'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected' :'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected' :'' }>작성자+내용</option>
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected' :'' }>작성자+제목+내용</option>
						</select> 
						<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" style="width: 100px;" />
						<span class="input-group-append" style="margin-right: 2%;" >
							<button class="btn btn-primary" type="button" onclick="list_go(1);" data-card-widget="search">
	        					<i class="fa fa-fw fa-search"></i>
	    					</button>
							<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','노하우등록',800,860);">노하우 등록</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="container-fluid">
			<input type="hidden" id="page" name="page" value="1">
			<input type="hidden" id="endPage" name="endPage" value="${pageMaker.endPage }">
			<div class="row" id="addBottom" style="float: none; margin: 100 auto;">
				<c:forEach items="${dataMap.knowhowList }" var="knowhow">
					<div class="col-md-10" style="float: none; margin: 0 auto;">
						<!-- Box Comment -->
						<div class="card card-widget">
							<div class="card-header">
								<div class="user-block">
									<img class="img-circle" src="<%=request.getContextPath() %>/member/getPictureBySn/${knowhow.mber_sn }">
									<span class="knowhow-title" style="width: 500px; margin-left: 10px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block;">
										${knowhow.knh_title }
									</span>
									<span class="description">${knowhow.knh_regDate }</span>
								</div>
								<!-- /.user-block -->
								<div class="card-tools">
    								<span class="knowhow-nm">작성자 : ${knowhow.mber_ncnm }</span> <br>
									<c:set value="${loginUser.mber_sn }" var="mber_sn" />
									<c:set value="${knowhow.mber_sn }" var="knowhowmber_sn" />

									<c:if test="${mber_sn eq knowhowmber_sn }">
										<button type="button" class="btn btn-primary btn-sm" id="registBtn" onclick="OpenWindow('modifyForm.do?knh_no=${knowhow.knh_no}','노하우 수정',800,740);">수정</button>
										<button type="button" id="removeBtn" class="btn btn-warning btn-sm" onclick="remove_go(${knowhow.knh_no});">삭제</button>
									</c:if>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="row card-body" style="padding-right: 7px; padding-top: 0px; padding-bottom: 0px; height: 400px;">
								<div class="card-body col-md-7">
    								<div id="knh_content" style="height: 320px; overflow: auto; padding-right: 15px;">
										${knowhow.knh_content }
									</div>
<!-- 									<button type="button" class="btn btn-default btn-sm"> -->
<!-- 										<i class="fas fa-share" onclick="share_go()"></i> 공유 -->
<!-- 									</button> -->
									<div class="row" style="padding-top: 10px;">
										<c:if test="${knowhow.likeExist eq 0 }">
											<button type="button" id="likeBtn-${knowhow.knh_no }" class="col-md-2 btn btn-default btn-sm" onclick="like_go(${knowhow.knh_no},${knowhow.knh_likeCnt })">
												<i class="far fa-thumbs-up" ></i><div id="like-${knowhow.knh_no }" style="float:right;"> ${knowhow.knh_likeCnt } 좋아요</div>
											</button>
										</c:if>
										<c:if test="${knowhow.likeExist eq 1 }">
											<button type="button" style="background-color:#8C8C8C;" id="likeBtn-${knowhow.knh_no }" class="col-md-2 btn btn-default btn-sm" onclick="like_go(${knowhow.knh_no},${knowhow.knh_likeCnt })">
												<i class="far fa-thumbs-up" ></i><div id="like-${knowhow.knh_no }" style="float:right;"> ${knowhow.knh_likeCnt } 좋아요</div>
											</button>
										</c:if>
<%-- 										<div class="col-md-6" style="color:#6F6F6F;">&nbsp;&nbsp;&nbsp;${knowhow.knh_likeCnt }명의 사람들이 좋아합니다.</div> --%>
										<div class="col-md-10" style="font-size:medium; color:#6F6F6F; text-align : right;">${knowhow.replyMap.replyNum }개의 댓글이 있습니다.</div>
									</div>
								</div>
								<div class="card-body col-md-5" style="background-color: #F6F6F6; height: 400px; ">
									<div style="border-radius:0.25rem; background-color:#dee2e6;bottom:0;left:45px;margin:0;position:absolute;top:30px;width:4px;height : 300px"></div>
									<div class="timeline" id="repDiv-${knowhow.knh_no }"style="height: 300px; overflow:auto; margin:7px;" >
										<!-- Large modal -->
										<!-- 포이치  -->
										<!-- User image -->
										<div class="time-label" id="repliesDiv-${knowhow.knh_no }" >
											<input type="hidden" class="replyPage" id="replyPage-${knowhow.knh_no }" value="1">
											<input type="hidden" id="replyKnhNo" value="${knowhow.knh_no }">
											<input type="hidden" class="replyEndPage" id="replyEndPage-${knowhow.knh_no }" value="${knowhow.replyMap.replyPageMaker.endPage }">
											<cc:forEach items="${knowhow.replyMap.replyList}" var="replyList">
												<cc:if test="${knowhow.knh_no eq replyList.knh_no }">
													<div class="user-block">
														<img src="<%=request.getContextPath()%>/member/getPictureBySn/${replyList.knowhow_replyer}" class="img-circle img-bordered-sm"/>
													</div>
	
													<div class="timeline-item" id="${replyList.knowhow_reply_no}-scroll">
														<span class="time">
															<c:if test="${empty replyList.updatedate}">
																<i class="far fa-clock"></i>${replyList.regdate}
															</c:if>
															<c:if test="${not empty replyList.updatedate}">
																<i class="far fa-clock"></i>${replyList.updatedate}
															</c:if>
															<c:if test="${loginUser.mber_sn eq replyList.knowhow_replyer }">
																<a class="btn btn-primary btn-xs ${replyList.knowhow_reply_no}-a" id="modifyReplyBtn" data-knowhow_reply_no="${replyList.knowhow_reply_no}" onclick="replyModifyModal_go('${replyList.knowhow_reply_no}','${knowhow.knh_no }');" style="display:${replyList.knowhow_replyer};" data-replyer="${replyList.knowhow_replyer}" data-toggle="modal" data-target="#modifyModal">수정</a>
															</c:if>
														</span>
														<h3 class="timeline-header" style="font-weight: bold;">
															<strong style="display:none;">${replyList.knowhow_reply_no}</strong>
															${replyList.mber_ncnm}
														</h3>
														<div class="timeline-body" id="${replyList.knowhow_reply_no}-replytext">${replyList.knowhow_replytext}</div>
													</div>
													<div style="height: 4px"></div>
												</cc:if>
											</cc:forEach>
											<input type="hidden" id="knhNo"value="${knowhow.knh_no }">
										</div>
										<!-- /.comment-text -->
									</div>
									<form>
										<div class="img-push" style="text-align: center;">
											<input id="replytext-${knowhow.knh_no}" type="text" style="width:250px; border: 1px lightgray solid; "class="form-control-sm"placeholder="댓글을 입력하세요.">
											<button type="button" onclick="repRegist(${loginUser.mber_sn}, ${knowhow.knh_no });" style="vertical-align: top;" class="btn btn-success btn-sm btn-append">등록</button>
										</div>
									</form>
								</div>
							<!-- /.card-comment -->
							</div>
						<!-- card-footer -->
						</div>
					<!-- /.card-footer -->
					</div>
				<!-- /.card -->
				</c:forEach>
			</div>
			<div style="text-align: right;">
				<img onclick="goTop();" style="position:fixed; height:30px; width:30px; bottom:10px; right:15px;" src="<%=request.getContextPath() %>/resources/images/up.png"></img>
			</div>
		</div>
	</section>

	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="display:none;"></h4>
					<input type="hidden" id="modal-knhNo" value="">
					<button type="button" class="close" data-dismiss="modal">&times;</button>        
				</div>
				<div class="modal-body" data-rno>
					<p><input style="text-align: left;" type="text" id="knowhow_reply_content" class="form-control"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn" onclick="replyModify_go();">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<form id="jobForm">
	<input type='hidden' name="page" value="" />
<!-- 	<input type='hidden' name="perPageNum" value=""/> -->
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>



<%@ include file="knowhowReply_js.jsp" %>
	
<%--     <%@ include file="/WEB-INF/views/common/pagination.jsp"%> --%>
<%-- 무한스크롤 function --%> 
<%--     <%@ include file="list_js.js" %> --%>
<%-- <%@ include file="./reply_js.jsp" %> --%>
</body>