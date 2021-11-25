<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color : #10316b">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<%=request.getContextPath() %>/resources/images/logozzin.png" alt="AdminLTE Logo" style="width :234px;">
      <span class="brand-text font-weight-light"></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<%=request.getContextPath() %>/member/getPicture.do?picture=${loginUser.mber_photo }" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <div class="row">
              <a href="javascript:OpenWindow('<%=request.getContextPath() %>
              /member/detail.do?id=${loginUser.mber_id }','내정보','800','700');" class="d-block">${loginUser.mber_nm }</a>&nbsp;&nbsp;
              <button onclick="location.href='<%=request.getContextPath() %>/common/logout.do';" 
              	class="btn btn-xs btn-primary col-xs-3 " type="button" >LOGOUT</button>
         </div>
         <div class="row">  
         <a href="javascript:OpenWindow('<%=request.getContextPath() %>
              /member/detail.do?id=${loginUser.mber_id }','내정보','800','700');" class="d-block">닉네임 : ${loginUser.mber_ncnm }</a>       
           	
         </div>
           	<a href="tel:${loginUser.mber_moblphon_no }">tel : ${loginUser.mber_moblphon_no }</a><br/>
           	
        </div>
      </div>
      
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" role="menu" data-accordion="false">
                    
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

</body>
</html>