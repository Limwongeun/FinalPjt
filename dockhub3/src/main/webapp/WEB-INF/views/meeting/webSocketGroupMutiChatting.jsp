<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>

</head>
<body>
	<div class="row" style="margin : 15px">
	<div class="card direct-chat direct-chat-primary col-sm-9" style="margin-bottom : 0px">
       <div class="card-header ui-sortable-handle" style="cursor: move;">
         <h3 class="card-title">채팅 회의</h3>
       </div>
       <!-- /.card-header -->
       <div class="card-body">
         <!-- Conversations are loaded here -->
         <div class="direct-chat-messages" style="height : 450px"id="direct-chat-messages">
         </div>
         <!--/.direct-chat-messages-->
       </div>
       <!-- /.card-body -->
       <div class="card-footer">
         <form action="#" method="post">
           <div class="input-group">
             <input type="text" name="message" placeholder="메세지를 입력해주세요." id="messageText" onkeydown="JavaScrpit:Enter_Check();" class="form-control">
             <span class="input-group-append">
               <button type="button" value="Send" class="btn btn-primary" onclick="sendMessage()">보내기</button>
             </span>
           </div>
         </form>
       </div>
       <!-- /.card-footer-->
     </div>

	<div class="col-sm-3">
		<div id="chatArea">
			<input type="hidden" id="newRoomName" value="">
	    	<button type="button" class="btn btn-block btn-info" onclick="closingConnect()">회의 종료</button>
	    	<button type="button" class="btn btn-block btn-info" onclick="acceptApply()">회의 저장</button>
<%-- 		<c:if test="${from eq 'open' }"> --%>
<%-- 		</c:if> --%>
<%-- 		<c:if test="${from eq 'join' }"> --%>
<!-- 	    	<button type="button" class="btn btn-block btn-info" onclick="closingUser()">회의 종료</button> -->
<%-- 		</c:if> --%>
	    </div>
	    <div id="chatRoom">
	    	<span id="chatRoomName"></span> 채팅방 멤버 목록<br>
<!-- 	    	<select id="chatRoomList" size="10"></select><br> -->
			<div id="chatMem"style="width : 200px; border : 1px solid lightgrey; height : 500px; padding : 10px"></div>
<!-- 	    	<select id="chatRoomMemList" size="20" style="width : 200px"></select><br> -->
	    	<input type="hidden" id="createRoom" name="createRoom" value="채팅방만들기" onclick="createRoom()">
	    	<input type="hidden" id="mtg_sn" name="mtg_sn" value="${mtg_sn }">
	    	<input type="hidden" id="user_sn" name="user_sn" value="${user_sn }">
	    </div>

	</div>

	

	    <br>
	    <div id="connectArea">
	    	<!-- 접속자 입력 텍스트박스 -->
		    사용자ID : <input type="text" id="userId" value="${mber_ncnm }"size="20">
		    <!-- 접속 버튼 -->
		    <input type="button" id="connect"  onclick="connectting()">
	    </div>
	    <input type="hidden" id="mber_photo" name="mber_photo" value="${mber_photo }">
    </div>
<!-- <script type="text/javascript" src="http://jsgetip.appspot.com"></script> -->



  <div class="modal fade" id="acceptModal" tabindex="-1" aria-labelledby="addGitModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="addGitModalLabel">신청 수락</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="labelmodal modal-body container-fluid">
      	<div class="selectDate">
	      	<label for="meetingDate">제목 입력</label><br/>
	      	<input id="meetingDate" type="text">
      	</div>

      </div>
      <div class="modal-footer">
      	<button id="addMeeting" onclick="saveChatting()" class="btn btn-success">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" hidden="hidden">Close</button>
      </div>
    </div>
  </div>
