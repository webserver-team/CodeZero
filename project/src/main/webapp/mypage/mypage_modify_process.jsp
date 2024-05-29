<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/mypage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	<%
	String id = (String) session.getAttribute("id");
	String name = request.getParameter("name");
	String phone= request.getParameter("phone");
	String email = request.getParameter("email");
	
	String sql = null;
	Statement stmt = null;

	String db_id = null;
	String db_name = null;
	String db_phone = null;
	String db_email = null;

	try {
		sql = "UPDATE member SET name = '" + name + "', phone = '" + phone + "', email = '" + email + "' WHERE id = '" + id + "'";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		session.setAttribute("message","회원정보가 수정되었습니다.");
		session.setAttribute("name", name);
		session.setAttribute("id", id);
		response.sendRedirect("mypage.jsp");
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	%>
</body>
</html>
