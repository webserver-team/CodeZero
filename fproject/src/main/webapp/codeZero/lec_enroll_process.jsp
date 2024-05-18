<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 강의 관련 데이터를 받아와서 데이터베이스에 저장하는 코드입니다. -->
	<%@ include file ="connection.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		// *** 데이터를 한번에 받아오도록 수정
		int lecId = 201000001;
		String lecName = request.getParameter("lecName");
		String teacherName = request.getParameter("teacherName");
		String lecDescription = request.getParameter("lecDescription");
		String lecCategory = request.getParameter("lecCategory");
		String lecLevel = request.getParameter("lecLevel");
		int lecPrice = Integer.parseInt(request.getParameter("lecPrice"));
		int lecReviewCount = 0;
		
		Statement stmt = null;
		
        try {
        	String sql="INSERT INTO lecture(lecId, lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount) VALUES (" + null + ", '" + lecName + "', '" + teacherName + "', '" + lecDescription + "', '" + lecCategory + "', '" + lecLevel + "', " + lecPrice + ", " + lecReviewCount + ")";
        	stmt = conn.createStatement();
        	stmt.executeUpdate(sql);
        	String message = "강의가 정상적으로 등록되었습니다.";
        	System.out.println(message);
        	response.sendRedirect("lec_enroll.jsp");
        } catch (SQLException ex){
        	out.println("SQLException: " + ex.getMessage());
        } finally {
        	if (stmt!=null)
        		stmt.close();
        	if (conn!=null)
        		conn.close();
        }
	%>
</body>
</html>