<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>
	function payCheck() {
		var form = document.getElementById("paymentForm");

		if (form.name.value=="" || form.phone.value=="" || form.email.value=="") {
			alert("입력하지 않은 값이 있습니다.");
			return false;
		}
		
		
		form.submit();
	}
</script>
</head>
<body>
    <%@ include file="connection.jsp" %>
    <%@ include file="courses_nav.jsp" %>
    
    <div class="container mt-4">
        <h1 style="font-weight: bold;" class="display-4 mt-5 mb-4">결제 정보</h1>
        
        <%
        	int sum = Integer.parseInt(request.getParameter("sum"));
            String user_id = (String) session.getAttribute("userID");

            ResultSet rs = null;
            PreparedStatement pstmt = null;

            try {
                String sql = "SELECT * FROM member WHERE userId = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, user_id);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
        %>

		  <div class="row align-items-start">
		    <div class="col">
				<form id="paymentForm" action="payment_process.jsp" method="post">
					<div class="mb-3">
				        <label for="name" class="form-label">이름</label>
				        <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
					</div>
					<div class="mb-3">
					    <label for="phone" class="form-label">전화번호</label>
					    <input type="tel" class="form-control" id="phone" name="phone" value="<%= phone %>" required>
					</div>
					<div class="mb-3">
					    <label for="email" class="form-label">이메일</label>
					    <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
					</div>
					<div class="mb-3">					
					<label class="form-label">결제 방식</label><br>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="paymentMethods" id="paymentMethod1" value="신용카드" checked>
						  <label class="form-check-label" for="paymentMethod1">신용카드</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="paymentMethods" id="paymentMethod2" value="가상계좌">
						  <label class="form-check-label" for="paymentMethod2">가상계좌</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="paymentMethods" id="paymentMethod3" value="휴대폰 결제">
						  <label class="form-check-label" for="paymentMethod3">휴대폰 결제</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="paymentMethods" id="paymentMethod4" value="실시간 계좌이체">
						  <label class="form-check-label" for="paymentMethod4">실시간 계좌이체</label>
						</div>						
					</div>			
					<div class="d-flex justify-content-end mt-5 mb-1">
						<h3>총 결제 금액  &nbsp;  ₩<%=sum %></h3>
						<input type="hidden" name=price value="<%=sum %>">
					</div>
					<div class="d-flex justify-content-end mb-3">
						<button type="button" class="btn btn-primary" onclick="payCheck()">결제</button>
					</div>
				</form>
		    </div>
		 </div>

        <%
                } else {
                    out.println("<script>alert('사용자 정보를 찾을 수 없습니다.'); location.href='lec_manage.jsp';</script>");
                }
            } catch (SQLException e) {
                out.println("<script>alert('데이터베이스 오류: " + e.getMessage() + "'); location.href='lec_manage.jsp';</script>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) pstmt.close();
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
