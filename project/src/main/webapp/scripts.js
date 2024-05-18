document.addEventListener("DOMContentLoaded", function () {
    var registerButton = document.getElementById("registerButton");
    var regi_Background = document.getElementById("regi_Background");
    var registerModal = document.getElementById("registerModal");
    var registerClose = document.getElementById("registerClose");

    registerButton.addEventListener("click", function () {
        regi_Background.style.display = "block";
        registerModal.style.display = "block";
    });

    registerClose.addEventListener("click", function () {
        regi_Background.style.display = "none";
        registerModal.style.display = "none";
    });

    // Close modal when clicking outside of it
    regi_Background.addEventListener("click", function () {
        regi_Background.style.display = "none";
        registerModal.style.display = "none";
    });
    
   
    
    var loginButton = document.getElementById("loginButton");
    var login_Background = document.getElementById("login_Background");
    var loginModal = document.getElementById("loginModal");
    var loginClose = document.getElementById("loginClose");
    
    loginButton.addEventListener("click", function () {
        login_Background.style.display = "block";
        loginModal.style.display = "block";
    });

    loginClose.addEventListener("click", function () {
        login_Background.style.display = "none";
        loginModal.style.display = "none";
    });
    
     // Close modal when clicking outside of it
    login_Background.addEventListener("click", function () {
        login_Background.style.display = "none";
        loginModal.style.display = "none";
    });
});