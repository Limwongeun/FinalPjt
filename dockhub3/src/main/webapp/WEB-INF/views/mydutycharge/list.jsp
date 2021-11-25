<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="dutyChargeList" value="${dataMap.dutyChargeList }" />

<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> -->

<head></head>

<title></title>

<body>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>단위업무</h1>  				
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
		<div class="card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width:540px;">
				<div style="display: none;">
					<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
						  		onchange="list_go2();">
						  		<option value="10" >정렬개수</option>				  		
					</select>
				</div>
					<div class="input-group row">
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="up"  ${cri.searchType eq 'up' ? 'selected':'' }>전 체</option>
							<option value="p" ${cri.searchType eq 'p' ? 'selected':'' }>프로젝트명</option>
							<option value="u" ${cri.searchType eq 'u' ? 'selected':'' }>단위업무명</option>
						</select>					
						<input id="" class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="list_go2(1,'dutycharge.do');" 
							data-card-widget="search" >
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body" style="height: 590px;">
				<table class="table table-bordered text-center" >					
					<tr style="font-size:0.95em;">
						<th style="width:6%;">번 호</th>
						<th style="width:20%;">단위업무명</th>
						<th style="width:20%;">프로젝트명</th>
						<th style="width:10%;">업무상태</th>
						<th style="width:10%;">시작일자</th>
						<th style="width:10%;">완료일자</th>
						<th colspan="2" style="width:15%;">완료율(%)</th>
					</tr>				
					<c:if test="${empty dutyChargeList }" >
						<tr>
							<td colspan="7">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>				
					<c:forEach items="${dutyChargeList }" var="dutyCharge" varStatus="status">
						<tr style='font-size:0.85em;cursor:pointer;' onclick="OpenWindow('dutyChargeMain.do?unit_job_sn=${dutyCharge.unit_job_sn}','상세보기',620,670);">
							<td>${status.count }</td>
							<td>${dutyCharge.unit_job_nm }</td>
							<td>${dutyCharge.prjct_sj }</td>
					<c:set var="duty" value="${dutyCharge.myst}"/>
						<c:choose>
							<c:when test="${duty eq '지연'}">
								<td><div class="badge bg-danger" style="font-size: 12px; width: 50px; height: 20px;">${dutyCharge.myst }</div></td>
							</c:when>
							<c:when test="${duty eq '진행'}">
								<td><div class="badge bg-success" style="font-size: 12px; width: 50px; height: 20px;">${dutyCharge.myst }</div></td>
							</c:when>
							<c:when test="${duty eq '시작전'}">
								<td><div class="badge bg-warning" style="font-size: 12px; width: 50px; height: 20px;">${dutyCharge.myst }</div></td>
							</c:when>
							<c:when test="${duty eq '종료'}">
								<td><div class="badge bg-primary" style="font-size: 12px; width: 50px; height: 20px;">${dutyCharge.myst }</div></td>
							</c:when>
						</c:choose>
								<td><c:set var="bgnde" value="${dutyCharge.unit_job_bgnde }"/>${fn:substring(bgnde,0,10) }</td>
								<td><c:set var="endde" value="${dutyCharge.unit_job_endde }"/>${fn:substring(endde,0,10) }</td>
							<td style="width: 100px;">
		                      	 <div class="progress progress-m" style="margin:5px; ">
		                      	 <c:choose>
		                      	 	<c:when test="${dutyCharge.unit_job_pro eq 0 }">
		                          <div class="progress-bar bg-success" style="width: 0%;"></div>
		                      	 	</c:when>
		                      	 	<c:otherwise>
		                          <div class="progress-bar bg-success" style="width: ${dutyCharge.unit_job_pro }%;"></div>
		                      	 	</c:otherwise>
		                      	 </c:choose>
		                     </div>
		                     </td>
							<td>${dutyCharge.unit_job_pro }%</td>
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination3.jsp" %>
			</div>
		
		</div>
		
    </section>
    <!-- /.content -->
    <script>
    window.onload=function(){
    	$("[data-target='recruit-pblanc_wrter']").click(function(event){    		
    		OpenWindow('<%=request.getContextPath()%>/recruit/detail.do?id='
    				+$(this).text(),'상세보기',800,700);
    		return false;    		
    	});
    }
    
    
    function list_go2(page,url){
    	if(!url) url="dutycharge.do";
    	
    	var jobForm=$('#jobForm');
    	if(!page) page=1;
//    	var prjct_sn;
//    	if (!$("#prjct_sn").val()) {
//    		 prjct_sn = $("#prjct_sn").val();
//    		 jobForm.find("[name='prjct_sn']").val(prjct_sn);
//    	}
    	
    	jobForm.find("[name='page']").val(page);
//    	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
    	jobForm.find("[name='perPageNum']").val(10);
    	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
    	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
    	
    	jobForm.attr({
    		action:url,
    		method:'get'
    	}).submit();
    	
    }
    
    
    </script>

</body>





