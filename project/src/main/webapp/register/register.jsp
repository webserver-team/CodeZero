<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="../stylesheet/register.css">
	<title>회원가입</title>
</head> 

<%@ include file="/../db/dbconn.jsp" %>

<script type="text/javascript">

window.onload = function(){
	
	var modal_status = '<%= session.getAttribute("modal_status")%>';
	var message = '<%= session.getAttribute("message")%>';

	
	if (modal_status == "on"){
		document.getElementById("registerModal").style.display = "block";
		document.getElementById("regi_Background").style.display = "block";
	}

	if (message != 'null'){
		setTimeout(function() {			// modal창을 띄우고 alert창이 뜨게 하기 위해 약간의 지연시간을 줌
			alert(message);
			}, 100);
	}
	
	<% 
		session.removeAttribute("modal_status");
		session.removeAttribute("message");
	%>
}
</script>

<script type="text/javascript">

function checkMember(){
	
	var regExpId = /^[a-z][a-z0-9]{4,19}$/;
	var regExpName = /^[가-힣]*$/;
	var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
	var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	let form = document.getElementById('regi_Member');
	
	let id = form.id.value;
	let name = form.name.value;
	let passwd = form.passwd.value;
	let phone = form.phone.value;
	let email = form.email.value;

	if (!regExpId.test(id)) {
		alert("아이디 : 5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		form.id.select();
		return;
	}
	if (!regExpName.test(name)) {
		alert("이름 : 한글만 사용 가능합니다.");
		return;
	}
	if (!regExpPasswd.test(passwd)) {
		alert("비밀번호 : 최소 8자 이상이어야 하며, 영문자 및 숫자를 포함해야 합니다.");
		return;
	}
	if (!regExpPhone.test(phone)) {
		alert("연락처 입력을 확인해 주세요");
		return;
	}
	if (!regExpEmail.test(email)) {
		alert("이메일 입력을 확인해 주세요");
		return;
	}
	
	form.submit();
}
</script>

<body>
	<div id="regi_Background" class="regi-background"></div>
		
	<div id="registerModal" class="register-modal">
		<div class="regi_out">
			<div class="regi_in">
				
<!-- 				<form action="${pageContext.request.contextPath}/RegisterServlet" id="regi_Member" method="post" class="regi_form"> -->
				<form action="../register/register_process.jsp" id="regi_Member" method="post" class="regi_form">
				
					<span id="registerClose" class="close" style="left:10">&times;</span>
					<h3>회원가입</h3>
					<div class="id_div input_div">
						<input type="text" name="id" class="input id" placeholder="아이디">
					</div>
					<div class="passwd_div input_div">
						<input type="password" name="passwd" class="input passwd" placeholder="비밀번호" >
					</div>
					<div class="name_div input_div">
						<input type="text" name="name" class="input name" placeholder="이름">
					</div>
					<div class="phone_div input_div">
						<input type="text" maxlength="11" name="phone" class="input phone" placeholder="전화번호">
					</div>
					<div class="email_div input_div">
						<input type="text" name="email" class="input email" placeholder="이메일">
					</div>
					<p style="display:flex; justify-content:space-around"> <input type="button" value="가입하기" style="margin-top:10px" onclick="checkMember()" class="button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>