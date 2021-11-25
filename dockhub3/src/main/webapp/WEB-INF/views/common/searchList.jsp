<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="searchList" value="${dataMap.searchList }" />


<title>프로젝트목록</title>

<body>
<script>
function fn_go2(prjct_sn){
	window.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M040000&prjct_sn="+prjct_sn;	
}
</script>
<!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>프로젝트 검색 목록</h1>  				
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
		<div class="card container-fluid" style="padding : 10px">
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
						<select class="form-control col-md-4" name="searchType" id="searchType" style="display:none">
<%-- 							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option> --%>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>작업유형</option>
<%-- 							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option> --%>
<%-- 							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option> --%>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="list_go8(1);" data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				
										
			</div>
			<div class="row">
			<c:choose>
				<c:when test="${fn:length(searchList) eq 0}">
					<div class="col-sm-9" style="min-height:760px">
						<div class="info-box">
			              <div class="info-box-content" style="text-align : center">
			              	해당하는 프로젝트가 존재하지 않습니다.
			              </div>
			              
			            </div>
			            <div class="card-footer" style="display:none">
							<%@ include file="/WEB-INF/views/common/searchpagination.jsp" %>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-sm-9">
						<c:forEach items="${searchList }" var="search">
							<div class="info-box">
				              <span class="info-box-icon bg-info" style=" width: 100px;height: 100px; margin-left : 20px">
				              <c:choose>
				              	<c:when test="${search.prjct_photo eq null}">
					              	<img style="width: 90px;height: 90px;"src="<%=request.getContextPath() %>/resources/images/project.JPG" class="img-circle elevation-2" alt="User Image">
				              	</c:when>
				              	<c:otherwise>
					                <img style="width: 90px;height: 90px;" src="<%=request.getContextPath() %>/pmsproject/getPicture.do?picture=${search.prjct_photo }" class="img-circle elevation-2" alt="User Image">
				              	</c:otherwise>
				              </c:choose>
				              </span>
				
				              <div class="info-box-content" onclick="fn_go2(${search.prjct_sn});" style="cursor:pointer">
				                <span class="info-box-text" style="margin-left : 30px; font-size : 1.3em">${search.prjct_sj }</span>
				                <span class="info-box-number" style="margin-left : 30px">
									<i class="markIcon far fa-bookmark"></i> 북마크 ${search.prjct_scrap_co } 
									<i class="likeIcon far fa-heart" style="margin-left : 30px; margin-right : 4px"></i>좋아요 ${search.prjctr_like_co }
								</span>
				              </div>
				              <!-- /.info-box-content -->
				            </div>
						</c:forEach>
						<c:set var="size" value="${5-fn:length(searchList) }" />
						<c:if test="${fn:length(searchList) ne 5}">
							<c:forEach begin="1" end="${size}" step="1" varStatus="status">
								<div class="info-box">
					              <span class="info-box-icon" style=" width: 100px;height: 100px;">
	
					              </span>
					
					              <div class="info-box-content">
					              </div>
					              <!-- /.info-box-content -->
					            </div>
							
							</c:forEach>
						</c:if>
						<div class="card-footer">
							<%@ include file="/WEB-INF/views/common/searchpagination.jsp" %>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

				<div class="col-sm-3">
					<table class="table table-hover text-nowrap">
	                  <thead>
	                    <tr>
	                      <th>작업유형코드</th>
	                    </tr>
	                  </thead>
	                  <tbody  style="cursor:pointer">
	                    <tr>
	                      <td onclick="typeCode(0)">오픈소스 프로젝트</td>
	                    </tr>
	                    <tr>
	                      <td onclick="typeCode(1)">교육 프로젝트</td>
	                    </tr>
	                    <tr>
	                      <td onclick="typeCode(2)">개인 프로젝트</td>
	                    </tr>
	                     <tr>
	                      <td onclick="typeCode(3)">작업 프로젝트</td>
	                    </tr>
	                  </tbody>
	                </table>
				
				</div>
			</div>
		
		</div>
		
    </section>
    <!-- /.content -->
<script>
function typeCode(type){
	var jobForm=$('#jobForm');
	jobForm.find("[name='type_code']").val(type);
	$("[name='searchType']").val('tc').prop("selected",true);
	list_go7();
}


</script>
    
</body>





