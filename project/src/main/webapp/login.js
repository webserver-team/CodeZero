var noId = false;
var noPw = false;	

function loginAttempt(){
	var form = document.getElementById("login_Member");
	var error = document.getElementById("login_errorMessage");

	if (form.id.value == "")
		noId = true;
	else 
		noId = false;
	if (form.passwd.value == "")
		noPw = true;
	else 
		noPw = false;
	
	if (noId){
		if (noPw){
			error.textContent = "아이디, 비밀번호를 입력해주세요."
			error.style.display = "block";
			form.id.select();
		}
		else{
			error.textContent = "아이디를 입력해주세요."
				error.style.display = "block";
			form.id.select();
		}
	}
	else if (noPw){
		error.textContent = "비밀번호를 입력해주세요."
			error.style.display = "block";
		form.passwd.select();
	}		
	else 
		error.style.display = "none";
	if (!noId && !noPw) 
		form.submit();
}

function loginOnEnter(event) {
    if (event.keyCode === 13) {  
    	loginAttempt();
    }
}

function modifyOnEnter(event) {
    if (event.keyCode === 13) { 
    	modifyAttempt();
    }
}    
   
document.addEventListener("DOMContentLoaded", function () {
    var loginButton = document.getElementById("loginButton");
    var login_Background = document.getElementById("login_Background");
    var loginModal = document.getElementById("loginModal");
    var loginClose = document.getElementById("loginClose");
    
    loginButton.addEventListener("click", function () {
        login_Background.style.display = "block";
        loginModal.style.display = "block";
        setTimeout(function() {
			login_Background.classList.add("fadeIn");
			loginModal.classList.add("fadeIn");
		}, 10)
		document.getElementById("login_input_id").focus();
    });

    loginClose.addEventListener("click", function () {
        login_Background.classList.remove("fadeIn");
		loginModal.classList.remove("fadeIn");

        login_errorMessage.style.display = "none";
        
        setTimeout(function() {
			login_Background.style.display = "none";
        	loginModal.style.display = "none";
		}, 500)
    });
    
    login_Background.addEventListener("click", function () {
        login_Background.classList.remove("fadeIn");
		loginModal.classList.remove("fadeIn");
        login_errorMessage.style.display = "none";
        
        setTimeout(function() {
			login_Background.style.display = "none";
        	loginModal.style.display = "none";
		}, 500)
    });
});