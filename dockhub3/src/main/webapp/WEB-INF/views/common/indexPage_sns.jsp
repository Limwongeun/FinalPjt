<%@page import="kr.or.ddit.dto.MenuVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>

</head>
<title>Dock-Hub</title>

  
<body>
  <div class="content-wrapper" style="background-color:#fff; margin-left : 0px;heigth : 730px !important" >
  
  	<iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>
  
  </div>


<!-- REQUIRED SCRIPTS -->
<script>
function subMenu(mCode, prjct_sn){
	//alert("function call sumMenu()"+mCode);	
 	if(mCode!="M000000"){ 
		$.getJSON("subMenu.do?mCode="+mCode,function(data){
			//console.log(data);
			let tempData = []
			$.each(data, function(i,v){
				v.prjct_sn = prjct_sn
				tempData.push(v);
			});
			//console.log(tempData)
// 			printData(data,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');
			printData(tempData,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');
			
 		}); 
	}else{
		$('.subMenuList').html("");		
	}
}

function goPage(url,mCode,prjct_sn){
	  // HTML5 지원브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
	    
	    if (mCode != 'M000000') {
	        renewURL += "?mCode="+mCode+"&prjct_sn="+prjct_sn;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);
	 
	} else {
	    location.hash = "#"+mCode;
	}
	$('iframe[name="ifr"]').attr("src","<%=request.getContextPath()%>"+url+"?prjct_sn="+prjct_sn);
}

//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printData(dataArr,target,templateObject,removeClass,prjct_sn){
	
	var template=Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}

</script>



<!-- handlebars  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}
	<li class="nav-item subMenu" >
      	<a href="javascript:goPage('{{murl}}','{{mcode}}', '{{prjct_sn}}');" class="nav-link">
          <i class="{{micon}}"></i>
             <p>{{mname}}</p>
        </a>
  	</li>
{{/each}}
</script>


<script>
window.onload=function(){
	goPage('${menu.murl}','${menu.mcode}', '${prjct_sn}');
	subMenu('${menu.mcode}'.substring(0,3)+"0000", '${prjct_sn}');
}
</script>

</body>