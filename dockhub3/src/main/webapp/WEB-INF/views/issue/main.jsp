<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
$(document).ready(function(){
	
})
</script>
<style>
html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}

/*tab css*/
.tab{float:left;  height:290px; width:100%;}
.tabnav{font-size:0; width:100%; border:1px solid #ddd;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#10316b;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#10316b; }
.tabcontent{padding: 20px;  border:1px solid #ddd; border-top:none;}
</style>


</head>
<body>
<c:if test="${from eq 'regist'}" >
		<script>
	    	alert("이슈 등록을 성공했습니다."); 
	    	window.opener.location.reload();	
	    	window.close();
    	</script>
</c:if>

<c:if test="${from eq 'update'}" >
		<script>
	    	alert("이슈 수정을 성공했습니다."); 
	    	window.opener.location.reload();	
	    	window.close();
    	</script>
</c:if>

<c:if test="${from eq 'delete'}" >
		<script>
	    	alert("이슈 삭제를 성공했습니다."); 
	    	window.opener.location.reload();	
	    	window.close();
    	</script>
</c:if>

<c:if test="${from eq 'end'}" >
		<script>
	    	alert("이슈  종료를 성공했습니다."); 
	    	window.opener.location.reload();	
	    	window.close();
    	</script>
</c:if>

<c:if test="${from eq 're'}" >
		<script>
	    	alert("이슈  재시작을 성공했습니다."); 
	    	window.opener.location.reload();	
	    	window.close();
    	</script>
</c:if>



	<script type="text/javascript">
		function change_parent_url(url) {
			window.location.href = url;
		}
	</script>
	<script type="text/javascript">
		function openUrl(url) {
			window.location.href = url;
		}
	</script>
	<div>
		<a href="javascript:change_parent_url('');"	style="
			display: inline-block;
			width: 78px;
			text-align: center;
			float: left;
			color: black;
			padding: 10px;
			border-left: 1px solid #ccc;
			font-weight:700;
			border-bottom:1px solid white;">이슈</a>
	</div>
	<div>
		<a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list?prjct_sn='+${prjct_sn});"
			style="text-decoration: none;
	      	display:inline-block;
			border-top:1px solid #ccc;
			border-right: 1px solid #ccc;
			border-left:1px solid #ccc;
			border-bottom:1px solid #ccc;
	      	width: 78px;
			background: #eee;
			text-align: center;
			padding: 12px 1px 10px 1px;
			height: 48px;
			color: black;
			font-weight: 700;">마일스톤</a>
	</div>
	<section class="content-header" style=" border-top: 1px solid #ccc; margin-left: 155px; margin-top:-1px;">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1 style="margin-left: -29%;">이슈</h1>
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
		<div class="card" style="box-shadow:none;">
			<div class="card-header with-border" style="z-index: 1; border-bottom:none; margin-bottom: -26px;">

					<div class="input-group row" style="    padding: 0px 10px 10px 10px; float:left; width:500px;">						
						<select class="form-control col-md-4" name="searchType" id="searchType" style="margin-left: 6.1%;">
							<option value="iw"  ${cri.searchType eq 'iw' ? 'selected':'' }>전 체</option>
							<option value="i" ${cri.searchType eq 'i' ? 'selected':'' }>이슈 제목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" style="width: 115px";/>
<!-- 						<span class="input-group-append" style="margin-right: 60%"> -->
						<span class="input-group-append" style="">
							<button class="btn btn-primary" type="button" data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>	

				<button type="button" class="btn btn-primary" id="registBtn"
					onclick="OpenWindow('<%=request.getContextPath() %>/issue/registForm.do?prjct_sn=${prjct_sn }','이슈등록',800,700,'registForm');" style="float: right; margin-right: 3.3%; background-color: #215287; border-color: #215287;">이슈 등록</button>
			</div>
		  </div>
<div style=" width:90%; margin:0 auto;">
  <div class="tab">
    <ul class="tabnav">
      <li><a href="#tab01"  id='openI' name='openI'onClick="openOpen();">open</a></li>
      <li><a href="#tab02"  id='openC' name='openC'  onClick="openClose();">close</a></li>
    </ul>
    <div class="tabcontent">
<!--       <div id="tab01">tab1 content</div> -->
<!--       <div id="tab02">tab2 content</div> -->
		<div>
		</div>
		<input type="hidden" id="filePage" name="filePage"value="1">
		<input type="hidden" name="prjct_sn" id="prjct_sn" value="${prjct_sn}">
		<div id="issueDiv">
		
		</div>

			<ul id="pagination" class="pagination justify-content-center m-0" ></ul>

	</div>
</div>
  </div>

	</section>
	<!-- /.content -->
	<script>
	
$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
});
	</script>
<%@ include file="./listOpen.jsp" %>
</body>
</html>