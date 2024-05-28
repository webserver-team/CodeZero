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
	<script src="../modify.js"></script>
	<script type="text/javascript">
	
	window.onload = function(){
		document.getElementById("my-name-input").focus();
	}
	
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
			<form action="mypage_modify_process.jsp" method="POST" id="mypage-modify-form" class="my-infos">

				<h2 class="mypage-title">회원정보</h2>

				<div id="my-info-id" class="my-info">
					<div class="my-info-in">
						<p class="my-p">ID</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-id-div">
							<input type="text" id="my-id-input" name="id" value="<%=db_id%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div id="my-info-name" class="my-info" style="margin:0px">
					<div class="my-info-in">
						<p class="my-p">이름</p>
					</div>

					<div class="my-info-in value">
						<div class="my-info-div" id="my-name-div">
							<input type="text" id="my-name-input" maxlength="" name="name" placeholder="<%=db_name%>"
								class="my-info-input" onkeydown="modifyOnEnter(event)">
						</div>
					</div>
				</div>
				<p id="name-error" class="errorMessage modify-error">이름 : 한글만 사용 가능</p>

				<div id="my-info-phone" class="my-info" style="margin:0px">
					<div class="my-info-in">
						<p class="my-p">연락처</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-phone-div">
							<input type="text" id="my-phone-input" maxlength="11" name="phone" placeholder="<%=db_phone%>"
								class="my-info-input" onkeydown="modifyOnEnter(event)">
						</div>
					</div>
				</div>
				<p id="phone-error" class="errorMessage modify-error">연락처 입력을 확인해 주세요</p>

				<div id="my-info-email" class="my-info" style="margin:0px">
					<div class="my-info-in">
						<p class="my-p">이메일</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-email-div">
							<input type="text" id="my-email-input" maxlength="40" name="email" placeholder="<%=db_email%>"
								class="my-info-input" onkeydown="modifyOnEnter(event)">
						</div>
					</div>
				</div>
				<p id="email-error" class="errorMessage modify-error">이메일 입력을 확인해 주세요</p>
				<h3></h3>
				<input type="button" class="change-info-button" onclick="modifyAttempt()" value="회원 정보 수정">
				<h5></h5>
			</form>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>