<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 학습 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <%@ include file="connection.jsp" %>
    <%@ include file="courses_nav.jsp" %>
    
    <div class="container mt-4">
    <%
        String user_id = (String) session.getAttribute("userID");

        if (user_id == null) {
            out.println("<div class='alert alert-warning'>로그인이 필요합니다.</div>");
            return;
        }

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM Lecture WHERE lecId IN (SELECT lecId FROM Payment WHERE userId = ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            if (!rs.isBeforeFirst()) { 
                out.println("<div class='alert alert-danger'>수강 중인 강좌가 없습니다.</div>");
            } else {
    %>
    
        <div class="row row-cols-1 row-cols-md-3 g-4 mt-4">
    <%
            while(rs.next()) {
                String lecId = rs.getString("lecId");
                String lecName = rs.getString("lecName");
                String teacherName = rs.getString("teacherName");
                String image = rs.getString("image");
    %>
            <div class="col">
                <a href="playing.jsp?lecId=<%=lecId %>" style="text-decoration:none; color:black;">
                    <div class="card h-100">
                        <img src="resource/upload/<%=image %>" class="card-img-top" alt="Course Image">
                        <div class="card-body p-4">
                            <h5 class="card-title"><%= lecName %></h5>
                            <p class="card-text" style="font-weight: bold;"><%= teacherName %></p>
                        </div>
                    </div>
                </a>
            </div>
    <%
            }
    %>
        </div>
    </div>
    <%
            }
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>" + e.getMessage() + "</div>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger'>리소스 닫기 에러: " + e.getMessage() + "</div>");
            }
        }
    %>
</body>
</html>
