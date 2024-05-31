<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수강바구니</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5 mb-5">
        <h1 style="font-weight: bold;" class="display-4 mb-4">장바구니</h1>
        <div class="row">
            <!-- Left Column: Course List -->
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-header d-flex align-items-center">
                        <input type="checkbox" id="selectAll" class="form-check-input me-2">
                        <label for="selectAll" class="mb-0">전체선택</label>
                    </div>
                    <div class="card-body">
                        <!-- Sample course item. Repeat this block for each course in the cart. -->
                        <div class="d-flex align-items-center mb-3">
                            <input type="checkbox" class="form-check-input me-2">
                            <img src="imagePath" class="img-thumbnail me-3" style="width: 120px; height: auto;" alt="Course Image">
                            <div>
                              	<a href="#" class="text-decoration-none" style="font-weight: bold; font-size: 20px;">강의명</a>
                            </div>
                            <div class="ms-auto text-end">
                                <span style="font-weight: bold; font-size: 20px;">원</span>
                            </div>
                            <button type="button" class="btn-close ms-4" aria-label="Remove"></button>
                        </div>
                        <!-- End of sample course item -->
                    </div>
                </div>
            </div>

            <!-- Right Column: Order Summary -->
            <div class="col-md-4">
                <div class="card mb-3">
                    <div class="card-body">
                        <ul class="list-group list-group-flush mb-3">
                            <li class="list-group-item d-flex justify-content-between">
                                <span>선택상품 금액</span>
                                <span>원</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between text-danger">
                                <span>할인금액</span>
                                <span>원</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between fw-bold">
                                <span>총 결제금액</span>
                                <span>원</span>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-success w-100">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
