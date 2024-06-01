<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정 처리</title>
</head>
<body>
<%@ include file="connection.jsp" %>
<%

    PreparedStatement pstmt = null;
	ResultSet rs = null;

    int lecId = Integer.parseInt(request.getParameter("lecId"));
    String lecName = request.getParameter("lecName");
    String teacherName = request.getParameter("teacherName");
    String lecDescription = request.getParameter("lecDescription");
    String lecCategory = request.getParameter("lecCategory");
    String lecLevel = request.getParameter("lecLevel");
    int lecPrice = Integer.parseInt(request.getParameter("lecPrice"));
    String imageName = request.getParameter("imageName");
    String videoName = request.getParameter("videoName");

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
            out.println("<script>alert('강의가 성공적으로 수정되었습니다.'); location.href='lec_manage.jsp';</script>");
        } else {
            out.println("<script>alert('수정할 강의를 찾을 수 없습니다.'); location.href='lec_manage.jsp';</script>");
        }

    } catch (SQLException e) {
        out.println("<script>alert('데이터베이스 오류: " + e.getMessage() + "'); location.href='lec_manage.jsp';</script>");
    }
 	finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>
