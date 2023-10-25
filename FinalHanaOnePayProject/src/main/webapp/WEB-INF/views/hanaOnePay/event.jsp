<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-02
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마이하나페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">
    <title>마이하나</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <style>
        body {
            min-height: 100vh;
            min-height: -webkit-fill-available;
        }


        html {
            height: -webkit-fill-available;
        }

        main {
            height: 100vh;
            height: -webkit-fill-available;
            max-height: 100vh;
            overflow-x: auto;
            overflow-y: hidden;
        }

        .dropdown-toggle {
            outline: 0;
        }

        .btn-toggle {
            padding: .25rem .5rem;
            font-weight: 600;
            color: var(--bs-emphasis-color);
            background-color: transparent;
        }

        .btn-toggle:hover,
        .btn-toggle:focus {
            color: rgba(var(--bs-emphasis-color-rgb), .85);
            background-color: var(--bs-tertiary-bg);
        }

        .btn-toggle::before {
            width: 1.25em;
            line-height: 0;
            content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
            transition: transform .35s ease;
            transform-origin: .5em 50%;
        }

        [data-bs-theme="dark"] .btn-toggle::before {
            content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%28255,255,255,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
        }

        .btn-toggle[aria-expanded="true"] {
            color: rgba(var(--bs-emphasis-color-rgb), .85);
        }

        .btn-toggle[aria-expanded="true"]::before {
            transform: rotate(90deg);
        }

        .btn-toggle-nav a {
            padding: .1875rem .5rem;
            margin-top: .125rem;
            margin-left: 1.25rem;
        }

        .btn-toggle-nav a:hover,
        .btn-toggle-nav a:focus {
            background-color: var(--bs-tertiary-bg);
        }

        .scrollarea {
            overflow-y: auto;
        }

        .flex-container {
            display: flex;
        }

        .mypageMain {
            flex: 1;
        }

        .mypageMain {
            display: flex;
            flex-direction: column;
            margin-left: 30px;
        }

        .mypageName {
            margin-right: 130px;
            text-align: center;
            width: 100%;
        }

        .mypageMain > .mypageName {
            align-self: center;
        }

        .myCardInfo {
            font-size: 20px;
            width: 450px;
            height: 300px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center;
        }

        .monthlyCardInfo {
            font-size: 20px;
            margin-left: 40px;
            width: 510px;
            height: 300px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center;
        }

        .creditCardWithDraw {
            font-size: 20px;
            margin-left: -5px;
            width: 60%;
            height: 160px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            margin-right: 130px;
            margin-bottom: 30px;
            text-align: center;
        }

        .myHanaMoney {
            font-size: 20px;
            margin-left: -100px;
            width: 28%;
            height: 160px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            margin-bottom: 30px;
            text-align: center;
        }

        table {
            width: 90.3%;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .plusBtn {
            margin-left: 20px;
            color: white;
            background-color: #00857E;
            border-radius: 10px;
            border: none;
        }

        .mainCard {
            display: flex;
            align-items: center;
            text-align: left;
        }

        .payCardImg {
            margin-left: 20px;
            margin-right: 20px;
            order: -1;
            width: 200px;
            height: 150px;
        }

        .custom-flex-container {
            flex-direction: column;
        }

        .payTag {
            margin-top: 10px;
            align-items: center;
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 60%;

        }

        .proImg {
            width: 100px;
            height: 100px;
            margin-right: 10px;
        }

        .profile {
            padding: 2px;
            font-size: 16px;
            text-align: center;
            color: white;
            background-color: #666666;
            border-radius: 10px;
            border: none;
            align-content: center;
            margin-top: 10px;
            margin-right: 20px;
            width: 150px;
            height: 30px;
            transition: background-color 0.3s ease;
        }

        .profile:hover {
            background-color: #6C757D;
        }


        .proInfo {
            margin-right: 10px;
            margin-top: 10px;
            margin-left: 10px;
            font-size: 17px;
            color: #666666;
        }

        .holicontainer {
            margin-bottom: 100px;
            margin-left: 50px;
            display: flex;
            flex-direction: row;
        }

        .profile a {
            text-decoration: none;
            color: inherit;
        }

        .profile a:hover {
            text-decoration: none;
        }

        .adPayTag {
            width: 90.3%;
            height: 50px;
            background-color: #d9ede8;
        }

        .adPayTag {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 65px;
        }

        /*토글스위치*/
        .toggleSwitch {
            width: 60px;
            height: 30px;
            display: block;
            position: relative;
            border-radius: 30px;
            background-color: #fff;
            box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
            cursor: pointer;
            margin: 30px;
        }

        .toggleSwitch .toggleButton {
            width: 20px;
            height: 20px;
            position: absolute;
            top: 50%;
            left: 4px;
            transform: translateY(-50%);
            border-radius: 50%;
            background: #00857E;
        }

        #toggle:checked ~ .toggleSwitch {
            background: #00857E;
        }

        #toggle:checked ~ .toggleSwitch .toggleButton {
            left: calc(100% - 44px);
            background: #fff;
        }

        .toggleSwitch, .toggleButton {
            transition: all 0.2s ease-in;
        }

        .toggleContainer {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .using {
            display: flex;
            align-items: center;
        }

        .toggleContainer {
            display: flex;
            align-items: center;
            margin-left: 570px;
        }

        .eventBlock {
            transition: transform 0.3s ease-in-out;
        }

        .eventBlock:hover {
            transform: scale(1.05);
        }

        .eventName a {
            color: black;
            text-decoration: none;
            display: block;
        }

        .eventName a:hover {
            color: #ff4500;
        }

    </style>

</head>
<body>

<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<div class="flex-container">
    <%--    사이드바시작--%>
    <div class="flex-shrink-0 p-3" style="width: 280px; margin-left: 90px;">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
            <svg class="bi pe-none me-2" width="30" height="24">
                <use xlink:href="#bootstrap"/>
            </svg>
            <span class="fs-5 fw-semibold">이벤트</span>
        </a>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                    이벤트
                </button>

                <div class="collapse show" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/hanaOnePay/selectHanaPayCard"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">진행중인 이벤트</a></li>
                        <li><a onclick="fetchAccountData()"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                               style="cursor: pointer;">종료된 이벤트</a></li>
                    </ul>
                </div>
            </li>


            <li class="border-top my-3"></li>
        </ul>
    </div>

    <div class="mypageMain">
        <div class="mypageName">
            <div style="font-size: 30px">진행중인이벤트</div>
            <div style="color: #959595">하나원페이에서 이벤트 혜택을 누리세요</div>
        </div>
        <br>
        <br>

        <%--        이벤트캐러셀--%>
        <div id="carouselExampleRide" class="carousel slide" data-bs-ride="carousel" style="width: 90.3%">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="1000">
                    <img src="/img/shop/eventSlide1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/img/shop/eventSlide2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/img/shop/eventSlide3.png" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>



        <br><br>


        <a href="/shop/shopMain" style="text-decoration: none; color: inherit;">
            <div class="adPayTag">
                <img src="/img/eventTag.png" style="width: 37px; height: 37px;">
                <span class="tagcolor"
                      style="color: #d14369; font-size: 20px; margin-left: 4px">하나원쇼핑</span>에서 쇼핑하고 하나머니 받아가세요 ! >
            </div>
        </a>

        <br>

        <nav class="navbar navbar-expand-lg bg-body-tertiary" style="width: 90.3%;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" style="font-size: 18px;" >하나원페이</a>
                        </li>

                        <li class="nav-item dropdown" style="margin-left: -3px;">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                진행중인 이벤트
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">진행중인 이벤트</a></li>
                                <li><a class="dropdown-item" href="#">종료된 이벤트</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">하나원쇼핑</a></li>
                            </ul>
                        </li>

                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" aria-label="Search">
                        <button style="width: 100px;" class="btn btn-outline-success" type="submit">조회</button>
                    </form>
                </div>
            </div>
        </nav>

        <hr style="width: 90.3%; border-width: 4px;">
        <div class="eventBlock" style="display: flex;">
            <div class="eventImg" style="margin-left: 3%; "><img src="/img/event1.png" alt=""></div>
            <div class="eventName" style="margin-left: 12%; margin-top: 40px;">가을엔 이런 혜택 어텀?</div>
            <div class="eventperiod" style="margin-left: 30%; margin-top: 40px;">2023.10.01~2023.10.31</div>
        </div>
        <hr style="width: 90.3%; border-width: 1px;">
        <div class="eventBlock" style="display: flex;">
            <div class="eventImg" style="margin-left: 3%; "><img src="/img/event2.png" alt=""></div>
            <div class="eventName" style="margin-left: 12%; margin-top: 40px;">연말엔 나도 해외여행! 하나로 한번에 준비</div>
            <div class="eventperiod" style="margin-left: 20%; margin-top: 40px;">2023.10.01~2023.12.31</div>
        </div>
        <hr style="width: 90.3%; border-width: 1px;">
        <div class="eventBlock" style="display: flex;">
            <div class="eventImg" style="margin-left: 3%; "><img src="/img/event3.png" alt=""></div>
            <div class="eventName" style="margin-left: 12%; margin-top: 40px;">대학교 등록금 무이자 할부 혜택</div>
            <div class="eventperiod" style="margin-left: 25.5%; margin-top: 40px;">2023.10.01~2023.10.31</div>
        </div>
        <hr style="width: 90.3%; border-width: 1px;">
        <div class="eventBlock" style="display: flex;">
            <div class="eventImg" style="margin-left: 3%; "><img src="/img/event4.png" alt=""></div>
            <div class="eventName" style="margin-left:12%; margin-top: 40px;">하나원쇼핑 5만원 이상 구매시 하나머니 적립!</div>
            <div class="eventperiod" style="margin-left: 18%; margin-top: 40px;">2023.10.01~2023.10.31</div>
        </div>
        <hr style="width: 90.3%; border-width: 1px;">
        <div class="eventBlock" style="display: flex;">
            <div class="eventImg" style="margin-left: 3%; "><img src="/img/event5.png" alt=""></div>
            <div class="eventName" style="margin-left: 12%; margin-top: 40px;">이자율을 낮추는 꿀팁!</div>
            <div class="eventperiod" style="margin-left: 31%; margin-top: 40px;">2023.10.01~2023.10.31</div>
        </div>
        <hr style="width: 90.3%; border-width: 1px;">
        <nav aria-label="Page navigation example" style="margin-left: 28%;">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>

        <br><br><br><br><br>
    </div>
</div>

</div>

<%--<%@ include file="/WEB-INF/views/comm/footer.jsp" %>--%>
<img src="/img/footer.png" style="margin-left: 9%;">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>

    window.onload = function () {
        console.log("Script is running");

        let phoneElement = document.getElementById("phone");
        let originalPhone = phoneElement.textContent.trim();

        console.log("Original phone:", originalPhone);

        if (originalPhone) {
            let phoneParts = originalPhone.split('-');
            if (phoneParts.length === 3) {
                phoneParts[2] = "****";
                let modifiedPhone = phoneParts.join('-');
                phoneElement.textContent = modifiedPhone;
            }
        }

        const targetAmount = parseInt('${thisMonthTotalAmounts[card1.cardNumber]}'.replace(/[^0-9]/g, ''));
        const displayElement = document.getElementById("monthlyUsage");
        const duration = 500;
        const stepTime = 10;
        let currentAmount = 0;
        const increment = targetAmount / (duration / stepTime);

        const intervalId = setInterval(function () {
            currentAmount += increment;
            if (currentAmount >= targetAmount) {
                clearInterval(intervalId);
                currentAmount = targetAmount;
            }
            displayElement.textContent = numberWithCommas(Math.round(currentAmount)) + "원";
        }, stepTime);

        // 하나머니
        const targetHanaMoney = parseInt('${hanaMoney}'.replace(/[^0-9]/g, ''));
        const displayHanaMoneyElement = document.getElementById("hanaMoney");

        let currentHanaMoney = 0;

        const hanaMoneyIntervalId = setInterval(function () {
            currentHanaMoney += increment;
            if (currentHanaMoney >= targetHanaMoney) {
                clearInterval(hanaMoneyIntervalId);
                currentHanaMoney = targetHanaMoney;
            }
            displayHanaMoneyElement.textContent = numberWithCommas(Math.round(currentHanaMoney)) + "원";
        }, stepTime);

    }

    window.addEventListener('DOMContentLoaded', (event) => {
        // 숫자에 세 자리마다 콤마 추가하는 함수
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        let totalSpentAmountDiv = document.getElementById('totalSpentAmount');
        let value = parseInt(totalSpentAmountDiv.textContent.replace(/[^0-9]/g, ''));
        totalSpentAmountDiv.textContent = "총 " + numberWithCommas(value) + "원";
    });

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }


    var cardNames = ['${card1.cardName}', '${card2.cardName}'];
    var cardImages = ['/img/${card1.cardName}.png', '/img/${card2.cardName}.png'];
    var cardAmounts = ['${thisMonthTotalAmounts[card1.cardNumber]}원', '${thisMonthTotalAmounts[card2.cardNumber]}원'];
    var thisMonthTransData = {
        '${card1.cardNumber}': '${thisMonthTransData[card1.cardNumber]}',
        '${card2.cardNumber}': '${thisMonthTransData[card2.cardNumber]}'
    };
    console.log(thisMonthTransData);

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function formatCardAmount(amountStr) {
        var numberPart = amountStr.replace(/[^0-9]/g, '');
        return numberWithCommas(numberPart) + '원';
    }

    function parseTransList(transListString) {
        var regex = /\(payId=(\d+), cardNumber=([\d\-]+), payDate=([\d\- :]+), payAmount=(\d+), businessCode=(\d+), businessMall=([^,]+), payStatus=([^,]+), payType=([^\)]+)\)/g;
        var result = [];
        var match;

        while (match = regex.exec(transListString)) {
            result.push({
                payId: parseInt(match[1]),
                cardNumber: match[2],
                payDate: match[3],
                payAmount: parseInt(match[4]),
                businessCode: parseInt(match[5]),
                businessMall: match[6].trim(),
                payStatus: match[7].trim(),
                payType: match[8].trim()
            });
        }

        return result;
    }

    function showTransData(cardNumber) {
        // tbody 참조
        var tbody = document.querySelector('.recentCardUse tbody');

        // tbody 내용 초기화
        tbody.innerHTML = '';

        var transListString = thisMonthTransData[cardNumber];

        // 문자열을 파싱하여 JSON 형식의 객체 배열로 변환
        var transList = parseTransList(transListString);

        console.log("transList:", transList);

        for (var i = 0; i < transList.length; i++) {
            var trans = transList[i];
            console.log("중8ㅑㄴ", trans);


            var newRow = tbody.insertRow();
            var cell1 = newRow.insertCell(0); // 결제일시
            var cell2 = newRow.insertCell(1); // 거래처
            var cell3 = newRow.insertCell(2); // 카드 번호
            var cell4 = newRow.insertCell(3); // 상태
            var cell5 = newRow.insertCell(4); // 거래금액

            // 각 cell에 데이터 할당
            cell1.textContent = trans.payDate;
            cell2.textContent = trans.businessMall;
            cell3.textContent = maskCardNumber(trans.cardNumber);
            cell4.textContent = trans.payStatus;
            cell5.textContent = numberWithCommas(trans.payAmount) + "원";

        }
    }

    function showCardInfo(index) {
        // 카드 이미지와 이름 업데이트
        document.querySelector('#cardImage').src = cardImages[index];
        document.querySelector('#cardImage').alt = cardNames[index];
        document.querySelector('#cardName').textContent = cardNames[index];

        // 카드 사용금액 업데이트
        var formattedAmount = formatCardAmount(cardAmounts[index]);
        document.querySelector('#monthlyUsage').textContent = formattedAmount;

        // 추가된 거래내역 표시 로직
        var cardNumber = (index === 0) ? '${card1.cardNumber}' : '${card2.cardNumber}';
        showTransData(cardNumber);
    }


    function fetchAccountData() {
        fetch(`/api/account-data`, {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({"banks": ["woori", "shinhan", "KB"]})  //모든 은행의 계좌를 조회
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                sessionStorage.setItem('accountData', JSON.stringify(data));

                window.location.href = "/hanaOnePay/selectHanaPayAccount";
            })
            .catch(error => {
                console.error("계좌 정보 조회 중 오류 발생:", error);
            });
    }

    function maskCardNumber(cardNumber) {
        var cardNumStr = cardNumber.toString();

        if (cardNumStr.includes('-')) {
            var parts = cardNumStr.split('-');
            return parts[0] + '-****-****-' + parts[3];
        } else {
            return cardNumStr.substring(0, 4) + '********' + cardNumStr.substring(12);
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        var cardNumberElement = document.getElementById('cardNumber');
        var parts = cardNumberElement.textContent.split(' ');
        var maskedNumber = maskCardNumber(parts[parts.length - 1]);

        cardNumberElement.textContent = parts.slice(0, -1).join(' ') + ' ' + maskedNumber;
    });


</script>

</body>
</html>
