<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Login Modal Example</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Main content -->
    <div class="main-content">
        <h1>Welcome to Our Website</h1>
        <button id="loginButton">Login</button>
    </div>

    <!-- Modal Background -->
    <div id="modalBackground" class="modal-background"></div>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span id="closeModal" class="close">&times;</span>
            <h2>Login</h2>
            <form action="login.jsp" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <br>
                <button type="submit">Login</button>
            </form>
        </div>
    </div>

    <script src="scripts.js"></script>
</body>
</html>