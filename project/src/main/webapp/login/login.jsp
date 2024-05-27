<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<link rel="stylesheet" href="../stylesheet/login.css">
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
<div id="login_Background" class="login-background modal"></div>
		
	<div id="loginModal" class="login-modal modal">
		<div class="login_out">
			<div class="login_in">
				
				<form action="../login/login_process.jsp" id="login_Member" method="post" class="login_form">
				
				
					<span id="loginClose" class="close" style="left:10">&times;</span>
					<h3>로그인</h3>
					
					<p style="height:60px"></p>
					
					<div class="login_id_div input_div">
						<input type="text" id="login_input_id" maxlength="20" name="id" class="input id" placeholder="아이디" onkeydown="loginOnEnter(event)">
			   		</div>
					<div class="login_passwd_div input_div" id="login_passwd_div">
						<input type="password" id="login_input_passwd" maxlength="20" name="passwd" class="input passwd" placeholder="비밀번호" onkeydown="loginOnEnter(event)">
			     	</div>
			     	
			     	<p id="login_errorMessage" class="errorMessage" style="height:0px"></p>
			     	
			     	<p style="height:80px"></p>
			     	
			     	<p style="display:flex; justify-content:space-around"> <input type="button" value="로그인" onclick="loginAttempt()" class="login_button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>