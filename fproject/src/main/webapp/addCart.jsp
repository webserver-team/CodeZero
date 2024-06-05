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
            String lecId = request.getParameter("lecId");
            String user_id = (String) session.getAttribute("userID");

            PreparedStatement pstmt = null;

            try {
                String sql = "INSERT INTO Cart (userId, lecId) VALUES (?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, user_id); 
                pstmt.setInt(2, Integer.parseInt(lecId));

                int count = pstmt.executeUpdate();
                
                if (count > 0) {
                    System.out.println("장바구니 추가 성공");
                } else {
                    System.out.println("장바구니 추가 실패");
                }                


            } catch (SQLException e) {
                out.println("데이터 삽입 실패");
                out.println(e.getMessage());
            } finally {
                 if (pstmt != null) pstmt.close();
                 if (conn != null) conn.close();
             }
            
            response.sendRedirect("lec.jsp?lecId="+lecId);
        %>
    </div>
</body>
</html>