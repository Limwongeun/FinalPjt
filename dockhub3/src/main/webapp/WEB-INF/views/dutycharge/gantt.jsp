<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
text{
	font-size: 14px;
}
</style>
  <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-core.min.js" type="text/javascript"></script>
  <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-gantt.min.js" type="text/javascript"></script>
  <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-exports.min.js"></script>
  <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-ui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.anychart.com/releases/8.10.0/css/anychart-ui.min.css"/>
  
	<link rel="stylesheet" href="https://cdn.anychart.com/releases/8.10.0/fonts/css/anychart-font.min.css">
	<script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-base.min.js"></script>
	<script src="https://cdn.anychart.com/releases/8.10.0/locales/ko-kr.js"></script>
  
  
  <script type="text/javascript">
  var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
  var globalData;
  var globalChart;
  var globalTreeData;
  
  anychart.onDocumentReady(function () {    	
	    // create data
	    // 한국어 패치
		var format ="yyyy'-'MM'-'dd'T'HH':'mm':'ss";
		var locale = "ko-kr";
		anychart.format.inputLocale("ko-kr");
		anychart.format.outputLocale("ko-kr");
		anychart.format.outputDateTimeFormat("yyyy'-'MM'-'dd'");
		
		var timeZoneOffset = new Date().getTimezoneOffset();
		var prjct_sn = $('#prj').val()
    	  $.ajax({
	    	url : contextPath + '/pmsDuty/list?prjct_sn=' + prjct_sn,
	    	method: 'get',
	    	success:function(dutyList){
	    		data = [];
	    		$.each(dutyList, function(i,res){
	    			var temp =	{
	    					id : res.unit_job_sn,
	    					name : res.unit_job_nm,
	    					actualStart : res.unit_job_bgnde,
	    					actualEnd : res.unit_job_endde,
	    					progressValue : res.unit_job_pro / 100,
	    					manager : res.mber_ncnm,
	    					user_sn : res.user_sn
	    				}
	    			data.push(temp);
	    		})
	    		//--------------------------------
	    		var treeData = anychart.data.tree(data, "as-table");  
	    		
	    		if(treeData) globalTreeData = treeData;
	    		
	    		$('#test').attr('value',data)
	    		$('#test1').attr('value',treeData)
	    		
	    		
				
	    		// 나중에 쓸 수도 있을만한 기능(svg태그 내 선택자)
// 	    		var itt = treeData.search('id','1');
// 	    		itt.set('name','바꾸기')
// 				itt.remove();
	    		
			    // create a chart
			    var chart = anychart.ganttProject();
			    
			    // 차트 높이 설정
			    chart.defaultRowHeight(35);
			    
			    if(chart) globalChart = chart;
			    // set the data
			    chart.data(treeData);
			    // set the container id
			    chart.container("container");  
			    // initiate drawing the chart
			    chart.draw();
			    // fit elements to the width of the timeline
			    chart.fitAll();
			    
			    // 오늘 일시 라인 생성
			    var marker_1 = chart.getTimeline().lineMarker(0);
			    marker_1.value(new Date());
			    marker_1.stroke("2 #dd2c00");
			    
			    // 컬럼 추가
			    var column_0 = chart.dataGrid().column(0);
			    var column_1 = chart.dataGrid().column(1);
			    var column_2 = chart.dataGrid().column(2);
			    var column_3 = chart.dataGrid().column(3);
			    
			    // 컬럼 세팅
			    column_0.title("번호")
			    column_0.title().fontColor("#64b5f6")
			    column_0.title().fontWeight(600);
			    column_1.title("작업명")
			    column_1.title().fontColor("#64b5f6")
			    column_1.title().fontWeight(600);
			    column_2.title("완료율 (%)")
			    column_2.title().fontColor("#64b5f6")
			    column_2.title().fontWeight(600);
			    column_3.title("담당자")
			    column_3.title().fontColor("#64b5f6")
			    column_3.title().fontWeight(600);
			    column_2.setColumnFormat("progressValue", "percent");
			    column_3.setColumnFormat("manager", "string");
			    
			    
			     // 더블 클릭 이벤트 - 수정, 삭제 모달
			    chart.listen('rowDblClick', function(e) {
			    	e.preventDefault();
			    	var item = e.item;
			    	var start = item.get('actualStart').split(" ")
			    	var end = item.get('actualEnd').split(" ")
			    	var progress = (item.get('progressValue') * 100)
			    	$('#pro').attr("value", progress)
			    	var manager = item.get('user_sn')
			    	$('#ma').attr("value", manager)
			    	$("#modifyDutyModal").find("#unit_job_sn").attr("value", item.get('id'))
			    	$("#modifyDutyModal").find("#unit_job_nm").attr("value", item.get('name'))
			    	$("#modifyDutyModal").find("#user_sn").find("option[value=" + manager + "]").attr("selected", "true")
			    	$("#modifyDutyModal").find("#unit_job_pro").find("option[value="+ progress + "]").attr("selected", "true")
			    	$("#modifyDutyModal").find("#unit_job_bgnde").attr("value", start[0])
			    	$("#modifyDutyModal").find("#unit_job_endde").attr("value", end[0])
			    	
// 			    	alert("JobSn : " + item.get('id') + " 업무명 : " + item.get('name') + " 담당자 : " +item.get('manager') + " 완료율 : " + (item.get('progressValue') * 100) + "%")
			       openModifyModal();
			    });
			    
			    
			    
			    var dataGrid = anychart.standalones.dataGrid();
			    dataGrid.data(treeData)
			    
			    chart.edit(true);
			    
			    
			    // 툴팁 변경
			    chart.dataGrid().tooltip().useHtml(true);    
				chart.dataGrid().tooltip().format(
				  "<span style='font-weight:600;font-size:12pt'>" +
				  "{%actualStart}{dateTimeFormat:MMM dd}일 - " +
				  "{%actualEnd}{dateTimeFormat:MMM dd}일</span><br><br>" +
				  "완료율(%) : {%progress}<br>" +
				  "담당자 : {%manager}"
				);
			    chart.getTimeline().tooltip().useHtml(true);    
			    chart.getTimeline().tooltip().format(
			      "<span style='font-weight:600;font-size:12pt'>" +
			      "{%actualStart}{dateTimeFormat:MMM dd}일 - " +
			      "{%actualEnd}{dateTimeFormat:MMM dd}일</span><br><br>" +
			      "완료율(%): {%progress}<br>" +
			      "담당자: {%manager}"
			    );
				// 타임라인 표시 변경(%)
				// access the timeline
				var timeline = chart.getTimeline();
				
				// configure labels of tasks
				timeline.tasks().labels().useHtml(true);
				timeline.tasks().labels().format(function() {
				  if (this.progress == 1) {
				    return "<span style='color:#64b5f6'>COMPLETE</span>";
				  } else {
				    return "<span style='color:#64b5f6'>" +
				           this.progress * 100 + "</span>%";
				  }
				});
				

				chart.autoRedraw(true);
				
			    // 간트 차트 쪼개기(구역 설정)
			    chart.splitterPosition("35.5%");
			    // Maximum 날짜 표시 - 연말
			    chart.getTimeline().scale().maximum("2021-12-31");
	    		//---------------------------------
				
				
			    
	    	},
	    	error: function(){
	    		alert("실패")
	    	},
	    	dataType:"json"
	    });
    	  
	    
  });  
  

  
  function openRegistModal(){
	$('#registDutyModal').modal('show');
}
  function openModifyModal(){
	$('#modifyDutyModal').modal('show');
}
  function saveDuty(){
	  var form = $('form[name="registForm"]');
	  var unit_job_nm = $('#registDutyModal').find('#unit_job_nm').val()
	  var user_sn = $('#registDutyModal').find('#user_sn').val()
	  var unit_job_bgnde = $("#registDutyModal").find("#unit_job_bgnde").val()
  	  var unit_job_endde = $("#registDutyModal").find("#unit_job_endde").val()
	  if(!unit_job_nm){
		  alert("제목 입력은 필수 입니다.")
		  return;
	  }
	  if(user_sn == 0){
		  alert("담당자 지정은 필수 입니다.")
		  return;
	  }
	  if(unit_job_bgnde == "" || unit_job_endde == ""){
		  alert("날짜 지정은 필수 입니다.")
		  return;
	  }
	  form.submit();
  }
  function modifyDuty(){
	  var form = $('form[name="modifyForm"]');
	  form.submit();
  }
  
  function deleteDuty(){
	  var unit_job_sn = $("#modifyDutyModal").find("#unit_job_sn").val()
	  var prjct_sn = $("#modifyDutyModal").find("#prjct_sn").val()
	  if(confirm("정말 삭제 하시겠습니까?")){
		location.href="<%=request.getContextPath()%>/pmsDuty/remove?prjct_sn="+prjct_sn+"&unit_job_sn="+unit_job_sn		  
	  }
  }
  function cancelRegistModal(){
	var progress = $('#pro').val()
	var manager = $('#ma').val()
	  
	$("#registDutyModal").find("#unit_job_nm").val("")
	
   	$("#registDutyModal").find("#user_sn").val("0")
   	$("#registDutyModal").find("#unit_job_pro").val("0")
   	$("#registDutyModal").find("#unit_job_bgnde").val("")
  	$("#registDutyModal").find("#unit_job_endde").val("")
	$('#registDutyModal').modal('hide');
  }
  function cancelModifyModal(){
	var progress = $('#pro').val()
	var manager = $('#ma').val()
	$("#modifyDutyModal").find("#user_sn").find("option[value=" + manager + "]").removeAttr("selected")
   	$("#modifyDutyModal").find("#unit_job_pro").find("option[value="+ progress + "]").removeAttr("selected")
   	$("#modifyDutyModal").find("#unit_job_bgnde").removeAttr("value")
  	$("#modifyDutyModal").find("#unit_job_endde").removeAttr("value")
  	$('#modifyDutyModal').modal('hide');
  }
