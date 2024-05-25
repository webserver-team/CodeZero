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

	
	
	var error1Exist = false;
	var error2Exist = false;
		
	function checkMember(){
		var regExpId = /^[a-z][a-z0-9]{4,19}$/;
		var regExpName = /^[가-힣]{2,10}$/;
		var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
		var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var form = document.getElementById("regi_Member");
		
		var error1 = document.getElementById("regi_errorMessage1");				
		var error2 = document.getElementById("regi_errorMessage2");	
			
		var id = form.id.value;
		var name = form.name.value;
		var passwd = form.passwd.value;
		var phone = form.phone.value;
		var email = form.email.value;
		
		if (!regExpId.test(id)) {
			error1.textContent = "ID : 5~20자의 영문 소문자, 숫자만 사용 가능\n";
			noId = true;
			noPw = false;
		}
		else {
			error1.textContent = error1.textContent.replace("ID : 5~20자의 영문 소문자, 숫자만 사용 가능\n", "");  
			noId = false;
		}
		
		if (!regExpPasswd.test(passwd)) {
			if (!noPw)
				error1.textContent = error1.textContent + "비밀번호 : 최소 8자 이상, 영문자 및 숫자 포함\n";
			noPw = true;
		} 
		else {
			error1.textContent = error1.textContent.replace("비밀번호 : 최소 8자 이상, 영문자 및 숫자 포함\n", "\n");
			noPw = false;
		}
		
		if (!regExpName.test(name)) {
			error2.textContent = "이름 : 한글만 사용 가능\n";
			noName = true;
			noPhone = false;
			noEmail = false;
		} 
		else {
			error2.textContent = error2.textContent.replace("이름 : 한글만 사용 가능\n", "");
			noName = false;
		}
		
		if (!regExpPhone.test(phone)) {
			if (!noPhone)
				error2.textContent = error2.textContent + "연락처 입력을 확인해 주세요\n";
			noPhone = true;
		}
		else {
			error2.textContent = error2.textContent.replace("연락처 입력을 확인해 주세요\n", "");
			noPhone = false;
		}
		
		if (!regExpEmail.test(email)) {
			if (!noEmail)
				error2.textContent = error2.textContent + "이메일 입력을 확인해 주세요\n";
			noEmail = true;
		} 
		else {
			error2.textContent = error2.textContent.replace("이메일 입력을 확인해 주세요\n", "");
			noEmail = false;
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
		
		
		if (noId || noPw || noName || noPhone || noEmail)	
			return;
		
		
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
						<input type="text" id="regi_input_id" name="id" class="input id" placeholder="아이디" onkeydown="registerOnEnter(event)">
					</div>
					<div id="regi_passwd_div" class="passwd_div input_div">
						<input type="password" id="regi_input_passwd"  name="passwd" class="input passwd" placeholder="비밀번호" onkeydown="registerOnEnter(event)">
					</div>
					
					<p id="regi_errorMessage1" class="errorMessage">
					
					<div class="name_div input_div">
						<input type="text" id="regi_input_name" name="name" class="input name" placeholder="이름" onkeydown="registerOnEnter(event)">
					</div>
					<div class="phone_div input_div">
						<input type="text" id="regi_input_phone" maxlength="11" name="phone" class="input phone" placeholder="전화번호" onkeydown="registerOnEnter(event)">
					</div>
					<div id="regi_email_div" class="email_div input_div">
						<input type="text" id="regi_input_email" name="email" class="input email" placeholder="이메일" onkeydown="registerOnEnter(event)">
					</div>
					
					<p id="regi_errorMessage2" class="errorMessage">
					
					<p style="display:flex; justify-content:space-around"> <input type="button" value="가입하기" style="margin-top:5px" onclick="checkMember()" class="register_button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>