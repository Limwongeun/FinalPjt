<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
#tabcontent {
	display: block;

	padding: 6px 12px;
}
a{
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
a:visited { 
	color: black; 
	text-decoration: none;
	
	}


li {
	float: left;
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
}
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('li').css('background-color', 'white');
			$(this).css('background-color', 'grey');
			$.ajax({
				url : activeTab ,    //탭의 data-tab속성의 값으로 된 html파일로 통신
				type:"post",
				contentType:'application/json',
				error : function() {          //통신 실패시
					alert('통신실패!');
				},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();          
	});
</script>
</head>
<body>
<div id="container">
		<ul class="tab">
			<li data-tab="<%=request.getContextPath() %>/notification/list.do" class='tabmenu' id="default"><a href="#">TabExample1</a></li>
			<li data-tab="tab2" class='tabmenu'><a href="#">TabExample2</a></li>
			<li data-tab="tab3" class='tabmenu'><a href="#">TabExample3</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>
</body>
</html>