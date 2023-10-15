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

        .flex-shrink-0 {
            /* 필요에 따라 여기에 추가 스타일을 설정하세요 */
        }

        .mypageMain {
            flex: 1; /* 나머지 공간을 채우도록 설정 */
            /* 필요에 따라 여기에 추가 스타일을 설정하세요 */
        }

        .mypageMain {
            display: flex;
            flex-direction: column;
            margin-left: 30px;
            /*align-items: center;*/
            /*justify-content: center;*/
            /*height: 100vh;  !* 높이를 화면 높이와 동일하게 설정. 필요에 따라 조정할 수 있습니다. *!*/
        }

        .mypageName {
            margin-right: 130px;
            text-align: center; /* 텍스트 중앙 정렬 */
            width: 100%; /* 너비를 100%로 설정하여 왼쪽 및 오른쪽 여백 없음 */
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
            text-align: center; /* 텍스트 중앙 정렬 */
        }

        .monthlyCardInfo {
            font-size: 20px;
            margin-left: 40px;
            width: 510px;
            height: 300px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center; /* 텍스트 중앙 정렬 */
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
            text-align: center; /* 텍스트 중앙 정렬 */
        }

        .myHanaMoney {
            font-size: 20px;
            margin-left: -100px;
            width: 28%;
            height: 160px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            /*margin-right: 130px;*/
            margin-bottom: 30px;
            text-align: center; /* 텍스트 중앙 정렬 */
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
            display: flex; /* flex를 사용하여 아이템들을 가로로 나열합니다 */
            align-items: center; /* 아이템들을 수직 중앙에 배치합니다 */
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
            border-radius: 15px; /* 둥근 모서리 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
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
            transition: background-color 0.3s ease; /* 부드러운 전환을 위한 트랜지션 설정 */
        }

        .profile:hover {
            /* 호버 상태에서의 스타일 */
            background-color: #6C757D; /* 호버 시 배경색 변경 등을 설정합니다. */
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
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 부모 요소의 폰트색을 상속받음 */
        }

        .profile a:hover {
            text-decoration: none; /* 마우스 호버 상태에서도 밑줄 제거 */
        }

        .adPayTag {
            width: 90.3%;
            height: 50px;
            background-color: #d9ede8;
        }

        .adPayTag {
            display: flex; /* flexbox를 사용합니다. */
            align-items: center; /* 수직으로 가운데 정렬합니다. */
            justify-content: center; /* 수평으로 가운데 정합니다. */
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
            align-items: center; /* 항목들을 수직으로 중앙에 배치합니다. */
            gap: 10px; /* 항목들 사이의 간격을 추가합니다. */
        }

        .using {
            display: flex;
            align-items: center;
            /*justify-content: space-between;*/
        }

        .toggleContainer {
            display: flex;
            align-items: center;
            margin-left: 570px;
        }

        /* Hover Effect for Event Block */
        .eventBlock {
            transition: transform 0.3s ease-in-out;
        }

        .eventBlock:hover {
            transform: scale(1.05); /* Increase the size to 105% on hover */
        }

        /* Styling for eventName link */
        .eventName a {
            color: black; /* Your desired text color */
            text-decoration: none; /* Removes underline */
            display: block; /* Makes the a tag behave like a block element */
        }

        /* Change color on hover */
        .eventName a:hover {
            color: #ff4500; /* Your desired hover color */
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
                        <%--                    <li><a href="/api/linkedAccount" class="link-body-emphasis d-inline-flex text-decoration-none rounded">연동카드조회</a></li>--%>
                        <%--                    <li><a href="/hanaOnePay/selectPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>--%>
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
    <%--    사이드바끝--%>

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
        console.log("Script is running"); // 로그 추가

        let phoneElement = document.getElementById("phone");
        let originalPhone = phoneElement.textContent.trim();

        console.log("Original phone:", originalPhone); // 로그 추가

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
        const duration = 500; // 애니메이션 시간 (2초)
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
        let value = parseInt(totalSpentAmountDiv.textContent.replace(/[^0-9]/g, '')); // 숫자만 추출
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

        // cardTransData에서 해당 카드번호의 거래내역 문자열을 가져옵니다.
        var transListString = thisMonthTransData[cardNumber];

        // 문자열을 파싱하여 JSON 형식의 객체 배열로 변환
        var transList = parseTransList(transListString);

        console.log("transList:", transList);

        // 거래내역 리스트를 순회하면서 테이블 row를 추가합니다.
        for (var i = 0; i < transList.length; i++) {
            var trans = transList[i];
            console.log("중8ㅑㄴ", trans);

            // 새로운 row와 cells 생성
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
                // 계좌 정보를 화면에 출력하는 코드
                // 예: 계좌 정보를 테이블에 추가
                sessionStorage.setItem('accountData', JSON.stringify(data));

                // 계좌 조회가 성공적으로 완료되었으므로 해당 경로로 리디렉션
                window.location.href = "/hanaOnePay/selectHanaPayAccount";
            })
            .catch(error => {
                console.error("계좌 정보 조회 중 오류 발생:", error);
            });
    }

    function maskCardNumber(cardNumber) {
        // 예: 카드번호가 "1234567890123456" 또는 "1234-5678-9012-3456"
        var cardNumStr = cardNumber.toString(); // 숫자일 경우를 대비해 문자열로 변환

        // 하이픈(-)이 포함된 경우와 포함되지 않은 경우에 대해 나누어 처리
        if (cardNumStr.includes('-')) {
            // "1234-5678-9012-3456" -> "1234-****-****-3456"
            var parts = cardNumStr.split('-');
            return parts[0] + '-****-****-' + parts[3];
        } else {
            // "1234567890123456" -> "1234********3456"
            return cardNumStr.substring(0, 4) + '********' + cardNumStr.substring(12);
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        // cardNumber 요소를 참조합니다.
        var cardNumberElement = document.getElementById('cardNumber');

        // 텍스트에서 실제 카드 번호 부분만 추출하여 마스크합니다.
        // 예를 들어, "하나은행 1234-5678-9012-3456" -> "하나은행 1234-****-****-3456"
        // 이 예에서는 카드번호가 항상 마지막에 있고, 공백으로 구분된다고 가정합니다.
        var parts = cardNumberElement.textContent.split(' ');
        var maskedNumber = maskCardNumber(parts[parts.length - 1]);

        // 마스크된 번호로 텍스트를 변경합니다.
        cardNumberElement.textContent = parts.slice(0, -1).join(' ') + ' ' + maskedNumber;
    });


</script>

</body>
</html>
