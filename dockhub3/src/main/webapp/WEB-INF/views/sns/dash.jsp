<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="recruitList" value="${dataMap.recruitList2 }" />
<c:set var="knowhowList" value="${dataMap2.knowhowList }" />
<c:set var="recruitList2" value="${dataMap3.recruitList3 }" />
<c:set var="memberList" value="${memberMap.bestMemberList }"/>
<c:set var="bestKnowhowList" value="${knowhowMap.bestKnowhowList }"/>
<c:set var="projectList" value="${projectMap.bestProjectList }"/>

<head>
<style>

.bod {
   width: 33%;
   float: left;
   text-align: center;
   text-decoration: none;
   color: black;
   height: 200px;
}
</style>

</head>
<body style="overflow-x:auto;overflow-y:hidden;">

   <script>
      
   </script>

   <section class="content-header" style="overflow-x: auto; overflow-y: hidden;">
      <div class="card card-outline card-primary" style="width: 100%; margin-right: 8px; float: left;border-top: 3px solid #282c2f;">
         <div class="card-header">
            <h3 class="card-title">Best Of Dock</h3>
            <div class="card-tools" style="float: right"></div>
         </div>

         <div class="card-body" style="padding: 5px; margin-top:13px;">
            <!--                   <div class="bod" onclick="location.href='#';" style="cursor: pointer; border-right:1px solid rgba(0,0,0,.125);">Best Member<br></div> -->



             <div class="row">
                 <!--                   <div class="bod" onclick="location.href='#';" style="cursor: pointer; border-right:1px solid rgba(0,0,0,.125);">Best Member<br></div> -->

                 <c:forEach items="${memberList }" var="member" end="0" varStatus="status">
                     <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
                         <div class="card bg-light d-flex flex-fill">
                             <div class="card-header text-muted border-bottom-0" style="text-align: center;">Best Member
                             </div>
                             <div class="card-body pt-0">
                                 <div class="">
                                     <div class="col-12 text-center">
                                         <img src="<%=request.getContextPath() %>/member/getPictureBySn/${member.mber_sn}" width="85px" style="max-height: 103px; float: left; margin-left: 47px; margin-top: -7px; width: 77px;" class="img-circle img-fluid">
                                     </div>
                                     <div class="col-12 text-center">
                                         <h2 class="lead"><b>${member.mber_nm }</b></h2>
                                             <c:set var="date" value="${member.best_mber_date }"/>
                                             <c:set var="date1" value="${fn:substring(date,5,7) }"/>
                                             
                                             <p class="text-muted text-sm">
                                             ${fn:substring(date,0,4) }년  
                                      <c:choose>
                                     <c:when test="${date1 eq '01'}"> 1분기</c:when>
                                     <c:when test="${date1 eq '02'}"> 1분기</c:when>
                                     <c:when test="${date1 eq '03'}"> 1분기</c:when>
                                     <c:when test="${date1 eq '04'}"> 2분기</c:when>
                                     <c:when test="${date1 eq '05'}"> 2분기</c:when>
                                     <c:when test="${date1 eq '06'}"> 2분기</c:when>
                                     <c:when test="${date1 eq '07'}"> 3분기</c:when>
                                     <c:when test="${date1 eq '08'}"> 3분기</c:when>
                                     <c:when test="${date1 eq '09'}"> 3분기</c:when>
                                     <c:when test="${date1 eq '10'}"> 4분기</c:when>
                                     <c:when test="${date1 eq '11'}"> 4분기</c:when>
                                     <c:when test="${date1 eq '12'}"> 4분기</c:when>
                                  </c:choose>
                                             </p>
                                             <p class="text-muted text-sm">완료 프로젝트 : ${member.best_mber_pjtcnt } </p>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </c:forEach>
                 <c:forEach items="${bestKnowhowList }" var="bestKnowhow" end="0" varStatus="status">
                     <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
                         <div class="card bg-light d-flex flex-fill">
                             <div class="card-header text-muted border-bottom-0" style="text-align: center;">Best Knowhow
                             </div>
                             <div class="card-body pt-0">
                                 <div class="">
                                     <div class="col-12 text-center">
                                         <h2 class="lead"><b>제목 : ${bestKnowhow.knh_title }</b></h2>
                                                <c:set var="date2" value="${bestKnowhow.best_knh_date }"/>
                                                <c:set var="day" value="${fn:substring(date2,8,10) }"/>
                                                                                                <p class="text-muted text-sm">
                                                ${fn:substring(date2,0,4) }년  ${fn:substring(date2,5,7) }월 
                                                <c:choose>
                                                   <c:when test="${day eq '01'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '02'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '03'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '04'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '05'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '06'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '07'}"> 1주차   </c:when>
                                                   <c:when test="${day eq '08'}"> 2주차   </c:when>
                                                   <c:when test="${day eq '09'}"> 2주차   </c:when>
                                                   <c:when test="${day eq '10'}"> 2주차   </c:when>
                                                   <c:when test="${day eq '12'}"> 2주차   </c:when>
                                                   <c:when test="${day eq '13'}"> 2주차   </c:when>
                                                   <c:when test="${day eq '14'}"> 2주차   </c:when>
                                                   <c:when test="${day eq '15'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '16'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '17'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '18'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '19'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '20'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '21'}"> 3주차   </c:when>
                                                   <c:when test="${day eq '22'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '23'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '24'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '25'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '26'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '27'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '28'}"> 4주차   </c:when>
                                                   <c:when test="${day eq '29'}"> 5주차   </c:when>
                                                   <c:when test="${day eq '30'}"> 5주차   </c:when>
                                                   <c:when test="${day eq '31'}"> 5주차   </c:when>
                                                </c:choose>
                                                 </p>
                                                <p class="text-muted text-sm">좋아요 수 : ${bestKnowhow.best_knh_likecnt } </p>
                                                
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </c:forEach>
                 <c:forEach items="${projectList }" var="project" end="0" varStatus="status">
                     <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
                         <div class="card bg-light d-flex flex-fill">
                             <div class="card-header text-muted border-bottom-0" style="text-align: center;">Best Project
                             </div>
                             <div class="card-body pt-0">
                                 <div class="">
                                     <div class="col-12 text-center">
                                         <h2 class="lead"><b>프로젝트 명: ${project.prjct_sj }</b></h2>
                                           <c:set var="date3" value="${project.best_pjt_date }"/>
                  <c:set var="month" value="${fn:substring(date3,5,7) }"/>
                     
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
      <div class="card card-outline card-primary" style="width: 49%; margin-right: 8px; float: left;border-top: 3px solid #282c2f;">
         <div class="card-header">
            <h3 class="card-title">최신 노하우</h3>
         </div>
         <div class="card-body" style="padding: 5px; height:300px;">


            <div class="card-body" style="padding-top: 10px;">
               <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-nowrap">
                     <thead>
                        <tr style="font-size: 0.95em;">
                           <th style="width: 10%; text-align: center">번 호</th>
                           <th style="width: 40%; text-align: center">제 목</th>
                           <th style="width: 10%; text-align: center">작성자</th>
                           <th style="width: 5%; text-align: center">좋아요</th>
                           <th style="width: 15%; text-align: center">등록일자</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:if test="${empty knowhowList }">
                           <tr>
                              <td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
                           </tr>
                        </c:if>
                        <c:forEach items="${knowhowList }" var="knowhow"
                           varStatus="status">
                           <tr style='font-size: 0.85em; cursor: pointer;' onclick="location.href='<%=request.getContextPath()%>/knowhow/list';">

                              <%--                      <td style="text-align:center">${knowhow.knh_no }</td> --%>
                              <td style="text-align: center"><c:out
                                    value="${status.count }" /></td>
                              <td style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${knowhow.knh_title }</td>
                              <td style="text-align: center">${knowhow.mber_ncnm }</td>
                              <td style="text-align: center">${knowhow.knh_likeCnt }</td>
                              <td style="text-align: center">${knowhow.knh_regDate }</td>

                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>

         </div>
      </div>

      <div class="card card-outline card-primary" style="width: 49%; margin-right: 8px; float: left;border-top: 3px solid #282c2f;">
         <div class="card-header">
            <h3 class="card-title">최신 공고</h3>
         </div>
         <div class="card-body" style="padding: 5px; height:300px;">




            <div class="card-body" style="padding-top: 10px;">
               <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-nowrap">
                     <thead>
                        <tr style="font-size: 0.95em;">
                           <th style="width: 10%; text-align: center">번 호</th>
                           <th style="width: 50%; text-align: center">제 목</th>
                           <th style="width: 15%; text-align: center">작성자</th>
                           <th style="text-align: center">조회수</th>
                           <th style="text-align: center">등록일자</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:if test="${empty recruitList }">
                           <tr>
                              <td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
                           </tr>
                        </c:if>
                        <c:forEach items="${recruitList }" var="recruit"
                           varStatus="status">
                           <tr style='font-size: 0.85em; cursor: pointer;'
                              onclick="OpenWindow('<%=request.getContextPath() %>/notification/detail.do?pblanc_sn=${recruit.pblanc_sn }&from=list','상세보기',800,780);">

                              <%--                      <td style="text-align:center">${recruit.pblanc_sn }</td> --%>
                              <td style="text-align: center"><c:out
                                    value="${status.count }" /></td>
                              <td id="boardTitle"
                                 style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                 ${recruit.pblanc_sj }</td>
                              <td style="text-align: center"
                                 data-target="recruit-pblanc_wrter">${recruit.mber_ncnm}</td>
                              <td style="text-align: center">${recruit.pblanc_rdcnt }</td>
                              <td style="text-align: center">${recruit.pblanc_rgsde }</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>

         </div>
      </div>






	<div class="card card-outline card-primary" style="width: 100%; margin-right: 8px; float: left;border-top: 3px solid #282c2f;cursor : pointer">
         <div class="card-header">
            <h3 class="card-title">인기글</h3>
            <div class="card-tools" style="float: right"></div>
         </div>
         <div id="row">
          <c:forEach items="${recruitList2 }" var="recruit" varStatus="status">
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column" style="float: left; height: 190px;">
               <div class="card bg-light d-flex flex-fill">
                  <div class="card-header text-muted border-bottom-0"></div>
                  <div class="card-body pt-0" style="margin-top:-15px; margin-bottom: -19px;     max-height: 153px; ">
                     <div class="">
                        <div class="col-12 text-center"></div>
                        <div class="col-12 text-center" style="max-height: 153px; overflow: hidden;     height: 156px;">
                           <div class="lead" style="font-weight:600; padding-bottom: 5px; max-height: 35px; width: 350px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin-top: 6px;">${recruit.pblanc_sj }</div>
