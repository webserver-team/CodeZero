<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="register.css">
	<title>회원가입</title>
</head>
<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/JSP_project";
		String user="root";
		String password="1234";
		
		conn=DriverManager.getConnection(url, user, password);
		
	} catch (SQLException ex) {
			
	}
%>

<script type="text/javascript">


	function checkMember(){
		
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExpName = /^[가-힣]*$/;
		var regExpPasswd = /^[a-z|A-Z]/;
		var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		let form = document.Member;
		
		let id = form.id.value;
		let name = form.name.value;
		let passwd = form.passwd.value;
		let phone = form.phone.value;
		let email = form.email.value;

		if (!regExpId.test(id)) {
			alert("아이디는 문자로 시작해 주세요");
			form.id.select();
			return;
		}
		if (!regExpName.test(name)) {
			alert("이름은 한글만으로 입력해 주세요");
			return;
		}
		if (!regExpPasswd.test(passwd)) {
			alert("비밀번호는 영문만으로 입력해 주세요");
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

<body style="background-color:#cfe7c3">
	<div class="register">
		<div class="regi_out">
			<div class="regi_in">
				<form action="register_process.jsp" name="Member" method="post" class="regi_form">
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