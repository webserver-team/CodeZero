document.addEventListener("DOMContentLoaded", function () {
    var registerButton = document.getElementById("registerButton");
    var modalBackground = document.getElementById("modalBackground");
    var registerModal = document.getElementById("registerModal");
    var closeModal = document.getElementById("closeModal");

    registerButton.addEventListener("click", function () {
        modalBackground.style.display = "block";
        registerModal.style.display = "block";
    });

    closeModal.addEventListener("click", function () {
        modalBackground.style.display = "none";
        registerModal.style.display = "none";
    });

    // Close modal when clicking outside of it
    modalBackground.addEventListener("click", function () {
        modalBackground.style.display = "none";
        registerModal.style.display = "none";
    });
});