<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의 등록</h1>
	<form action="lec_enroll_process.jsp" method="post" enctype="multipart/form-data" >
		<input type="text" name="lecName" placeholder="강의명" maxlength="30">
		<br>
		<input type="text" name="teacherName" placeholder="강사명">
		<br>
		강의 이미지 등록 <input type="file" name="imageName">
		<br>
		강의 동영상 등록 <input type="file" name="videoName">
		<br>
		<select name="lecCategory">
		<optgroup label="프로그래밍">
			<option disabled hidden selected>카테고리 선택</option>
			<option value="프론트엔드">프론트엔드</option>
			<option value="백엔드">백엔드</option>
			<option value="앱 개발">앱 개발</option>
			<option value="데이터베이스">데이터베이스</option>
			<option value="개발도구">개발도구</option>
		</optgroup>
		<optgroup label="게임 개발">
			<option value="게임 프로그래밍">게임 프로그래밍</option>
			<option value="게임 기획">게임 기획</option>
			<option value="게임 그래픽">게임 그래픽</option>
		</optgroup>
		<optgroup label="인공지능/빅데이터">
			<option value="데이터 분석">데이터 분석</option>
			<option value="컴퓨터 비전">컴퓨터 비전</option>
			<option value="자연어 처리">자연어 처리</option>
		</optgroup>
		<optgroup label="보안/네트워크">
			<option value="보안">보안</option>
			<option value="네트워크">네트워크</option>
			<option value="시스템">시스템</option>
			<option value="클라우드">클라우드</option>
		</optgroup>
		<!-- ***이벤트 핸들러 함수 설정하기 -->
		<input type="hidden" id="Field" name="field">
		</select>
		<select name="lecLevel">
			<option disabled hidden selected>단계 선택</option>
			<option value="초급">초급</option>
			<option value="중급">중급</option>
			<option value="고급">고급</option>
		</select>
		<br>
		<input type="text" placeholder="가격" name="lecPrice">
		<br>
		<textarea name="lecDescription" cols="40" rows="3" placeholder="강의 설명"></textarea>
		<br>
		<input type="submit" value="등록">
	</form>
</body>
</html>