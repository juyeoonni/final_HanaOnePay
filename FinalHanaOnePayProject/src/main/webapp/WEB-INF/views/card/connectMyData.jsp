<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-07
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>joinHanaOnePay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .card-info:hover {
            background-color: rgba(224, 221, 221, 0.41);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            transform: scale(1.03);
            transition: all 0.2s ease;
        }

        .left-aligned-content {
            text-align: left;
            width: 100%;
        }

        .page-center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .content-container {
            margin-top: 500px;
            width: 600px;
            text-align: left;
        }

        .card-info.checked {
            background-color: rgba(224, 221, 221, 0.41);
        }

        form {
            width: 390px;
            margin: 50px auto;
            background: #fff;
            padding: 35px 25px;
            text-align: center;
            box-shadow: 0px 5px 5px -0px rgba(0, 0, 0, 0.3);
            border-radius: 5px;
            border: 4px solid #00857E;
            margin-top: -10px;
        }

        input[type="password"] {
            padding: 0 40px;
            border-radius: 5px;
            width: 350px;
            margin: auto;
            border: 1px solid rgb(228, 220, 220);
            outline: none;
            font-size: 60px;
            color: transparent;
            text-shadow: 0 0 0 rgb(71, 71, 71);
            text-align: center;
        }

        input:focus {
            outline: none;
        }

        .pinButton {
            border: none;
            background: none;
            font-size: 1.5em;
            border-radius: 50%;
            height: 60px;
            font-weight: 550;
            width: 60px;
            color: transparent;
            text-shadow: 0 0 0 rgb(102, 101, 101);
            margin: 7px 20px;
        }

        .clear,
        .enter {
            font-size: 1em !important;
        }

        .pinButton:hover {
            box-shadow: #00857E 1 1 2px 2px;
        }

        .pinButton:active {
            background: #00857E;
            color: #fff;
        }

        .clear:hover {
            box-shadow: #ff3c41 1 1 1px 1px;
        }

        .clear:active {
            background: #ff3c41;
            color: #fff;
        }

        .enter:hover {
            box-shadow: #00857E 1 1 1px 1px;
        }

        .enter:active {
            background: #00857E;
            color: #fff;
        }

        .modal-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #pinpad {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .pinButton.calc {
            transition: transform 0.3s ease;
        }

        .pinButton.calc:hover {
            transform: scale(1.3);
        }

        .submitBtn {
            width: 51.85px;
            height: 37.6px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #00857E;
            border: none;
            color: #FFFFFF;
        }

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
            flex: 1; /* 나머지 공간을 채우도록 설정 */
        }

        .mypageMain {
            display: flex;
            flex-direction: column;
            margin-left: 30px;
        }

        #custom-register-button {
            background-color: #00857E !important; /* 배경색 */
            color: #fff !important; /* 텍스트 색상 */
            border: none !important; /* 테두리 없음 */
            padding: 10px 20px !important; /* 내부 여백 */
            border-radius: 5px !important; /* 테두리 둥글기 */
            cursor: pointer !important; /* 커서 모양을 손가락으로 변경 */
            margin-top: 10px;
            margin-left: 295px;
            width: 300px;
        }

        #custom-register-button:hover {
            background-color: #015550 !important; /* 호버 시 배경색 변경 */
        }

        .flex-shrink-0 {
            width: 280px;
            margin-left: 90px;
            transition: all 0.3s ease; /* 부드러운 이동 효과 */
        }
    </style>

</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
<%--사이드바시작--%>
<div class="flex-shrink-0 p-3" style="width: 280px; margin-left: 90px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
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
                           class="link-body-emphasis d-inline-flex text-decoration-none rounded">마이하나원페이 연동</a></li>
                    <li><a onclick="fetchAccountData()"
                           class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                           style="cursor: pointer;">내 카드 불러오기</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">

            <div class="collapse" id="dashboard-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/api/payments-by-month?month=09"
                           class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 지출 조회</a></li>
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
                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">New...</a>
                    </li>
                    <li><a href="#"
                           class="link-body-emphasis d-inline-flex text-decoration-none rounded">Profile</a></li>
                    <li><a href="#"
                           class="link-body-emphasis d-inline-flex text-decoration-none rounded">Settings</a></li>
                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Sign
                        out</a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>

