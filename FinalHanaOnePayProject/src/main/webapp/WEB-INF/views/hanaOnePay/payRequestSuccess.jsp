<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>원페이결제요청</title>
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
            font-size: 25px;
            margin-left: 4px;
        }

        .paymentInfo {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0.1, 0, 0, 0.1);
            padding: 2%;
            margin: 2%;
            border-radius: 8px;
            background-color: #FFFFFF;
        }

        .paySuccess {
            margin-left: 20%;
            align-items: center;
            justify-content: center;
        }

        .paySuccessImg {
            width: 100%;
            max-width: 70vw;
            margin: auto;
            display: block;
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

        .page-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        @media (min-width: 600px) {
            .headername {
                font-size: 2.5em;
            }

            .btn-qr {
                font-size: 2em;
            }
        }

        @media (min-width: 768px) and (max-width: 991px) {
            .headername {
                font-size: 2.5em;
            }

            .btn-qr {
                font-size: 2em;
                width: 30%;
            }

            .paySuccessImg {
                max-width: 40vw;
            }

            .paymentInfo {
                width: 70vw;
                margin: 1% auto;
            }
        }

        @media (min-width: 992px) and (max-width: 1199px) {
            .headername {
                font-size: 3em;
            }

            .btn-qr {
                font-size: 2.5em;
                width: 20%;
            }

            .paySuccessImg {
                max-width: 30vw;
            }

            .paymentInfo {
                width: 60vw;
                margin: 1% auto;
            }
        }

        @media (min-width: 1200px) {
            .headername {
                font-size: 3.5em;
            }

            .btn-qr {
                font-size: 2.8em;
                width: 15%;
            }

            .paySuccessImg {
                max-width: 25vw;
            }

            .paymentInfo {
                width: 50vw;
                margin: 1% auto;
            }
        }

    </style>
</head>

<body>
<div class="card-header">
    <img class="headerImg" src="/img/hanaLogo.png"> <br>
    <div class="headername">하나원페이</div>
</div>

<div class="paySuccess" style="margin-left: 61px">
    <img class="paySuccessImg" src="/img/paySuccess.gif" alt="paySuccess" style="margin-right: 400px;"> <br>
    <div style="margin-left: 52px; margin-top: -30px; margin-bottom: 20px;">결제가 승인되었습니다.</div>
</div>
<br>

<div class="paymentInfo">
    <h2>결제정보</h2>
    <hr>
    <table class="table">
        <tr>
            <td>가맹점</td>
            <td>하나원쇼핑</td>
        </tr>
        <tr>
            <td>상품명</td>
            <td>${sessionScope.productName}</td>
        </tr>
        <tr>
            <td>결제일시</td>
            <td>${time}</td>
        </tr>
        <tr>
            <td>결제상태</td>
            <td>정상승인</td>
        </tr>
        <tr>
            <td>결제요금</td>
            <td id="productPrice"></td>
        </tr>
    </table>
    <hr>
</div>

<br>

<div class="page-container">
    <button type="button" class="btn-qr" id="payStart" data-bs-toggle="modal" data-bs-target="#paymentModal">
        확인
    </button>
</div>

<br><br><br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    window.onload = function() {
        let priceElement = document.getElementById("productPrice");
        let rawPrice = priceElement.textContent.trim();
        let formattedPrice = numberWithCommas(rawPrice);
        priceElement.textContent = formattedPrice + "원";
    }

    // window.onload = function() {
    //     let priceElement = document.getElementById("productPrice");
    //     let rawPrice;
    //
    //     // sessionScope에서 productPrice 값을 확인
    //     if (priceElement.textContent.trim() !== "") {
    //         rawPrice = priceElement.textContent.trim();
    //     } else {
    //         // sessionScope의 productPrice 값이 존재하지 않는 경우, sessionStorage에서 가져옵니다.
    //         rawPrice = sessionStorage.getItem("productPrice");
    //     }
    //
    //     let formattedPrice = numberWithCommas(rawPrice);
    //     priceElement.textContent = formattedPrice + "원";
    // }

    document.getElementById('payStart').addEventListener('click', function() {
        window.location.href = "/shop/shopMain";
    });
    var productPrice = sessionStorage.getItem("productPrice");
    document.getElementById("productPrice").textContent = productPrice;
</script>
</body>
</html>
