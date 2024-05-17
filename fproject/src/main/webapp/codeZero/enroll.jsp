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
	<form action="" method="get">
		<input type="text" name="lecName" placeholder="강의명" maxlength="30">
		<br>
		<input type="text" name="teacherName" placeholder="강사명">
		<br>
		<select name="lecCategory">
		<optgroup label="프로그래밍">
			<option disabled hidden selected>카테고리 선택</option>
			<option value="frontend">프론트엔드</option>
			<option value="backend">백엔드</option>
			<option value="app">앱 개발</option>
			<option value="database">데이터베이스</option>
			<option value="tool">개발도구</option>
		</optgroup>
		<optgroup label="게임 개발">
			<option value="gameProgramming">게임 프로그래밍</option>
			<option value="gameDesign">게임 기획</option>
			<option value="gameGraphic">게임 그래픽</option>
		</optgroup>
		<optgroup label="인공지능/빅데이터">
			<option value="dataAnalysis">데이터 분석</option>
			<option value="CV">컴퓨터 비전</option>
			<option value="NLP">자연어 처리</option>
		</optgroup>
		<optgroup label="보안/네트워크">
			<option value="security">보안</option>
			<option value="network">네트워크</option>
			<option value="system">시스템</option>
			<option value="cloud">클라우드</option>
		</optgroup>		
		</select>
		<select name="lecLevel">
			<option disabled hidden selected>단계 선택</option>
			<option value="beginner">초급</option>
			<option value="intermediate">중급</option>
			<option value="advanced">고급</option>
		</select>
		<br>
		<input type="text" placeholder="가격" name="lecPrice">
		<br>
		<textarea name="description" cols="40" rows="3" placeholder="강의 설명"></textarea>
		<br>
		<input type="submit" value="등록">
	</form>
</body>
</html>