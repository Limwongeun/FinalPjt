<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color : #282c2f; font-family: Noto Sans KR;">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath() %>/index.do?mCode=M010000&prjct_sn=" class="brand-link" style="border-bottom:none;">
      <img src="<%=request.getContextPath() %>/resources/images/DockHub_Logo.png" alt="DockHub_Logo" style="width :215px;padding-left:6px;">
      <span class="brand-text font-weight-light"></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<%=request.getContextPath() %>/member/getPicture.do?picture=${loginUser.mber_photo }" class="img-circle elevation-2" alt="User Image" style="width: 80px;height:80px">
        </div>
        <div class="info">
          <div class="row">
              <a href="javascript:OpenWindow('<%=request.getContextPath() %>/member/detail.do?mber_sn=${loginUser.mber_sn }&from=aside','내정보','800','935');" class="d-block" style="font-weight:bold;font-size:17px; margin-left: 9px;">이  름: ${loginUser.mber_nm }</a>&nbsp;&nbsp;
         </div>
         <div class="row">  
         <a href="javascript:OpenWindow('<%=request.getContextPath() %>/member/detail.do?mber_sn=${loginUser.mber_sn }&from=aside','내정보','800','935');" class="d-block" style="font-size:12px;padding-top:5px; margin-left: 10px;">닉네임 : ${loginUser.mber_ncnm }</a>       
         </div>
<%--            	<a href="tel:${loginUser.mber_moblphon_no }" style="margin-left:-5px;">Tel : ${loginUser.mber_moblphon_no }</a><br/> --%>
			<button onclick="location.href='<%=request.getContextPath() %>/common/logout.do';" 
              	class="btn btn-xs btn-primary col-xs-3 " type="button" style="margin-top:6px;">LOGOUT</button>
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