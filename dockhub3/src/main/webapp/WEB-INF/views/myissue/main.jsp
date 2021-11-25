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

					<div class="input-group row" style="    padding: 0px 10px 10px 10px; float:right; width:500px; margin-right: 21px;">						
						<select class="form-control col-md-4" name="searchType" id="searchType" style="margin-left: 6.1%;">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" style="width: 115px";/>
<!-- 						<span class="input-group-append" style="margin-right: 60%"> -->
						<span class="input-group-append" style="">
							<button class="btn btn-primary" type="button"  
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>	
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
		<input type="hidden" id="filePage" name="filePage"value="1">
		<input type="hidden" name="mber_sn" id="mber_sn" value="${mber_sn}">
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

function openClose(){
	$("#filePage").val(1);
	$('.issueLi').empty();
	var mber_sn = $("#mber_sn").val();
	getPage("<%=request.getContextPath()%>/mypage/listClose/"+mber_sn+"/"+1);
}
	</script>
<%@ include file="./listOpen.jsp" %>
</body>
</html>