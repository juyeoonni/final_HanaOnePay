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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
<%@ include file="/WEB-INF/views/comm/header.jsp"%>


<form action="/path_to_your_server_endpoint" method="POST" class="card p-4">
    <h3 class="mb-3">카드 정보 입력</h3>

    <div class="mb-3">
        <label for="cardNumber" class="form-label">카드 번호</label>
        <div class="card-input-group">
            <input type="text" id="cardNumber1" name="cardNumber1" class="form-control card-input" maxlength="4" placeholder="0000">
            <span class="card-separator">-</span>
            <input type="text" id="cardNumber2" name="cardNumber2" class="form-control card-input" maxlength="4" placeholder="0000">
            <span class="card-separator">-</span>
            <input type="text" id="cardNumber3" name="cardNumber3" class="form-control card-input" maxlength="4" placeholder="0000">
            <span class="card-separator">-</span>
            <input type="text" id="cardNumber4" name="cardNumber4" class="form-control card-input" maxlength="4" placeholder="0000">
        </div>
    </div>



    <div class="mb-3">
        <label for="expirationDate" class="form-label">유효기간</label>
        <input type="text" id="expirationDate" name="expirationDate" class="form-control" placeholder="MM/YY" maxlength="5">
    </div>

    <div class="mb-3">
        <label for="cvc" class="form-label">CVC</label>
        <input type="text" id="cvc" name="cvc" class="form-control" placeholder="카드 뒷면 3자리 숫자" maxlength="3">
    </div>

    <div class="mb-3">
        <label for="cardPassword" class="form-label">카드 비밀번호</label>
        <input type="password" id="cardPassword" name="cardPassword" class="form-control" placeholder="카드 비밀번호 (앞 2자리)" maxlength="2">
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


<main>

</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>