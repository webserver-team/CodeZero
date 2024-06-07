<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의/프로그래밍</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<%@ include file="/connection.jsp" %>
	<%@ include file="courses_nav.jsp" %>
	
	<div class="container mt-4">
    <div class="btn-group mb-5">
       <a href="subCategory.jsp?lecCategory=프론트엔드" class="btn btn-light" aria-current="page">프론트엔드</a>
       <a href="subCategory.jsp?lecCategory=백엔드" class="btn btn-light">백엔드</a>
       <a href="subCategory.jsp?lecCategory=앱 개발" class="btn btn-light">앱 개발</a>
       <a href="subCategory.jsp?lecCategory=데이터베이스" class="btn btn-light">데이터베이스</a>
       <a href="subCategory.jsp?lecCategory=개발도구" class="btn btn-light">개발도구</a>
    </div>
	
   	<div class="row row-cols-1 row-cols-md-3 g-4">
	<%
	
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            
            try {
            	 String sql = "SELECT * FROM lecture WHERE lecCategory IN ('프론트엔드', '백엔드', '앱 개발', '데이터베이스', '개발도구')";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                // 데이터 출력
                while (rs.next()) {
                    String lecName = rs.getString("lecName");
                    String teacherName = rs.getString("teacherName");
                    String lecDescription = rs.getString("lecDescription");
                    String lecCategory = rs.getString("lecCategory");
                    String lecLevel = rs.getString("lecLevel");
                    int lecPrice = rs.getInt("lecPrice");
                    int lecReviewCount = rs.getInt("lecReviewCount");
                    String image = rs.getString("image");
                    int lecId = rs.getInt("lecId");
               		
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
</body>
</html>