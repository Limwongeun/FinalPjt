<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="memberList" value="${memberMap.bestMemberList }"/>
<c:set var="knowhowList" value="${knowhowMap.bestKnowhowList }"/>
<c:set var="projectList" value="${projectMap.bestProjectList }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<style>
</style>
<body>
 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Best Of Dock</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
<section class="content"  style="overflow-x: hidden; overflow-y: hidden;" >



      	 
      <!-- Default box -->
 <div class="card card-solid">
     <div class="card-body pb-0">
        <h5>Best Member</h5>
         <div class="swiper mySwiper">
             <div class="swiper-wrapper">
                 <c:set var="j" value="3" />
                 <div class="swiper-slide">
                     <div class="row">
                         <c:forEach items="${memberList }" var="member" varStatus="status">
                             <c:if test="${status.index%3 == 0 and status.index != 0 }">
                     </div>
                 </div>
                 <div class="swiper-slide">
                     <div class="row">

                         </c:if>


                         <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
                             <div class="card bg-light d-flex flex-fill">
                                 <div class="card-header text-muted border-bottom-0">
                                 </div>
                                 <div class="card-body pt-0">
                                     <div class="">
                                         <div class="col-12 text-center">
                                             <img src="<%=request.getContextPath() %>/member/getPictureBySn/${member.mber_sn}" width="113px" style="max-height: 113px" class="img-circle img-fluid">
                                         </div>
                                         <div class="col-12 text-center">
                                             <h2 class="lead"><b>이름 : ${member.mber_nm }</b></h2>
                                             <c:set var="date" value="${member.best_mber_date }"/>
                                              <c:set var="month" value="${fn:substring(date,5,7) }"/>
                                             
                                             <p class="text-muted text-sm">
                                             ${fn:substring(date,0,4) }년     
	                          	<c:choose>
			                         	<c:when test="${month eq '01'}"> 1분기</c:when>
			                         	<c:when test="${month eq '02'}"> 1분기</c:when>
			                         	<c:when test="${month eq '03'}"> 1분기</c:when>
			                         	<c:when test="${month eq '04'}"> 2분기</c:when>
			                         	<c:when test="${month eq '05'}"> 2분기</c:when>
			                         	<c:when test="${month eq '06'}"> 2분기</c:when>
			                         	<c:when test="${month eq '07'}"> 3분기</c:when>
			                         	<c:when test="${month eq '08'}"> 3분기</c:when>
			                         	<c:when test="${month eq '09'}"> 3분기</c:when>
			                         	<c:when test="${month eq '10'}"> 4분기</c:when>
			                         	<c:when test="${month eq '11'}"> 4분기</c:when>
			                         	<c:when test="${month eq '12'}"> 4분기</c:when>
			                      	</c:choose>
                                             </p>
                                             <p class="text-muted text-sm">완료 프로젝트 : ${member.best_mber_pjtcnt } </p>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         </c:forEach>
                     </div>
                 </div>
             </div>
             <div class="swiper-pagination"></div>
         </div>
     </div>
            <!-- 본체 -->
     
        <div class="card-body pb-0">
           <h5>Best Knowhow</h5>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="row">
                            <c:forEach items="${knowhowList }" var="knowhow" varStatus="status">
                                <c:if test="${status.index%3 == 0 and status.index != 0 }">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="row">
                            </c:if>
                            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
                                <div class="card bg-light d-flex flex-fill">
                                    <div class="card-header text-muted border-bottom-0">
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="">
                                            <div class="col-12 text-center">
                                                <h2 class="lead"><b>제목 : ${knowhow.knh_title }</b></h2>
                                                <c:set var="date2" value="${knowhow.best_knh_date }"/>
                                                <c:set var="day" value="${fn:substring(date2,8,10) }"/>
                                                <p class="text-muted text-sm">
                                                ${fn:substring(date2,0,4) }년  ${fn:substring(date2,5,7) }월 
                                                <c:choose>
                                                	<c:when test="${day eq '01'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '02'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '03'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '04'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '05'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '06'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '07'}"> 1주차	</c:when>
                                                	<c:when test="${day eq '08'}"> 2주차	</c:when>
                                                	<c:when test="${day eq '09'}"> 2주차	</c:when>
                                                	<c:when test="${day eq '10'}"> 2주차	</c:when>
                                                	<c:when test="${day eq '12'}"> 2주차	</c:when>
                                                	<c:when test="${day eq '13'}"> 2주차	</c:when>
                                                	<c:when test="${day eq '14'}"> 2주차	</c:when>
                                                	<c:when test="${day eq '15'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '16'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '17'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '18'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '19'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '20'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '21'}"> 3주차	</c:when>
                                                	<c:when test="${day eq '22'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '23'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '24'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '25'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '26'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '27'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '28'}"> 4주차	</c:when>
                                                	<c:when test="${day eq '29'}"> 5주차	</c:when>
                                                	<c:when test="${day eq '30'}"> 5주차	</c:when>
                                                	<c:when test="${day eq '31'}"> 5주차	</c:when>
                                                </c:choose>
                                                 </p>
                                                <p class="text-muted text-sm">좋아요 수 : ${knowhow.best_knh_likecnt } </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>

            <!-- 본체 -->
        <div class="card-body pb-0">
            	<h5>Best Project</h5>
   	 <div class="swiper mySwiper">
      <div class="swiper-wrapper">
                  	 <div class="swiper-slide">
  	          <div class="row">
              <c:forEach items="${projectList }" var="project" varStatus="status">
                   <c:if test="${status.index%3 == 0 and status.index != 0 }">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="row">
                            </c:if>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
              <div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0">
                </div>
                <div class="card-body pt-0">
                  <div class="">
                    <div class="col-12 text-center">
                      <h2 class="lead"><b>프로젝트 명: ${project.prjct_sj }</b></h2>
                     <c:set var="date3" value="${project.best_pjt_date }"/>
                     
                      <p class="text-muted text-sm"> ${fn:substring(date3,0,4) }년 ${fn:substring(date3,5,7) }월
                       </p>
                      <p class="text-muted text-sm">좋아요 + 북마크 : ${project.best_pjt_cnt }</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           </c:forEach>
            
      	 </div>
      	    	       	 </div>
      	       </div>
      <div class="swiper-pagination"></div>


     </div>
            <!-- 본체 -->
     </div>
  </div>
  
      <!-- /.card -->

    </section>
    
        <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper(".mySwiper", {
        pagination: {
          el: ".swiper-pagination",
        },
      });

    </script>
</body>
</html>