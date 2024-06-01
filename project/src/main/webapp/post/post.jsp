<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PostList"%>
<%@ page import="dto.Post"%>
<%@ page import="dao.CommentList"%>
<%@ page import="dto.Comment"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/post.css">
<link rel="stylesheet" href="../stylesheet/comment.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String postId = request.getParameter("postId");
		Post post = new Post();
		PostList postlist = new PostList();
		post = postlist.getPost(postId);
	%>
	
	<script>
		function onComment(){
			var commentForm = document.getElementById("comment-on-form");
			var commentText = document.getElementById("comment-textarea");
			
			if (commentText.value == ""){
				alert("댓글을 입력해주세요");
				commentText.select();
				return false;
			}
			else
				commentForm.submit();
		}
	</script>
	
	<script>
	document.addEventListener('DOMContentLoaded', autoResize);
	
	// textarea의 높이를 자동으로 조정하는 함수
	function autoResize() {
	    const textarea = document.getElementById('post-textarea');
	    textarea.style.height = 'auto'; // 높이를 자동으로 조정
	    textarea.style.height = textarea.scrollHeight + 'px'; // 스크롤 높이만큼 조정
	}
	</script>
	
	
	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container table_container" style="height: 90%">
		<div class="post-title-div">
			<h3 class="post-title"><%=post.getPostTitle() %></h3>
		</div>
		<div id="post-div" class="post-div">
			<textarea id="post-textarea" name="postContent" class="post-textarea" maxlength="10000" placeholder="내용을 입력해주세요" disabled><%=post.getPostContent() %></textarea>
		</div>
		
		<div class="comment-div">
		<%
		Comment[] comments = null;
		CommentList commentlist = new CommentList();
		
		if (!commentlist.existComment(postId)){
			%>
			<div class="no-comment">댓글이 없습니다.</div>
			<%
		}
		else{
			commentlist = new CommentList();
			comments = commentlist.getCommentList(postId);
			
			if (comments != null){
				for (int i = 0; i < comments.length; i++){
					%>
					<div class="comment-row <%if (i+1 == comments.length){%>last<%}%>">
						<p class="comment-userId"><%=comments[i].getUserId() %></p>
						<p class="comment-comment"><%=comments[i].getComment() %></p>
					</div>
					<%
				}
			}
		}
		%>
			
		</div>
		
		<form action="comment_on_process.jsp?postId=<%=post.getPostID() %>" id="comment-on-form" class="comment-on-form" method="POST">
			<textarea id="comment-textarea" class="comment-textarea" name="comment-textarea" placeholder="댓글을 입력해주세요"></textarea>
			<input type="button" id="commentOn" class="comment-button" value="등록" onclick="onComment()">
		</form>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
<script src="../post.js"></script>
</body>
</html>