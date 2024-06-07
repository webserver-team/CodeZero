<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<%@ include file="connection.jsp" %>
    
        <%
            int lecId = Integer.parseInt(request.getParameter("lecId"));
            ResultSet rs = null;
            PreparedStatement pstmt = null;

            try {
	            	
	                String sql = "SELECT lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount, image, video FROM lecture WHERE lecId=?";
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setInt(1, lecId);
	                rs = pstmt.executeQuery();
	
	                if (rs.next()) {
	                    String lecName = rs.getString("lecName");
	                    String teacherName = rs.getString("teacherName");
	                    String video = rs.getString("video");    
               
        %>
        
		<div class="mb-4 text-center">
	        <h1 class="display-5 mt-3 font-weight-bold text-center"><%= lecName %></h1>
	        <video id="video" class="img-fluid mt-3" controls style="margin-top: 40px;">
	            <source src="resource/upload/<%= video %>" type="video/mp4">
	        </video>
	        <p><a href="study.jsp" class="btn btn-light btn-lg">학습 페이지로 돌아가기</a></p>
		</div>


        
        
        
        <%
            } else {
               out.println("<div class='alert alert-warning'>해당 강의를 찾을 수 없습니다.</div>");
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