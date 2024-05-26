<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/checkPasswd.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	<%
	String id = (String) session.getAttribute("id");

	ResultSet rs = null;
	Statement stmt = null;

	String db_id = null;
	String db_passwd = null;
	String db_name = null;
	String db_phone = null;
	String db_email = null;

	try {
		String sql = "SELECT * FROM member WHERE id='" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if (rs.next()) {
			db_id = rs.getString("id");
			db_passwd = rs.getString("passwd");
			db_name = rs.getString("name");
			db_phone = rs.getString("phone");
			db_email = rs.getString("email");
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


	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container check_passwd_container">
		<div class="check_passwd_box">
			<div class="check_passwd">
				<h2 class="check_passwd_title">회원정보</h2>
				<form action="checkPasswd_process.jsp" class="check_passwd_form">
					<div class="check_passwd_in">
						<input type="password" id="checkPasswd" class="check_passwd_input"
							placeholder="비밀번호">
					</div>
					<input type="button" class="check_passwd_button" value="확인">
				</form>
			</div>
		</div>
	</div>
</body>
</html>