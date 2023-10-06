<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 카드 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">

    <style>
        body {
            padding: 5% 10%;
        }

        .card-input {
            display: inline-block;
            width: 22%;
            margin-right: 2%;
        }

        .card-input-group {
            display: flex;
            align-items: center;
        }

        .card-input {
            width: 60px;
            margin-right: 10px;
        }

        .card-separator {
            margin-right: 10px;
        }

        .btn-primary {
            background-color: #00857E !important;
            border-color: #00857E !important;
        }

        .btn-primary:hover {
            background-color: #00665e !important;
            border-color: #00554e !important;
        }
    </style>

</head>

<body>


<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<main>

<form action="/path_to_your_server_endpoint" method="POST" class="card p-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
        <h3>카드 정보 입력</h3>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            카드 등록
        </button>
    </div>
    카드 정보 입력</h3>
    <div class="mb-3">
        <label for="cardNumber" class="form-label">카드 번호</label>
        <div class="card-input-group">
            <input type="text" id="cardNumber1" name="cardNumber1" class="form-control card-input" maxlength="4"
                   placeholder="0000">
            <span class="card-separator">-</span>
            <input type="text" id="cardNumber2" name="cardNumber2" class="form-control card-input" maxlength="4"
                   placeholder="0000">
            <span class="card-separator">-</span>
            <input type="text" id="cardNumber3" name="cardNumber3" class="form-control card-input" maxlength="4"
                   placeholder="0000">
            <span class="card-separator">-</span>
            <input type="text" id="cardNumber4" name="cardNumber4" class="form-control card-input" maxlength="4"
                   placeholder="0000">
        </div>
    </div>


    <div class="mb-3">
        <label for="expirationDate" class="form-label">유효기간</label>
        <input type="text" id="expirationDate" name="expirationDate" class="form-control" placeholder="MM/YY"
               maxlength="5">
    </div>

    <div class="mb-3">
        <label for="cvc" class="form-label">CVC</label>
        <input type="text" id="cvc" name="cvc" class="form-control" placeholder="카드 뒷면 3자리 숫자" maxlength="3">
    </div>

    <div class="mb-3">
        <label for="cardPassword" class="form-label">카드 비밀번호</label>
        <input type="password" id="cardPassword" name="cardPassword" class="form-control" placeholder="카드 비밀번호 (앞 2자리)"
               maxlength="2">
    </div>

    <h3 class="mb-3">약관 동의</h3>

    <div class="mb-2 form-check">
        <input type="checkbox" class="form-check-input" id="allAgreement" name="allAgreement">
        <label class="form-check-label" for="allAgreement">전체 약관동의</label>
    </div>

    <div class="mb-2 form-check">
        <input type="checkbox" class="form-check-input" id="hanaOnePayAgreement" name="hanaOnePayAgreement">
        <label class="form-check-label" for="hanaOnePayAgreement">하나원페이 개인(신용) 정보 수집 및 이용 동의</label>
    </div>

    <div class="mb-2 form-check">
        <input type="checkbox" class="form-check-input" id="hanaToCardAgreement" name="hanaToCardAgreement">
        <label class="form-check-label" for="hanaToCardAgreement">하나원페이 -> 카드사 개인(신용)정보 제공 동의</label>
    </div>

    <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="cardToHanaAgreement" name="cardToHanaAgreement">
        <label class="form-check-label" for="cardToHanaAgreement">카드사 -> 하나원페이 개인 (신용)정보 제공 동의</label>
    </div>

    <input type="submit" value="등록" class="btn btn-primary">
</form>


<%--    카드입력모달--%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <img src="/img/hanaLogo.png" alt="하나원페이 로고" style="margin-right: 10px; width: 45px; height: 45px;">
                <h1 class="modal-title fs-5" id="exampleModalLabel"  style="font-weight: bold;">하나원페이</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <label for="image">이미지 업로드</label>
                    <input type="file" id="idCardImage" name="image" onchange="previewImage(event)">
                    <!-- 이미지 표시 부분 -->
                    <div class="col-md-6">
                        <img id="modalImage" src="" alt="Uploaded Image" style="max-width: 100%;">
                    </div>

                    <!-- 입력 폼 부분 -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">cardNumber</label>
                            <input type="text" class="form-control" id="cardNumber" placeholder="Enter Card Number">
                        </div>
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">cardCode</label>
                            <input type="text" class="form-control" id="cardCode" placeholder="Enter Card cardCode">
                        </div>
                        <div class="mb-3">
                            <label for="validityPeriod" class="form-label">validityPeriod</label>
                            <input type="text" class="form-control" id="validityPeriod" placeholder="Enter Validity Period">
                        </div>
                        <div class="mb-3">
                            <label for="userName" class="form-label">userName</label>
                            <input type="text" class="form-control" id="userName" placeholder="Enter User Name">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">

                <button type="button" id="uploadButton" class="btn btn-primary">업로드</button>

                <button type="button" class="btn btn-primary" id="ocr-send">등록</button>
            </div>
        </div>
    </div>
</div>




</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let imageDataURL;  // 이미지의 data URL을 저장할 변수

    // 첨부한 이미지 받아오기
    function previewImage(event) {
        const reader = new FileReader();
        reader.onload = function() {
            const output = document.getElementById('modalImage');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }


    // 모달이 보여질 때 이미지를 설정 (Bootstrap 5 이상 필요)
    document.getElementById("exampleModal").addEventListener('shown.bs.modal', function () {
        document.getElementById("modalImage").src = imageDataURL;
    });

    // ocr 처리
    document.querySelector("#uploadButton").addEventListener("click", function (event) {
        event.preventDefault();

        let formData = new FormData();
        formData.append("image", document.getElementById("idCardImage").files[0]);

        document.querySelector("#uploadButton").addEventListener("click", function(event) {
            event.preventDefault();

            let formData = new FormData();
            formData.append("image", document.getElementById("idCardImage").files[0]);

            $.ajax({
                type: "POST",
                url: "/authenticateAction",
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    console.log(data); // 데이터의 형식 확인

                    let cardNumber = data.cardNumber; // 예: JSON의 키가 cardNumber인 경우
                    let cardCode = data.cardCode;
                    let userName = data.userName;
                    let validityPeriod = data.validityPeriod;

                    document.getElementById("cardNumber").value = cardNumber;
                    document.getElementById("cardCode").value = cardCode;
                    document.getElementById("userName").value = userName;
                    document.getElementById("validityPeriod").value = validityPeriod;
                },
                error: function(error) {
                    console.error("Error during AJAX request:", error);
                }
            });
        });

    });

    // '등록' 버튼 클릭 시 동작
    document.querySelector('#ocr-send').addEventListener('click', function () {
        const cardNumberParts = document.getElementById("cardNumber").value.split("-");
        console.log("cardNumberParts: ", cardNumberParts)
        document.getElementById("cardNumber1").value = cardNumberParts[0];
        document.getElementById("cardNumber2").value = cardNumberParts[1];
        document.getElementById("cardNumber3").value = cardNumberParts[2];
        document.getElementById("cardNumber4").value = cardNumberParts[3];
        // document.getElementById("cvc").value = document.getElementById("cardCode").value;
        document.getElementById("expirationDate").value = document.getElementById("validityPeriod").value;

        // 모달을 닫음
        var modal = bootstrap.Modal.getInstance(document.getElementById('exampleModal'));
        modal.hide();
    });














</script>


</body>
</html>