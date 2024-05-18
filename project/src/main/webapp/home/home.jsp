<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "errorpage.jsp" %>
<html>
<head>
	<link rel="stylesheet" href="../stylesheet/home_style.css">
	<link rel="stylesheet" href="../stylesheet/styles.css">
	<title>Welcome</title>
</head>
<body style="background-color:#cfe7c3">
	<div class="container">
	<%@ include file="/../header/header.jsp" %>
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