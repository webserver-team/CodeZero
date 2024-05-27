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
		document.getElementById("regi_Background").style.display = "block";
		document.getElementById("regi_input_id").focus();
	}
	<%session.removeAttribute("regi_modal_status");%>
}

function loginModal(){
	var login_modal_status = '<%=session.getAttribute("login_modal_status")%>';
			if (login_modal_status == "on") {
				document.getElementById("loginModal").style.display = "block";
				document.getElementById("login_Background").style.display = "block";
				document.getElementById("login_input_id").focus();
			}
	<%session.removeAttribute("login_modal_status");%>
		}
	</script>


	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container text-center" style="height:90%">
		<div class="searcharea">
			<div class="searchbox">
				<input class="search" type="text" placeholder="검색어를 입력해 주세요.">
			</div>
		</div>

		<p style="height: 100px"></p>
		<div class="box">
			<div class="lecture_box1"></div>
			<div class="lecture_box2"></div>
			<div class="lecture_box2"></div>
		</div>
	</div>
	<p style="height:100px"></p>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>