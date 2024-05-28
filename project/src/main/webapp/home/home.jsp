<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../stylesheet/home_style.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>Welcome</title>
</head>
<body>

	<script type="text/javascript">

window.onload = function(){
	
	
	loginModal();
	
	registerModal();
	
	messageAlert();
}

function messageAlert(){
	var message = '<%=session.getAttribute("message")%>';
	if (message != 'null'){
		setTimeout(function() {			// modal창을 띄우고 alert창이 뜨게 하기 위해 약간의 지연시간을 줌
			alert(message);
			}, 100);
	}	
	<%session.removeAttribute("message");%>
}

function registerModal(){
	var regi_modal_status = '<%=session.getAttribute("regi_modal_status")%>';
	if (regi_modal_status == "on"){
		document.getElementById("registerModal").style.display = "block";
		document.getElementById("regi-background").style.display = "block";
		document.getElementById("registerModal").classList.add("fadeIn");
		document.getElementById("regi-background").classList.add("fadeIn");
		document.getElementById("regi-input-id").focus();
	}
	<%session.removeAttribute("regi_modal_status");%>
}

function loginModal(){
	var login_modal_status = '<%=session.getAttribute("login_modal_status")%>';
			if (login_modal_status == "on") {
				document.getElementById("loginModal").style.display = "block";
				document.getElementById("login-background").style.display = "block";
				document.getElementById("loginModal").classList.add("fadeIn");
				document.getElementById("login-background").classList.add("fadeIn");
				document.getElementById("login-input-id").focus();
			}
	<%session.removeAttribute("login_modal_status");%>
		}
	</script>


	<%@ include file="/../header/header.jsp"%>
	
	<div class="container">
	
		<div style="height:200px"></div>
		
		<div class="searcharea">
			<div class="searchbox">
				<input class="search" type="text" placeholder="검색어를 입력해 주세요.">
			</div>
		</div>

		<div style="height:200px"></div>
		
		<div class="box">
			<div class="lecture-box1"></div>
			<div class="lecture-box2"></div>
			<div class="lecture-box2"></div>
		</div>
	</div>
	<p style="height:100px"></p>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>