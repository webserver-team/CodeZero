<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script type="text/javascript">

	function check() {
		var form = document.getElementById("lec_update");
		
		if (form.lecName.value=="" || form.teacherName.value=="" || form.videoName.value=="" || form.lecCategory.value=="" || form.lecLevel.value=="" || form.lecPrice.value=="") {
			alert("입력하지 않은 값이 있습니다.");
			return false;
		
		} else if (form.lecName.value.length < 5) {
			alert("강의명은 5글자 이상 입력해야 합니다. ");
			form.lecName.select();
			return false;
		} else if (isNaN(form.lecPrice.value)){
			alert("가격은 숫자로 입력해야 합니다.");
			form.lecPrice.select();
			return false;
		}
		else {
			form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="connection.jsp" %>

	<%
		int lecId = Integer.parseInt(request.getParameter("lecId"));
		ResultSet rs = null;
	   	PreparedStatement pstmt = null;
	   
	   	try {
	       String sql = "SELECT * FROM lecture WHERE lecId=?";
	       pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, lecId);
           rs = pstmt.executeQuery();
           
           if (rs.next()) {
	           String lecName = rs.getString("lecName");
	           String teacherName = rs.getString("teacherName");
	           String lecDescription = rs.getString("lecDescription");
	           String lecCategory = rs.getString("lecCategory");
	           String lecLevel = rs.getString("lecLevel");
	           int lecPrice = rs.getInt("lecPrice");
	           String image = rs.getString("image");
	           String video = rs.getString("video");
	%>
	
	<div class="container mt-5">
		<div class="card-body">
			<h1 style="font-weight: bold;" class="display-4 mb-2">강의 수정</h1>
			<br><br>
			<form id="lec_update" name="lec_update" action="lec_update_process.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="lecId" value="<%= lecId %>">
				<div class="mb-3">
					<label for="lecName" class="form-label">강의명</label>
					<input type="text" class="form-control" id="lecName" name="lecName" placeholder="강의명" maxlength="50" value="<%= lecName %>">
				</div>
				<div class="mb-3">
					<label for="teacherName" class="form-label">강사명</label>
					<input type="text" class="form-control" id="teacherName" name="teacherName" placeholder="강사명" maxlength="10" value="<%= teacherName %>">
				</div>
				<div class="mb-3">
					<label for="imageName" class="form-label">강의 이미지</label>
					<input type="file" class="form-control" id="imageName" name="imageName">
				</div>
				<div class="mb-3">
					<label for="videoName" class="form-label">강의 동영상</label>
					<input type="file" class="form-control" id="videoName" name="videoName">
				</div>
				<div class="mb-3">
					<label for="lecCategory" class="form-label">카테고리</label>
					<select class="form-select" id="lecCategory" name="lecCategory">
						<option disabled hidden selected>카테고리 선택</option>
						<optgroup label="프로그래밍">
							<option value="프론트엔드" <%= lecCategory.equals("프론트엔드") ? "selected" : "" %>>프론트엔드</option>
							<option value="백엔드" <%= lecCategory.equals("백엔드") ? "selected" : "" %>>백엔드</option>
							<option value="앱 개발" <%= lecCategory.equals("앱 개발") ? "selected" : "" %>>앱 개발</option>
							<option value="데이터베이스" <%= lecCategory.equals("데이터베이스") ? "selected" : "" %>>데이터베이스</option>
							<option value="개발도구" <%= lecCategory.equals("개발도구") ? "selected" : "" %>>개발도구</option>
						</optgroup>
						<optgroup label="게임 개발">
							<option value="게임 프로그래밍" <%= lecCategory.equals("게임 프로그래밍") ? "selected" : "" %>>게임 프로그래밍</option>
							<option value="게임 기획" <%= lecCategory.equals("게임 기획") ? "selected" : "" %>>게임 기획</option>
							<option value="게임 그래픽" <%= lecCategory.equals("게임 그래픽") ? "selected" : "" %>>게임 그래픽</option>
						</optgroup>
						<optgroup label="인공지능/빅데이터">
							<option value="데이터 분석" <%= lecCategory.equals("데이터 분석") ? "selected" : "" %>>데이터 분석</option>
							<option value="컴퓨터 비전" <%= lecCategory.equals("컴퓨터 비전") ? "selected" : "" %>>컴퓨터 비전</option>
							<option value="자연어 처리" <%= lecCategory.equals("자연어 처리") ? "selected" : "" %>>자연어 처리</option>
						</optgroup>
						<optgroup label="보안/네트워크">
							<option value="보안" <%= lecCategory.equals("보안") ? "selected" : "" %>>보안</option>
							<option value="네트워크" <%= lecCategory.equals("네트워크") ? "selected" : "" %>>네트워크</option>
							<option value="시스템" <%= lecCategory.equals("시스템") ? "selected" : "" %>>시스템</option>
							<option value="클라우드" <%= lecCategory.equals("클라우드") ? "selected" : "" %>>클라우드</option>
						</optgroup>
					</select>
				</div>
				<div class="mb-3">
					<label for="lecLevel" class="form-label">단계</label>
					<select class="form-select" id="lecLevel" name="lecLevel">
						<option disabled hidden selected>단계 선택</option>
						<option value="초급" <%= lecLevel.equals("초급") ? "selected" : "" %>>초급</option>
						<option value="중급" <%= lecLevel.equals("중급") ? "selected" : "" %>>중급</option>
						<option value="고급" <%= lecLevel.equals("고급") ? "selected" : "" %>>고급</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="lecPrice" class="form-label">가격</label>
					<input type="text" class="form-control" id="lecPrice" name="lecPrice" placeholder="가격" maxlength="10" value="<%= lecPrice %>">
				</div>
				<div class="mb-3">
					<label for="lecDescription" class="form-label">강의 설명</label>
					<textarea class="form-control" id="lecDescription" name="lecDescription" rows="3" placeholder="강의 설명" maxlength="150"><%= lecDescription %></textarea>
				</div>
				<div class="d-flex justify-content-end mb-3">
					<button type="button" class="btn btn-light btn-lg" onclick="check()">수정</button>
				</div>
			</form>
		</div>
	</div>
	<%
           } else {
               out.println("해당 강의를 찾을 수 없습니다.");
           }
	   } catch (SQLException e) {
	       out.println("lecture 테이블 호출 실패");
	       out.println(e.getMessage());
	   } finally {
	       if (rs != null) rs.close();
	       if (pstmt != null) pstmt.close();
	       if (conn != null) conn.close();
	   }
	%>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