</div>

    <script type="text/javascript">
    function acceptApply(pblanc_sport_sn){
    	$('#acceptModal').modal('toggle');

    }
    
    function Enter_Check() {
    		if(event.keyCode == 13){
    			sendMessage();
    			return; 
    			}
		}
    	var webSocket = null; // 웹소켓 변수 선언
        var messageTextArea = document.getElementById("messageTextArea");
    	var messageText = document.getElementById("messageText");
    	var userText = document.getElementById("userId");
    	
    	var index = 0;
    	function connectting(){
    		if(userText.value.trim()==""){
    			alert("접속자 ID를 입력하세요");
    			userText.focus();
    			return;
    		}
				//웹소켓 초기화
				webSocket = new WebSocket("ws://192.168.45.56/ddit/websocktGroupMultiChat.do");
	        
	    	// 처음 접속 성공하면 
				webSocket.onopen = function onOpen(event){
					document.getElementById("connectArea").style.display = "none";
					var mber_photo = $("#mber_photo").val();
					document.getElementById("chatRoom").style.display = "block";
					document.getElementById("chatArea").style.display = "block";
					// webSocket.send(userText.value);
					webSocket.send( createMessage("connect", "전체", userText.value) );
					
				}

				//메시지가 오면 messageTextArea요소에 메시지를 추가한다.
				webSocket.onmessage = function processMessge(message){
					//Json 풀기
					var jsonData = JSON.parse(message.data);
					var Text = jsonData.message.split(" : ")[1];
					var messageUser = jsonData.message.split(" : ")[0];
					var messageText = Text.split("$$^^")[0];
					var photo = Text.split("$$^^")[1];

					if(messageText != null) {
						 if(messageText.split(" ")[1]=="퇴장했습니다."){
							 var mtg_sn = $("#mtg_sn").val();
								$.ajax({
									url:"<%=request.getContextPath() %>/pmsproject/selectMeetingMember?mtg_sn="+mtg_sn,	
									contentType:"application/json",
									success:function(data){
										var arr= [];
										arr = data;
										var str = "";
										for (var i = 0; i < arr.length; i++) {
											$("#chatMem").empty();
											str += "<div>"+arr[i].mber_ncnm+"</div>";
										}
										$("#chatMem").append(str);
									},
									error:function(error){
//							 			AjaxErrorSecurityRedirectHandler(error.status);		
										alert("selectMem 실패");
									}
								});
						 }
						 if(messageText.split(" ")[1]=="입장했습니다."){
							 var mtg_sn = $("#mtg_sn").val();
								$.ajax({
									url:"<%=request.getContextPath() %>/pmsproject/selectMeetingMember?mtg_sn="+mtg_sn,	
									contentType:"application/json",
									success:function(data){
										var arr= [];
										arr = data;
										var str = "";
										for (var i = 0; i < arr.length; i++) {
											$("#chatMem").empty();
											str += "<div>"+arr[i].mber_ncnm+"</div>";
										}
										$("#chatMem").append(str);
									},
									error:function(error){
//							 			AjaxErrorSecurityRedirectHandler(error.status);		
										alert("selectMem 실패");
									}
								});
						 }
						 if(messageText.split(" ")[1]=="연결"){
							 var mtg_sn = $("#mtg_sn").val();
								$.ajax({
									url:"<%=request.getContextPath() %>/pmsproject/selectMeetingMember?mtg_sn="+mtg_sn,	
									contentType:"application/json",
									success:function(data){
										var arr= [];
										arr = data;
										var str = "";
										for (var i = 0; i < arr.length; i++) {
											$("#chatMem").empty();
											str += "<div>"+arr[i].mber_ncnm+"</div>";
										}
										$("#chatMem").append(str);
									},
									error:function(error){
//							 			AjaxErrorSecurityRedirectHandler(error.status);		
										alert("selectMem 실패");
									}
								});
						 }
						var messageBoot = "";
						if (messageUser == "System") {
							messageBoot += '<div class="direct-chat-msg">';
							messageBoot +=   '<div class="direct-chat-infos clearfix">'
							messageBoot +=   	'<span class="direct-chat-name float-left" id="chatName'+index+'">'+messageUser+'</span>';
							messageBoot +=   '</div>';
							messageBoot +=   '<img class="direct-chat-img" src="<%=request.getContextPath() %>/resources/images/sys.jpg" alt="">'
							messageBoot +=   '<div class="direct-chat-text" id="msg'+index+'">';
							messageBoot +=    	messageText;
							messageBoot +=	'</div>'
							messageBoot += '</div>';
	
						}else if(userText.value != messageUser){
							messageBoot += '<div class="direct-chat-msg">';
							messageBoot +=   '<div class="direct-chat-infos clearfix">'
							messageBoot +=   	'<span class="direct-chat-name float-left" id="chatName'+index+'">'+messageUser+'</span>';
							messageBoot +=   '</div>';
							messageBoot +=   '<img class="direct-chat-img" src="<%=request.getContextPath() %>/member/getPicture?picture='+photo+'" alt="">'
							messageBoot +=   '<div class="direct-chat-text" id="msg'+index+'">';
							messageBoot +=    	messageText;
							messageBoot +=	'</div>'
							messageBoot += '</div>';
	
							
						}else{
							messageBoot += '<div class="direct-chat-msg right">';
							messageBoot +=   '<div class="direct-chat-infos clearfix">'
							messageBoot +=   	'<span class="direct-chat-name float-right" id="chatName'+index+'">'+messageUser+'</span>';
							messageBoot +=   '</div>';
							messageBoot +=   '<img class="direct-chat-img" src="<%=request.getContextPath() %>/member/getPicture?picture='+photo+'" >'
							messageBoot +=   '<div class="direct-chat-text" id="msg'+index+'">';
							messageBoot +=    	messageText;
							messageBoot +=	'</div>'
							messageBoot += '</div>';
	
							
						}
							$("#direct-chat-messages").append(messageBoot);
							$("#direct-chat-messages").scrollTop($("#direct-chat-messages")[0].scrollHeight);

					};
					index += 1;	
				}
	        
				webSocket.onerror = function showErrorMsg(event) {
					alert("오류 : " + event.data);
				}
			
				webSocket.onclose = function(event){
					messageTextArea.value = "";
					messageText.value = "";
					userText.value = "";
					document.getElementById("connectArea").style.display = "block";
					document.getElementById("chatRoom").style.display = "none";
					document.getElementById("chatArea").style.display = "none";
				}
    	}
    
    	// 메시지 구조  {"command" : "명령종류", "room" : "채팅방이름", "message" : "메시지" }
    	// 명령 종류 : "create" - 채팅방 만들기, "change" - 채팅방 이동, "message" - 메시지 전송, "connect" - 처음 접속 
    	
    	function saveChatting(){
    		var arr = [];

    		var mtg_sn = $("#mtg_sn").val();
			for (var j = 0; j < index; j++) {
// 				var chatName = document.getElementById("chatName"+j).html();
				var chatName = $("#chatName"+j).text()
				var msg = $("#msg"+j).text()
				var data = {chatName : chatName, msg : msg};
				arr.push(data);
			}
    		var title = {title : $('#meetingDate').val()};
    		var mtg_sn2 = {mtg_sn : mtg_sn};
			arr.push(title)
			arr.push(mtg_sn2)
			$.ajax({
				url : "saveChat",
				type : "post",
				data : {
				       data: JSON.stringify(arr)
			     },
// 			     dataType: 'application/json',
				success : function(result){
					if (result == "ok") {
						
					alert("회의록 저장에 성공했습니다. ");
					opener.location.reload();
					//openwindow
		    		$('#acceptModal').modal('hide');
					}
				}, 
				error : function(){
					alert("실패")
				}
			});

				
    	}
    	
		//메시지 보내기
		function sendMessage(){
			if(messageText.value.trim()==""){
				messageText.focus();
				return;
			}
			var room = document.getElementById("chatRoomName").innerHTML.trim();
			var mber_photo = $("#mber_photo").val();
			//webSocket.send('{"room" : "' + "전체" + '", "message" : "' + messageText.value + '"}' );
			webSocket.send( createMessage("message", room, messageText.value+"$$^^"+mber_photo) );
			messageText.value = ""; 
		}
    	
    	// 채팅방 만들기
    	function createRoom(){
    		var newRoom = document.getElementById("newRoomName");
    		if(newRoom.value==""){
    			alert("생성할 채팅방을 입력한 후 사용하세요.")
    			newRoom.focus();
    			return;
    		}
    		webSocket.send( createMessage("create", newRoom.value, null) );
    		newRoom.value = ""; 
    	}
    	
    	// 채팅방 이동
    	function chatRoomIn(){
    		var selectRoom = document.getElementById("chatRoomList")
    		if(selectRoom.selectedIndex==-1 || selectRoom.value==""){
    			alert("이동할 채팅방을 선택한 후 사용하세요.");
    			return;
    		}
    		webSocket.send( createMessage("change", selectRoom.value, null) );
    	}
    	
