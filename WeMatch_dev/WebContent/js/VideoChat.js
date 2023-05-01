		$(function() {
			$("#btntest").click(function() {
				$("#tt").toggle();	
			});
		});
		$(function() {
			$("#cc").click(function() {
				$("#tt").hide();	
			});
		});

		window.onload = function() {
			const ws_host_port = "ws://localhost:8080/";
			const contextPath = "WeMatch_dev/";
			const endpoint = "echoserver01";
			const connString = ws_host_port + contextPath + endpoint;
			const status = document.getElementById('status');
			var btnConn = document.getElementById('btnConn');
			var btnSend = document.getElementById('btnSend');
			var btnClose = document.getElementById('btnClose');
			var message = document.getElementById('message');
			var serverResponseArea = document
					.getElementById('serverResponseArea');
			var btntest = document.getElementById('btntest');
			var socket = null;
			btnClose.disabled = true;
			btnSend.disabled = true;

			btnSend.onclick = function() {
				if (socket == null) {
//					status.innerHTML = "必須先連到主機才能送訊息";
					return;
				}

				if (message.value.length == 0) {
//					status.innerHTML = "尚未輸入資料，無法送出";
					return;
				}
				appendMsg("會員: " + message.value);
				socket.send(message.value);
			}
	
			btntest.onclick = function() {
				socket = new WebSocket(connString);

				socket.onopen = function(e) {
//					status.innerHTML = "已連線";
				};

				socket.onmessage = function(event) {
					appendMsg("小編: " + event.data);
				};
				btnClose.disabled = false;
				btnSend.disabled = false;
				socket.onclose = function(event) {
					if (event.wasClean) {
//						status.innerHTML = "[close] 連線正常關閉, code=" + event.code
//								+ ", reason= " + event.reason;
					} else {
//						status.innerHTML = "[close] 連線不正常結束";
					}
					btnClose.disabled = true;
					btnSend.disabled = true;

				};

				socket.onerror = function(error) {
					alert("[error] 連線發生錯誤，原因：" + error.message);
				};
			}
			
			cc.onclick = function() {
				if (socket == null) {
//					status.innerHTML = "必須先連到主機才能關閉連線";
					return;
				}
				if (socket.readyState === WebSocket.OPEN) {
					socket.onclose = function() {
					}; // disable onclose handler first
					socket.close();
//					status.innerHTML = "已離線";
				}

				btnClose.disabled = true;
				btnSend.disabled = true;
			}
			
		$("#message").keydown(function(event) {
		    if(event.keyCode === 13){
//				alert(event.keyCode);
		    	$("#btnSend").click();
		    };
		});
				
		}
		
		function appendMsg(message) {
			//	 		serverResponseArea.value = serverResponseArea.value + message + "\n";
			serverResponseArea.value += message + "\n";
		}
		