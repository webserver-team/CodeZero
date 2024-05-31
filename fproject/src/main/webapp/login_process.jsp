<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
    <%@ include file ="connection.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");
	
    	//form에서 입력된 ID, PW 파라미터 값 가져옵니다.
        String id = request.getParameter("user_id");
        String passwd = request.getParameter("password");
		
        //쿼리의 결과를 저장하고 읽을 수 있는 객체
        ResultSet rs = null;
        Statement stmt = null;
        
        //로그인 성공 여부를 나타내는 변수
        boolean loginSuccess = false;

        try {
            // 사용자 정보 조회 쿼리
			String sql = "SELECT user_id, password FROM member";
            
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
			
            //(쿼리 결과)다음 행이 존재하면 TRUE 반환 
            while (rs.next()) {
            	String storedUserId = rs.getString("user_id");
                String storedPassword = rs.getString("password");

                // 입력한 아이디 비밀번호와 저장된 아이디 비밀번호가 일치한다면
                if (id.equals(storedUserId) && passwd.equals(storedPassword)) {
                    loginSuccess = true;
                    break;
                }
            }
            
            // 로그인 성공 여부에 따라 리다이렉트 수행
            if (loginSuccess) {
                // 메인 페이지로 리다이렉트
                response.sendRedirect("home.jsp");
            } else {
                // 로그인 실패 시 로그인 페이지로 리다이렉트
                response.sendRedirect("login.jsp");
            }
       	}
         catch (SQLException e) {
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
