<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.like-wrap {
	margin-bottom: 10px;
}

.mark-wrap {
	margin-bottom: 10px;
}

.like-wrap .likeIcon {
	color: #10316b;
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.mark-wrap .markIcon {
	color: #10316b;
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.like-wrap:hover .likeIcon {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}

.mark-wrap:hover .markIcon {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}
</style>

</head>
<body>

	<script>
function likePrj(data){
	var prjct_sn = $("#prjct_sn").val();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/pmsproject/likePrjct?prjct_sn="+prjct_sn+"&likeNum="+data,
		type:"post",
		success : function(res){
			$(".like-wrap").empty();
			$(".likeCnt").empty();
			if (data == 1) {
				$(".like-wrap").append("<a class='iconLike' href='javascript:likePrj(0)'><i class='likeIcon far fa-heart fa-3x'></i></a>")
			}else if (data == 0) {
				$(".like-wrap").append("<a class='iconLike' href='javascript:likePrj(1)'><i class='likeIcon fas fa-heart fa-3x'></i></a>")
			}
			$(".likeCnt").append("<button type='button' class='btn btn-block btn-secondary btn-sm' style='background-color : #10316b;'>좋아요 "+res+"개</button>")
		},
		error : function(){
			alert("좋아요 실패");
		}
	});
};
function markPrj(data){
	var prjct_sn = $("#prjct_sn").val();
	$.ajax({
		url:"<%=request.getContextPath()%>/pmsproject/markPrjct?prjct_sn="
								+ prjct_sn + "&likeNum=" + data,
						type : "post",
						success : function(res) {
							$(".mark-wrap").empty();
							$(".markCnt").empty();
							if (data == 1) {
								$(".mark-wrap")
										.append(
												"<a class='iconMark' href='javascript:markPrj(0)'><i class='markIcon far fa-bookmark fa-3x'></i></a>")
							} else if (data == 0) {
								$(".mark-wrap")
										.append(
												"<a class='iconMark' href='javascript:markPrj(1)'><i class='markIcon fas fa-bookmark fa-3x'></i></a>")
							}
							$(".markCnt")
									.append(
											"<button type='button' class='btn btn-block btn-secondary btn-sm' style='background-color : #10316b;'>북마크 "
													+ res + "개</button>");
						},
						error : function() {
							alert("좋아요 실패");
						}
					});
		};

		anychart.onDocumentReady(function() {

			anychart.theme('lightBlue');
			// create pie chart with passed data
			var chart = anychart.pie([ [ '종료', $("#eee").val() ],
					[ '지연', $("#ddd").val() ], [ '진행', $("#ppp").val() ],
					[ '대기', $("#www").val() ] ]);

			// set chart title text settings
			chart.title('단위업무')
			// set chart radius
			.radius('43%')
			// create empty area in pie chart
			.innerRadius('30%');

			// set container id for the chart
			chart.container('container');
			// initiate chart drawing
			chart.draw();

			var chart2 = anychart.pie([ [ 'CLOSE', $("#ccc").val() ],
					[ 'OPEN', $("#ooo").val() ] ]);

			// set chart title text settings
			chart2.title('이슈')
			// set chart radius
			.radius('43%')
			// create empty area in pie chart
			.innerRadius('30%');

			// set container id for the chart
			chart2.container('container2');
			// initiate chart drawing
			chart2.draw();

		});
	</script>
	<%-- <c:forEach var="status" items="${dutyStatus }"> --%>
	<%-- 	<c:if test=${status = 종료}> --%>

	<%-- 	</c:if> --%>
	<%-- 	<c:if test=${status = 지연}> --%>

	<%-- 	</c:if> --%>
	<%-- 	<c:if test=${status = 진행}> --%>

	<%-- 	</c:if> --%>
	<%-- 	<c:if test=${status = 대기}> --%>

	<%-- 	</c:if> --%>
	<%-- </c:forEach> --%>

	<input type="hidden" id="eee" value="${eee }">
	<input type="hidden" id="ddd" value="${ddd }">
	<input type="hidden" id="ppp" value="${ppp }">
	<input type="hidden" id="www" value="${www }">
	<input type="hidden" id="ooo" value="${ooo }">
	<input type="hidden" id="ccc" value="${ccc }">



	<input type="hidden" id="prjct_sn" value="${project.prjct_sn }">
	<!-- Main content -->
	<section class="content-header">
		<div class="row">
			<div class="col-sm-4" style="text-align: center">

				<h3>${project.prjct_sj }</h3>

			</div>
			<div class="col-sm-8">
				<h3 class="float-sm-right"></h3>
			</div>
		</div>
	</section>


	<section class="content">
		<div class="container-fluid">

			<div class="row">
				<div class="col-sm-4">
					<div class="card-body" style="height: 130px;">
						<div class="row">

							<div class="col-sm-6 like-wrap" style="text-align: center;">
								<c:if test="${likeprjct eq 0 }">
									<a class="iconLike" href="javascript:likePrj(0)"><i
										class="likeIcon far fa-heart fa-3x"></i></a>
								</c:if>
								<c:if test="${likeprjct eq 1 }">
									<a class="iconLike" href="javascript:likePrj(1)"><i
										class="likeIcon fas fa-heart fa-3x"></i></a>
								</c:if>

							</div>


							<div class="col-sm-6 mark-wrap" style="text-align: center;">
								<c:if test="${markprjct eq 0 }">
									<a class="iconMark" href="javascript:markPrj(0)"><i
										class="markIcon far fa-bookmark fa-3x"></i></a>
								</c:if>
								<c:if test="${markprjct eq 1 }">
									<a class="iconMark" href="javascript:markPrj(1)">
									<i class="markIcon fas fa-bookmark fa-3x"></i></a>
								</c:if>
							</div>
						</div>
						<div class="row">

							<div class="col-sm-6 likeCnt">
								<button type="button" class="btn btn-block btn-secondary btn-sm"
									style="background-color: #10316b;">좋아요
									${project.prjctr_like_co }개</button>
							</div>


							<div class="col-sm-6 markCnt">
								<button type="button" class="btn btn-block btn-secondary btn-sm"
									style="background-color: #10316b;">북마크
									${project.prjct_scrap_co }개</button>
							</div>
						</div>

					</div>
					<div class="card-body" style="height: 150px;">
						<table class="table table-sm">
							<thead>
								<tr>
									<th style="padding-bottom: 10px" colspan='3'>
										<h3 class="card-title">프로젝트 정보</h3>
										<div class="card-tools" style="float: right">
											<a href="#" class="btn btn-tool btn-sm"> 
												<i class="far fa-plus-square fa-lg"></i>
											</a>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 94px; text-align: center">시작일</td>
									<td style="width: 94px; text-align: center">종료일</td>
								</tr>
								<tr>
									<td style="text-align: center">${project.prjct_bgnde }</td>
									<td style="text-align: center">${project.prjct_endde }</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="card-body" style="height: 100px">
						<table class="table table-sm">
							<thead>
								<tr>
									<th style="padding-bottom: 10px" colspan='3'><h3
											class="card-title">프로젝트 전체 진척도</h3>
										<div class="card-tools" style="float: right">
											<a href="#" class="btn btn-tool btn-sm"> <i
												class="far fa-plus-square fa-lg"></i>
											</a>
										</div></th>
								</tr>
							</thead>
							<tbody>


								<tr>

									<td style="width: 55px;">

										<div style="text-align: center; font-size: 20px">
											${(projectPro.issuePro+projectPro.dutyPro)/2 }%</div>
									</td>
									<td>

										<div class="progress progress-m" style="margin: 5px;">
											<div class="progress-bar progress-bar-danger"
												style="width: ${(projectPro.issuePro+projectPro.dutyPro)/2 }%; background-color: #116592!important;"></div>
										</div>
									</td>
								</tr>


							</tbody>
						</table>




					</div>
				</div>

				<div class="col-sm-8">
					<div class="card-body"style="border: 1px solid lightgrey; height: 380px; padding: 5px; padding-left: 40px; padding-right: 40px">
						<div class="row" style="height: 100%;">
							<div class="col-sm-6" id="container"></div>
							<div class="col-sm-6" id="container2"></div>
						</div>
					</div>
				</div>

			</div>
			<div class="row" style="margin-top: 50px;">
				<div class="col-sm-12">
					<div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;">
						<div class="card-header">
							<h3 class="card-title">구성원 및 개인 진척도</h3>

							<div class="card-tools" style="float: right">
								<a href="#" class="btn btn-tool btn-sm"> <i
									class="far fa-plus-square fa-lg"></i>
								</a>
							</div>
							<!-- /.card-tools -->
						</div>
						<!-- /.card-header -->
						<div class="card-body" style="padding-top: 10px;">
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th style="width: 135px; text-align: center">닉네임</th>
											<th style="width: 105px; text-align: center">이름</th>
											<th style="width: 105px; text-align: center">역할</th>
											<th style="width: 105px; text-align: center">담당업무</th>
											<th style="width: 55px; text-align: center"></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList }" varStatus="status">

											<tr
												onclick="OpenWindow('<%=request.getContextPath() %>/pmsproject/projectProfile.do?prjct_sn=${project.prjct_sn  }&mber_sn=${user.mber_sn }','상세보기',450,590);">
												<td style="vertical-align: middle; text-align: center">${user.mber_ncnm }</td>
												<td style="vertical-align: middle; text-align: center">${user.mber_nm }</td>
												<td style="vertical-align: middle; text-align: center">${user.role_nm }</td>
												<td>
													<div>단위업무</div>
													<div>이슈</div>
												</td>
												<td>
													<div style="text-align: center">${user.proDuty }/${user.allDuty }
													</div>
													<div style="text-align: center">${user.proIssue }/${user.allIssue }
													</div>
												</td>
												<td>
													<div class="progress progress-m" style="margin: 5px;">
														<c:choose>
															<c:when test="${user.allDuty eq 0 }">

																<div class="progress-bar progress-bar-danger"
																	style="width: 0%; background-color: #116592!important; "></div>
															</c:when>
															<c:otherwise>
																<div class="progress-bar progress-bar-danger"
																	style="width: ${user.proDuty/user.allDuty*100 }%; background-color: #116592!important;"></div>

															</c:otherwise>
														</c:choose>

													</div>
													<div class="progress progress-m" style="margin: 5px;">
														<c:choose>
															<c:when test="${user.allIssue eq 0 }">

																<div class="progress-bar progress-bar-danger"
																	style="width: 0%; background-color: #116592!important;"></div>
															</c:when>
															<c:otherwise>
																<div class="progress-bar progress-bar-danger"
																	style="width: ${user.proIssue/user.allIssue*100 }%; background-color: #116592!important;"></div>
															</c:otherwise>
														</c:choose>

													</div>
												</td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
			</div>
		</div>
	</section>

</body>





