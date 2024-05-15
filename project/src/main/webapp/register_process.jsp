<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>

<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String email=request.getParameter("email");
		
		Statement stmt = null;
		
		try{
			String sql="INSERT INTO member VALUES('" + id + "','" + passwd + "','" + name + "','" + phone + "','" + email + "')";
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
	%>
			<script>
				alert("회원이 되신 것을 환영합니다.");
				window.location.href = "home.jsp";
			</script>
	<%
		}catch (SQLException ex){
	%>
			<script>
				alert("회원가입에 실패했습니다.");
				window.location.href = "home.jsp";
			</script>
	<%
		} finally {
			if (stmt!=null)
				stmt.close();
			if (conn!=null)
				conn.close();
		}
	%>
</body>
</html>