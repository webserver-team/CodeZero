<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberList"%>
<%@ page import="dto.Member"%>
<html>
<head>
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/mypage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");

	if (session.getAttribute("id") == null) {
		response.sendRedirect("../home/home.jsp");
	} 
	else {
		String[] result = null;

		MemberList memberlist = new MemberList();

		result = memberlist.checkMember(id, passwd);

		if (result[0].equals("비밀번호가 일치하지 않습니다.")) {
			session.setAttribute("message", result[0]);
			response.sendRedirect("checkPasswd.jsp");
		} else
			response.sendRedirect("mypage_modify.jsp");
	}
	%>
</body>
</html>