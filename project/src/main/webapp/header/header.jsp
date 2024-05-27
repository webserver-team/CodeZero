<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>


<link rel="stylesheet" href="../stylesheet/header_style.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/register.css">

<%
	
	String header_name = (String)session.getAttribute("name");
	String header_id = (String)session.getAttribute("id");
	
%>


<script>
	function clearText(){
		var inputs = document.getElementsByClassName("input");
		for (var i = 0; i < inputs.length; i++)
			inputs[i].value = "";
	}
	
	
	
</script>



<header class="pb-3 border-bottom" style="margin-top: 10px; margin-bottom:20px; padding-bottom:15px !important; border-bottom:1px solid #03c75a !important">
<div class="container text-center">
	<div class="row">
		<div class="col" style="margin-top:10px">
		   	<a href="../home/home.jsp" class="home-button"> 
			    <svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
					<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
				</svg>   
		    	<span><b>CODE:0</b></span>
			</a>    
			<div class="login-register" style="display:flex; justify-content:flex-end; width:100%; height:32px">
		
				<% if (header_name == null) {%>
				<button id="loginButton" class="header-button" onclick="clearText()">로그인</button>
				<jsp:include page="../login/login.jsp"></jsp:include>
	
				<button id="registerButton" class="header-button" onclick="clearText()">회원가입</button> 
				<jsp:include page="../register/register.jsp"></jsp:include>
				<% } 
				else {%>
				<a href="../mypage/mypage.jsp" class="link" style="font-size:13px; margin-right:5px"><%= header_name %> 님</a>
				<form action="../login/logout_process.jsp" class="logout" style="height:100%">
					<button type="submit" id="logout" class="header-button">로그아웃</button>
				</form>
				<% } %>
			</div>
			<script src="../scripts.js"></script>
		</div>
	</div>
	
	<div class="category">
		<a href="../lectures/lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
			JAVA
		</a>		
		<a href="../lectures/lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
			C
		</a>
		<a href="../lectures/lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
			C++	
		</a>
		<a href="../lectures/lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
			인공지능
		</a>
		<a href="../lectures/lectures.jsp" class="category_link d-flex align-items-center text-decoration-none">
			디자인
		</a>
		<a href="../noticeBoard/noticeBoard.jsp" class="category_link d-flex align-items-center text-decoration-none">
			게시판	
		</a>
	</div>
</div>
</header>