<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file ="../db/dbconn.jsp" %>

<link rel="stylesheet" href="../stylesheet/login.css">
	<meta charset="UTF-8">
	<title>Document</title>

	<script type="text/javascript">
	
	var messageExist = 0;
	var noId = 0;
	var noPw = 0;
	
	function loginAttempt(){
		var form = document.getElementById('login_Member');
		var errorMessage = document.createElement("p");
		errorMessage.id = "errorMessage";
		errorMessage.style = "font-size:13px"
		var target = document.getElementById("passwd_div");
		
		if (form.id.value == "")
			noId = 1;
		else 
			noId = 0;
		if (form.passwd.value == "")
			noPw = 1;
		else 
			noPw = 0;
			
		if (messageExist == 0){
			form.insertBefore(errorMessage, target.nextSibling);
			messageExist = 1;
		}
		
		if (noId == 1){
			if (noPw == 1){
				document.getElementById("errorMessage").textContent = "아이디, 비밀번호를 입력해주세요."
				document.getElementById("input_id").focus();
			}
			else{
				document.getElementById("errorMessage").textContent = "아이디를 입력해주세요."
				document.getElementById("input_id").focus();
			}
			return false;
		}
		else if (noPw == 1){
			document.getElementById("errorMessage").textContent = "비밀번호를 입력해주세요."
			document.getElementById("input_passwd").focus();
			return false;
		}		
	
// 		if (form.id.value == "") {
// 			if (idMessageLimit < 1){
// 				if(messageExist == 0){
// 					form.insertBefore(errorMessage, target.nextSibling);
// 					errorMessage.textContent = "아이디를 입력해주세요."
// 					messageExist = 1;
// 					idMessageLimit = 1;
// 				}
// 				else{
// 					message = document.getElementById("errorMessage");
// 					message.textContent = "아이디를 입력해주세요."
// 					idMessageLimit = 1;
// 				}
// 			}
// 			pwMessageLimit = 0;
// 			return false;
// 		}
// 		else {
// 			idMessageLimit = 0;
// 		}
		
// 		if (form.passwd.value == ""){
// 			if (pwMessageLimit < 1){
// 				if(messageExist == 0){
// 					form.insertBefore(errorMessage, target.nextSibling);
// 					errorMessage.textContent = "비밀번호를 입력해주세요."
// 					messageExist = 1;
// 					pwMessageLimit = 1;
// 				}
// 				else{
// 					message = document.getElementById("errorMessage");
// 					message.textContent = "비밀번호를 입력해주세요."
// 					pwMessageLimit = 1;
// 				}
// 			}
// 			return false;
// 		}
// 		else {
// 			pwMessageLimit = 0;
// 		}

		form.submit();
	}

// 	function hideIdMessage(){
// 		if (noId != 0 && messageExist != 0){
// 			document.getElementById("errorMessage").style.display = "none";
// 			noId= 0;
// 			messageExist = 0;	
// 		}
// 	}
	
// 	function hidePwMessage(){
// 		if (noPw != 0 && messageExist != 0){
// 			document.getElementById("errorMessage").style.display = "none";
// 			noPw = 0;
// 			messageExist = 0;
// 		}
// 	}
	
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
					
					<div class="login_id_div input_div">
						<input type="text" id="input_id" name="id" class="input id" placeholder="아이디">
			   		</div>
					<div class="login_passwd_div input_div" id="passwd_div">
						<input type="password" id="input_passwd" name="passwd" class="input passwd" placeholder="비밀번호">
			     	</div>
			     	<p style="display:flex; justify-content:space-around"> <input type="button" value="로그인" style="margin-top:70px" onclick="loginAttempt()" class="button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>