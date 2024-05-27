var noId = false;
var noPw = false;
var noName = false;
var noPhone = false;
var noEmail = false;

var regExpId = /^[a-z][a-z0-9]{4,19}$/;
var regExpName = /^[가-힣]{2,7}$/;
var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
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

function checkMember(){
	
	var form = document.getElementById("regi_Member");

	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.passwd.value;
	var phone = form.phone.value;
	var email = form.email.value;
	
	var idError = document.getElementById("id_error");		
	var passwdError = document.getElementById("passwd_error");
	var nameError = document.getElementById("name_error");
	var phoneError = document.getElementById("phone_error");
	var emailError = document.getElementById("email_error");
	
	var errors = document.getElementById("regi_errors"); 
	
	var empty1 = document.getElementById("empty1");
	var empty2 = document.getElementById("empty2");
	
	if (!regExpId.test(id)) {
		idError.style.display = "block";
		noId = true;
	}
	else {
		idError.style.display = "none";
		noId = false;
	}
	
	if (!regExpPasswd.test(passwd)) {
		passwdError.style.display = "block";
		noPw = true;
	} 
	else {
		passwdError.style.display = "none";
		noPw = false;
	}
	
	if (!regExpName.test(name)) {
		nameError.style.display = "block";
		noName = true;
	} 
	else {
		nameError.style.display = "none";
		noName = false;
	}
	
	if (!regExpPhone.test(phone)) {
		phoneError.style.display = "block";
		noPhone = true;
	}
	else {
		phoneError.style.display = "none";
		noPhone = false;
	}
	
	if (!regExpEmail.test(email)) {
		emailError.style.display = "block";
		noEmail = true;
	} 
	else {
		emailError.style.display = "none";
		noEmail = false;
	}
	
	if (noId || noPw)
		empty1.style.display = "none";
	else 
		empty1.style.display = "block";
	
	if (noName || noPhone || noEmail){
		empty2.style.display = "none";
		errors.style.display = "block";
	}
	else{ 
		empty1.style.display = "flex";	
		errors.style.display = "none";
	}
	
	if (noEmail)
		form.email.select();
	if (noPhone)
		form.phone.select();
	if (noName)
		form.name.select();
	if (noPw)
		form.passwd.select();
	if (noId)
		form.id.select();
	
	if (!noId && !noPw && !noName && !noPhone && !noEmail)	
		form.submit();
}

document.addEventListener("DOMContentLoaded", function () {
    var registerButton = document.getElementById("registerButton");
    var regi_Background = document.getElementById("regi_Background");
    var registerModal = document.getElementById("registerModal");
    var registerClose = document.getElementById("registerClose");

    registerButton.addEventListener("click", function () {
        regi_Background.style.display = "block";
        registerModal.style.display = "block";
        
        setTimeout(function() {
			regi_Background.classList.add("fadeIn");
			registerModal.classList.add("fadeIn");
		}, 10)
		document.getElementById("regi_input_id").focus();
    });

    registerClose.addEventListener("click", function () {
        regi_Background.classList.remove("fadeIn");
		registerModal.classList.remove("fadeIn");
		setTimeout(function() {
			regi_Background.style.display = "none";
        	registerModal.style.display = "none";
		}, 500)
		
        id_error.style.display = "none";
        passwd_error.style.display = "none";
        name_error.style.display = "none";
        phone_error.style.display = "none";
        email_error.style.display = "none";	
		regi_errors.style.display = "none";
        empty1.style.display = "block";
        empty2.style.display = "block";
    });

    regi_Background.addEventListener("click", function () {
		regi_Background.classList.remove("fadeIn");
		registerModal.classList.remove("fadeIn");
		setTimeout(function() {
			regi_Background.style.display = "none";
        	registerModal.style.display = "none";
		}, 500)

        document.getElementById("id_error").style.display = "none";
        document.getElementById("passwd_error").style.display = "none";
        document.getElementById("name_error").style.display = "none";
        document.getElementById("phone_error").style.display = "none";
        document.getElementById("email_error").style.display = "none";	
		regi_errors.style.display = "none";
        document.getElementById("empty1").style.display = "block";
        document.getElementById("empty2").style.display = "block";
    });
});