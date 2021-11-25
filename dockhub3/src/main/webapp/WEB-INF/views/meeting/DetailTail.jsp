<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<title>회의 상세보기</title>

<body>
<style>
.userNm:hover{
	background-color : #E0E0E0;
	cursor: pointer;
}
</style>
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
    <!-- Content Header (Page header) -->
<!--     <section class="content-header"> -->
<!--        <div class="container-fluid"> -->
<!--           <div class="row mb-2"> -->
<!--              <div class="col-sm-6"> -->
<!--                   <h1>회의 상세보기</h1> -->
<!--                </div>                -->
          
                
<!--                 <div class="col-sm-6"> -->
<!--                <ol class="breadcrumb float-sm-right"> -->
<!--                  <li class="breadcrumb-item"><a href="list.do"><i class="fa fa-dashboard"></i>회의</a></li> -->
<!--                  <li class="breadcrumb-item active">상세보기</li>               -->
<!--                </ol> -->
<!--                </div> -->
<!--            </div>            -->
<!--          </div> -->
<!--     </section> -->


  <!-- Main content -->
    <section class="content container-fluid" style="padding : 10px">
      <div class="row">
         <div class="col-md-12">
            <div class="card card-outline card-primary" >
               <div class="card-header">
                  <h3 class="card-title">온라인 회의 상세보기2</h3>
               </div>
               <div class="card-body">
                  <div class="form-group col-sm-12">
                     <label for="title">회의 제목</label>
                     <input type="text" class="form-control" id="mber_schdul_nm " 
                        value="${meeting.mtg_title }" readonly />                     
                  </div>   
			<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
                 <div class="form-group col-sm-12">
                     <label for="mber_schdul_cn">내 용</label>
                     <div style="min-height : 200px; border : 1px solid lightgrey; border-radius : 5px; padding : 10px">${meeting.mtg_content }</div>
                  </div>
<!--                      <select onchange="if(this.value) window.open(this.value);"> -->
<!--                      	<option value="" selected="selected">회의 종류를 선택해주세요.</option> -->
<!--                      	<option value="https://192.168.45.59:9001/"> 화상회의</option> -->
<!--                      	<option value="https://192.168.45.59:9001/demos/screen-sharing.html"> 화면공유</option> -->
<!-- 						<option value="http://localhost/ddit/pmsproject/chat">온라인회의</option>                     	 -->
<!--                      </select> -->
<!--                      <div class="form-group col-sm-12" > -->
<!--                         <label for="writer">회원 -->
<!--                         <button type="button" id="inviteBtn" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">초대</button> -->
<%-- <%--                         <button type="button" id="inviteBtn" class="btn btn-info btn-sm" onclick="invite_go('invite.do','${meeting.mtg_sn}');">초대</button> --%>
<!--                         </label> -->
<!--                         <input type="text" class="form-control" id="mber_sn "  -->
<%--                             value="${meeting }" readonly /> --%>
<!--                      </div>       -->
                     
                     <div class="form-group col-sm-12" >
                        <label for="regDate">회의 일자</label>
               
                        <input type="text" class="form-control" id="mber_schdul_bgnde" 
                           value="${fn:split(meeting.mtg_date,'T')[0] } &nbsp; ${fn:split(meeting.mtg_date,'T')[1] }" readonly />
                     </div>  
                        
					<div class="form-group col-sm-12">
						<label for="user">구성원</label> <br/>
						<div style="border : 1px solid lightgrey; padding: 10px; border-radius : 10px;min-height : 50px">
							<c:forEach items="${memList }" var="user">
								<div class="userNm" style="display:inline-block; width : 230px; height : 30px; padding: 5px" >
								 ${user.mber_ncnm }
								</div>
							</c:forEach>	
						</div>					
					</div>	
                                    
               </div>
               <div class="card-footer">
                  
                     <button type="button" id="modifyBtn" class="btn btn-warning" onclick="submit_go('modifyForm.do','${meeting.mtg_sn}');">수정</button>
<!--                      <button type="button" id="modifyBtn" class="btn btn-primary" onclick="modify_go();">수 정</button>                   -->
                     <button type="button" id="removeBtn" class="btn btn-danger" onclick="submit_go('remove.do','${meeting.mtg_sn}');">삭제</button>
                   <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">닫기 </button>
               </div>                           
            </div><!-- end card -->            
         </div><!-- end col-md-12 -->
      </div><!-- end row  -->      
      
    </section>
    
    
		    <!-- Modal -->
<!-- 		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 		  <div class="modal-dialog"> -->
<!-- 		    <div class="modal-content"> -->
<!-- 		      <div class="modal-header"> -->
<!-- 		        <h4 class="modal-title" id="myModalLabel">초대 하기</h4> -->
<!-- 		      </div> -->
<!-- 		      <div class="modal-body"> -->
<!-- 		      <form action="meetingUserRegist.do" name="meetingUserRegistForm"> -->
<%-- 		      <input type="hidden" id="mtg_sn" name="mtg_sn" value="${meeting.mtg_sn }"> --%>
<!--                      <select class="form-control" name="user_sn" id="user_sn"> -->
<%--                      	<c:forEach var="userList" items="${dataMap.userList }"> --%>
<%--                             <option value="${userList.user_sn }">${userList.user_sn }</option> --%>
<%--                      	</c:forEach> --%>
<!-- 					</select> -->
<!-- 		      </form> -->
<!-- 			</div> -->
<!-- 		      <div class="modal-footer"> -->
<!-- 		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 		        <button type="button" class="btn btn-primary" onclick="invite_go()">초대</button> -->
<!-- 		      </div> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
<!-- 		</div> -->
		    
<script>
    function submit_go(url,mtg_sn){
      //alert(url);
   	var prjct_sn = $("#prjct_sn").val();
     location.href=url+"?mtg_sn="+mtg_sn+"&prjct_sn="+prjct_sn;
   }
 
    function invite_go(){
    	var form = document.meetingUserRegistForm;
    	
    	form.submit();
    }
    
   /*  function remove_go(no){
     	alert(no);
    	var answer = confirm("정말 삭제하시겠습니까?");
    	var prjct_sn = $("#prjct_sn").val();
    	if(answer)	
    		location.href=url+"?mtg_sn="+mtg_sn;
//     			"remove.do?mtg_sn="+no+"&prjct_sn="+prjct_sn;
//     		location.href="remove.do?mtg_sn="+no+"&prjct_sn="+prjct_sn;
    		/* formObj.attr({'action':'remove.do',
   
    			
    			'method':'post'}).submit(); */
//    } */
 </script>
</body>

