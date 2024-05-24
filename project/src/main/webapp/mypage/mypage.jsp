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
		<div class="container">
			<div class="my_infos">

				<div class="my_info">
					<div class="my_info_in">
						<p class="my_p">ID</p>
					</div>
					<div class="my_info_in">
						<div class="my_info_div" id="my_id_div">
							<input type="text" id="my_id_input" value="<%=db_id%>"
								class="my_info_input" disabled>
						</div>
					</div>
				</div>

				<div class="my_info">
					<div class="my_info_in">
						<p class="my_p">이름</p>
					</div>

					<div class="my_info_in">
						<div class="my_info_div" id="my_name_div">
							<input type="text" id="my_name_input" value="<%=db_name%>"
								class="my_info_input" disabled>
						</div>
					</div>
				</div>

				<div class="my_info">
					<div class="my_info_in">
						<p class="my_p">연락처</p>
					</div>
					<div class="my_info_in">
						<div class="my_info_div" id="my_phone_div">
							<input type="text" id="my_phone_input" value="<%=db_phone%>"
								class="my_info_input" disabled>
						</div>
					</div>
				</div>

				<div class="my_info">
					<div class="my_info_in">
						<p class="my_p">이메일</p>
					</div>
					<div class="my_info_in">
						<div class="my_info_div" id="my_email_div">
							<input type="text" id="my_email_input" value="<%=db_email%>"
								class="my_info_input" disabled>
						</div>
					</div>
				</div>
				<input type="button" value="회원 정보 수정">
			</div>
		</div>
	</div>
</body>
</html>