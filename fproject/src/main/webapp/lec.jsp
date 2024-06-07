<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>

    
	function addCart() {
		if (confirm("장바구니에 등록하시겠습니까?")){
			document.cartForm.submit();
		} else {
			document.cartForm.reset();
		}
	}
	

    </script>
</head>
<body>

	<%@ include file="connection.jsp" %>
	<%@ include file="courses_nav.jsp" %>

    <div class="mt-4">
    
        <%
        	String user_id = (String) session.getAttribute("userID");
            int lecId = Integer.parseInt(request.getParameter("lecId"));
            ResultSet rs = null;
            PreparedStatement pstmt = null;

            try {
            	
            	String check = "SELECT COUNT(*) FROM Payment WHERE userId = ? AND lecId = ?";
    			pstmt = conn.prepareStatement(check);
    			pstmt.setString(1, user_id);
    			pstmt.setInt(2, lecId);
    			rs = pstmt.executeQuery();
    			rs.next();
    			int isOrdered = rs.getInt(1);
            	
            	
                String sql = "SELECT lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount, image, video FROM lecture WHERE lecId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, lecId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String lecName = rs.getString("lecName");
                    String teacherName = rs.getString("teacherName");
                    String lecDescription = rs.getString("lecDescription");
                    String lecCategory = rs.getString("lecCategory");
                    String lecLevel = rs.getString("lecLevel");
                    int lecPrice = rs.getInt("lecPrice");
                    int lecReviewCount = rs.getInt("lecReviewCount");
                    String image = rs.getString("image");
                    String video = rs.getString("video");    
               
        %>
        
        <div class="row mb-4">
            <div class="col-12 text-left">
                <h1 style="font-weight: bold;" class="display-4 mt-3"><%= lecName %></h1>
                <h3><%= teacherName %></h3>
                <span class="badge bg-primary" style="font-size: 1rem;"><%= lecCategory %></span>
                <span class="badge bg-secondary" style="font-size: 1rem;"><%= lecLevel %></span>
            </div>
        </div>
        
        <div class="row">
            <!-- Left Column: Lecture Description -->
            <div class="col-md-8">
                <div class="mt-4">
                	<% if (isOrdered == 1) { 
                		%>
                	
                    <video id="video" width="100%" height="auto" controls>
                        <source src="resource/upload/<%=video%>" type="video/mp4">
                    </video>
                    
                    <% } else {
                    	%>
                    	
                    <video id="video" width="100%" height="auto" disabled>
                        <source src="resource/upload/<%=video%>" type="video/mp4">
                    </video>
                    <% } %>
                    
                </div>
                <div class="mt-5">
                    <h1 style="font-weight: bold;" class="display-5">강의 소개</h1>           
                    <p><%= lecDescription %></p>
                </div>
                <div class="mt-5">
                    <h1 style="font-weight: bold;" class="display-5">강의 커리큘럼</h1>           
                    <p>강의 커리큘럼 내용 추가</p>
                </div>
                <div class="mt-5">
                    <h1 style="font-weight: bold;" class="display-5">강의평</h1>           
                    <p>강의평 내용 추가</p>
                </div>
            </div>
            
            
            <div class="col-md-4">
                <div class="mt-4">
                    <p style="font-weight: bold;" class="display-6 mt-3 text-end">₩<%= lecPrice %></p>
                    <form name="cartForm" action="addCart.jsp?lecId=<%=lecId%>" method="post"> <a href="#" class="btn btn-primary btn-lg w-100" onclick="addCart()">장바구니 추가</a> </form>
                    <ul class="list-group list-group-flush mt-3">
                        <li class="list-group-item">강의 수: 총 49개 수업</li>
                        <li class="list-group-item">난이도: <%= lecLevel %></li>
                        <li class="list-group-item">수강생: .....명</li>
                        <li class="list-group-item">리뷰 수: <%= lecReviewCount %>개</li>
                    </ul>
                </div>
            </div>
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