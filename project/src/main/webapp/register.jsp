<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="style.css">
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
	function checkId(){
		
		
	}
	

	function checkMember(){
		
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExpName = /^[가-힣]*$/;
		var regExpPasswd = /^[a-z|A-Z]/;
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		let form = document.Member;
		
		let id = form.id.value;
		let name = form.name.value;
		let passwd = form.passwd.value;
		let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
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

<body>
	<div class="register">
		<form action="register_process.jsp" name="Member" method="post">
			<h3>회원가입</h3>
			<p>아이디 : <input type="text" name="id"> <input type="button" value="중복 검사" onclick="checkId()">
			<p>비밀번호 : <input type="password" name="passwd">
			<p>이름 : <input type="text" name="name">
			<p>연락처 : <select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"> - <input type="text" maxlength="4" size="4" name="phone3">
			<p>이메일: <input type="text" name="email">
			<p> <input type="button" value="가입하기" onclick="checkMember()">
		</form>		 
	</div>
</body>
</html>