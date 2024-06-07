<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 학습 페이지</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="connection.jsp" %>
	<%@ include file="courses_nav.jsp" %>
	
	<div class="row row-cols-1 row-cols-md-3 g-4 mt-4">
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
				
				while(rs.next()) {
					String lecId = rs.getString("lecId");
					String lecName = rs.getString("lecName");
					String teacherName = rs.getString("teacherName");
					String image = rs.getString("image");
						
		%>
			<div class="col">
				<a href="lec.jsp?lecId=<%=lecId %>" style = "text-decoration:none; color:black;">
					<div class="mb-3 p-4 border">
						<img src="resource/upload/<%= image %>" class="img-fluid mb-2" alt="<%= lecName %>">
						<h5 style="font-weight: bold; class="text-center" style=""><%= lecName %></h5>
						<%=teacherName %>
					</div>
				</a>
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
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
