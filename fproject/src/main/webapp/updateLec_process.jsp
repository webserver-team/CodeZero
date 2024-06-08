<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정 처리</title>
</head>
<body>
    <%@ include file ="connection.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");
        MultipartRequest multi = new MultipartRequest(request, "/Users/mm/git/CodeZero/fproject/src/main/webapp/resource/upload", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

        int lecId = Integer.parseInt(multi.getParameter("lecId"));
        String lecName = multi.getParameter("lecName");
        String teacherName = multi.getParameter("teacherName");
        String lecDescription = multi.getParameter("lecDescription");
        String lecCategory = multi.getParameter("lecCategory");
        String lecLevel = multi.getParameter("lecLevel");
        int lecPrice = Integer.parseInt(multi.getParameter("lecPrice"));
        String imageName = multi.getParameter("imageName");
        String videoName = multi.getParameter("videoName");
 		
 	   PreparedStatement pstmt = null;
	
	    try {
	        String sql = "UPDATE lecture SET lecName=?, teacherName=?, lecDescription=?, lecCategory=?, lecLevel=?, lecPrice=?, image=?, video=? WHERE lecId=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, lecName);
	        pstmt.setString(2, teacherName);
	        pstmt.setString(3, lecDescription);
	        pstmt.setString(4, lecCategory);
	        pstmt.setString(5, lecLevel);
	        pstmt.setInt(6, lecPrice);
	        pstmt.setString(7, imageName);
	        pstmt.setString(8, videoName);
	        pstmt.setInt(9, lecId);
	
	        int count = pstmt.executeUpdate();
	
	        if (count > 0) {
	            System.out.println("강의가 성공적으로 수정되었습니다.");
	        } else {
	            System.out.println("수정할 강의를 찾을 수 없습니다.");
	        }
	
	    } catch (SQLException e) {
	        out.println("<script>alert('데이터베이스 오류: " + e.getMessage() + "'); location.href='lec_manage.jsp';</script>");
	    }
	 	finally {
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
	    }
	    
	    response.sendRedirect("administration.jsp");
	%>
</body>
</html>