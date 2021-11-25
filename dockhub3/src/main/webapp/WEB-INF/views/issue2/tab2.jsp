<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script type="text/javascript">
        function change_parent_url(url)
        {
	    window.location.href=url;
        }		
    </script>
   <div><a href="javascript:change_parent_url('');" 
    	style= "text-decoration: none;
      	color:white;
      	padding:5px 10px 5px 10px;
      	margin:10px;
      	display:inline-block;
      	border-radius: 10px;
      	transition:all 0.1s;
      	text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      	background-color: #1f75d9; 
		border-bottom:2px solid #165195;
		float:left;"> 
		이슈</a></div>			
    <div><a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list?prjct_sn='+${prjct_sn});"
    	style= "text-decoration: none;
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
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>이슈</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
    
<%-- <a href="javascript:change_parent_url('<%=request.getContextPath()%>/mile/list?prjct_sn='+${prjct_sn});" --%>
<!-- style= "text-decoration: none; -->
<!--       font-size:2rem;  -->
<!--        	color:white;  -->
<!--        	padding:5px 10px 5px 10px;  -->
<!--        	margin:10px;  -->
<!--        	display:inline-block;  -->
<!--        	border-radius: 10px;  -->
<!--        	transition:all 0.1s;  -->
<!--        	text-shadow: 0px 0px rgba(0, 0, 0, 0.44);  -->
<!--        	background-color: #ff521e;  -->
<!--        	border-bottom:5px solid #c1370e;  -->
<!--       	border-bottom:2px solid #c1370e;">  -->
<!-- 	마일스톤 </a> -->


<!-- 	<button>이슈</button> -->
<%-- 	<button onclick="location.href='<%=request.getContextPath()%>/mile/tab1'">마일스톤</button> --%>
<!-- 	여기는 이슈 -->
</body>
</html>