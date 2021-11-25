<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="cri" value="${pageMaker.cri }" />

<head></head>

<title>회원목록</title>

<body>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>프로젝트 정보</h1>  				
	  			</div>
	  			<div class="col-sm-6" style="text-align:right;">
					<button class="btn btn-default" onclick="window.close()" style="float: right;"> 닫 기 </button>
	  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 
   	<section class="content">
   	<div class="container-fluid">
 		<div class="row">
 			<div class="col-sm-6">
		  	<div class="info-box" style="padding-left:40px; height : 150px;">
              <span style="margin:20px;">
              	<img  style="height: 100px; width: 100px; "src="<%=request.getContextPath() %>/pmsproject/getPicture.do?picture=${project.prjct_photo }">
              
              </span>

              <div class="info-box-content">
                <span class="info-box-text">프로젝트 명 </span>
                <span class="info-box-text" style="font-weight:bold; font-size:1.3em">${project.prjct_sj }</span>
              </div>
              <!-- /.info-box-content -->
            </div>	
		    </div>
		    <div class="col-sm-6">
		  		<div class="info-box"  style="padding-left:30px; height : 150px;">
              <span class="info-box-icon"><i class="fas fa-thumbs-up fa-lg"></i></span>

              <div class="info-box-content">
                <span class="info-box-text" style="font-size:1.3em">Likes</span>
                <span class="info-box-number" style="font-weight:bold; font-size:1.3em">${project.prjctr_like_co }</span>

                
              </div>
              <!-- /.info-box-content -->
              <span class="info-box-icon" style="margin:20px;"><i class="fas fa-bookmark fa-lg"></i></span>

              <div class="info-box-content">
                <span class="info-box-text" style="font-size:1.3em">BookMark</span>
                <span class="info-box-number" style="font-weight:bold; font-size:1.3em">${project.prjct_scrap_co }</span>

                
              </div>
              <!-- /.info-box-content -->
            </div>
		    </div>
 		</div>
 		<div class="row" style="height: 10px;">
 		</div>
 		<div class="row">
 			<div class="col-sm-6">
		  		<div class="card card-success shadow-sm" style="height: 70px;">
              
              <div class="card-body" >
              
              
              
                              시작일 : ${fn:split(project.prjct_bgnde,'-')[0] }년 ${fn:split(project.prjct_bgnde,'-')[1] }월 ${fn:split(project.prjct_bgnde,'-')[2] }일
              </div>
              <!-- /.card-body -->
            </div>
		    </div>
		    <div class="col-sm-6">
		  		<div class="card card-success shadow-sm" style="height: 70px;">
              
              <div class="card-body">
              종료일 :  ${fn:split(project.prjct_endde,'-')[0] }년 ${fn:split(project.prjct_endde,'-')[1] }월 ${fn:split(project.prjct_endde,'-')[2] }일
              </div>
              <!-- /.card-body -->
            </div>
		    </div>
 		</div>
 		<div class="row" style="height: 20px;">
 		</div>
 		<div class="row">
 			<div class="col-sm-12">
		  		<div class="card card-success shadow-sm" style="padding-left : 20px">
              <h5 class="mt-4 mb-2">프로젝트 설명 </h5>
              <div class="card-body" style="min-height : 220px;" >
                ${project.prjct_cn }
              </div>
              <!-- /.card-body -->
            </div>
		    </div>
		    
 		</div>
 		 		<div class="row" style="height: 20px;">
 		</div>
 		<div class="row">
 			<div class="col-sm-6">
		  		<div class="card card-success shadow-sm">
              
              <div class="card-body">
              프로젝트 상태 :
              <c:choose>
	              <c:when test="${project.prjct_ing eq '1'}">
	              
	              <span class="badge badge-warning">시작전</span>
	              </c:when>
	              <c:when test="${project.prjct_ing eq '2'}">

	             <span class="badge badge-success" style="width: 100px;font-size:16px">진행중</span>
	              </c:when>
	              <c:when test="${project.prjct_ing eq '3'}">
	              <span class="badge badge-info">기간종료</span>
	              </c:when>
	              <c:when test="${project.prjct_ing eq '4'}">
      	             <span class="badge badge-danger" style="width: 100px;font-size:16px">비활성화</span>
	              
<!-- 		              <div class="card bg-danger"> -->
<!-- 		              <div class="card-body"> -->
<!-- 		                비활성화 -->
<!-- 		              </div> -->
<!-- 		              /.card-body -->
<!-- 		           	  </div> -->
	              <!-- <span class="badge badge-danger">비활성화</span> -->
	              </c:when>
              </c:choose>
                
              </div>
              <!-- /.card-body -->
            </div>
		    </div>
		    <div class="col-sm-6">
		  		<div class="card card-success shadow-sm">
              
              <div class="card-body">
                현재 참여중인 구성원 : ${project.user_cnt }
              </div>
              <!-- /.card-body -->
            </div>
		    </div>
 		</div>
 		
 		</div>
   	</section>
<script>
</script>
</body>





