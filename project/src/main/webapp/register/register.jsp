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

var id_errorMessege = document.createElement("p");
var passwd_errorMessege = document.createElement("p");
var name_errorMessege = document.createElement("p");
var phone_errorMessege = document.createElement("p");
var email_errorMessege = document.createElement("p");

function checkMember(){
	
	var regExpId = /^[a-z][a-z0-9]{4,19}$/;
	var regExpName = /^[가-힣]*$/;
	var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
	var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	var form = document.getElementById('regi_Member');
	
	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.passwd.value;
	var phone = form.phone.value;
	var email = form.email.value;

	var noId = false;
	var noPw = false;
	var noName = false;
	var noPhone = false;
	var noEmail = false;
	
	if (!regExpId.test(id)) {
		noId = true;
		form.id.select();
		
// 		alert("아이디 : 5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		return;
	} else noId = false;
	if (!regExpPasswd.test(passwd)) {
		form.passwd.select();
		noPw = true;
// 		alert("비밀번호 : 최소 8자 이상이어야 하며, 영문자 및 숫자를 포함해야 합니다.");
		return;
	} else noPw = false;
	if (!regExpName.test(name)) {
		form.name.select();
		noName = true;
// 		alert("이름 : 한글만 사용 가능합니다.");
		return;
	} else noName = false;
	if (!regExpPhone.test(phone)) {
		form.phone.select();
		noPhone = true;
// 		alert("연락처 입력을 확인해 주세요");
		return;
	} else noPhone = false;
	if (!regExpEmail.test(email)) {
		form.email.select();
		noEmail = true;
// 		alert("이메일 입력을 확인해 주세요");
		return;
	} else noEmail = false;
	
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