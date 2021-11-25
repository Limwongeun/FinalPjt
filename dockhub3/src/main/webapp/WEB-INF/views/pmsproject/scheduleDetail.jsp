<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<title>일정 상세보기</title>

<body>
   <c:if test="${from eq 'modify' }" >
      <script>
         alert("수정되었습니다.");
         window.opener.location.reload();
      </script>
   </c:if>
   
   
   <c:if test="${from eq 'remove' }" >
      <script>
         alert("삭제되었습니다.");
         window.opener.location.reload();
         window.close();
      </script>
   </c:if>

	<section class="content-header">
	
	</section>
  <!-- Main content -->
    <section class="row justify-content-center">
<!--       <div class="row"> -->
         <div class="col-md-9">
            <div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
<!--             <div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;"> -->
               <div class="card-header">
                  <h3 class="card-title">상세보기</h3>
               </div>
               <div class="card-body">
                  <div class="form-group col-sm-12">
                     <label for="title">일정명</label>
                     <input type="text" class="form-control" id="prjct_schdul_nm " 
                        value="${projectSchedule.prjct_schdul_nm  }" readonly />                     
                  </div>   
                  <div class="col-sm-12 row">
                     <div class="form-group col-sm-4" >
                        <label for="writer">회원</label>
                        <input type="text" class="form-control" id="user_sn " 
                            value="${projectSchedule.user_sn }" readonly />
                     </div>      
                     
                     <div class="form-group col-sm-4" >
                        <label for="regDate">시작일</label>
                        <c:set var="bgnde" value="${projectSchedule.prjct_schdul_bgnde }"/>
                        <input type="text" class="form-control" id="prjct_schdul_bgnde" 
                           value="${fn:substring(bgnde,0,10) }" readonly />
                     </div>   
                     <div class="form-group col-sm-4" >
                        <label for="regDate">종료일</label>
				         <c:set var="endde" value="${projectSchedule.prjct_schdul_endde }"/>
                        
                        <input type="text" class="form-control" id="prjct_schdul_endde" 
                           value="${fn:substring(endde,0,10) }" readonly />
                     </div>   
                  </div>   
                  <div class="form-group col-sm-12">
                     <label for="prjct_schdul_cn">내 용</label>
                     <div>${projectSchedule.prjct_schdul_cn }</div>
                  </div>
                                    
               </div>
               <div class="card-footer">
                  
                     <button type="button" id="modifyBtn" class="btn btn-warning" style="background: #84a7d3; border: 1px solid #84a7d3; color: white;" onclick="submit_go('scheduleModifyForm.do','${projectSchedule.prjct_schdul_sn}');">수정</button>                  
                      <button type="button" id="removeBtn" class="btn btn-danger" style="background: #4f559f; border: 1px solid #4f559f; color: white;" onclick="submit_go('scheduleRemove.do','${projectSchedule.prjct_schdul_sn}');">삭제</button>
                  
                   <button type="button" id="listBtn" class="btn btn-default" onclick="CloseWindow();">닫기 </button>
               </div>                           
            </div><!-- end card -->            
         </div><!-- end col-md-12 -->
<!--       </div>end row        -->
      
    </section>
    
<script>
    function submit_go(url,prjct_schdul_sn){
      //alert(url);
     location.href=url+"?prjct_schdul_sn="+prjct_schdul_sn;
   }
 
 </script>
</body>

















