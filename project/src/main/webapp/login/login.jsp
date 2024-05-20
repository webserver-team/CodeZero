<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file ="../db/dbconn.jsp" %>

<link rel="stylesheet" href="../stylesheet/login.css">
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   
   
	<script type="text/javascript">

	/*
	var idMessageLimit = 0;
	var pwMessageLimit = 0;
	function loginAttempt(){
		var form = document.loginForm;
		var errorMessage = document.createElement("p");
		if (form.id.value == "") {
			if (idMessageLimit < 1){
				errorMessage.textContent = "아이디를 입력해주세요."
				form.appendChild(errorMessage);
				idMessageLimit += 1;
			}
			return false;	
		}
		else {
			idMessageLimit = 0;
		}
		
		if (form.pw.value == ""){
			if (pwMessageLimit < 1){
				errorMessage.textContent = "비밀번호 입력해주세요."
				form.appendChild(errorMessage);
				pwMessageLimit += 1;
			}
			return false;
		}
		else {
			pwMessageLimit = 0;
		}
		
	form.submit();
	}
	*/
	
		var messageLimit = 0;
		
		function loginAttempt(){
			var form = document.getElementById('login_Member');
			var errorMessage = document.createElement("p");
			
			if ((form.id.value && form.passwd.value) == "") {
				if (messageLimit < 1){
					errorMessage.textContent = "아이디 또는 비밀번호를 입력해주세요."
					form.appendChild(errorMessage);
					messageLimit += 1;
				}
				return false;	
			}
			else
				form.submit();
		}
	</script>	
</head>
<body>
<div id="login_Background" class="login-background"></div>
		
	<div id="loginModal" class="login-modal">
		<div class="login_out">
			<div class="login_in">
				
				<form action="../login/login_process.jsp" id="login_Member" method="post" class="login_form">
				
				
					<span id="loginClose" class="close" style="left:10">&times;</span>
					<h3>로그인</h3>
					
					<div class="id_div input_div">
						<input type="text" name="id" class="input id" placeholder="아이디">
			   		</div>
					<div class="passwd_div input_div">
						<input type="password" name="passwd" class="input passwd" placeholder="비밀번호" >
			     	</div>
			     	<p style="display:flex; justify-content:space-around"> <input type="button" value="로그인" style="margin-top:10px" onclick="loginAttempt()" class="button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>