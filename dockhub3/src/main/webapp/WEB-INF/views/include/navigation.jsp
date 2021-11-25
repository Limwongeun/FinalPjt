<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="font-family: Noto Sans KR;z-index: 0;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <c:forEach items="${menuList }" var="menu">      
      
      <li class="nav-item d-none d-sm-inline-block">
        <a href="javascript:subMenu('${menu.mcode }');goPage('${menu.murl }','${menu.mcode }');" class="nav-link">${menu.mname }</a>
      </li>
            
      </c:forEach>
      
      
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">

      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block" style="display: none; padding-right: 0px;">
          <form class="form-inline">
          	<input type='hidden' name="page" value="" />
			<input type='hidden' name="perPageNum" value=""/>
			<input type='hidden' name="searchType" value="" />
			<input type='hidden' name="keyword" value="" />
            <div class="input-group input-group-sm">
              <input id="searchInput"class="form-control form-control-navbar"style="margin-left: 400px;height:40px" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="button" onclick="goSearch()">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" id="closeSearch" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
      
	  <li class="nav-item">
	  	<a class="nav-link" href="javascript:OpenWindow('<%=request.getContextPath() %>/myFile/icon.do','파일보관함',1100,610);" role="button">

	      <i class="fas fa-folder-open"></i>
    	</a>

	  </li>
      <!-- Messages Dropdown Menu -->
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link" data-toggle="dropdown" href="#"> -->
<!--           <i class="far fa-comments"></i> -->
<!--           <span class="badge badge-danger navbar-badge">3</span> -->
<!--         </a> -->
<!--         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             Message Start -->
<!--             <div class="media"> -->
<!--               <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle"> -->
<!--               <div class="media-body"> -->
<!--                 <h3 class="dropdown-item-title"> -->
<!--                   Brad Diesel -->
<!--                   <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
<!--                 </h3> -->
<!--                 <p class="text-sm">Call me whenever you can...</p> -->
<!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             Message End -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             Message Start -->
<!--             <div class="media"> -->
<!--               <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
<!--               <div class="media-body"> -->
<!--                 <h3 class="dropdown-item-title"> -->
<!--                   John Pierce -->
<!--                   <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span> -->
<!--                 </h3> -->
<!--                 <p class="text-sm">I got your message bro</p> -->
<!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             Message End -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             Message Start -->
<!--             <div class="media"> -->
<!--               <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
<!--               <div class="media-body"> -->
<!--                 <h3 class="dropdown-item-title"> -->
<!--                   Nora Silvester -->
<!--                   <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span> -->
<!--                 </h3> -->
<!--                 <p class="text-sm">The subject goes here</p> -->
<!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             Message End -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item dropdown-footer">See All Messages</a> -->
<!--         </div> -->
<!--       </li> -->
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">${cnt }</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-header">새 알림 목록</span>
          <div class="dropdown-divider"></div>
          <c:forEach items="${notificationList }" var="list">
	          <div class="dropdown-divider text-white"></div>
	          <a href="" class="dropdown-item" style="font-size: 14px;" onclick="RemoveAlram('${list.mber_ntcn_sn}');">
	            <i class="fas fa-envelope mr-2"></i>
			              일정명: ${list.mber_schdul_nm } 
			      <br>        
			              시간 : ${list.mber_ntcn_time }
	          </a>
            </c:forEach>
            
     <!--      <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a> -->
        </div>
      </li>

      <li class="nav-item" style="margin-left: 10px;">
<!--         <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button"> -->
<!--           <i class="fas fa-th-large"></i> -->
<!--         </a> -->


		
			<input type="button" class="btn btn-block btn-secondary btn" onclick="fn_go('sns')" value="SNS">



		
		
      </li>
    </ul>
  </nav>

  <!-- /.navbar -->
  
  <script>
  function RemoveAlram(mber_ntcn_sn){
	   $.ajax({
	       url : '<%=request.getContextPath()%>/updateNotification',
	      data : {"mber_ntcn_sn":mber_ntcn_sn},
	      dataType : 'json',
	      success: function(data){
	      },
	      error : function(error){
	      }
	   });
	}
  </script>
