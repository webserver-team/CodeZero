<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Lec" %>
<%@ page import="dao.lecRepository" %>
<jsp:useBean id="lecDAO" class="dao.lecRepository" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세정보</title>
</head>
<body>
    <%@ include file="menu.jsp" %>

    <div>
        <h3>강의 소개</h3>
        
        <%
            // 모든 강의를 가져옴
            ArrayList<Lec> lecs = lecDAO.getAllLectures();
            
            // 첫 번째 강의를 선택
            Lec lec = lecs.get(0); // 예시로 첫 번째 강의만 사용
            
            // 강의 세부 정보 표시
        %>
        
        <p>강의 ID: <%= lec.getLecId() %></p>
        <p>강의 이름: <%= lec.getLecName() %></p>
        <p>강사 이름: <%= lec.getTeacherName() %></p>
        <p>강의 설명: <%= lec.getLecDescription() %></p>
        <p>강의 분류: <%= lec.getLecCategory() %></p>
        <p>강의 수준: <%= lec.getLecLevel() %></p>
        <p>강의 가격: <%= lec.getLecPrice() %></p>
        <p>리뷰 수: <%= lec.getLecReviewCount() %></p>
        
    </div>
</body>
</html>

