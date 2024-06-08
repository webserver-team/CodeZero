<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팝업 창</title>
    <script>
        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (seconds * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }

        function closePopup() {
            setCookie("hidePopup", "true", 30); // 하루 동안 쿠키 설정
            document.getElementById("popup").style.display = "none";
        }
    </script>
</head>
<body>
    <%
        Cookie[] cookies = request.getCookies();
    	
        int hidePopup = 0;
        
		Cookie cookie_id = new Cookie("userID", user_id);
		Cookie cookie_pw = new Cookie("userPW", user_pw);

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("hidePopup") && cookie.getValue().equals("true")) {
                    hidePopup = true;
                    break;
                }
            }
        }
    %>
    <div id="popup" style="display:<%= hidePopup ? "none" : "block" %>; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); padding:20px; background-color:#fff; border:1px solid #000;">
        <p>이 팝업은 하루 동안 보지 않기 설정이 가능합니다.</p>
        <button onclick="closePopup()">하루 동안 보지 않기</button>
    </div>
</body>
</html>
