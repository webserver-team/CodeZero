<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "errorpage.jsp" %>
<html>
<head>
	<link rel="stylesheet" href="home_style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>Welcome</title>
</head>
<body style="background-color:#cfe7c3">
	<div class="container pu-4">
	<%@ include file="menu_home.jsp" %>
		<div class="container text-center" style = "height:90%">
			<div class="searcharea">
				<div class="searchbox">
		   			<input class="search" type = "text" placeholder = "검색어를 입력해 주세요.">
		   		</div>
	   		</div>
		</div>
	</div>
</body>
</html>