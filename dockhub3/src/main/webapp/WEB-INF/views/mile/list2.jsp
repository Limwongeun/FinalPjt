<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="milestoneList" value="${dataMap.milestoneList2 }" />
<%-- <c:set var="milestoneList2" value="${dataMap2.milestoneList2 }" /> --%>
<%-- <c:set var="count" value="${dataMap.count }" /> --%>

<head>
    <style>
    </style>
</head>

<title>목록</title>

<body>


    <!-- //UI Object -->
    <script type="text/javascript">
        function change_parent_url(url)
        {
        	 window.location.href=url;
        }		
    </script>
<%-- ${milestoneList[0].mile_no } --%>
	<c:if test="${from eq 'remove' }">
	<script>
   		alert("삭제되었습니다.");
		location.reload();
		//window.close();
	</script>
	</c:if>
	
	<c:if test="${from eq 'regist'}" >
		<script>
    	alert("마일스톤 등록이 성공했습니다."); 
    	window.opener.location.reload();	
    	window.close();
    	</script>
    </c:if>
    <div><a href="javascript:change_parent_url('<%=request.getContextPath()%>/pmsproject/issue?prjct_sn='+${prjct_sn });" 
    	style= "text-decoration: none;
/*      font-size:2rem; */
      	color:white;
      	padding:5px 10px 5px 10px;
      	margin:10px;
      	display:inline-block;
      	border-radius: 10px;
      	transition:all 0.1s;
      	text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
/*       transform: translateY(3px); */
      	background-color: #1f75d9; 
/*       border-bottom:5px solid #165195; */
		border-bottom:2px solid #165195;
		float:left;"> 
		이슈</a></div>			
    <div><a href="javascript:change_parent_url('');" 
    	style= "text-decoration: none;
/*      font-size:2rem; */
      	color:white;
      	padding:5px 10px 5px 10px;
      	margin:10px;
      	display:inline-block;
      	border-radius: 10px;
      	transition:all 0.1s;
      	text-shadow: 0px 0px rgba(0, 0, 0, 0.44);
      	background-color: #ff521e;
      	border-bottom:5px solid #c1370e;
      	border-bottom:2px solid #c1370e;"> 
		마일스톤</a></div>			
	 <!-- Main content -->
<!-- 	 <input type="hidden" name="searchType" id="searchType" value="tcw">
	 <input type="hidden" name="keyword" id="keyword" value=""> -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>마일스톤</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 		<div class="card" style="display: none;">
			<div  class="card-header with-border">
				<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','글등록',800,700);">공지등록</button>				
				<div id="keyword" class="card-tools" style="width:450px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
					  		onchange="list_go();">
					  		<option value="5" >정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  		<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
					  	</select>						
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>작성자+제목+내용</option>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="list_go(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			</div>
			
	 <!-- Main content -->
    <section class="content">
		<div class="card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do?prjct_sn=${prjct_sn }','공지등록',800,700);" style="float:right">마일스톤 등록</button>				
			</div>

		<div><a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list?prjct_sn='+${prjct_sn});" 
    	style= "text-decoration: none;
/*      font-size:2rem; */
      	color:white;
      	padding:5px 10px 5px 10px;
      	margin:10px;
      	display:inline-block;
      	border-radius: 10px;
      	transition:all 0.1s;
      	text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
/*       transform: translateY(3px); */
      	background-color: #1f75d9; 
/*       border-bottom:5px solid #165195; */
		border-bottom:2px solid #165195;
		float:left;"> 
		OPEN</a>
		<a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list2?prjct_sn='+${prjct_sn});" 
    	style= "text-decoration: none;
/*      font-size:2rem; */
      	color:white;
      	padding:5px 10px 5px 10px;
      	margin:10px;
      	display:inline-block;
      	border-radius: 10px;
      	transition:all 0.1s;
      	text-shadow: 0px 0px rgba(0, 0, 0, 0.44);
      	background-color: #ff521e;
      	border-bottom:5px solid #c1370e;
      	border-bottom:2px solid #c1370e;"> 
		CLOSE</a></div>	

			
