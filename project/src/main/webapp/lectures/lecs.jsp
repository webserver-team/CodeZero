<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="dao.LectureList" %>
<%@ page import="dto.Lecture" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록 페이지</title>
<link rel="stylesheet" href="../stylesheet/lecs.css">
</head>
<body>
	<%@ include file="../header/header.jsp"%>


	<div class="container" style="margin-top: 200px !important; display:flex; justify-content:center; align-items:center; min-height:500px; box-sizing:border-box">
		<div class="lec-row"
			style="width: 100%; display: flex; align-items: flex-start; padding:0px 5% 0px 5%">

			<%
			int i = 0;
			String category = request.getParameter("category");
			String search = request.getParameter("search");
			
			if (category == null)
				category = request.getParameter("subCategory");	
			
			Lecture[] lectures = null;
			LectureList lectureList = new LectureList(); 
			
			lectures = lectureList.getLectureList(search, category);
			
			for (i = 0; i < lectures.length; i++){
			%>
			<a href="lec.jsp?lecId=<%=lectures[i].getLecId()%>" class="lec-a" style="text-decoration: none; color: black;">
				<div class="lec-col">
					<div class="card h-100" style="width:100%">
						<img src="../resource/upload/<%=lectures[i].getImage()%>" class="card-img-top"
							alt="..." style="width:100%">
						<div class="lec-body">
							<h5 class="lec-title"><%=lectures[i].getLecName()%></h5>
							<p class="lec-text"><%=lectures[i].getLecDescription()%></p>
							<div class="lec-name-price">
								<p class="card-text" style="font-weight: bold;"><%=lectures[i].getTeacherName()%></p>
								<p class="card-text card-price" style="display:flex; align-items:center; font-size:14px; text-align:center;">
									₩<%=lectures[i].getLecPrice()%></p>
							</div>
						</div>
						<div class="lec-footer">
							<span class="badge bg-primary"><%=lectures[i].getLecCategory()%></span> <span
								class="badge bg-secondary"><%=lectures[i].getLecLevel()%></span> <span
								class="badge bg-success">리뷰 수 : <%=lectures[i].getLecReviewCount()%></span>
						</div>
					</div>
				</div>
			</a>

			<%
			}
			if (i == 0){
				%>
				<div class="empty-lec-div">
					<p class="empty-lec-p">강의가 없습니다.</p>
				</div>
				<%
				}
				%>
			</div>
		</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>