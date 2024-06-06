<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	LocalDate now = LocalDate.now();
	
	String paymentDate = now.toString();

	System.out.println(paymentDate); // 2021-12-02

	%>
</body>
</html>