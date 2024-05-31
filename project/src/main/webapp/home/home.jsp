<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../stylesheet/home_style.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="../header/header.jsp"%>
	
	<div class="container">
	
		<div style="min-height:125px"></div>
		
		<div class="searcharea">
			<div class="searchbox">
				<input class="search" type="text" placeholder="검색어를 입력해 주세요.">
			</div>
		</div>

		<div style="min-height:125px"></div>
		
		<div class="box">
			<div class="lecture-box1"></div>
			<div class="lecture-box2"></div>
			<div class="lecture-box2"></div>
		</div>
	</div>
	<p style="height:100px"></p>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>