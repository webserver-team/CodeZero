<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.MemberList" %>
<%@ page import="dto.Member" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login Process</title>
	<link rel="stylesheet" href="../stylesheet/styles.css">
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");

    	String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        
        String referer = request.getHeader("Referer");

        String[] result = null;

        MemberList member = new MemberList();
        
        result = member.checkMember(id, passwd);
        
        if (result[0].equals("비밀번호가 일치하지 않습니다.")){
        	session.setAttribute("message", result[0]);
        	session.setAttribute("login_modal_status", "on");
        	response.sendRedirect(referer);
        }
        else if (result[0].equals("사용자가 존재하지 않습니다.")){
        	session.setAttribute("message", result[0]);
        	session.setAttribute("login_modal_status", "on");
        	response.sendRedirect(referer);
        }
        else {
        	session.setAttribute("id", result[0]);
        	session.setAttribute("name", result[1]);
        	response.sendRedirect(referer);
        }
    %>
</body>
</html>