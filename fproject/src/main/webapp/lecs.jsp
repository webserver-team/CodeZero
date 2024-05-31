<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%@ include file="connection.jsp" %>
	
    <div class="container mt-4">
        <div class="d-flex justify-content-end mb-3">
        	<a href="cart.jsp" class="btn btn-light btn-lg" role="button">장바구니</a>
            <a href="lec_enroll.jsp" class="btn btn-light btn-lg" role="button">강의 등록</a>
        </div>
        
        <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
        
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            
            try {
                String sql = "SELECT lecId, lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount, image FROM lecture";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                // 데이터 출력
                while (rs.next()) {
                	int lecId = rs.getInt("lecId");
                    String lecName = rs.getString("lecName");
                    String teacherName = rs.getString("teacherName");
                    String lecDescription = rs.getString("lecDescription");
                    String lecCategory = rs.getString("lecCategory");
                    String lecLevel = rs.getString("lecLevel");
                    int lecPrice = rs.getInt("lecPrice");
                    int lecReviewCount = rs.getInt("lecReviewCount");
                    String image = rs.getString("image");
               		
        %>
        	<a href="lec.jsp?lecId=<%=lecId%>" class="text-dark text-decoration-none">
            <div class="col">
                <div class="card h-100">
                    <img src="resource/upload/<%=image %>" class="card-img-top" alt="...">
                    <div class="card-body p-4">
                        <h5 class="card-title"><%= lecName %></h5>
                        <p class="card-text"><%= lecDescription.length() > 60 ? lecDescription.substring(0, 60) + "..." : lecDescription %></p>
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
                }
            } catch (SQLException e) {
                out.println("lecture 테이블 호출 실패");
                out.println(e.getMessage());
            } finally {
                // 리소스 정리
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center mt-4">
                <li class="page-item"><a class="page-link" href="lecs.jsp?page=1">1</a></li>
                <li class="page-item"><a class="page-link" href="lecs.jsp?page=2">2</a></li>
            </ul>
        </nav>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
