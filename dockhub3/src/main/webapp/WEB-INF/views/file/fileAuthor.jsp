<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head></head>

<title>게시판목록</title>

<body>
<script>
function changeAuthor(file, option){
 	$.ajax({
		url:"<%=request.getContextPath()%>/filesave/changeAuthor.do?filesave_sn="+file+"&option="+option,
		type:"post",
		success : function(){
			alert("성공");
		},
		error : function(){
			alert("파일이동이 실패했습니다.");
		}
	});  
}
</script>
	<c:if test="${from eq 'regist'}">
		<script>
			alert("게시판 등록이 성공했습니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row" style="padding-top : 10px; padding-left : 10px">
	  			
	  				<h3>파일권한</h3>
	  			
	  				
<!-- 	  				<div style=" display: inline; position : fixed; right : 20px"> -->
<!-- 	  				<button type="button" class="btn btn-block btn-primary" id='saveAll' name='saveAll' style="background-color : #10316b; width :110px; border : 0px;" onClick="saveAll();">저장하기</button> -->
<!-- 	  				</div>  				 -->
	  				
	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
    <section class="content">		
		<div class="card">

			<div class="card-body">
				<table class="table table-bordered">				
					<tr style="text-align : center">
						<th>이름</th>
						<th>권한</th>
					</tr>
					<%-- <c:set var="fileList" value="${fileList2 }"/> --%>			
					<c:if test="${empty fileList2 }" >
						<tr>
							<td colspan="6">
								<strong>파일이 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${fileList2 }" var="file" varStatus="st">
						<input type="hidden" value="${file.filesave_sn }" >
						<tr style='font-size:0.85em;'>
							
							<td >${file.filesave_nm}</td>
							<td>
							<select id="select${st.count }" onchange="changeAuthor(${file.filesave_sn },this.options[this.selectedIndex].value)">
							    <option value="0">전체</option>
							    <option value="1">비공개</option>
							</select>
							</td>
							<script>
							$("#select${st.count } option:eq(${file.filesave_author_code})").attr("selected","selected");
							</script>
						</tr>
					</c:forEach>
				</table>				
			</div>
<!-- 			<div class="card-footer"> -->
<%-- 				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>				 --%>
<!-- 			</div> -->
		</div>
		
    </section>
    <!-- /.content -->

</body>