</script>

</head>
<body>
<section class="content-header">
  	<div class="container-fluid">
  		<div class="row md-2">
  			<div class="col-sm-6">
  				<h1>단위 업무</h1>
  			</div>
  			<div class="col-sm-6" style="text-align:right;">
  				
<%--   				<h4 class="breadcrumb-item active">${project.prjct_sj }</h4> --%>
  			</div>
  		</div>
  	</div>
</section>
<div style="text-align:right;">
	<button class="btn-sm btn-info" onclick="zoomIn()">확대</button>
	<button class="btn-sm btn-info" onclick="zoomOut();">축소</button>
	<button class="btn-sm btn-success" onclick="openRegistModal()">생성</button>
</div>
  <div id="helper"></div>
<div id="editor-container"></div>
<div id="container-wrapper">
    <div id="container" style="height: 600px;"></div>
</div>
<input id="test" type="hidden" value="">
<input id="test1" type="hidden" value="">
<input id="pro" type="hidden" value="">
<input id="ma" type="hidden" value="">
<div class="modal fade" id="registDutyModal" tabindex="-1" aria-labelledby="registDutyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="addDutyModalLabel">단위업무 등록</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="gitDutyModal labelmodal modal-body container-fluid">
      	<form name="registForm" action="<%=request.getContextPath()%>/pmsDuty/regist.do">
	      	<div class="dutyNameArea">
		      	<label for="dutyName">단위 업무명</label><br/>
		      	<input id="unit_job_nm" name="unit_job_nm" type="text">
	      	</div><br/>
	      	<div class="dutyProArea">
		      	<label for="proSelect">진행률(%): </label>
				<select id="unit_job_pro" name="unit_job_pro">
				    <option value="0">0%</option>
				    <option value="10">10%</option>  
				    <option value="20">20%</option>
				    <option value="30">30%</option> 
				    <option value="40">40%</option> 
				    <option value="50">50%</option>
				    <option value="60">60%</option>
				    <option value="70">70%</option>
				    <option value="80">80%</option>
				    <option value="90">90%</option>
				    <option value="100">100%</option>
			    </select>
	      	</div>
	      	<div class="memNcnmArea">
		      	<label for="memNcnm">담당자</label><br/>
				<select id="user_sn" name="user_sn">
						<option value="0" hidden="true"></option>
				    <c:forEach items="${userList }" var="list">
				    	<option value="${list.user_sn }">${list.mber_ncnm }</option>
				    </c:forEach>
			    </select>
	      	</div>
	      	<div class="startDate">
	      		<label for="unit_job_bgnde">시작일</label><br/>
	      		<input id="unit_job_bgnde" name="unit_job_bgnde" type="date">
	      	</div>
	      	<div class="endDate">
	      		<label for="unit_job_endde">마감일</label><br/>
	      		<input id="unit_job_endde" name="unit_job_endde" type="date">
	      	</div>
	      	<div>
	      		<input id="unit_job_sn" name="unit_job_sn" type="text" hidden="true">
	      	</div>
	      	<input id="prjct_sn" name="prjct_sn" type="hidden" value="${prjct_sn }">
      	</form>
      </div>
      <div class="modal-footer">
      	<button id="addDutyBtn" onclick="saveDuty()" class="btn btn-primary">저장</button>
      	<button id="addDutyBtn" onclick="cancelRegistModal()" class="btn btn-secondary">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modifyDutyModal" tabindex="-1" aria-labelledby="modifyDutyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="modifyDutyModalLabel">단위업무 상세</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="gitDutyModal labelmodal modal-body container-fluid">
      <form name="modifyForm" action="<%=request.getContextPath()%>/pmsDuty/modify.do">
	      	<div class="dutyNameArea">
		      	<label for="dutyName">단위 업무명</label><br/>
		      	<input id="unit_job_nm" name="unit_job_nm" type="text">
	      	</div><br/>
	      	<div class="dutyProArea">
		      	<label for="proSelect">진행률(%): </label>
				<select id="unit_job_pro" name="unit_job_pro">
				    <option value="0">0%</option>
				    <option value="10">10%</option>  
				    <option value="20">20%</option>
				    <option value="30">30%</option> 
				    <option value="40">40%</option> 
				    <option value="50">50%</option>
				    <option value="60">60%</option>
				    <option value="70">70%</option>
				    <option value="80">80%</option>
				    <option value="90">90%</option>
				    <option value="100">100%</option>
			    </select>
	      	</div>
	      	<div class="memNcnmArea">
		      	<label for="memNcnm">담당자</label><br/>
				<select id="user_sn" name="user_sn">
				    <c:forEach items="${userList }" var="list">
				    	<option value="${list.user_sn }">${list.mber_ncnm }</option>
				    </c:forEach>
			    </select>
	      	</div>
	      	<div class="startDate">
	      		<label for="unit_job_bgnde">시작일</label><br/>
	      		<input id="unit_job_bgnde" name="unit_job_bgnde" type="date">
	      	</div>
	      	<div class="endDate">
	      		<label for="unit_job_endde">마감일</label><br/>
	      		<input id="unit_job_endde" name="unit_job_endde" type="date">
	      	</div>
	      	<div>
	      		<input id="unit_job_sn" name="unit_job_sn" type="text" hidden="true">
	      	</div>
	      	<input id="prjct_sn" name="prjct_sn" type="hidden" value="${prjct_sn }">
      	</form>
      </div>
      <div class="modal-footer">
      	<button id="addDutyBtn" onclick="modifyDuty()" class="btn btn-primary">저장</button>
      	<button id="addDutyBtn" onclick="deleteDuty()" style="background: #215287; border-color: #215287;" class="btn btn-danger">삭제</button>
      	<button id="addDutyBtn" onclick="cancelModifyModal()" style="border-color: #ddd;" class="btn btn-default">닫기</button>
      </div>
    </div>
  </div>
