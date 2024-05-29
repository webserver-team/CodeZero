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
	<script type="text/javascript">
	window.addEventListener('load', function() {
		document.getElementById("checkPasswd").focus();
	});
	</script>

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

	<%@ include file="/../header/header.jsp"%>
	<div class="container mypage-container">
		<div class="my-infos-box">
			<form action="checkPasswd_process.jsp" method="POST" class="my-infos">

				<h2 class="mypage-title">회원정보</h2>

				<div class="my-info" style="width:250px">
					<div class="check-passwd-in">
						<div class="check-passwd-div">
							<input type="password" name="passwd" id="checkPasswd" class="check-passwd-input"
								placeholder="비밀번호">
						</div>
					</div>
				</div>
				
				<p style="height:100px"></p>
				<input type="submit" class="change-info-button" style="width:250px" value="확인">
			</form>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>