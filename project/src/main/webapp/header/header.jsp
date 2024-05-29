<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link rel="stylesheet" href="../stylesheet/header_style.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/register.css">

<%
String header_name = (String) session.getAttribute("name");
String header_id = (String) session.getAttribute("id");
%>

<script>
	function clearText() {
		var inputs = document.getElementsByClassName("input");
		for (var i = 0; i < inputs.length; i++)
			inputs[i].value = "";
	}
</script>

<script type="text/javascript">
	
	window.onload = function(){
		
		loginModal();
		
		registerModal();
		
		messageAlert();
	}
	
	function messageAlert(){
		var message = '<%=session.getAttribute("message")%>';
		if (message != 'null'){
			setTimeout(function() {			// modal창을 띄우고 alert창이 뜨게 하기 위해 약간의 지연시간을 줌
				alert(message);
				}, 100);
		}	
		<%session.removeAttribute("message");%>
	}
	
	function registerModal(){
		var regi_modal_status = '<%=session.getAttribute("regi_modal_status")%>';
		if (regi_modal_status == "on"){
			document.getElementById("registerModal").style.display = "block";
			document.getElementById("regi-background").style.display = "block";
			document.getElementById("registerModal").classList.add("fadeIn");
			document.getElementById("regi-background").classList.add("fadeIn");
			document.getElementById("regi-input-id").focus();
		}
		<%session.removeAttribute("regi_modal_status");%>
	}
	
	function loginModal(){
		var login_modal_status = '<%=session.getAttribute("login_modal_status")%>';
				if (login_modal_status == "on") {
					document.getElementById("loginModal").style.display = "block";
					document.getElementById("login-background").style.display = "block";
					document.getElementById("loginModal").classList.add("fadeIn");
					document.getElementById("login-background").classList.add("fadeIn");
					document.getElementById("login-input-id").focus();
				}
		<%session.removeAttribute("login_modal_status");%>
	}
</script>

<script src="../login.js"></script>
<script src="../register.js"></script>
<script src="../dropdown.js"></script>

<header class="header">
<div class="header-box">
	<div class="header-container"
		style="height: 110px; display: flex; flex-direction: column">
		<div class="row">
			<div class="col" style="margin-top: 10px">
				<a href="../home/home.jsp" class="home-button"> 
				<svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
					<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
				</svg> <span><b>CODE:0</b></span>
				</a>
				<div class="login-register"
					style="display: flex; justify-content: flex-end; width: 100%; height: 32px">

					<%
					if (header_name == null) {
					%>
					<button id="loginButton" class="header-button"
						onclick="clearText()">로그인</button>
					<jsp:include page="../login/login.jsp"></jsp:include>

					<button id="registerButton" class="header-button"
						onclick="clearText()">회원가입</button>
					<jsp:include page="../register/register.jsp"></jsp:include>
					<%
					} else {
					%>
					<a href="../mypage/mypage.jsp" class="link"
						style="font-size: 13px; margin-right: 5px"><%=header_name%> 님</a>
					<form action="../login/logout_process.jsp" class="logout"
						style="height: 100%">
						<button type="submit" id="logout" class="header-button">로그아웃</button>
					</form>
					<%
					}
					%>
				</div>
			</div>
		</div>

		<div id="header_category" class="category">
			<div class="category-div">
				<a href="../lectures/lectures.jsp" class="category-link"> JAVA </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lectures.jsp" class="category-link"> C </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lectures.jsp" class="category-link"> C++ </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lectures.jsp" class="category-link"> 인공지능 </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lectures.jsp" class="category-link"> 디자인 </a>
			</div>
			<div class="category-div">
				<a href="../noticeBoard/noticeBoard.jsp" class="category-link">
					게시판 </a>
			</div>
			<div id="dropdownContent" class="dropdown-content">
				<div id="dropdown-category" class="dropdown-category">
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a> 
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
					<a id="dropdown-category-a" class="dropdown-category-a">뭐시기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</header>