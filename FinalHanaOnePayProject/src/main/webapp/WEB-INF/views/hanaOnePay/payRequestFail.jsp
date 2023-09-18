<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>결제승인거절</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        @font-face {
            font-family: 'Hana2CM';
            src: url('/fonts/Hana2-CM.ttf') format('truetype');
        }

        body {
            font-family: 'Hana2CM', sans-serif !important;
            background-color: #f7f7f8;
        }

        .carousel-inner img {
            width: 100%;
            max-width: 200px;
            margin: auto;
            display: block;
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .headerImg {
            width: 40px;
            height: 40px;
        }

        .headername {
            font-size: 2em;
            margin-left: 4px;
        }

        .page-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .btn-qr {
            background-color: #00857E !important;
            color: #f7f7f7 !important;
            border: none;
            border-radius: 5px;
            width: 45%;
            height: 7vh;
            padding: 5px;
            font-size: 4.5vw;
        }

        .payFail{
            width: 30%;
            height: 30%;
        }
    </style>

</head>
<body>
<div class="card-header">
    <img class="headerImg" src="/img/hanaLogo.png"> <br>
    <div class="headername">하나원페이</div>
</div>

<br>

<div class="page-container">
    <img class="payFail" src="/img/payFail.png" alt="payFail">
    <br>
    <div class="payFailMsg">
        결제 승인 거절! 안돼 돌아가.
    </div>
</div>

<br>

<div class="page-container">
    <button type="button" class="btn-qr" id="payStart" data-bs-toggle="modal" data-bs-target="#paymentModal">
        이전으로
    </button>
</div>

</body>
</html>
