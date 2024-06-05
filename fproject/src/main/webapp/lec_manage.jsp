<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>

	function deleteLecture(lecId) {
		if (confirm("해당 강의를 삭제합니다.") == true) {
			location.href = "lec_delete.jsp?lecId=" + lecId;
			alert('삭제되었습니다.');
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<%@ include file="connection.jsp" %>

	<%
	
	String user_id = (String) session.getAttribute("userID");
	
	if (!"admin".equals(user_id)) {
		response.sendRedirect("lecs.jsp");
	}

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try {
		String sql = "SELECT lecId, lecName, teacherName, lecPrice FROM lecture";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		%>
	
	<div class="container mt-5">
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h1 style="font-weight: bold;" class="display-4 mb-2"><a href="lecs.jsp" style="text-decoration:none; color:black;">메인</a>/ 강의 관리</h1>
		<a href="lec_enroll.jsp" class="btn btn-light btn-lg" role="button">강의 등록</a>
	</div>
	<table class="table table-bordered mt-5">
	    <thead>
	        <tr>
	            <th>강의ID</th>
	            <th>강의명</th>
	            <th>강사명</th>
	            <th>가격</th>
	            <th>수정</th>
	            <th>삭제</th>
	        </tr>
	    </thead>
	    <tbody>
	        <%
	while (rs.next()) {
	    int lecId = rs.getInt("lecId");
	    String lecName = rs.getString("lecName");
	    String teacherName = rs.getString("teacherName");
	    int lecPrice = rs.getInt("lecPrice");
	%>
	<tr>
	    <td><%=lecId%></td>
		<td><%=lecName%></td>
		<td><%=teacherName%></td>
		<td><%=lecPrice%></td>
		<td><a class="btn btn-primary btn-sm" href="lec_update.jsp?lecId=<%=lecId%>">수정</a></td>
		<td><a class="btn btn-danger btn-sm" href="#" onclick="event.preventDefault(); deleteLecture('<%=lecId%>');">삭제</a></td>
	</tr>
	<%
	}
	%>
	    </tbody>
	</table>
	<%
	} catch (SQLException e) {
	    out.println("lecture 테이블 호출 실패");
	    out.println(e.getMessage());
	} finally {
	    if (rs != null) rs.close();
	    if (pstmt != null) pstmt.close();
	    if (conn != null) conn.close();
	}
	%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
