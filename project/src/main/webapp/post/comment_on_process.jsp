<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.CommentList" %>
<%@ page import="dto.Comment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = (String)session.getAttribute("id");
	String postId = request.getParameter("postId");
	String comment = request.getParameter("comment-textarea");

	String message = null;
	
	CommentList commentlist = new CommentList();
	
	message = commentlist.addComment(postId, userId, comment);
	
	session.setAttribute("message", message);
	
	response.sendRedirect("post.jsp?postId=" + postId);
%>
</body>
</html>