//     	채팅방 나가기  ==> 즉, '전체' 채팅방으로 이동
//     	function chatRoomOut(){
//      		websocket.send( createmessage("change", "전체", null) );
//     	}
    	
    	// 전송할 메시지를 작성하는 함수
    	function createMessage(command, room, message){
    		return '{"command" : "' + command + '", "room" : "' + room + '", "message" : "' + message + '"}'
    	}
        
//     	function closingUser(){
//     		deleteMem();
//     		webSocket.send( createMessage("change", "전체", null) );
// 			window.close();
//     	}
		function closingConnect(){
// 			webSocket.send( createMessage("change", "전체", null) );
			deleteMem();
			webSocket.close();
			var mtg_sn = $("#mtg_sn").val();
			$.ajax({
				url:"<%=request.getContextPath() %>/pmsproject/setMeetingStatus?mtg_sn="+mtg_sn+"&mtg_sttus_code=2",	
				contentType:"application/json",
				success:function(data){
					opener.opener.location.reload();
					window.close();
				},
				error:function(error){
//		 			AjaxErrorSecurityRedirectHandler(error.status);		
					alert("미팅 닫기 실패");
				}
			});
		}
		
		window.onbeforeunload = function(){
			
			closing();
		}

		window.onload=function(){
			var connect = $("#connect");
			connect.click();	
		}
		
		function deleteMem(){
			var user_sn = $("#user_sn").val();
			var mtg_sn = $("#mtg_sn").val();
			$.ajax({
				url:"<%=request.getContextPath() %>/pmsproject/deleteMeetingMem?mtg_sn="+mtg_sn+"&user_sn="+user_sn,	
				contentType:"application/json",
			    async: false,
				success:function(res){
					if (res=="ok") {
// 	 					alert("memdelete")
					}
				},
				error:function(error){
// 		 			AjaxErrorSecurityRedirectHandler(error.status);
// 					console.log(error)
					alert("memdelete 실패");
				}
			});
		}

    </script>
</body>
</html>