<%-- 			<a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list?prjct_sn='+${prjct_sn});"> OPEN </a> --%>
<!-- 			<br> -->
<%-- 			<a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list2?prjct_sn='+${prjct_sn});"> CLOSE </a> --%>
			<div class="card-body">
				
				<table class="table table-bordered text-center" >					
					<tr style="font-size:0.95em;">
<!-- 						<th style="width:10%;">번 호</th> -->
<!-- 						<th style="width:20%;">제 목</th> -->
<!-- 						<th style="width:15%;">작성자</th> -->
<!-- 						<th style="width:15%;">등록일자</th> -->
<!-- 						<th style="width:10%;">마감일자</th> -->
<!-- 						<th style="width:10%;">상태</th> -->
<!-- 						<th style="width:10%;">상태</th> -->
<!-- 						<th style="width:10%;">삭제</th> -->
					</tr>				
					<c:if test="${empty milestoneList }" >
						<tr>
							<td colspan="10">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>				
					<c:forEach items="${milestoneList }" var="milestone">
						<tr style='font-size:0.85em;'>
							<td id="boardTitle" style="cursor:pointer; text-align:left;max-width: 100px; overflow: hidden; width:45%;
												white-space: nowrap; text-overflow: ellipsis; line-height: 5; font-size:20px; padding-left:30px; font-weight:600;"  onclick="detail_go(${milestone.mile_no});">
							${milestone.mile_title }
							</td>		


							<td style="width:45%;">
<!-- 							    <div class="h_graph"> -->
<!-- 							        <ul style="margin:0 50px 0 50px;padding:1px 0 0 0;/*border:1px solid #ddd;*/border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none;"> -->
<!-- 							        </ul> -->
<!-- 							    </div> -->
							    <div class="h_graph">
<!-- 							        <ul style="margin:0 50px 0 50px;padding:1px 0 0 0;/*border:1px solid #ddd;*/border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none;"> -->
<!-- 							            <li style="position:relative;margin:10px 0;vertical-align:top;white-space:nowrap;"> -->
							            	
<!-- 							            </span> -->
<!-- 							            </li> -->
<!-- 							        </ul> -->
							    </div>
							    
							    <div class="progress" style="margin:10px;">
				                  <div class="progress-bar bg-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="border-radius:6px;  width: ${(milestone.openissue/(milestone.openissue+milestone.closeissue))*100}%;">
				                  
				                  
				                  
				                  
				                    <span class="sr-only">20% Complete</span>
				                  </div>
				                </div>
				                <div style="width:100%; height:23px; margin-left: 20px; margin-top: 5px;">
<!-- 					            	<div style="float:left; width:20%;color:#767676;line-height:20px">20%</div> -->
									<div style="float:left; width:20%; margin-left:50px;">
										<c:if test="${(milestone.openissue/(milestone.openissue+milestone.closeissue)) eq 'NaN'}">
											<c:out value="0%"/>
										</c:if>
										<c:if test="${(milestone.openissue/(milestone.openissue+milestone.closeissue)) ne 'NaN'}">
											<fmt:formatNumber type="number" maxFractionDigits="0" value="${(milestone.openissue/(milestone.openissue+milestone.closeissue))*100}" />%
										</c:if>
					                </div>
					                <div style="float:left; width:30%;">${milestone.openissue } open</div>
								    <div style="float:left; width:20%;">${milestone.closeissue } close</div>
							    </div>
							<div style="width:100%; ">
									<button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px;" type="button" id="modifyBtn" class="btn btn-primary" onclick="modify_go(${milestone.mile_no});">수 정</button>
									<button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px;" type="button" id="modifyBtn2" class="btn btn-light" onclick="code_go(${milestone.mile_no});">종 료</button>
									<button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px;" type="button" id="removeBtn" class="btn btn-warning"onclick="remove_go(${milestone.mile_no});">삭제</button>
							</div>	
							</td>
						</tr>
					</c:forEach>
					
				</table>				
			</div>
			<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
			<input type="hidden" name ="mile_state_code" id="mile_state_code" value="${mile_state_code}">
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/paginationClose.jsp" %>
			</div>
		
		</div>
		
    </section>
    <!-- /.content -->
    <script>
