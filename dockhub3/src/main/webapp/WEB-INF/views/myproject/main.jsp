<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>
<%-- <c:set var="cri" value="${dataMap.pageMaker.cri }" /> --%>
<%-- <c:set var="projectList" value="${dataMap.projectList }" /> --%>
<body>
<style type="text/css">

.swiper-container {
	
	border:2px solid silver;
	border-radius:3px;
	box-shadow:0 0 3px #ccc inset;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}



.img-wrap .markImg {

	-webkit-transform : scale(1);
	-moz-transform : scale(1);
	-ms-transform : scale(1);
	-o-transform : scale(1);
	transform : scale(1);
	-webkit-transition : .3s;
	-moz-transition : .3s;
	-ms-transition : .3s;
	-o-transition : .3s;
	transition : .3s;
	
}

.img-wrap:hover .markImg {

	-webkit-transform : scale(1.2);
	-moz-transform : scale(1.2);
	-ms-transform : scale(1.2);
	-o-transform : scale(1.2);
	transform : scale(1.2);

	
}

.memImg:hover{
	z-index : 2000000; 
	-webkit-transform : scale(1.3);
	-moz-transform : scale(1.3);
	-ms-transform : scale(1.3);
	-o-transform : scale(1.3);
	transform : scale(1.3);
}



</style>

<script>
function fn_go2(prjct_sn){
	window.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M040000&prjct_sn="+prjct_sn;	
}
</script>

 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>프로젝트</h1>  				
	  			</div>
	  			<div class="col-sm-6" style="text-align:right;">
	  
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 
   	<section class="content">
   	<div class="container-fluid">
   		<div class="card">
              <div class="card-header" >
                <h3 class="card-title">
                  
                  초대받은 프로젝트
                </h3>

                
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="padding: 5px">
              <c:choose>
              	<c:when test="${fn:length(inviteList) eq 0 }">
              		<div style="padding : 20px; height : 200px; text-align : center">초대 목록이 없습니다.</div>
              	</c:when>
              	<c:otherwise>
              	           <div class="swiper-container" style="height : 330px">
								<div class="swiper-wrapper">
									<c:forEach var="invite" items="${inviteList }">
										<div class="swiper-slide">
											<div>
												<div style="font-size : 20px; background-color : #EBEBEB">${invite.prjct_sj }</div>
												<c:choose>
													<c:when test="${invite.prjct_photo eq null }">
													
												<img class="img-circle"style="display:block; width : 150px; height : 150px; margin:10px"src="<%=request.getContextPath() %>/resources/images/project.JPG">
												
													</c:when>
													<c:otherwise>
												<img class="img-circle" style="display:block; width : 150px; height : 150px; margin:10px"src="<%=request.getContextPath() %>/myproject/getPicture.do?picture=${invite.prjct_photo }">
													
													</c:otherwise>
												</c:choose>
												<div style="font-size : 20px">역할 : ${invite.role_nm }</div>
												<div class="row">
													<button type="button" onclick="inviteRes(${invite.prjct_invite_sn},'1')" class="btn btn-secondary btn-sm" style="margin : auto;margin-right : 10px;width : 100px; background-color : #10316b;">수락</button>
													<button type="button" onclick="inviteRes(${invite.prjct_invite_sn},'2')" class="btn btn-secondary btn-sm" style="margin : auto;width : 100px;">거절</button>
												</div>
											</div>
											
										</div>
										
									</c:forEach>
							<!-- 		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0820.jpg"></div> -->
									
								</div>
							
								<!-- 네비게이션 -->
								<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
								<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
							
								<!-- 페이징 -->
								<div class="swiper-pagination"></div>
							</div>
							         
              	
              	</c:otherwise>
              </c:choose>
        
              
              
              </div>
              <!-- /.card-body -->

            </div>
            
 		  	<div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;">
              <div class="card-header">
                <h3 class="card-title">참여 프로젝트</h3>

                <div class="card-tools" style="float:right">
                  <button type="button" onclick="OpenWindow('registForm.do','프로젝트등록',800,700);"class="btn btn-secondary btn-sm" style="margin : auto;margin-right : 10px;width : 150px; background-color : #10316b;">
			                  프로젝트 생성
                    <i class="far fa-plus-square fa-lg"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="padding-top: 10px;">
              	<div class="table-responsive p-0" style="">
					<div id="proPrjctList">
				
					</div>

              	</div>
				<div class='text-center'>
					<ul id="proPrjctPagination" class="pagination justify-content-center m-0" >
				
					</ul>
				</div>
              </div>
              <%@ include file="./proPrjctList_js.jsp" %>
              
        <%--       
              
              
               <div class="card-body" style="padding-top: 10px;">
	              <div class="card-body table-responsive p-0">
	                <table class="table table-hover text-nowrap" >
	                  <thead>
	                    <tr>
	                      <th style="width: 50px;text-align : center">NO</th>
	                      <th style="width: 120px;text-align : center">프로젝트</th>
	                      <th style="width: 200px;text-align : center">기간</th>
	                      <th style="width: 105px;text-align : center">진행률</th>
	                      <th style="width: 300px;"></th>
	                      <th style="width: 200px;text-align : center">구성원</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                  <c:choose>
	              	<c:when test="${fn:length(projectList) eq 0 }">
	              	<tr>
	              		<td colspan="6">
		              		<div style="padding : 20px; height : 50px; text-align : center">진행중인 프로젝트가 없습니다.</div>
	              		
	              		</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach var="project" items="${projectList }" varStatus="status">

<tr onclick="fn_go2(${project.prjct_sn});">
	<td style="vertical-align:middle;text-align : center">${status.index+1 }</td>
	<td style="vertical-align:middle;text-align : center">${project.prjct_sj }</td>
	<td style="vertical-align:middle;text-align : center">${project.prjct_bgnde }~${project.prjct_endde }</td>
	<td style="vertical-align:middle;text-align : center; width : 30px">${(project.dutyPro+project.issuePro)/2 }%</td>
	<td style="vertical-align:middle;">
		<div class="progress progress-m" style="margin:5px; ">
		<div class="progress-bar progress-bar-danger" style="background-color : #10316b;width: ${(project.dutyPro+project.issuePro)/2 }%;"></div>
		</div>
	
	</td>
	<td>
		<div style="position : relative;left : 10%">
		
		<c:forEach var ="member" items="${project.memList }" varStatus="mStatus">
		<c:choose>
		<c:when test="${member.mber_photo eq null }">
			
		<img class="img-circle memImg" style="width : 50px;"src="<%=request.getContextPath() %>/resources/images/user.png">					
		</c:when>
		<c:otherwise>
		<img class="img-circle memImg" style="width : 50px; position:absolute; left : ${mStatus.index *15}px" src="<%=request.getContextPath() %>/member/getPicture.do?picture=${member.mber_photo }">
		</c:otherwise>
		</c:choose>
		
		</c:forEach>
		</div>
	
	
	</td>
</tr>
	                  </c:forEach>
	              	</c:otherwise>
	              	</c:choose>
	                  
	                 
	                    
	                   
	                  </tbody>
	                </table>
	              </div>
              </div>  --%>
              <!-- /.card-body -->
<!--              <div class="card-footer"> -->
<%-- 				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>				 --%>
<!-- 			</div> -->
            </div>
            
               		<div class="card">
              <div class="card-header" >
                <h3 class="card-title">
                  
   	북마크한 프로젝트
                </h3>

                
              </div>
              <!-- /.card-header -->
    <div class="card-body" style="padding: 5px">
    <c:choose>
     <c:when test="${fn:length(markList) eq 0 }">
     	<div style="padding : 20px; height : 200px; text-align : center">북마크 목록이 없습니다.</div>
     </c:when>
     <c:otherwise>
    <div class="swiper-container" style="height : 280px">
	<div class="swiper-wrapper">
		
		<c:forEach var="mark" items="${markList }">
			<div class="swiper-slide">
				<div>
					<div style="font-size : 20px; background-color : #EBEBEB">${mark.prjct_sj }</div>
					<div class="img-wrap">
						<c:choose>
							<c:when test="${mark.prjct_photo eq null }">
								<img onclick="fn_go2(${mark.prjct_sn});" class="img-circle markImg"style=" width : 150px; height : 150px; margin:20px"src="<%=request.getContextPath() %>/resources/images/project.JPG">
							</c:when>
							<c:otherwise>
								<img onclick="fn_go2(${mark.prjct_sn});" class="img-circle markImg" style="width : 150px; height : 150px; margin:20px"src="<%=request.getContextPath() %>/myproject/getPicture.do?picture=${mark.prjct_photo }">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
			</div>
			
		</c:forEach>
<!-- 		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0820.jpg"></div> -->
		
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
     </c:otherwise>
     </c:choose>
    
    
    
    

              
              
              
              </div>
              <!-- /.card-body -->

            </div>
 		
 	</div>
   	</section>




<script>

new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

function inviteRes(prjct_invite_sn,prjct_invite_sttus){
	location.href="inviteRes.do?prjct_invite_sn="+prjct_invite_sn+"&prjct_invite_sttus="+prjct_invite_sttus;
}


</script>
</body>