<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
       .add-button {
            background-color: #00857E !important;
            color: #fff !important;
            border: none !important;
            padding: 10px 20px !important;
            border-radius: 5px !important;
            cursor: pointer !important;
            margin-top: 10px;
            margin-left: 430px;
            width: 600px;
            text-decoration: none;
        }

       .add-button:hover {
            background-color: #015550 !important;
        }

        /*사이드바*/
        body {
            min-height: 100vh;
        }

        main {
            height: 100vh;
            max-height: 100vh;
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

        .page-center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card-name {
            width: 100px;
            height: 34px;
            color: #FFFFFF;
            background-color: #BCD9D3;
            border-radius: 5px;
            padding: 5px;
            margin-bottom: 10px;
        }

       .card-info {
           border: 1px solid #ccc;
           width: 900px;
           padding: 10px;
           margin-bottom: 10px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           display: flex;
           flex-direction: row;
           align-items: center;
           border-radius: 10px;
       }

       .card-logo {
           text-align: center;
           width: 120px;
           height: 34px;
           color: white;
           border-radius: 5px;
           padding: 5px;
           display: flex;
           align-items: center;
       }

       .card-logo img {
           width: 20px;
           height: 20px;
           margin-right: 5px;
       }

       .shinhan-bg {
           background-color: #3253BC;
       }

       .KB-bg {
           background-color: #7C7268;
       }

       .woori-bg {
           background-color: #0182cd;
       }

       .hana-bg {
           background-color: #00857E;
       }

       .card-info:hover {
           background-color: rgba(224, 221, 221, 0.41);
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
           transform: scale(1.03);
           transition: all 0.2s ease;
       }

       .hanaCard:hover{
           background-color: rgba(224, 221, 221, 0.41);
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
           transform: scale(1.03);
           transition: all 0.2s ease;
       }
    </style>

</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<main>
    <%--사이드바시작--%>
    <div class="row">
        <div class="col-lg-3 flex-shrink-0 p-3" style="width: 280px; margin-left: 90px;">
            <a href="/"
               class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                <svg class="bi pe-none me-2" width="30" height="24">
                    <use xlink:href="#bootstrap"/>
                </svg>
                <span class="fs-5 fw-semibold">마이페이</span>
            </a>
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                        하나원페이
                    </button>
                    <div class="collapse show" id="home-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/hanaOnePay/selectHanaPayCard"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded">마이하나원페이 연동</a>
                            </li>
                            <li><a onclick="fetchAccountData()"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                                   style="cursor: pointer;">내 카드 불러오기</a></li>
                            <li><a onclick="fetchAccountData()"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                                   style="cursor: pointer;">연동 확인</a></li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">

                    <div class="collapse" id="dashboard-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/api/payments-by-month?month=09"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 지출 조회</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">

                    <div class="collapse" id="orders-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/api/payments-by-month?month=09"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
                        </ul>
                    </div>
                </li>
                <li class="border-top my-3"></li>
                <li class="mb-1">

                    <div class="collapse" id="account-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded">New...</a>
                            </li>
                            <li><a href="#"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded">Profile</a>
                            </li>
                            <li><a href="#"
                                   class="link-body-emphasis d-inline-flex text-decoration-none rounded">Settings</a>
                            </li>
                            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Sign
                                out</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>


        <div class="col-lg-8" >

            <div class="mycardOnePay" style="margin-left: 20px;">
                <div style="font-size:18px; text-align: center; color: #00857E;">마이카드</div>
                <div style="font-size: 2em; text-align: center;">마이하나원페이</div>
            </div>
            <div style="margin-left: 65px;">

                <div class="d-flex justify-content-start align-items-center mb-2" style="margin-left: 60px; margin-top: 30px;">
                    <h3 class="mb-0 me-3" style="margin-left: -30px;">연동 카드 확인</h3>

                    <!-- 드롭다운 시작 -->
                    <div class="dropdown" style="display: inline-block;">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                aria-expanded="false" style="margin-left: -50px;">
                            전체카드조회
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">전체카드조회</a></li>
                            <li><a class="dropdown-item" href="#">하나카드조회</a></li>
                            <li><a class="dropdown-item" href="#">다른카드조회</a></li>
                        </ul>
                    </div>
                    <!-- 드롭다운 끝 -->

                </div>
                <div id="selectedCardCount" class="mb-2" style="margin-left: 30px;">
                    연동된 카드 개수: <span id="count">0</span> 개
                </div>
                <%
                    String selectedCards = (String) session.getAttribute("selectedCards");
                    List<HanaOnePayCardDTO> allCards = (List<HanaOnePayCardDTO>) request.getAttribute("allCards");
                    String allCardsJson = new ObjectMapper().writeValueAsString(allCards);
                %>

                <div class="p-3 m-3 border border-3 rounded-3 shadow d-flex align-items-center hanaCard" style="width: 900px;">
                    <img src="/img/하나 원큐 카드.png"  style="width: 200px; height: 130px; margin-right: 10px; flex-shrink: 0;"alt="">
                    <div class="d-flex flex-column">
                        <div class="card-name">
                            <div style="display: flex;">
                                <img src="/img/bank/bankName=hana.png" style="width: 25px; height: 25px; margin-right: 3px; margin-bottom: 2px;">
                                <p style="color: #FFFFFF;">하나카드</p>
                            </div>
                        </div>
                        <div>카드이름 : 하나 원큐 카드</div>
                        <div>카드번호 : 6894- **** - **** -1029</div>
                    </div>

                </div>

                <c:forEach var="card" items="${allCards}">
                    <div class="card-info p-3 m-3 border border-3 rounded-3 shadow d-flex align-items-center">
                        <img src="/img/${card.cardName}.png" style="width: 200px; height: 130px; margin-right: 10px; flex-shrink: 0;">

                        <div>
                            <c:choose>
                                <c:when test="${card.cardCode eq 'KB'}">
                                    <div class="card-logo KB-bg">
                                        <img src="/img/bank/bankName=KB.png" alt="KB Logo">
                                        국민카드
                                    </div>
                                </c:when>
                                <c:when test="${card.cardCode eq 'woori'}">
                                    <div class="card-logo woori-bg">
                                        <img src="/img/bank/bankName=woori.png" alt="Woori Logo">
                                        우리카드
                                    </div>
                                </c:when>
                                <c:when test="${card.cardCode eq 'shinhan'}">
                                    <div class="card-logo shinhan-bg">
                                        <img src="/img/bank/bankName=shinhan.png" alt="Shinhan Logo">
                                        신한카드
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-logo hana-bg">
                                        <img src=/img/bank/bankName=hana.png" alt="Hana Logo">
                                        하나카드
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            카드 이름 : ${card.cardName} <br>
                            <c:set var="cardParts" value="${fn:split(card.cardNumber, '-')}"/>
                            <c:set var="maskedPart1" value="****"/>
                            <c:set var="maskedPart2" value="****"/>
                            <c:set var="maskedCardNumber" value="${cardParts[0]}-${maskedPart1}-${maskedPart2}-${cardParts[3]}"/>
                            카드 번호: ${maskedCardNumber}
                        </div>
                    </div>
                </c:forEach>
                <a href="/hanaOnePay/addPayCard" class="add-button">페이카드 추가</a>
            </div>

        </div>
    </div>
</main>

<!-- 푸터위치 -->
<%--<%@ include file="/WEB-INF/views/comm/footer.jsp" %>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>


<script>
    let cards = <%= allCardsJson %>;

    console.log(cards);


    // 연동된 카드 개수 업데이트 함수
    function updateCardCount() {
        let count = cards.length + 1; // cards 배열의 길이를 가져와 연동된 카드 개수로 설정
        document.getElementById('count').textContent = count;
    }

    // 페이지 로드 시 연동된 카드 개수 업데이트 호출
    window.onload = function () {
        updateCardCount();
    }

    cards.forEach(card => {
        const cardDiv = document.createElement("div");
        cardDiv.classList.add("card-info");

        const imageUrl = "/img/" + card.cardName + ".png";
        let cardCompany = card.cardCode;

        if (card.cardCode === "shinhan") {
            cardCompany = "신한카드";
        } else if (card.cardCode === "KB") {
            cardCompany = "KB국민카드";
        } else if (card.cardCode === "woori") {
            cardCompany = "우리카드";
        } else if (card.cardCode === "hana") {
            cardCompany = "하나카드";
        }

        cardDiv.innerHTML =
            '<img src="' + imageUrl + '" style="width: 200px; height: 130px; margin-right: 10px;">' +
            '<div style="flex: 1;">' +
            '<div class="card-code" style="width: 100px; color: white; background-color: #BCD9D3; border-radius: 5px; padding: 5px;">' +
            cardCompany +
            '</div>' +
            '카드 이름: ' + card.cardName + '<br>' +
            '카드 번호: ' + card.cardNumber +
            '</div>';

        document.getElementById('cardDataContainer').appendChild(cardDiv);
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>