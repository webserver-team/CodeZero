<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login Process</title>
	<link rel="stylesheet" href="../stylesheet/styles.css">
</head>
<body>
    <%@ include file ="../db/dbconn.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");

        ResultSet rs = null;
        Statement stmt = null;

        try {
            // 사용자 정보 조회 쿼리 실행
            String sql = "SELECT * FROM member WHERE id='" + id + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                String storedPassword = rs.getString("passwd");
                String storedName = rs.getString("name");

                // 입력한 비밀번호와 데이터베이스에 저장된 비밀번호 비교
                if (passwd.equals(storedPassword)) {
                    // 로그인 성공 시 메인 페이지로 이동
					session.setAttribute("id", id);	
                    session.setAttribute("name", storedName);
                    response.sendRedirect("../home/home.jsp");
                } else {
                    // 비밀번호 불일치 시 에러 메시지 출력
	                session.setAttribute("message", "비밀번호가 일치하지 않습니다.");
	                session.setAttribute("login_modal_status", "on");
	                response.sendRedirect("../home/home.jsp");
                }
            } else {
                // 사용자가 존재하지 않을 때 에러 메시지 출력
                session.setAttribute("message", "사용자가 존재하지 않습니다.");
                session.setAttribute("login_modal_status", "on");
                response.sendRedirect("../home/home.jsp");
                
                       
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 연결 종료
              if (rs != null)
            	  rs.close();
              if (stmt != null)
            	  stmt.close();
              if (conn != null)
            	  conn.close();
        }
    %>
</body>
</html>