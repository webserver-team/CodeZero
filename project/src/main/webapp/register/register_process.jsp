<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberList" %>
<%@ page import="dto.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>회원가입 성공</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
		String referer = request.getHeader("Referer");
		
		String message = null;
		
		MemberList member = new MemberList(); 
		
		message = member.addMember(id, passwd, name, phone, email);
		
		session.setAttribute("message", message);
		
		if(message.equals("이미 사용중인 ID입니다.")){
			session.setAttribute("regi_modal_status","on");
		}
		
		response.sendRedirect(referer);
	%>
</body>
</html>