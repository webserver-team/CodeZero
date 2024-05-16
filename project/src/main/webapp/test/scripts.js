document.addEventListener("DOMContentLoaded", function () {
    var loginButton = document.getElementById("loginButton");
    var modalBackground = document.getElementById("modalBackground");
    var loginModal = document.getElementById("loginModal");
    var closeModal = document.getElementById("closeModal");

    loginButton.addEventListener("click", function () {
        modalBackground.style.display = "block";
        loginModal.style.display = "block";
    });

    closeModal.addEventListener("click", function () {
        modalBackground.style.display = "none";
        loginModal.style.display = "none";
    });

    // Close modal when clicking outside of it
    modalBackground.addEventListener("click", function () {
        modalBackground.style.display = "none";
        loginModal.style.display = "none";
    });
});