<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/create_post.css">
<title>게시판</title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");
	String referer = request.getHeader("Referer");

	if (id == null){
		response.sendRedirect("../home/home.jsp");
	}
%>


	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container table_container" style="height: 90%">
		<div class="createpost-title-div">
			<h3 class="createpost-title">게시물 작성</h3>
		</div>
		<form class="createpost-form">
			<textarea id="post-textarea" class="post-textarea"></textarea>
			<input type="button" class="createpost-button" value="등록하기"> 
		</form>
	</div>
</body>
</html>
<%@ include file="/../footer/footer.jsp"%>