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
<title>Insert title here</title>
</head>
<body>
	<!-- 강의 관련 데이터를 받아와서 데이터베이스에 저장 -->
    <%@ include file ="connection.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");
        MultipartRequest multi = new MultipartRequest(request, "/Users/mm/git/CodeZero/fproject/src/main/webapp/resource/upload", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

        int lecId = 201000001;
        String lecName = multi.getParameter("lecName");
        String teacherName = multi.getParameter("teacherName");
        String lecDescription = multi.getParameter("lecDescription");
        String lecCategory = multi.getParameter("lecCategory");
        String lecLevel = multi.getParameter("lecLevel");
        int lecPrice = Integer.parseInt(multi.getParameter("lecPrice"));
        int lecReviewCount = 0;

        Enumeration files = multi.getFileNames();
        String imageFileName = null;
        String videoFileName = null;
        

        while (files.hasMoreElements()) {
            String fname = (String) files.nextElement();
            String fileName = multi.getFilesystemName(fname);
            String fileType = multi.getContentType(fname);

            if (fileType != null) {
                if (fileType.startsWith("image/")) {
                    imageFileName = fileName;
                } else if (fileType.startsWith("video/")) {
                    videoFileName = fileName;
                }
            }
        }

        Statement stmt = null;

        try {
            stmt = conn.createStatement();
            String sql = "INSERT INTO lecture (lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount, image, video) " +
                         "VALUES ('" + lecName + "', '" + teacherName + "', '" + lecDescription + "', '" + lecCategory + "', '" + lecLevel + "', " + lecPrice + ", " + lecReviewCount + ", '" + imageFileName + "', '" + videoFileName + "')";
            stmt.executeUpdate(sql);

            String message = "강의가 정상적으로 등록되었습니다.";
            System.out.println(message);
            response.sendRedirect("lec_manage.jsp");
            
        } catch (SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
