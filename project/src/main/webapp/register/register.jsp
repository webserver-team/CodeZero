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

	var noId = false;
	var noPw = false;
	var noName = false;
	var noPhone = false;
	var noEmail = false;
	
	var regExpId = /^[a-z][a-z0-9]{4,19}$/;
	var regExpName = /^[가-힣]{2,7}$/;
	var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
	var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
	function checkMember(){
		
		var form = document.getElementById("regi_Member");

		var id = form.id.value;
		var name = form.name.value;
		var passwd = form.passwd.value;
		var phone = form.phone.value;
		var email = form.email.value;
		
		var idError = document.getElementById("id_error");		
		var passwdError = document.getElementById("passwd_error");
		var nameError = document.getElementById("name_error");
		var phoneError = document.getElementById("phone_error");
		var emailError = document.getElementById("email_error");
		
		var errors = document.getElementById("regi_errors"); 
		
		var empty1 = document.getElementById("empty1");
		var empty2 = document.getElementById("empty2");
		
		if (!regExpId.test(id)) {
			idError.style.display = "block";
			noId = true;
		}
		else {
			idError.style.display = "none";
			noId = false;
		}
		
		if (!regExpPasswd.test(passwd)) {
			passwdError.style.display = "block";
			noPw = true;
		} 
		else {
			passwdError.style.display = "none";
			noPw = false;
		}
		
		if (!regExpName.test(name)) {
			nameError.style.display = "block";
			noName = true;
		} 
		else {
			nameError.style.display = "none";
			noName = false;
		}
		
		if (!regExpPhone.test(phone)) {
			phoneError.style.display = "block";
			noPhone = true;
		}
		else {
			phoneError.style.display = "none";
			noPhone = false;
		}
		
		if (!regExpEmail.test(email)) {
			emailError.style.display = "block";
			noEmail = true;
		} 
		else {
			emailError.style.display = "none";
			noEmail = false;
		}
		
		if (noId || noPw)
			empty1.style.display = "none";
		else 
			empty1.style.display = "block";
		
		if (noName || noPhone || noEmail){
			empty2.style.display = "none";
			errors.style.display = "block";
		}
		else{ 
			empty1.style.display = "flex";	
			errors.style.display = "none";
		}
		
		if (noEmail)
			form.email.select();
		if (noPhone)
			form.phone.select();
		if (noName)
			form.name.select();
		if (noPw)
			form.passwd.select();
		if (noId)
			form.id.select();
		
		if (!noId && !noPw && !noName && !noPhone && !noEmail)	
			form.submit();
	}
</script>

<body>
	<div id="regi_Background" class="regi-background"></div>
		
	<div id="registerModal" class="register-modal">
		<div class="regi_out">
			<div class="regi_in">
				
<!-- 			<form action="${pageContext.request.contextPath}/RegisterServlet" id="regi_Member" method="post" class="regi_form"> -->
				<form action="../register/register_process.jsp" id="regi_Member" method="post" class="regi_form">
				
					<span id="registerClose" class="close" style="left:10">&times;</span>
					<h3>회원가입</h3>
					<div class="id_div input_div">
						<input type="text" id="regi_input_id" maxlength="20" name="id" class="input id" placeholder="아이디" onkeydown="registerOnEnter(event)">
					</div>
					<div id="regi_passwd_div" class="passwd_div input_div">
						<input type="password" id="regi_input_passwd" maxlength="40" name="passwd" class="input passwd" placeholder="비밀번호" onkeydown="registerOnEnter(event)">
					</div>
					
					<h1 id="empty1" style="height:20px; margin:0px"></h1>
					
					<p id="id_error" class="errorMessage">ID : 5~20자의 영문 소문자, 숫자만 사용 가능</p>
					<p id="passwd_error" class="errorMessage">비밀번호 : 최소 8자 이상, 영문자 및 숫자 포함</p>
					
					<div class="name_div input_div">
						<input type="text" id="regi_input_name" maxlength="7" name="name" class="input name" placeholder="이름" onkeydown="registerOnEnter(event)">
					</div>
					<div class="phone_div input_div">
						<input type="text" id="regi_input_phone" maxlength="11" name="phone" class="input phone" placeholder="전화번호" onkeydown="registerOnEnter(event)">
					</div>
					<div id="regi_email_div" class="email_div input_div">
						<input type="text" id="regi_input_email" maxlength="40" name="email" class="input email" placeholder="이메일" onkeydown="registerOnEnter(event)">
					</div>
					
					<div id="regi_errors">
						<p id="name_error" class="errorMessage">이름 : 한글만 사용 가능</p>
						<p id="phone_error" class="errorMessage">연락처 입력을 확인해 주세요</p>
						<p id="email_error" class="errorMessage">이메일 입력을 확인해 주세요</p>
					</div>
					
					<h1 id="empty2" style="height:80px; margin:0px"></h1>
					
					<input type="button" value="가입하기" style="margin-top:12px" onclick="checkMember()" class="register_button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>