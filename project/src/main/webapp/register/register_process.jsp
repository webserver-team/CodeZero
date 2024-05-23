<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>회원가입 성공</title>
</head>

<body>
	<%@ include file="/../db/dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
		Statement stmt = null;
		
		try{
			
			String sqlCheckId = "SELECT * FROM member WHERE id ='" + id + "'";

            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sqlCheckId);
			
            if (rs.next()) {
            	session.setAttribute("message", "이미 사용중인 ID입니다.");
            	session.setAttribute("modal_status","on");
            	response.sendRedirect("../home/home.jsp");
            }
            else {
			String sql="INSERT INTO member VALUES('" + id + "','" + passwd + "','" + name + "','" + phone + "','" + email + "')";
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
			
			session.setAttribute("message", "회원이 되신 것을 환영합니다.");
        	response.sendRedirect("../home/home.jsp");
            }
		}catch (SQLException ex){
			session.setAttribute("message", "회원가입에 실패했습니다.");
        	response.sendRedirect("../home/home.jsp");
      
		} finally {
			if (stmt!=null)
				stmt.close();
			if (conn!=null)
				conn.close();
		}
	%>
</body>
</html>