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
	String id = (String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");

	ResultSet rs = null;
	Statement stmt = null;

	String db_passwd = null;

	try {
		String sql = "SELECT * FROM member WHERE id='" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if (rs.next()) {
			db_passwd = rs.getString("passwd");
			if (passwd.equals(db_passwd)){
				response.sendRedirect("mypage_modify.jsp");
			}
			else{
				session.setAttribute("check_passwd_message", "비밀번호가 일치하지 않습니다.");
				response.sendRedirect("checkPasswd.jsp");
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	%>
</body>
</html>