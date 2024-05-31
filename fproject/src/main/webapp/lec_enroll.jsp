<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript">
	function check() {
		var form = document.getElementById("lec_enroll");
		
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
	<div class="container mt-5">
		<div class="card-body">
			<h1 style="font-weight: bold;" class="display-4 mb-2">강의 등록</h1>
			<br><br>
			<form id="lec_enroll" name="lec_enroll" action="lec_enroll_process.jsp" method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="lecName" class="form-label">강의명</label>
					<input type="text" class="form-control" id="lecName" name="lecName" placeholder="강의명" maxlength="50">
				</div>
				<div class="mb-3">
					<label for="teacherName" class="form-label">강사명</label>
					<input type="text" class="form-control" id="teacherName" name="teacherName" placeholder="강사명" maxlength="10">
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
					</select>
				</div>
				<div class="mb-3">
					<label for="lecLevel" class="form-label">단계</label>
					<select class="form-select" id="lecLevel" name="lecLevel">
						<option disabled hidden selected>단계 선택</option>
						<option value="초급">초급</option>
						<option value="중급">중급</option>
						<option value="고급">고급</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="lecPrice" class="form-label">가격</label>
					<input type="text" class="form-control" id="lecPrice" name="lecPrice" placeholder="가격" maxlength="10">
				</div>
				<div class="mb-3">
					<label for="lecDescription" class="form-label">강의 설명</label>
					<textarea class="form-control" id="lecDescription" name="lecDescription" rows="3" placeholder="강의 설명" maxlength="150"></textarea>
				</div>
				<div class="d-flex justify-content-end mb-3">
					<button type="button" class="btn btn-light bnt-lg" onclick="check()">등록</button>
				</div>
			</form>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
