<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left : 0px; background-color : white; font-family: Noto Sans KR;">
    <a href="<%=request.getContextPath() %>/sns.do?mCode=S000000&prjct_sn=">
    <img src="<%=request.getContextPath() %>/resources/images/DockHub_LogoBK.png" alt="DockHub_LogoBK" style="width :234px;">
    </a>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">


      <!-- Messages Dropdown Menu -->
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link" data-toggle="dropdown" href="#"> -->
<!--           <i class="far fa-comments fa-lg" ></i> -->
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
      <li class="nav-item dropdown" style="margin-right: 10px;">
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
      <li class="nav-item" style=" margin-right: 10px;">
      	<button onclick="location.href='<%=request.getContextPath() %>/common/logout.do';"
      	class="btn btn-block btn-info btn" type="button" style="margin-right: 20px;">LOGOUT</button>
      </li>
      
      <li class="nav-item">
<!--         <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button"> -->
<!--           <i class="fas fa-th-large"></i> -->
<!--         </a> -->
		<input type="button" class="btn btn-block btn-secondary btn" onclick="fn_go('index')" value="PMS">
      </li>
    </ul>
  </nav>
    
    
    
    
    
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left : 0px; background-color : #282c2f; font-family: Noto Sans KR;  z-index: 2;">
    <!-- Left navbar links -->
    <div style="margin-left : 200px;">
    <ul class="navbar-nav">
      <li class="nav-item">
        
      </li>

      <c:forEach items="${menuList }" var="menu">      
      
      <li class="nav-item d-none d-sm-inline-block"  style="margin-left : 100px;">
        <a href="javascript:subMenu('${menu.mcode }');goPage('${menu.murl }','${menu.mcode }');" class="nav-link" style="color : #c2c7d0; font-weight: bold">${menu.mname }</a>
      </li>
            
      </c:forEach>
      
    </ul>
	</div>
   
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
  