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

    String lecIdParam = request.getParameter("lecId");
    String lecName = request.getParameter("lecName");
    String teacherName = request.getParameter("teacherName");
    String lecDescription = request.getParameter("lecDescription");
    String lecCategory = request.getParameter("lecCategory");
    String lecLevel = request.getParameter("lecLevel");
    String lecPriceParam = request.getParameter("lecPrice");
    String imageName = request.getParameter("imageName");
    String videoName = request.getParameter("videoName");

    // Debug statements
    out.println("lecIdParam: " + lecIdParam + "<br>");
    out.println("lecName: " + lecName + "<br>");
    out.println("teacherName: " + teacherName + "<br>");
    out.println("lecDescription: " + lecDescription + "<br>");
    out.println("lecCategory: " + lecCategory + "<br>");
    out.println("lecLevel: " + lecLevel + "<br>");
    out.println("lecPriceParam: " + lecPriceParam + "<br>");
    out.println("imageName: " + imageName + "<br>");
    out.println("videoName: " + videoName + "<br>");

    if (lecIdParam == null || lecIdParam.isEmpty() || lecPriceParam == null || lecPriceParam.isEmpty()) {
        out.println("<script>alert('lecId 또는 lecPrice 값이 비어 있습니다.'); location.href='lec_manage.jsp';</script>");
    } else {
        int lecId = Integer.parseInt(lecIdParam);
        int lecPrice = Integer.parseInt(lecPriceParam);

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
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
</body>
</html>
