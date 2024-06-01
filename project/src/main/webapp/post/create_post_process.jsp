<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PostList" %>
<%@ page import="dto.Post" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<% 	
        request.setCharacterEncoding("utf-8");

 		LocalDate currentDate = LocalDate.now();
 		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
 		String postDate = currentDate.format(formatter);
 	
		String userId = (String)session.getAttribute("id");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		 
		
        String passwd = request.getParameter("passwd");
        
        String referer = request.getHeader("Referer");

        String message = null;

        Post post = new Post(userId, postTitle, postContent, postDate);
        PostList postlist = new PostList();
        
        message = postlist.addPost(post);
        
        session.setAttribute("message", message);
        
        response.sendRedirect("posts.jsp");
        
    %>
</body>
</html>