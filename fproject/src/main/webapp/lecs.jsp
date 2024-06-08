<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

	<%@ include file="connection.jsp" %>
	<%@ include file="courses_nav.jsp" %>
	
    
    <div class="container mt-4">
    <div class="btn-group mb-3">
            <a href="lecs.jsp?category=programming&subCategory=프론트엔드" class="btn btn-light">프론트엔드</a>
            <a href="lecs.jsp?category=programming&subCategory=백엔드" class="btn btn-light">백엔드</a>
            <a href="lecs.jsp?category=programming&subCategory=앱 개발" class="btn btn-light">앱 개발</a>
            <a href="lecs.jsp?category=programming&subCategory=데이터베이스" class="btn btn-light">데이터베이스</a>
            <a href="lecs.jsp?category=programming&subCategory=개발도구" class="btn btn-light">개발도구</a>
            <a href="lecs.jsp?category=game&subCategory=게임 프로그래밍" class="btn btn-light">게임 프로그래밍</a>
            <a href="lecs.jsp?category=game&subCategory=게임 기획" class="btn btn-light">게임 기획</a>
            <a href="lecs.jsp?category=game&subCategory=게임 그래픽" class="btn btn-light">게임 그래픽</a>
            <a href="lecs.jsp?category=bigdata&subCategory=데이터 분석" class="btn btn-light">데이터 분석</a>
            <a href="lecs.jsp?category=bigdata&subCategory=컴퓨터 비전" class="btn btn-light">컴퓨터 비전</a>
            <a href="lecs.jsp?category=bigdata&subCategory=자연어 처리" class="btn btn-light">자연어 처리</a>
            <a href="lecs.jsp?category=security&subCategory=보안" class="btn btn-light">보안</a>
            <a href="lecs.jsp?category=security&subCategory=네트워크" class="btn btn-light">네트워크</a>
            <a href="lecs.jsp?category=security&subCategory=시스템" class="btn btn-light">시스템</a>
            <a href="lecs.jsp?category=security&subCategory=클라우드" class="btn btn-light">클라우드</a>
    </div>
    <div class="text-end">
    </div> 
    <div class="row row-cols-1 row-cols-md-3 g-4 mt-1">

        <%
        	int pageLimit = 9;
        	int count = 0;
        	String category = request.getParameter("category");
        	String subCategory = request.getParameter("subCategory");
        	
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            
            
            try {
   
            	String sql = "SELECT * FROM lecture";
            	
                if (category != null && subCategory == null) {
                    if (category.equals("programming")){
                        sql = "SELECT * FROM lecture WHERE lecCategory IN ('프론트엔드', '백엔드', '앱 개발', '데이터베이스', '개발도구')";
                    } else if (category.equals("game")){
                        sql = "SELECT * FROM lecture WHERE lecCategory IN ('게임 프로그래밍', '게임 기획', '게임 그래픽')";
                    } else if (category.equals("bigdata")){
                        sql = "SELECT * FROM lecture WHERE lecCategory IN ('데이터 분석', '컴퓨터 비전', '자연어 처리')";
                    } else if (category.equals("security")){
                        sql = "SELECT * FROM lecture WHERE lecCategory IN ('보안', '네트워크', '클라우드', '시스템')";
                    }
                    pstmt = conn.prepareStatement(sql);
                    
                } else if ( category != null && subCategory != null ){
                	sql = "SELECT * FROM lecture WHERE lecCategory=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, subCategory);
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
        	<a href="lec.jsp?lecId=<%=lecId%>" style = "text-decoration:none; color:black;">
            <div class="col">
                <div class="card h-100">
                    <img src="resource/upload/<%=image %>" class="card-img-top" alt="...">
                    <div class="card-body p-4">
                        <h5 class="card-title"><%= lecName %></h5>
                        <p class="card-text"><%= lecDescription %></p>
                        <div class="d-flex justify-content-between">
                            <p class="card-text" style="font-weight: bold;"><%= teacherName %></p>
                            <p class="card-text card-price" style="font-weight: bold;">₩<%= lecPrice %></p>
                        </div>
                    </div>
                    <div class="card-footer bg-light text-end">
                        <span class="badge bg-primary"><%= lecCategory %></span>
                        <span class="badge bg-secondary"><%= lecLevel %></span>
                        <span class="badge bg-success">리뷰 수 : <%= lecReviewCount %></span>
                    </div>
                </div>
            </div>
            </a>
            
        <% 
        	count++;
                }
            } catch (SQLException e) {
                out.println("lecture 테이블 호출 실패");
                out.println(e.getMessage());
            } finally {
                // 리소스 정리
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
        </div>
        
        <!-- 페이지 -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center mt-4">
                <li class="page-item"><a class="page-link" href="lecs.jsp?page=1">1</a></li>
                <li class="page-item"><a class="page-link" href="lecs.jsp?page=2">2</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>