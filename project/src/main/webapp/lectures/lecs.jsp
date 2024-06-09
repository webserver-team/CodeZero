<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록 페이지</title>
<link rel="stylesheet" href="../stylesheet/lecs.css">
</head>
<body>
	<%@ include file="../header/header.jsp"%>
	<%@ include file="../connection/connection.jsp"%>


	<div class="container" style="margin-top: 200px !important; display:flex; justify-content:center; align-items:center; min-height:500px; box-sizing:border-box">
		<div class="lec-row"
			style="width: 100%; display: flex; align-items: flex-start; padding:0px 5% 0px 5%">

			<%
			int count = 0;
			String category = request.getParameter("category");
			String subCategory = request.getParameter("subCategory");
			String search = request.getParameter("search");
			
			ResultSet rs = null;
			PreparedStatement pstmt = null;

			try {

				String sql = "SELECT * FROM lecture";

				if (search != null){
                	sql = "SELECT * FROM lecture WHERE lecName LIKE '%" + search + "%'";
                	pstmt = conn.prepareStatement(sql);
                }
				else if (category != null && subCategory == null) {
					if (category.equals("programming")) {
				sql = "SELECT * FROM lecture WHERE lecCategory IN ('프론트엔드', '백엔드', '앱 개발', '데이터베이스', '개발도구')";
					} else if (category.equals("game")) {
				sql = "SELECT * FROM lecture WHERE lecCategory IN ('게임 프로그래밍', '게임 기획', '게임 그래픽')";
					} else if (category.equals("bigdata")) {
				sql = "SELECT * FROM lecture WHERE lecCategory IN ('데이터 분석', '컴퓨터 비전', '자연어 처리')";
					} else if (category.equals("security")) {
				sql = "SELECT * FROM lecture WHERE lecCategory IN ('보안', '네트워크', '클라우드', '시스템')";
					}

					pstmt = conn.prepareStatement(sql);

				} else if (subCategory != null) {
					sql = "SELECT * FROM lecture WHERE lecCategory=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, subCategory);
				} else {
					pstmt = conn.prepareStatement(sql);
				}

				rs = pstmt.executeQuery();

				// 데이터 출력
				while (rs.next()) {
					String lecName = rs.getString("lecName");
					String teacherName = rs.getString("teacherName");
					String lecDescription = rs.getString("lecDescription");
					String lecCategory = rs.getString("lecCategory");
					String lecLevel = rs.getString("lecLevel");
					int lecPrice = rs.getInt("lecPrice");
					int lecReviewCount = rs.getInt("lecReviewCount");
					String image = rs.getString("image");
					int lecId = rs.getInt("lecId");
			%>
			<a href="lec.jsp?lecId=<%=lecId%>" class="lec-a" style="text-decoration: none; color: black;">
				<div class="lec-col">
					<div class="card h-100" style="width:100%">
						<img src="../resource/upload/<%=image%>" class="card-img-top"
							alt="..." style="width:100%">
						<div class="lec-body">
							<h5 class="lec-title"><%=lecName%></h5>
							<p class="lec-text"><%=lecDescription%></p>
							<div class="lec-name-price">
								<p class="card-text" style="font-weight: bold;"><%=teacherName%></p>
								<p class="card-text card-price" style="display:flex; align-items:center; font-size:14px; text-align:center;">
									₩<%=lecPrice%></p>
							</div>
						</div>
						<div class="lec-footer">
							<span class="badge bg-primary"><%=lecCategory%></span> <span
								class="badge bg-secondary"><%=lecLevel%></span> <span
								class="badge bg-success">리뷰 수 : <%=lecReviewCount%></span>
						</div>
					</div>
				</div>
			</a>

			<%
			count++;
			}
			if (count == 0){
			%>
			<div class="empty-lec-div">
				<p class="empty-lec-p">강의가 없습니다.</p>
			</div>
			<%
			}
			} catch (SQLException e) {
			out.println("lecture 테이블 호출 실패");
			out.println(e.getMessage());
			} finally {
			// 리소스 정리
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			}
			%>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>