<div class="page-center">

    <div class="content-container" style="margin-top: -150px;">
        <div style="margin-left: 260px">
            <div style="text-align: center; font-size:18px; color: #00857E;">마이카드</div>
            <h1 style="text-align: center; font-size: 2em;">마이하나원페이</h1>
        </div>
        <div class="d-flex justify-content-start align-items-center mb-2" style="margin-top: 50px;">
            <h3 class="mb-0 me-3">내 카드 불러오기</h3>

            <!-- 드롭다운 시작 -->
            <div class="dropdown" style="display: inline-block;">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
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

        <div id="selectedCardCount" class="mb-2">
            불러온 카드 개수: <span id="count">0</span> 개
        </div>
        <br>
        <!-- 데이터를 표시할 컨테이너 -->
        <div id="cardDataContainer">

        </div>

        <form id="cardForm" action="/hanaOnePay/payCardList" method="post" style="display: none;">
            <input type="hidden" name="selectedCards" id="selectedCardsInput">
        </form>


        <!-- Modal 추가 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <img src="/img/hanaLogo.png" alt="하나원페이 로고"
                             style="margin-right: 10px; width: 45px; height: 45px;">
                        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">하나원페이</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        카드 등록을 위해 결제비밀번호를 입력해주세요
                    </div>

                    <h4 class="modal-body">결제 비밀번호 6자리 입력
                        <h4>
                            <div id="pinpad">
                                <form>
                                    <input type="password" id="password"/></br>
                                    <input type="button" value="1" id="1" class="pinButton calc"/>
                                    <input type="button" value="2" id="2" class="pinButton calc"/>
                                    <input type="button" value="3" id="3" class="pinButton calc"/><br>
                                    <input type="button" value="4" id="4" class="pinButton calc"/>
                                    <input type="button" value="5" id="5" class="pinButton calc"/>
                                    <input type="button" value="6" id="6" class="pinButton calc"/><br>
                                    <input type="button" value="7" id="7" class="pinButton calc"/>
                                    <input type="button" value="8" id="8" class="pinButton calc"/>
                                    <input type="button" value="9" id="9" class="pinButton calc"/><br>
                                    <input type="button" value="삭제" id="clear" class="pinButton clear"/>
                                    <input type="button" value="0" id="0 " class="pinButton calc"/>
                                    <input type="button" value="확인" id="enter" class="pinButton enter"/>
                                </form>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="submitBtn" id="confirmRegister">등록</button>
                            </div>
                        </h4>
                    </h4>
                </div>
                </div>

            </div>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="/path/to/cdn/jquery.slim.min.js"></script>

