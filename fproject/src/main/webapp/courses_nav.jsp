<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비게이션</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
   <div class="container mt-4">
       <div class="d-flex justify-content-end mb-3">
       		<a href="test.jsp" class="btn btn-light btn-lg me-2">로그인</a>
       		<a href="test2.jsp" class="btn btn-light btn-lg me-2">로그아웃</a>
            <a href="cart.jsp" class="btn btn-light btn-lg me-2">장바구니</a>
            <a href="study.jsp" class="btn btn-light btn-lg me-2">나의 학습</a>
            <a href="lec_manage.jsp" class="btn btn-light btn-lg">관리 페이지</a>
       </div>
       
       <ul class="nav nav-tabs mb-2">
           <li class="nav-item">
               <a class="nav-link" href="lecs.jsp">전체</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="programming.jsp">프로그래밍</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="game.jsp">게임 개발</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="bigdata.jsp">빅데이터/AI</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="security.jsp">보안</a>
           </li>           
       </ul>    