//     window.onload=function(){
// //     	$("[data-target='notice-writer']").click(function(event){    		
//     	$("[data-target='milestone-mile_wrter']").click(function(event){    		
//     				+$(this).text(),'상세보기',800,700);
//     		return false;    		
//     	});
//     }

var formObj = "";
window.onload=function(){
	formObj = $("form[role='form']");
}

    function modify_go(no){
//     	alert("click modify btn");
    	var prjct_sn = $("#prjct_sn").val();
    	location.href="modifyForm.do?mile_no="+no+"&prjct_sn="+prjct_sn;
    	formObj.attr('action','modifyForm.do').submit();
    } 

    function detail_go(no){
//     	alert("click btn");
    	var prjct_sn = $("#prjct_sn").val();
    	
    	location.href="detail.do?mile_no="+no+"&prjct_sn="+prjct_sn;
    	formObj.attr('action','detail.do').submit();
    } 
    
    function remove_go(no){
//     	alert("click remove btn");
    	var answer = confirm("정말 삭제하시겠습니까?");
    	var prjct_sn = $("#prjct_sn").val();
    	if(answer)	
    		location.href="remove.do?mile_no="+no+"&prjct_sn="+prjct_sn;
    		/* formObj.attr({'action':'remove.do',
    							  'method':'post'}).submit(); */
    }
    
    function code_go(no){
    	var answer = confirm("상태를 종료하시겠습니까?");
    	var prjct_sn = $("#prjct_sn").val();
    	alert(prjct_sn)
    	if(answer)
    		location.href="modify2.do?mile_no="+ no + "&prjct_sn=" + prjct_sn;
    }
    </script>
    
</body>






































<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="pageMaker2" value="${dataMap2.pageMaker2 }" />

<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="cri2" value="${pageMaker2.cri }" />
<c:set var="milestoneList" value="${dataMap.milestoneList }" />
<c:set var="milestoneList2" value="${dataMap2.milestoneList2 }" />
<%-- <c:set var="milestoneList2" value="${dataMap2.milestoneList2 }" /> --%>
<%-- <c:set var="count" value="${dataMap.count }" /> --%>

<head>
<style>
html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}

