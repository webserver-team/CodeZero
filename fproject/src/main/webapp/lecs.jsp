<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >

	<%@ include file="connection.jsp" %>
	<%@ include file="courses_nav.jsp" %>
	
    
    <div class="container mt-4">
    <div class="text-end">
		<a href="?language=ko" >Korean</a> | <a href="?language=en" >English</a>
    </div> 
    <div class="row row-cols-1 row-cols-md-3 g-4 mt-4">
        <%
        	int pageLimit = 9;
        	int count = 0;
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            
            try {
                String sql = "SELECT * FROM lecture";
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
                        <span class="badge bg-primary"><fmt:message key="lecCategory"/>: <%= lecCategory %></span>
                        <span class="badge bg-secondary"><fmt:message key="lecLevel"/>: <%= lecLevel %></span>
                        <span class="badge bg-success"><fmt:message key="lecReviewCount"/>: <%= lecReviewCount %></span>
                    </div>
                </div>
            </div>
            </a>
            
        <% 
        	count++;
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
        
        <!-- 페이지 -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center mt-4">
                <li class="page-item"><a class="page-link" href="lecs.jsp?page=1">1</a></li>
                <li class="page-item"><a class="page-link" href="lecs.jsp?page=2">2</a></li>
            </ul>
        </nav>
    </div>
</fmt:bundle>
</body>
</html>