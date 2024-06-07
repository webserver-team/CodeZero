<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>하위 카테고리 처리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%@ include file="connection.jsp" %>
	<%@ include file="courses_nav.jsp" %>
	
	<div class="row row-cols-1 row-cols-md-3 g-4 mt-4">
        <%
            String lecCategory = request.getParameter("lecCategory");
            ResultSet rs = null;
            PreparedStatement pstmt = null;

            try {
                String sql = "SELECT * FROM lecture WHERE lecCategory=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, lecCategory);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                	int lecId = rs.getInt("lecId");
                    String lecName = rs.getString("lecName");
                    String teacherName = rs.getString("teacherName");
                    String lecDescription = rs.getString("lecDescription");
                    String lecLevel = rs.getString("lecLevel");
                    int lecPrice = rs.getInt("lecPrice");
                    int lecReviewCount = rs.getInt("lecReviewCount");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
        %>
        
        <a href="lec.jsp?lecId=<%=lecId%>" style = "text-decoration:none; color:black;">
            <div class="col">
                <div class="card h-100">
                    <img src="resource/upload/<%=image %>" class="card-img-top" alt="...">
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
                        <span class="badge bg-success">리뷰 수: <%= lecReviewCount %></span>
                    </div>
                </div>
            </div>
            </a>
            
           
        
        <%
            } else {
               out.println("<div class='alert alert-warning'>강의가 존재하지 않습니다.</div>");
            }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>데이터베이스 오류: " + e.getMessage() + "</div>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
	
</body>
</html>