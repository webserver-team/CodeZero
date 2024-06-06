<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <%@ include file="connection.jsp" %>

        <%
        	int cart = 0;
            int lecId = Integer.parseInt(request.getParameter("lecId"));
            String user_id = (String) session.getAttribute("userID");

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
            	
            	String check = "SELECT COUNT(*) FROM Payment WHERE userId = ? AND lecId = ?";
    			pstmt = conn.prepareStatement(check);
    			pstmt.setString(1, user_id);
    			pstmt.setInt(2, lecId);
    			rs = pstmt.executeQuery();
    			rs.next();
    			
    			int IsOrdered = rs.getInt(1);
    			
    			if (IsOrdered==0) {
    				
	                String sql = "INSERT INTO Cart (userId, lecId) VALUES (?, ?)";
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, user_id); 
	                pstmt.setInt(2, lecId);
	
	                pstmt.executeUpdate();
	                cart = 1;
	                
    			} else {
    				System.out.println("이미 구입한 강의입니다.");
    			}


            } catch (SQLException e) {
                out.println("데이터 삽입 실패");
                out.println(e.getMessage());
            } finally {
                 if (pstmt != null) pstmt.close();
                 if (conn != null) conn.close();
             }
            
            response.sendRedirect("lec.jsp?lecId="+lecId+"&cart="+cart);
        %>
    </div>
</body>
</html>