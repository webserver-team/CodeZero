<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
		var form = document.loginForm;
		var errorMessage = document.createElement("p");
		
		if ((form.id.value && form.pw.value) == "") {
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
    <div>
    <h1>로그인 </h1>
    <form name="loginForm" action="login_process.jsp" method="post">
       <input type="text" placeholder="아이디" name="user_id"> <br>
       <input type="password" placeholder="비밀번호" name="password">
       <input type="button" value="로그인 하기" onclick="loginAttempt()">
    </form>
    </div>

</body>
</html>