<%--                            <div class="text-muted text-sm" style=" text-overflow:ellipsis; overflow:hidden; white-space:normal; height:43px; display:inline-block; line-height:14px; ">${recruit.pblanc_cn }</div> --%>
                           <div class="text-muted text-sm" style="float: left; padding-left: 11%; position: absolute; left: 0px; top: 52px;">
<%--                            <img style="position:fixed; height:30px; width:30px; bottom:10px; right:15px;" src="<%=request.getContextPath() %>/resources/images/up.png"></img> --%>
                           <img style="height:40px; width:40px; margin-top: 10px;  "src="<%=request.getContextPath() %>/resources/images/glass2.png"></img>
                           <p>조회수  ${recruit.pblanc_rdcnt }</p>
                           </div>
                           <div class="text-muted text-sm" style="padding-right: 96px; padding-top: 30px; padding-right: 0%; padding-left: 30%;">작성자 :${recruit.mber_ncnm}</div>
                           <div class="text-muted text-sm" style="padding-right: 0%; padding-top: 10px; padding-left: 35%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">프로젝트명 :${recruit.prjct_sj}</div>
<%--                            <h2 class="lead"><b>좋아요  ${recruit.pblanc_rdcnt }개</b></h2> --%>
<%--                            <p class="text-muted text-sm">제목: ${recruit.pblanc_sj }</p> --%>
<%--                            <p class="text-muted text-sm">작성자 :${recruit.mber_ncnm}</p> --%>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
          </c:forEach>
         </div>


      </div>


   </section>



</body>




