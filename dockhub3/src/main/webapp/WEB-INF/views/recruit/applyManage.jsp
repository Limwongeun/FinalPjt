<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
   <c:if test="${from eq 'remove' }" >
    <script>
   		alert("삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
   </c:if>	
	<script type="text/javascript">
		function change_parent_url(url) {
			window.location.href = url;
		}
	</script>
   
  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:730px;">
   <section class="content-header" style="padding-bottom: 0px;padding-left: 107px;">
		<c:if test="${recruit.pblanc_wrter eq mber_sn}">
			<div>
				<a href="javascript:change_parent_url('<%=request.getContextPath()%>/notification/detail?pblanc_sn='+${recruit.pblanc_sn });"
					style="padding: 5px 10px 5px 10px; display: inline-block; border-radius: 10px; transition: all 0.1s;color : black; float : left">
					상세보기</a>
			</div>
			<div>
				<a href="javascript:change_parent_url('');"
					style="padding: 5px 10px 5px 9px; display: inline-block; transition: all 0.1s; color : black;border : 2px solid #282c2f; background-color : #282c2f;border-radius : 3px;color : white;border-bottom : 0px">
					신청 관리</a>
			</div>
		</c:if>
	</section>
      <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
		<div class="col-md-9">
			<div class="card card-outline card-info" style="border-top: 3px solid #215287;">
              <div class="card-header">
                <h3 class="card-title"  style="margin-top: 7px;">신청자 목록</h3>
				<div class="card-tools">
				    <button type="button" id="listBtn" class="btn btn-default" style="border-color: #ddd;" onclick="CloseWindow();">닫 기</button>
			    </div>
              </div>
              <!-- /.card-header -->
	     
	
				<div class="card-body">
	                <div class="table-responsive p-0">
						<div id="myRecruitApplyList">
						
						</div>
	
	              </div>
					<div class='text-center'>
						<ul id="myRecruitApplyPagination" class="pagination justify-content-center m-0" >
					
						</ul>
					</div>
              </div>
            </div>

		</div>
		</div>
		
	<input type="hidden" name="pblanc_sn" id="pblanc_sn"value="${recruit.pblanc_sn }" />
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<%@ include file="./applyManage_js.jsp" %>


</body>








