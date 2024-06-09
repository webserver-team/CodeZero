<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세페이지</title>
<link rel="stylesheet" href="../stylesheet/lec.css">
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

	<%@ include file="../header/header.jsp" %>
	<%@ include file="../connection/connection.jsp" %>

     <div class="container">
    
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
    			
            	
            	String check2 = "SELECT COUNT(*) FROM Payment WHERE lecId = ?";
    			pstmt = conn.prepareStatement(check2);
    			pstmt.setInt(1, lecId);
    			rs = pstmt.executeQuery();
    			rs.next();
    			int countOfStudents = rs.getInt(1);
            	
            	
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
        
        <div class="row-lecname">
            <div class="col-12 text-left">
                <h1 class="lec-title"><%= lecName %></h1>
                <h3><%= teacherName %></h3>
                <span class="badge bg-primary" style="font-size: 1rem;"><%= lecCategory %></span>
                <span class="badge bg-secondary" style="font-size: 1rem;"><%= lecLevel %></span>
            </div>
        </div>
        
        <div class="row lec-description">
            <!-- Left Column: Lecture Description -->
            <div class="col-lec1">
                <div class="mt-4">
                	<% if (isOrdered == 1) { 
                		%>
                	
                    <video id="video" width="100%" height="auto" controls>
                        <source src="../resource/upload/<%=video%>" type="video/mp4">
                    </video>
                    
                    <% } else {
                    	%>
                    	
                    <video id="video" width="100%" height="auto" disabled>
                        <source src="../resource/upload/<%=video%>" type="video/mp4">
                    </video>
                    <% } %>
                    
                </div>
                <div class="mt-5">
                    <h1 style="font-weight: bold;" class="display-5">강의 소개</h1>           
                    <p><%= lecDescription %></p>
                </div>
                <div class="mt-5">
                    <h1 style="font-weight: bold;" class="display-5">강의평</h1>           
                    <p>강의평 내용 추가</p>
                </div>
            </div>
            
            
            <div class="col-lec2" style="flex-grow:1; height:100%">
                <div class="mt-4">
                    <p class="lec-price">₩<%= lecPrice %></p>
                    <form name="cartForm" action="addCart.jsp?lecId=<%=lecId%>" method="post"> <a href="#" class="addCart-button" onclick="addCart()">장바구니 추가</a> </form>
                    <ul class="list-group list-group-flush mt-3">
                        <li class="list-group-item">난이도 : <%= lecLevel %></li>
                        <li class="list-group-item">수강생 : <%= countOfStudents %>명</li>
                        <li class="list-group-item">리뷰 수 : <%= lecReviewCount %>개</li>
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
</body>
</html>