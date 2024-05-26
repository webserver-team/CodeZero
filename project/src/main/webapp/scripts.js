

function loginOnEnter(event) {
    if (event.keyCode === 13) {  
    	loginAttempt();
    }
}

function registerOnEnter(event) {
    if (event.keyCode === 13) { 
    	checkMember();
    }
}

function modifyOnEnter(event) {
    if (event.keyCode === 13) { 
    	modifyAttempt();
    }
}    
    

document.addEventListener("DOMContentLoaded", function () {
    var registerButton = document.getElementById("registerButton");
    var regi_Background = document.getElementById("regi_Background");
    var registerModal = document.getElementById("registerModal");
    var registerClose = document.getElementById("registerClose");

    registerButton.addEventListener("click", function () {
        regi_Background.style.display = "block";
        registerModal.style.display = "block";
		document.getElementById("regi_input_id").focus();
    });

    registerClose.addEventListener("click", function () {
        regi_Background.style.display = "none";
        registerModal.style.display = "none";
        document.getElementById("id_error").style.display = "none";
        document.getElementById("passwd_error").style.display = "none";
        document.getElementById("name_error").style.display = "none";
        document.getElementById("phone_error").style.display = "none";
        document.getElementById("email_error").style.display = "none";	
		regi_errors.style.display = "none";
        document.getElementById("empty1").style.display = "block";
        document.getElementById("empty2").style.display = "block";
    });

    regi_Background.addEventListener("click", function () {
        regi_Background.style.display = "none";
        registerModal.style.display = "none";
        document.getElementById("id_error").style.display = "none";
        document.getElementById("passwd_error").style.display = "none";
        document.getElementById("name_error").style.display = "none";
        document.getElementById("phone_error").style.display = "none";
        document.getElementById("email_error").style.display = "none";	
		regi_errors.style.display = "none";
        document.getElementById("empty1").style.display = "block";
        document.getElementById("empty2").style.display = "block";
    });
    
    var loginButton = document.getElementById("loginButton");
    var login_Background = document.getElementById("login_Background");
    var loginModal = document.getElementById("loginModal");
    var loginClose = document.getElementById("loginClose");
    
    loginButton.addEventListener("click", function () {
        login_Background.style.display = "block";
        loginModal.style.display = "block";
		document.getElementById("login_input_id").focus();
    });

    loginClose.addEventListener("click", function () {
        login_Background.style.display = "none";
        loginModal.style.display = "none";
        login_errorMessage.style.display = "none";
    });
    
    login_Background.addEventListener("click", function () {
        login_Background.style.display = "none";
        loginModal.style.display = "none";
        login_errorMessage.style.display = "none";
    });
});