<script>
    $(document).ready(function () {
        try {
            const selectCardCompanyFromSession = JSON.parse(sessionStorage.getItem('selectedCards') || "[]");
            const cardDataFromSession = JSON.parse(sessionStorage.getItem('cardData') || "[]");

            console.log(cardDataFromSession);

            function maskCardNumber(cardNumber) {
                // 카드 번호를 '-'로 분리
                const parts = cardNumber.split('-');

                // 중간 2개의 부분을 '*'로 대체
                if (parts.length === 4) {
                    const maskedParts = [
                        parts[0],
                        '****',
                        '****',
                        parts[3].substr(-4) // 마지막 4자리는 그대로 유지
                    ];
                    return maskedParts.join('-');
                }

                return cardNumber; // 형식이 맞지 않는 경우 그대로 반환
            }

            function displayCards(cards) {
                $('#count').text(cards.length);
                $('#cardDataContainer').empty();

                cards.forEach((cardData) => {
                    const cardDiv = document.createElement("div");
                    cardDiv.classList.add("card-info");

                    cardDiv.style.border = "1px solid #ccc";
                    cardDiv.style.width = "900px";
                    cardDiv.style.padding = "10px";
                    cardDiv.style.marginBottom = "10px";
                    cardDiv.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.1)";
                    cardDiv.style.display = "flex";
                    cardDiv.style.flexDirection = "row";
                    cardDiv.style.alignItems = "center";
                    cardDiv.style.borderRadius = "10px";

                    const imageUrl = "/img/" + cardData.cardName + ".png";
                    let cardCompany = cardData.cardCode;

                    let cardLogoUrl;
                    if (cardData.cardCode === "shinhan") {
                        cardCompany = "신한카드";
                        backgroundColor = "#3253BC";
                        cardLogoUrl = "/img/bank/bankName=shinhan.png";
                    } else if (cardData.cardCode === "KB") {
                        cardCompany = "KB국민카드";
                        backgroundColor = "#7C7268";
                        cardLogoUrl = "/img/bank/bankName=KB.png";
                    } else if (cardData.cardCode === "woori") {
                        cardCompany = "우리카드";
                        backgroundColor = "#0182cd";
                        cardLogoUrl = "/img/bank/bankName=woori.png";
                    } else if (cardData.cardCode === "hana") {
                        cardCompany = "하나카드";
                        backgroundColor = "#00857E";
                        cardLogoUrl = "/img/hana_logo.png";
                    }

                    cardDiv.innerHTML =
                        '<img src="' + imageUrl + '" style="width: 200px; height: 130px; margin-right: 10px;">' +
                        '<div style="flex: 1;">' +
                        '<div class="card-code" style="text-align:center; width: 120px; height:34px; color: white; background-color: ' + backgroundColor + '; border-radius: 5px; padding: 5px; display: flex; align-items: center;">' +
                        '<img src="' + cardLogoUrl + '" style="width: 20px; height: 20px; margin-right: 5px;">' + // 여기에 로고 이미지 추가
                        cardCompany +
                        '</div>' +
                        cardData.cardName + '<br>' +
                        maskCardNumber(cardData.cardNumber) +
                        '</div>' +
                        '<input type="checkbox" style="margin-left: 20px;">';

                    cardDataContainer.appendChild(cardDiv);
                });

                // "등록" 버튼을 페이지에 추가
                const registerButton = document.createElement("button");
                registerButton.textContent = "하나원페이 등록";
                registerButton.id = "custom-register-button";
                registerButton.addEventListener("click", registerSelectedCards);

                // "등록" 버튼을 페이지에 추가
                const buttonContainer = document.createElement("div");
                buttonContainer.appendChild(registerButton);
                cardDataContainer.appendChild(buttonContainer);
            }

            $('.dropdown-item').click(function () {
                const filterType = $(this).text();

                if (filterType === "전체카드조회") {
                    displayCards(cardDataFromSession);
                } else if (filterType === "하나카드조회") {
                    const hanaCards = cardDataFromSession.filter(card => card.cardCode === "hana");
                    displayCards(hanaCards);
                } else if (filterType === "다른카드조회") {
                    const otherCards = cardDataFromSession.filter(card => card.cardCode !== "hana");
                    displayCards(otherCards);
                }
            });

            // 초기 로드 시 전체 카드 목록 표시
            displayCards(cardDataFromSession);

            function registerSelectedCards() {
                // 모달 띄우기
                $('#exampleModal').modal('show');
            }

            // 모달의 "등록" 버튼 클릭 이벤트
            $('#confirmRegister').on('click', function () {
                const selectedCards = [];
                const cardDivs = document.querySelectorAll('.card-info');

                cardDivs.forEach((cardDiv, index) => {
                    const checkbox = cardDiv.querySelector('input[type="checkbox"]');
                    if (checkbox.checked) {
                        selectedCards.push(cardDataFromSession[index]);
                    }
                });
                console.log("Selected Cards:", selectedCards);

                document.getElementById('selectedCardsInput').value = JSON.stringify(selectedCards);
                document.getElementById('cardForm').submit();
            });


        } catch (error) {
            console.error("Error parsing JSON:", error);
        }
    });

    $(document).on('change', '.card-info input[type="checkbox"]', function () {
        const cardDiv = $(this).closest('.card-info');
        if (this.checked) {
            cardDiv.addClass('checked');
        } else {
            cardDiv.removeClass('checked');
        }
    });

    $(document).ready(function () {

        const input_value = $("#password");

        $("#password").keypress(function () {
            return false;
        });

        $(".calc").click(function () {
            let value = $(this).val();
            field(value);
        });

        function field(value) {
            input_value.val(input_value.val() + value);
        }

        $("#clear").click(function () {
            input_value.val("");
        });

        $("#enter").click(function () {
            alert("인증되었습니다.");
        });

    });

    document.addEventListener('DOMContentLoaded', function () {
        var enterButton = document.getElementById('enter');

        enterButton.addEventListener('click', function () {
            document.getElementById('paymentForm').submit();
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
