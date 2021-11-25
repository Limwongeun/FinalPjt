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
body::-webkit-scrollbar { display: none; }

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
    <section class="content-header" style="padding : 5px">
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
    </section>


  <!-- Main content -->
    <section class="content container-fluid" style="padding : 10px">
      <div class="row  justify-content-center">
         <div class="col-md-9">
            <div class="card card-outline card-primary" style="border-top: 3px solid #282c2f;">
               <div class="card-header" style="margin: 8px;">
                  <h3 class="card-title">온라인 회의 상세보기</h3>
                  <div class="card-tools">
                  	 <button type="button" id="modifyBtn" class="btn btn-warning" style=" background-color: #80bffb; border-color: #80bffb; color: white;" onclick="submit_go('modifyForm.do','${meeting.mtg_sn}');">수정</button>
<!--                      <button type="button" id="modifyBtn" class="btn btn-primary" onclick="modify_go();">수 정</button>                   -->
                     <button type="button" id="removeBtn" class="btn btn-danger" style="background: #215287; border-color: #215287; " onclick="submit_go('remove.do','${meeting.mtg_sn}');">삭제</button>
                  	 <button type="button" id="listBtn" class="btn btn-default" style="border-color: #ddd;" onclick="CloseWindow();">닫기 </button>
                  
                  
                  </div>
                  
               </div>
               <div class="card-body" style="padding-bottom:0px">
                  <div class="form-group col-sm-12">
                     <label for="title">회의 제목</label>
                     <input type="text" class="form-control" id="mber_schdul_nm" value="${meeting.mtg_title }" readonly />                     
                  </div>   
			<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
                 <div class="form-group col-sm-12">
                     <label for="mber_schdul_cn">내 용</label>
                     <div style="height : 200px; border : 1px solid lightgrey; border-radius : 5px; padding : 10px; overflow-y:scroll">${meeting.mtg_content }</div>
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
						<div style="border : 1px solid lightgrey; padding: 10px; border-radius : 10px;min-height : 80px">
							<c:forEach items="${memList }" var="user">
							
								<div class="userNm" style="display:inline-block; width : 230px; height : 30px; padding: 5px" onclick="OpenWindow('projectProfile.do?prjct_sn=${prjct_sn}&mber_sn=${user.mber_sn}','상세보기',450,510)">
								 	${user.mber_ncnm }
								</div>
							</c:forEach>	
						</div>					
					</div>	
					<div class="form-group col-sm-12">
						<div class="card card-outline card-success" style="border-top: 3px solid #282c2f;">
							<div class="card-header">
								첨부파일
							</div>			
							<div class="card-footer" style="min-height : 100px">
								<div class="row">
									<c:forEach items="${attachList }" var="attach">
										<div class="col-md-6 col-sm-4 col-xs-12"  style="cursor:pointer;"
											 onclick="location.href='<%=request.getContextPath()%>/getFile.do?file_sn=${attach.file_sn }&file_ordr=${attach.file_ordr }'">
											<div class="info-box">	
											 	<span class="info-box-icon bg-yellow">
													<i class="fa fa-copy"></i>
												</span>
												<div class="info-box-content">
													<span class ="info-box-text">
														<%-- <fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd" /> --%>	
													</span>
													<span class ="info-box-number">${attach.file_nm }</span>
												</div>
											</div>
										 </div>							
									</c:forEach>
								</div>
							</div>				
						</div>
					</div>                                    
               </div>
               <div class="card-footer"  style="padding-left : 240px">
                  <div>
	                  <c:choose>
	                  	<c:when test="${meeting.mtg_reg_user eq loginUserSn}">
	            	      <button type="button" id="listBtn" class="btn btn-primary" onclick="openMeeting('${member.mber_ncnm }','${member.mber_photo }');">회의시작</button>
	                  	</c:when>
	                  	<c:otherwise>
	                  		<c:if test="${meeting.mtg_sttus_code eq 1}">
		            	      <button type="button" id="listBtn" class="btn btn-primary" onclick="joinMeeting('${member.mber_ncnm }','${member.mber_photo }')">회의참여</button>
	                  		</c:if>
	                  		<c:if test="${meeting.mtg_sttus_code eq 0}">
		            	      <button type="button" id="listBtn" class="btn btn-secondary" onclick="">회의참여</button>
	                  		
	                  		</c:if>
	                  		<c:if test="${meeting.mtg_sttus_code eq 2}">
		            	      <button type="button" id="listBtn" class="btn btn-secondary" onclick="">회의참여</button>
	                  		
	                  		</c:if>
	                  	</c:otherwise>
	                  </c:choose>
                  
                  </div>
                  
                  
                  
                  
                  
                  
                  
                    
               </div>                           
            </div><!-- end card -->            
         </div><!-- end col-md-12 -->
      </div><!-- end row  -->      
      <input type="hidden" id="mtg_sn" name="mtg_sn" value="${meeting.mtg_sn }">
      <input type="hidden" id="loginUserSn" name="loginUserSn" value="${loginUserSn }">
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
var mtg_sn = $("#mtg_sn").val();
var user_sn = $("#loginUserSn").val();
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

function insertMem(){

	$.ajax({
		url:"<%=request.getContextPath() %>/pmsproject/insertMeetingMem?mtg_sn="+mtg_sn+"&user_sn="+user_sn,	
		contentType:"application/json",
		success:function(){
// 			alert("meminsert")
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("멤버 인서트 실패");
		}
	});
}

function openMeeting(ncnm, photo){
	insertMem();

	$.ajax({
		url:"<%=request.getContextPath() %>/pmsproject/setMeetingStatus?mtg_sn="+mtg_sn+"&mtg_sttus_code=1",	

		contentType:"application/json",
		success:function(data){
			opener.location.reload();
			OpenWindow('<%=request.getContextPath() %>/pmsproject/chat?mber_ncnm='+ncnm+'&mber_photo='+photo+'&mtg_sn='+mtg_sn+'&user_sn='+user_sn+'&from=open','채팅회의진행',900,640);
		},
		error:function(error){
// 			AjaxErrorSecurityRedirectHandler(error.status);		
			alert("미팅 열기 실패");
		}
	});
	
}

function joinMeeting(ncnm, photo){
	insertMem();
	OpenWindow("<%=request.getContextPath() %>/pmsproject/chat?mber_ncnm="+ncnm+"&mber_photo="+photo+"&mtg_sn="+mtg_sn+"&user_sn="+user_sn+"&from=join",'채팅회의참여',900,640);
}
 </script>
</body>

