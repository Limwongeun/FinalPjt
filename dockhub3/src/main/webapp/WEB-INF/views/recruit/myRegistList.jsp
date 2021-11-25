<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="recruitList" value="${dataMap.recruitList }" />

<head>
<style>
#container {
	width: 960px;

	text-align: center;
}
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	height : 50px;
	
}
a{

	color: #000;
	text-align: center;
	text-decoration: none;

	font-size: 17px;
	transition: 0.3s;
}
a:visited { 
	color: black; 
	text-decoration: none;
	
	}


.tabmenu {
	float: left;
	height : 50px;
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
}
}
</style>



</head>

<title>공고목록</title>

<body>
<div id="container">
		<ul class="tab">
			<li class='tabmenu'  style="background-color : #E0E0E0; border : 1px solid lightgrey"><a href="<%=request.getContextPath() %>/notification/list.do">공고목록</a></li>
			<li class='tabmenu' id="default" style="background-color : white; border : 1px solid lightgrey"><a href="<%=request.getContextPath() %>/notification/myList.do">작성한 공고</a></li>
			<li class='tabmenu' style="background-color : #E0E0E0; border : 1px solid lightgrey"><a href="<%=request.getContextPath() %>/notification/myMeeting.do">신청한 공고</a></li>
		</ul>
</div>


	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>작성한 공고</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
    <section class="content">		
		<div>
			<div class="card card-outline card-primary" style=" border-top: 3px solid #282c2f;">
              <div class="card-header">
                <h3 class="card-title">작성한 공고</h3>
              </div>
              <!-- /.card-header -->
	     
	
				<div class="card-body" style="padding-top: 10px;">
                <div class="table-responsive p-0">
				<div id="myRecruitList">
				
				</div>

              </div>
				<div class='text-center'>
					<ul id="myRecruitPagination" class="pagination justify-content-center m-0" >
				
					</ul>
				</div>
              </div>
            </div>

		</div>
		<div>
			<div class="card card-outline card-primary" style=" border-top: 3px solid #282c2f;">
				<div class="card-header">
					<h3 class="card-title">면접 관리</h3>
				</div>
				<!-- /.card-header -->
				  
				
				<div class="card-body" style="padding-top: 10px;">
					<div class="table-responsive p-0">
						<div id="recruitMeetingList">
						
						</div>
					
					</div>
					<div class='text-center'>
						<ul id="recruitMeetingPagination" class="pagination justify-content-center m-0" >
						
						</ul>
					</div>
				</div>
            </div>

		</div>
		<div>
			<div class="card card-outline card-primary" style=" border-top: 3px solid #282c2f;">
				<div class="card-header">
					<h3 class="card-title">면접 결과</h3>
				</div>
				<!-- /.card-header -->
				  
				
				<div class="card-body" style="padding-top: 10px;">
					<div class="table-responsive p-0">
						<div id="meetingResultList">
						
						</div>
					
					</div>
					<div class='text-center'>
						<ul id="meetingResultPagination" class="pagination justify-content-center m-0" >
						
						</ul>
					</div>
				</div>
            </div>

		</div>
		

		<input type="hidden" id="mber_sn" name="mber_sn" value="${mber_sn }">
    </section>
    <!-- /.content -->
<%@ include file="./myRegistList_js.jsp" %>
    
</body>





