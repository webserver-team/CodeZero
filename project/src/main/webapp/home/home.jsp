<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.PostList"%>
<%@ page import="dto.Post"%>
<html>
<head>
<link rel="stylesheet" href="../stylesheet/home.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>Welcome</title>
</head>
<body>

	<%@ include file="../header/header.jsp"%>

	<div class="container">

		<div style="min-height: 125px"></div>

		<div class="searcharea">
			<a href="../home/home.jsp">
				<img src="../images/On.png" style="width:100px; height:60px">
			</a>
			<div class="searchbox">
				<input class="search" type="text" placeholder="검색어를 입력해 주세요.">
			</div>
		</div>

		<div style="min-height: 125px"></div>

		<div class="box">
			<div class="lecture-box"></div>
			<div class="post-box">	
				<a href="../post/posts.jsp?category=free" class="home-post-title">자유게시판</a>

				<%
				Post[] posts = null;
				PostList postlist = new PostList();

				if (!postlist.existPost(null, "free")) {
				%>
				<div class="home-post-row-box" style="flex-grow:1">
					<div class="home-post-row">
						<p style="flex-grow:1; text-align:center; margin:0px">게시물이 없습니다.</p>
					</div>
				</div>
				<%
				} else {
				postlist = new PostList();
				posts = postlist.getPostList(null, "free");
				postlist.sortPost(posts);
				
				for (int i = 0; i < posts.length; i++) {
				%>
				<div class="home-post-row-box">
					<div class="home-post-row">
						<div class="home-post-col article">
							<a href="../post/post.jsp?postId=<%=posts[i].getPostID()%>"
								class="home-post-col-a"><%=posts[i].getPostTitle()%></a>
						</div>
						<p class="home-post-col userId"><%=posts[i].getUserId()%></p>
						<p class="home-post-col views"><%=posts[i].getViews()%>회</p>
					</div>
				</div>
				<%
				if (i == 4)
					break;
				}
				}
				%>


			</div>



			<div class="post-box">
				<a href="../post/posts.jsp?category=question" class="home-post-title">질문게시판</a>
				
				<%
				posts = null;
				postlist = new PostList();

				if (!postlist.existPost(null, "question")) {
				%>
				<div class="home-post-row-box" style="flex-grow:1">
					<div class="home-post-row">
						<p style="flex-grow:1; text-align:center; margin:0px">게시물이 없습니다.</p>
					</div>
				</div>
				<%
				} else {
				postlist = new PostList();
				posts = postlist.getPostList(null, "question");
				postlist.sortPost(posts);
				
				for (int i = 0; i < posts.length; i++) {
				%>
				<div class="home-post-row-box">
					<div class="home-post-row">
						<div class="home-post-col article">
							<a href="../post/post.jsp?postId=<%=posts[i].getPostID()%>"
								class="home-post-col-a"><%=posts[i].getPostTitle()%></a>
						</div>
						<p class="home-post-col userId"><%=posts[i].getUserId()%></p>
						<p class="home-post-col views"><%=posts[i].getViews()%>회</p>
					</div>
				</div>
				<%
				if (i == 4)
					break;
				}
				}
				%>

			</div>
		</div>
	</div>
	<p style="height: 100px"></p>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>