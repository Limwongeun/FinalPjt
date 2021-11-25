<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap2.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="recruitList" value="${dataMap2.recruitList }" />

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
			<li class='tabmenu' id="default" style="background-color : grey"><a href="<%=request.getContextPath() %>/notification/list.do">공고목록</a></li>
			<li class='tabmenu'><a href="<%=request.getContextPath() %>/notification/myList.do">작성한 공고</a></li>
			<li class='tabmenu'><a href="<%=request.getContextPath() %>/notification/myMeeting.do">신청한 공고</a></li>
		</ul>
</div>


	
	<c:if test="${from eq 'regist'}" >
		<script>
    	alert("공고 등록이 성공했습니다."); 
    	window.opener.location.reload();	
    	window.close();
    	</script>
    </c:if>
	 	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공고 목록</h1>  				
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
				<div class="row">
					<div id="keyword" class="input-group row" style="width:540px;">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
					  		onchange="list_go();" style="display:none">
					  		<option value="10" >정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  		<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
					  		
					  	</select>						
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="list_go(1);" data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<div style="margin-left : auto">						
						<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','공지등록',800,700);">공고등록</button>				
					</div>
				</div>
				
										
			</div>
			<div class="card-body" style="padding-top: 10px;">
				<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap" >	
				<thead>				
					<tr style="font-size:0.95em;">
						<th style="width:10%;text-align:center">번 호</th>
						<th style="width:50%;text-align:center">제 목</th>
						<th style="width:15%;text-align:center">작성자</th>
						<th style="text-align:center">조회수</th>
						<th style="text-align:center">등록일자</th>
						
<!-- 						<th style="width:10%;">마감일자</th> -->
					</tr>
				</thead>	
				  <tbody>			
					<c:if test="${empty recruitList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>				
					<c:forEach items="${recruitList }" var="recruit" varStatus="status">
						<tr style='font-size:0.85em;cursor:pointer;' onclick="OpenWindow('<%=request.getContextPath() %>/notification/detail.do?pblanc_sn=${recruit.pblanc_sn }&from=list','상세보기',800,780);">
							
							<td style="text-align:center">${recruit.pblanc_sn }</td>
							<td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden; 
												white-space: nowrap; text-overflow: ellipsis;">
							${recruit.pblanc_sj }
							</td>			
							<td  style="text-align:center" data-target="recruit-pblanc_wrter">${recruit.mber_ncnm}</td>	
							<td style="text-align:center">${recruit.pblanc_rdcnt }</td>
							<td style="text-align:center">${recruit.pblanc_rgsde }	 
<%-- 								<fmt:formatDate value="${recruit.pblanc_rgsde }" /> --%>
							</td>
<%-- 							<td><c:set var="clos_de" value="${recruit.pblanc_clos_de }"/> --%>
<%-- 							${fn:substring(clos_de,0,10) } --%>
<!-- 							</td>		 -->
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
		
		</div>
		
    </section>
    <!-- /.content -->
    <script>
    window.onload=function(){
//     	$("[data-target='notice-writer']").click(function(event){    		
    	$("[data-target='recruit-pblanc_wrter']").click(function(event){    		
    		OpenWindow('<%=request.getContextPath()%>/recruit/detail.do?id='
    				+$(this).text(),'상세보기',800,700);
    		return false;    		
    	});
    }
    
    
    </script>
    
</body>





