<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <% 
    request.setCharacterEncoding("UTF-8");

    Cookie[] cookies = request.getCookies();
    String lecDescription = "";
    String teacherName = "";
    int lecPrice = 0;
    String lecCategory = "";
    String lecLevel = "";
    int lecReviewCount = 0;
    String lecImage = "";
    String lecName = "";
    int lecId = 0;

    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++){
            String cookieName = cookies[i].getName();
            String cookieValue = URLDecoder.decode(cookies[i].getValue(), "utf-8");

            if (cookieName.equals("c_lecDescription")) {
                lecDescription = cookieValue;
            } else if (cookieName.equals("c_teacherName")) {
                teacherName = cookieValue;
            } else if (cookieName.equals("c_lecPrice")) {
                lecPrice = Integer.parseInt(cookieValue);
            } else if (cookieName.equals("c_lecCategory")) {
                lecCategory = cookieValue;
            } else if (cookieName.equals("c_lecLevel")) {
                lecLevel = cookieValue;
            } else if (cookieName.equals("c_lecReviewCount")) {
                lecReviewCount = Integer.parseInt(cookieValue);
            } else if (cookieName.equals("c_image")) {
                lecImage = cookieValue;
            } else if (cookieName.equals("c_lecName")) {
                lecName = cookieValue;
            } else if (cookieName.equals("c_lecId")) {
                lecId = Integer.parseInt(cookieValue);
            }
        }
    }
    %>
    
    <a href="lec.jsp?lecId=<%= lecId %>" style="text-decoration:none; color:black;">
        <div class="col">
            <div class="card h-100">
                <img src="resource/upload/<%= lecImage %>" class="card-img-top" alt="...">
                <div class="card-body p-4">
                    <h5 class="card-title"><%= lecName %></h5>
                    <p class="card-text"><%= lecDescription %></p>
                    <div class="d-flex justify-content-between">
                        <p class="card-text" style="font-weight: bold;"><%= teacherName %></p>
                        <p class="card-text card-price" style="font-weight: bold;">₩<%= lecPrice %></p>
                    </div>
                </div>
                <div class="card-footer bg-light text-end">
                    <span class="badge bg-primary"><%= lecCategory %></span>
                    <span class="badge bg-secondary"><%= lecLevel %></span>
                    <span class="badge bg-success">리뷰 수 : <%= lecReviewCount %></span>
                </div>
            </div>
        </div>
    </a>
  
</body>
</html>
