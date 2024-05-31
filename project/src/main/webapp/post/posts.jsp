<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.PostList"%>
<%@ page import="dto.Post"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/posts.css">
<title>게시판</title>
</head>

<%
String id = (String) session.getAttribute("id");
if (id == null) {
%>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var createpost = document.getElementById("createpost");
		var loginBackground = document.getElementById("login-background");
		var loginModal = document.getElementById("loginModal");

		createpost.addEventListener("click", function() {
			loginBackground.style.display = "block";
			loginModal.style.display = "block";
			setTimeout(function() {
				loginBackground.style.opacity = "1";
				loginModal.style.opacity = "1";
			}, 10)
			document.getElementById("login-input-id").focus();
		});
	});
</script>
<%
} else {
%>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var createpost = document.getElementById("createpost");
		createpost.addEventListener("click", function() {
			window.location.href = "create_post.jsp";
		});
	});
</script>
<%
}
%>

<body>
	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container table_container">
		<div style="width: 63%">
			<div class="board_top">
				<h3 style="padding-left: 10px; color: #03c75a">자유게시판</h3>
				<div class="createpost-div">
					<input type="button" id="createpost" class="createpost" value="글쓰기">
				</div>
			</div>
		</div>
		<div class="noticeBoard">
			<div class="board_table">
				<!------------------------------------------------------------------------------------>
				<p style="height: 10px; margin: 0px"></p>
				<%
				Post[] posts = null;
				PostList postlist = new PostList();
				
				if (!postlist.existPost()) {
				%>
				<div class="table_row" style="display:flex; justify-content:center; align-items:center">
						<p>게시물이 없습니다.</p>
				</div>
				<%
				}
				else {
					postlist = new PostList();
					posts = postlist.getPostList();

					if (posts != null){
						for (int i = 0; i < posts.length; i++){
							%>
							<div class="table_row">
								<div class="table_col article">
									<a href="post.jsp?=<%=posts[i].getPostID() %>" class="board_article"><%=posts[i].getPostTitle()%></a>
								</div>
								<div class="table_col name">
									<a class="board_name"><%=posts[i].getUserId()%></a>
								</div>
								<div class="table_col date">
									<p class="board_date">24/05/30</p>
								</div>
							</div>
							<%					
						}
					}
				}
				%>
				<p style="height: 10px; margin: 0px"></p>
				<!------------------------------------------------------------------------------------>
			</div>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>