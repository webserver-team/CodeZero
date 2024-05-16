<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>


<link rel="stylesheet" href="header_style.css">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="register.css">

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
		
		let form = document.getElementById('Member');
		
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



<header class="pb-3 border-bottom" style="margin-bottom:20px; padding-bottom:15px !important; border-bottom:1px solid #03c75a !important">
<div class="container text-center">
	<div class="row">
		<div class="col" style="margin-top:10px">
		   	<a href="./home.jsp" class="link1 d-flex align-items-center text-dark 
		   	text-decoration-none"> 
		    <svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
				<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
				<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
			</svg>   
		    <span class="fs-4"><b>CODE:0</b></span>
			</a>    
		</div>
		<div class="col" style="margin-top:12px; display:flex; justify-content:flex-end">
			<a href="./login.jsp" class="link d-flex align-items-center text-decoration-none" style="color:#03c75a; font-weight:bolder; font-size:12px">
			로그인
			</a>
			 <button id="loginButton">Login</button>
			 
			 
			<div id="modalBackground" class="modal-background"></div>
		
     		<div id="registerModal" class="register">
				<div class="regi_out">
					<div class="regi_in">
						
						<form action="register_process.jsp" id="Member" method="post" class="regi_form">
						
							<span id="closeModal" class="close" style="left:10">&times;</span>
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
		</div>
		<script src="scripts.js"></script>


		
		
		<div class="category">
			<a href="lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
				JAVA
			</a>		
			<a href="lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
				C
			</a>
			<a href="lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
				C++	
			</a>
			<a href="lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
				인공지능
			</a>
			<a href="lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
				디자인
			</a>
			<a href="home.jsp" class="category_link d-flex align-items-center text-decoration-none">
				게시판	
			</a>
		</div>
	</div>
</div>
</header>