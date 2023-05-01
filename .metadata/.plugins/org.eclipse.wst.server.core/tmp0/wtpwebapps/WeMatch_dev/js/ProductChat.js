		window.onload = function() {
		    const ws_host_port = "ws://localhost:8080";
		    const contextPath = "/WeMatch_dev";
		    const endpoint = "/productServer";
		    const connString = ws_host_port + contextPath + endpoint;
		    const status = document.getElementById('status');
		    var btnSend = document.getElementById('btnSend');
		    var message = document.getElementById('message');
		    var serverResponseArea = document
		        .getElementById('serverResponseArea');
		    var btntest = document.getElementById('tabHelper');
		    var socket = null;
		    btnSend.disabled = true;

		    btnSend.onclick = function() {
		        if (socket == null) {
		            status.innerHTML = "必須先連到主機才能送訊息";
		            return;
		        }

		        if (message.value.length == 0) {
		            status.innerHTML = "尚未輸入資料，無法送出";
		            return;
		        }
		        appendMsg("Member: " + message.value);
		        socket.send(message.value);
		        message.value = "";
		    }

		    btntest.onclick = function() {
		        socket = new WebSocket(connString);

		        socket.onopen = function(e) {
		            serverResponseArea.value = "小幫手已上線！\n";
		        };

		        socket.onmessage = function(event) {
		            appendMsg("Helper: " + event.data);
		        };
		        btnSend.disabled = false;
		        socket.onclose = function(event) {
		            if (event.wasClean) {
		                +", reason= " + event.reason;
		            } else {}
		            btnSend.disabled = true;

		        };

		        socket.onerror = function(error) {
		            alert("[error] 連線發生錯誤，原因：" + error.message);
		        };
		    }

		}

		function appendMsg(message) {
		    serverResponseArea.value += message + "\n";
		}


		$("#message").keydown(function(event) {
		    if (event.keyCode == 13) {
		        btnSend.click();
		    };
		});