<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
	<link rel="stylesheet" type="text/css" href="resourse/css/bootstrap.min.css">
</head>
<body>

        <%@ include file="/connection.jsp" %>
        <%@ include file="courses_nav.jsp" %>
		<div class="container mt-4">

        <%
            String user_id = (String) session.getAttribute("userID");

            if (user_id == null) {
                out.println("<div class='alert alert-warning'>로그인이 필요합니다.</div>");
                return;
            }

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String sql = "SELECT * FROM lecture WHERE lecId IN (SELECT lecId FROM Cart WHERE userId = ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, user_id);
                rs = pstmt.executeQuery();
                
                if (!rs.isBeforeFirst()) { 
                    out.println("<div class='alert alert-danger'>장바구니가 비어 있습니다.</div>");
                } else {
        %>
     
        <div class="row mt-5">
            <div class="col-md-8">
                <div class="card mb-3">
					<div class="card-header d-flex align-items-center">
					   <label class="mb-0">장바구니 목록</label>
					</div>
                    <div class="card-body">
                    
                        <%
                        	int sum = 0;
                            while (rs.next()) {
                                String lecName = rs.getString("lecName");
                                int lecPrice = rs.getInt("lecPrice");
                                String image = rs.getString("image");
                                int lecId = rs.getInt("lecId");

                                sum += lecPrice;
                        %>
                      
                        <div class="d-flex align-items-center mb-3">
                            <img src="resource/upload/<%=image %>" class="img-thumbnail me-3" style="width: 120px; height: auto;" alt="...">
                            <div>
                                <a href="lec.jsp?lecId=<%=lecId %>" class="text-decoration-none" style="font-weight: bold; font-size: 20px;"><%=lecName %></a>
                            </div>
                            <div class="ms-auto text-end">
                                <span style="font-weight: bold; font-size: 20px;"><%=lecPrice %>원</span>
                            </div>
                            <a href="deleteCart.jsp?lecId=<%=lecId %>"><button type="button" class="btn-close ms-4" aria-label="Remove"></button></a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-3">
                    <div class="card-body">
                        <ul class="list-group list-group-flush mb-3">
                            <li class="list-group-item d-flex justify-content-between fw-bold">
                                <span>총 결제금액</span>
                                <span><%=sum %>원</span>
                            </li>
                        </ul>
                        <a href="payment.jsp?sum=<%=sum%>"><button type="button" class="btn btn-success w-100">결제하기</button></a>
                    </div>
                </div>
            </div>
        </div>

        <%
                }
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger'>데이터 조회 실패: " + e.getMessage() + "</div>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>

    </div>
</body>
</html>
                