<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="../stylesheet/mypage.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	
	<script type="text/javascript">
	
	window.onload = function(){
		messageAlert();
	}
	
	function messageAlert(){
		var message = '<%=session.getAttribute("modify_message")%>';
		if (message != 'null'){
			setTimeout(function() {	
				alert(message);
				}, 100);
		}	
		<%session.removeAttribute("modify_message");%>
	}
	</script>
	
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
	<div class="mypage-container container">
		<div class="my-infos-box">
			<form action="checkPasswd.jsp" method="POST" class="my-infos">

				<h2 class="mypage-title">회원정보</h2>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">ID</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-id-div">
							<input type="text" id="my-id-input" value="<%=db_id%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">이름</p>
					</div>

					<div class="my-info-in value">
						<div class="my-info-div" id="my-name-div">
							<input type="text" id="my-name-input" value="<%=db_name%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">연락처</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-phone-div">
							<input type="text" id="my-phone-input" value="<%=db_phone%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">이메일</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-email-div">
							<input type="text" id="my-email-input" value="<%=db_email%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>
				<h3></h3>
				<input type="submit" class="change-info-button" value="회원 정보 수정">
				<h5></h5>
			</form>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>