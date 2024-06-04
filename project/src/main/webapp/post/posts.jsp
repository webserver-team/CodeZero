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

<script>
	function search(){
		var searchInput	= document.getElementById("search-input");
		var url = "posts.jsp?search=" + searchInput.value;
		var replaceurl = url.replace(/\\/g, "");
		window.location.href = replaceurl;
	}
	function searchOnEnter(event) {
	    if (event.keyCode === 13) {
	    	search();
	    }
	}
</script>

<body>
	<%@ include file="/../header/header.jsp"%>
	<div class="container table-container">
		<div style="width:63%; margin-top:100px">
			<div class="board-top">
				<h3 style="padding-left: 10px; color: #5fc703">자유게시판</h3>
				<div class="createpost-div">
					<input type="button" id="createpost" class="createpost" value="글쓰기">
				</div>
			</div>
		</div>
		<div class="noticeBoard">
			<div class="board-table">
				<!------------------------------------------------------------------------------------>
				<p style="height: 10px; margin: 0px"></p>
				<%
				String search = request.getParameter("search");
				
				Post[] posts = null;
				PostList postlist = new PostList();

				if (!postlist.existPost(search)) {
				%>
				<div class="table-row"
					style="display: flex; justify-content: center; align-items: center">
					<p>게시물이 없습니다.</p>
				</div>
				<%
				} else {
				postlist = new PostList();
				posts = postlist.getPostList(search);

				if (posts != null) {
					for (int i = posts.length - 1; i >= 0; i--) {
				%>
				<div class="table-row">
					<div class="table-col article">
						<a href="post.jsp?postId=<%=posts[i].getPostID()%>"
							class="board-article"><%=posts[i].getPostTitle()%></a>
					</div>
					<div class="table-col name">
						<a class="board-name"><%=posts[i].getUserId()%></a>
					</div>
					<div class="table-col date">
						<p class="board-date"><%=posts[i].getPostDate()%></p>
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
		
		<div class="search-div">
			<input type="text" id="search-input" class="search-input" placeholder="검색어를 입력해주세요" onkeydown="searchOnEnter(event)">
			<input type="button" class="search-button" value="검색" onclick="search()">
		</div>
		
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>