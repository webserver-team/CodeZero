<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberList" %>
<%@ page import="dto.Member" %>
<html>
<head>
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/mypage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%
	
	if (session.getAttribute("id") == null){
		response.sendRedirect("../home/home.jsp");
	}
	
	String id = (String) session.getAttribute("id");
	String name = request.getParameter("name");
	String phone= request.getParameter("phone");
	String email = request.getParameter("email");
	
	String message = null;

	MemberList memberlist = new MemberList();
	
	message = memberlist.changeInfo(id, name, phone, email);
	
	session.setAttribute("message", message);
	session.setAttribute("name", name);
	session.setAttribute("id", id);
	response.sendRedirect("mypage.jsp");
	%>
</body>
</html>
