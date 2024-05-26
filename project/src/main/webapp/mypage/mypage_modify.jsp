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
	
	window.onload = function(){
		document.getElementById("my_name_input").focus();
	}
	
	</script>
	
	<script type="text/javascript">
	
		var noName = false;
		var noPhone = false;
		var noEmail = false;
		
		var regExpName = /^[가-힣]{2,7}$/;
		var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		function modifyAttempt(){
			
			var form = document.getElementById("mypage_modify_form");

			var name = form.name.value;
			var phone = form.phone.value;
			var email = form.email.value;
			
			var nameError = document.getElementById("name_error");	
			var phoneError = document.getElementById("phone_error");
			var emailError = document.getElementById("email_error");
			
			if (!regExpName.test(name)){
				nameError.style.display = "block";
				noName = true;
			}
			else {
				nameError.style.display = "none";
				noName = false;
			}

			if (!regExpPhone.test(phone)){
				phoneError.style.display = "block";
				noPhone = true;
			}
			else {
				phoneError.style.display = "none";
				noPhone = false;
			}
			
			if (!regExpEmail.test(email)){
				emailError.style.display = "block";
				noEmail = true;
			}
			else {
				emailError.style.display = "none";
				noEmail = false;
			}
			
			if (noEmail)
				document.getElementById("my_email_input").focus();
			if (noPhone)
				document.getElementById("my_phone_input").focus();
			if (noName)
				document.getElementById("my_name_input").focus();
			
			if (!noName && !noPhone && !noEmail)
				form.submit();
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

	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container mypage_container">
		<div class="my_infos_box">
			<form action="mypage_modify_process.jsp" method="POST" id="mypage_modify_form" class="my_infos">

				<h2 class="mypage_title">회원정보</h2>

				<div id="my_info_id" class="my_info">
					<div class="my_info_in">
						<p class="my_p">ID</p>
					</div>
					<div class="my_info_in value">
						<div class="my_info_div" id="my_id_div">
							<input type="text" id="my_id_input" name="id" value="<%=db_id%>"
								class="my_info_input" disabled>
						</div>
					</div>
				</div>

				<div id="my_info_name" class="my_info">
					<div class="my_info_in">
						<p class="my_p">이름</p>
					</div>

					<div class="my_info_in value">
						<div class="my_info_div" id="my_name_div">
							<input type="text" id="my_name_input" maxlength="" name="name" placeholder="<%=db_name%>"
								class="my_info_input" onkeydown="modifyOnEnter(event)">
						</div>
					</div>
				</div>
				<p id="name_error" class="errorMessage modify_error">이름 : 한글만 사용 가능</p>

				<div id="my_info_phone" class="my_info">
					<div class="my_info_in">
						<p class="my_p">연락처</p>
					</div>
					<div class="my_info_in value">
						<div class="my_info_div" id="my_phone_div">
							<input type="text" id="my_phone_input" maxlength="11" name="phone" placeholder="<%=db_phone%>"
								class="my_info_input" onkeydown="modifyOnEnter(event)">
						</div>
					</div>
				</div>
				<p id="phone_error" class="errorMessage modify_error">연락처 입력을 확인해 주세요</p>

				<div id="my_info_email" class="my_info">
					<div class="my_info_in">
						<p class="my_p">이메일</p>
					</div>
					<div class="my_info_in value">
						<div class="my_info_div" id="my_email_div">
							<input type="text" id="my_email_input" maxlength="40" name="email" placeholder="<%=db_email%>"
								class="my_info_input" onkeydown="modifyOnEnter(event)">
						</div>
					</div>
				</div>
				<p id="email_error" class="errorMessage modify_error">이메일 입력을 확인해 주세요</p>
				<h3></h3>
				<input type="button" class="change_info_button" onclick="modifyAttempt()" value="회원 정보 수정">
				<h5></h5>
			</form>
		</div>
	</div>
</body>
</html>