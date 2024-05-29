<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/noticeBoard.css">
<title>게시판</title>
</head>
<body>
	<div class="container">
		<%@ include file="/../header/header.jsp"%>
	</div>
	<div class="container table_container">
	<div style="width:63%">
		<div class="board_top">
			<h3 style="padding-left:10px; color:#03c75a">자유게시판</h3>
			<div class="createpost-div">
				<input type="button" class="createpost" value="글쓰기">
			</div>
		</div>
	</div>
		<div class="noticeBoard">
			<div class="board_table">
<!------------------------------------------------------------------------------------>
				<p style="height:10px; margin:0px"></p>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<div class="table_row">
					<div class="table_col article">
						<a href="board.jsp" class="board_article">게시글 제목</a>
					</div>
					<div class="table_col name">
						<a href="user.jsp"  class="board_name">게시한 사람</a>
					</div>
					<div class="table_col date">
						<p class="board_date">게시일</p>
					</div>
				</div>
				<p style="height:10px; margin:0px"></p>
<!------------------------------------------------------------------------------------>
			</div>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>