/*tab css*/
.tab{float:left; width:100%; }
.tabnav{font-size:0; width:100%; border:1px solid #ddd;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#10316b;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#10316b; }
.tabcontent{padding: 20px; border:1px solid #ddd; border-top:none;}
</style>
</head>

<body>
    
<div class="tab" style=" width:90%; margin:0 auto;">
  <ul class="tabnav">
    <li><a href="#tab01" id="openBtn">open</a></li>
    <li><a href="#tab02" id="closeBtn">close</a></li>
  </ul>
  <div class="tabcontent">
  
  
    <div id="tab01">
    <section class="content">
      <div class="card">
         <div class="card-body" style="padding:0;">
            <table class="table table-bordered text-center" >               
               <tr style="font-size:0.95em;"> </tr>            
               <c:if test="${empty milestoneList }" >
                  <tr>
                     <td colspan="10">
                        <strong>해당 내용이 없습니다.</strong>
                     </td>
                  </tr>
               </c:if>            
               <c:forEach items="${milestoneList }" var="milestone">
                  <tr style='font-size:0.85em;'>
                     <td id="boardTitle" style="cursor:pointer; text-align:left;max-width: 100px; overflow: hidden; width:45%; white-space: nowrap; text-overflow: ellipsis; line-height: 5; font-size:20px; padding-left:30px; font-weight:550;"  onclick="detail_go(${milestone.mile_no});">
                     ${milestone.mile_title }</td>      
                     <td style="width:45%;">
                         <div class="h_graph"></div>
                         <div class="progress" style="margin:10px;">
                              <div class="progress-bar bg-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="border-radius:6px;  width: ${(milestone.openissue/(milestone.openissue+milestone.closeissue))*100}%;">
                                <span class="sr-only">20% Complete</span>
                              </div>
                         </div>
                         <div style="width:100%; height:23px; margin-left: 20px; margin-top: 5px; margin-bottom: 7px;">
                           <div style="float:left; width:20%; margin-left:50px; ">
                              <c:if test="${(milestone.openissue/(milestone.openissue+milestone.closeissue)) eq 'NaN'}">
                                 <c:out value="0%"/>
                              </c:if>
                              <c:if test="${(milestone.openissue/(milestone.openissue+milestone.closeissue)) ne 'NaN'}">
                                 <fmt:formatNumber type="number" maxFractionDigits="0" value="${(milestone.openissue/(milestone.openissue+milestone.closeissue))*100}" />%
                              </c:if>
                           </div>
                           <div style="float:left; width:30%;">${milestone.openissue } open</div>
                           <div style="float:left; width:20%;">${milestone.closeissue } close</div>
                        </div>
                     <div style="width:100%; ">
                           <button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px;" type="button" id="modifyBtn" class="btn btn-primary" onclick="modify_go(${milestone.mile_no});">수 정</button>
                           <button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px;" type="button" id="modifyBtn2" class="btn btn-light" onclick="code_go(${milestone.mile_no});">종 료</button>
                           <button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px;" type="button" id="removeBtn" class="btn btn-warning"onclick="remove_go(${milestone.mile_no});">삭제</button>
                     </div>   
                     </td>
                  </tr>
               </c:forEach>
            </table>            
         </div>
         <input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
         <div class="card-footer">
            <%@ include file="/WEB-INF/views/common/pagination.jsp" %>
         </div>
      </div>
    </section>
    
    </div>
    <div id="tab02">
	<section class="content">
		<div class="card">

			<div class="card-body" style="padding:0;">
				
				<table class="table table-bordered text-center" >					
					<tr style="font-size:0.95em;"></tr>				
					<c:if test="${empty milestoneList2 }" >
						<tr>
							<td colspan="10"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>				
					<c:forEach items="${milestoneList2 }" var="milestone">
						<tr style='font-size:0.85em;'>
							<td id="boardTitle" style="cursor:pointer; text-align:left;max-width: 100px; overflow: hidden; width:45%;
												white-space: nowrap; text-overflow: ellipsis; line-height: 5; font-size:20px; padding-left:30px; font-weight:550;"  onclick="detail_go(${milestone.mile_no});">
							${milestone.mile_title }
							</td>		
							<td style="width:45%;">
							    <div class="h_graph">
							    </div>
							    
							    <div class="progress" style="margin:10px;">
				                  <div class="progress-bar bg-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="border-radius:6px;  width: ${(milestone.openissue/(milestone.openissue+milestone.closeissue))*100}%;">
				                    <span class="sr-only">20% Complete</span>
				                  </div>
				                </div>
				                <div style="width:100%; height:23px; margin-left: 20px; margin-top: 5px; margin-bottom: 7px;">
<!-- 					            	<div style="float:left; width:20%;color:#767676;line-height:20px">20%</div> -->
									<div style="float:left; width:20%; margin-left:50px;">
										<c:if test="${(milestone2.openissue/(milestone.openissue+milestone.closeissue)) eq 'NaN'}">
											<c:out value="0%"/>
										</c:if>
										<c:if test="${(milestone2.openissue/(milestone.openissue+milestone.closeissue)) ne 'NaN'}">
											<fmt:formatNumber type="number" maxFractionDigits="0" value="${(milestone2.openissue/(milestone.openissue+milestone.closeissue))*100}" />%
										</c:if>
					                </div>
					                <div style="float:left; width:30%;">${milestone2.openissue } open</div>
								    <div style="float:left; width:20%;">${milestone2.closeissue } close</div>
							    </div>
							<div style="width:100%; ">
									<button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px; font-size: 16px;" type="button" id="modifyBtn" class="btn btn-primary" onclick="modify_go(${milestone.mile_no});">수 정</button>
									<button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px; font-size: 16px;" type="button" id="modifyBtn2" class="btn btn-light" onclick="code_go(${milestone.mile_no});">종 료</button>
									<button style="line-height:1; float:left; height:30px; font-size:15px; margin-left:10px; font-size: 16px;" type="button" id="removeBtn" class="btn btn-warning"onclick="remove_go(${milestone.mile_no});">삭제</button>
							</div>	
							</td>
						</tr>
					</c:forEach>
					
				</table>				
			</div>
			<input type="hidden" name ="prjct_sn" id="prjct_sn" value="${prjct_sn}">
			<input type="hidden" name ="mile_state_code" id="mile_state_code" value="${mile_state_code}">
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/paginationClose.jsp" %>
			</div>
		
		</div>
		
    </section>
    
    
    
    
    
    
    
    
    
    
    
    </div>
  </div>
</div>
</div>	    
    
    
    <!-- /.content -->
    <script>
//     window.onload=function(){
// //        $("[data-target='notice-writer']").click(function(event){          
//        $("[data-target='milestone-mile_wrter']").click(function(event){          
<%--           OpenWindow('<%=request.getContextPath()%>/milestone/list.do?id=' --%>
//                 +$(this).text(),'상세보기',800,700);
//           return false;          
//        });
//     }

var formObj = "";
window.onload=function(){
   formObj = $("form[role='form']");
}

    function modify_go(no){
//        alert("click modify btn");
       var prjct_sn = $("#prjct_sn").val();
       location.href="modifyForm.do?mile_no="+no+"&prjct_sn="+prjct_sn;
       formObj.attr('action','modifyForm.do').submit();
    } 

    function detail_go(no){
//        alert("click btn");
       var prjct_sn = $("#prjct_sn").val();
       location.href="detail.do?mile_no="+no+"&prjct_sn="+prjct_sn;
       formObj.attr('action','detail.do').submit();
    } 
    
    function remove_go(no){
//        alert("click remove btn");
       var answer = confirm("정말 삭제하시겠습니까?");
       var prjct_sn = $("#prjct_sn").val();
       if(answer)   
          location.href="remove.do?mile_no="+no+"&prjct_sn="+prjct_sn;
          /* formObj.attr({'action':'remove.do',
                           'method':'post'}).submit(); */
    }
    
    function code_go(no){
       var answer = confirm("상태를 종료하시겠습니까?");
       var prjct_sn = $("#prjct_sn").val();
       alert(prjct_sn)
       if(answer)
          location.href="modify2.do?mile_no="+ no + "&prjct_sn=" + prjct_sn;
    }
    
    $(function(){
    	  $('.tabcontent > div').hide();
    	  
    	  $('.tabnav a').click(function () {
    		  	$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabnav a').removeClass('active');
    	    	$(this).addClass('active');
    	    	return false;
    	  }).filter(':eq(0)').click();
    	  
    	  $("#openBtn").on("click", function(){
    			$("[name='viewOption']", "#jobForm").val("open")  
    	  });
    	  $("#closeBtn").on("click", function(){
    			$("[name='viewOption']", "#jobForm").val("close")  
    	  });
    	  
    	  if('${viewOption}'=='open'){
	    		$('.tabcontent > div').hide().filter($(".tabnav a#openBtn").get(0).hash).fadeIn();
	      	    //$('.tabnav a').removeClass('active');	    		  
	    		$(".tabnav a#openBtn").addClass('active');
    	  }else if('${viewOption}'=='close'){
    		  	$('.tabcontent > div').hide().filter($(".tabnav a#closeBtn").get(0).hash).fadeIn();
        	    $('.tabnav a').removeClass('active');	    		  
      			$(".tabnav a#closeBtn").addClass('active');
    	  }
    	  
    	  
   	});
    
    </script>
    
</body>