</div>
<input id="prj" type="hidden" value="${prjct_sn }">
<script>
$(function(){
// 	alert("test")
// 	console.log("test")
	var data = $('#test').val()
// 	alert(globalTreeData.search('id','1'))

// 	var ittt = globalTreeData.search('id','1')
	
// 	console.log(ittt)
// 	console.log(data.selectAll("svg:g:text"))
	

});

</script>
<script defer>

function zoomIn() {

    // Set zoom for the chart.
    globalChart.zoomIn(1.5);
}

function zoomOut() {

    // Set zoom out for the chart.
    globalChart.zoomOut(4);
}
// 	// 신규 생성
// 	var data = $('#test').val()
// // 	console.log(data)
//   var treeData = $('#test1').val()
// //   console.log(treeData)
//   var now = (new Date()).getTime();
//   var sec = 1000;
//   var min = 60 * sec;
//   var hour = 60 * min;
//   var day = 24 * hour;
//   function create(){
// // 		 console.log(globalTreeData)
// 	      globalTreeData.addChild({ 
// 	     	 	id : 100,
// 	 			name : 'New Item',
// 	 			progressValue : 0	 
// 		 });
 </script>
  <!-- <script>
  var editor = null;

  function startEditor() {
    // dispose chart
    if (globalChart) {
    	globalChart.dispose();
    	globalChart = null;
    }

    // run chart editor
    editor = anychart.editor();
    editor.render(document.getElementById('editor-container'));
    editor.listen('editorComplete', function () {
      var code = editor.getJavascript();
      buildChart(code);
    });

    // hide restart button
    document.getElementById('restart').style.display = 'none';
  }

  function buildChart(code) {
    // dispose editor
    if (editor) {
      editor.dispose();
      editor = null;
    }

    // build chart
    globalChart = eval(code);

    // show restart btn
    // hide restart button
    document.getElementById('restart').style.display = 'inline-block';
  }
  </script> -->
</body>
</html>