<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PostList" %>
<%@ page import="dto.Post" %>
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
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
        String passwd = request.getParameter("passwd");
        
        String referer = request.getHeader("Referer");

        String message = null;

        PostList postlist = new PostList();
        
        message = postlist.addPost(userId, postTitle, postContent);
        
        session.setAttribute("message", message);
        
        response.sendRedirect("posts.jsp");
        
    %>
</body>
</html>