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
            background-color: #CFEBE5;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
            transition: all 0.3s ease;
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
            width: 600px; /* 이 값은 원하는 대로 조절할 수 있습니다. */
            text-align: left; /* 이를 통해 "내 카드 불러오기"와 "연동된 카드 개수"를 왼쪽에 정렬합니다. */
        }

        .card-info.checked {
            background-color: #CFEBE5;
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

        .pinButton {
            /*margin: 5px;*/
        }

        .pinButton.calc {
            transition: transform 0.3s ease;  /* smooth transition effect */
        }

        .pinButton.calc:hover {
            transform: scale(1.3);  /* enlarges the button by 10% when hovered */
        }


    </style>

</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<div class="page-center">
    <div class="content-container">

        <div class="d-flex justify-content-start align-items-center mb-2">
            <h3 class="mb-0 me-3">내 카드 불러오기</h3>

            <!-- 드롭다운 시작 -->
            <div class="dropdown" style="display: inline-block;">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
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
            연동된 카드 개수: <span id="count">0</span> 개
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">카드 등록</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        카드 등록을 위해 결제비밀번호를 입력해주세요
                    </div>

                    <h4 class="modal-body">결제 비밀번호 6자리 입력<h4>
                        <div id="pinpad">
                            <form >
                                <input type="password" id="password" /></br>
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
                            <button type="button" class="btn btn-primary" id="confirmRegister">등록</button>
                        </div>
                    </h4>
                    </h4>
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
                                    cardDiv.style.width = "600px";
                                    cardDiv.style.padding = "10px";
                                    cardDiv.style.marginBottom = "10px";
                                    cardDiv.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.1)";
                                    cardDiv.style.display = "flex";
                                    cardDiv.style.flexDirection = "row";
                                    cardDiv.style.alignItems = "center";
                                    cardDiv.style.borderRadius = "10px";

                                    const imageUrl = "/img/" + cardData.cardName + ".png";
                                    let cardCompany = cardData.cardCode;

                                    // cardCode에 따라 카드 회사 이름 변경
                                    if (cardData.cardCode === "shinhan") {
                                        cardCompany = "신한카드";
                                    } else if (cardData.cardCode === "KB") {
                                        cardCompany = "KB국민카드";
                                    } else if (cardData.cardCode === "woori") {
                                        cardCompany = "우리카드";
                                    } else if (cardData.cardCode === "hana") {
                                        cardCompany = "하나카드";
                                    }
                                    cardDiv.innerHTML =
                                        '<img src="' + imageUrl + '" style="width: 200px; height: 130px; margin-right: 10px;">' +
                                        '<div style="flex: 1;">' +
                                        '<div class="card-code" style="width: 100px; color: white; background-color: #BCD9D3; border-radius: 5px; padding: 5px;">' +
                                        cardCompany +
                                        '</div>' +
                                        '카드 이름: ' + cardData.cardName + '<br>' +
                                        '카드 번호: ' + maskCardNumber(cardData.cardNumber) + // 카드 번호 마스킹 적용
                                        '</div>' +
                                        '<input type="checkbox" style="margin-left: 20px;">';

                                    cardDataContainer.appendChild(cardDiv);
                                });

                                // "등록" 버튼을 페이지에 추가
                                const registerButton = document.createElement("button");
                                registerButton.textContent = "하나원페이 등록";
                                registerButton.className = "btn btn-primary";
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
                            $('#confirmRegister').on('click', function() {
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

                    $(document).on('change', '.card-info input[type="checkbox"]', function() {
                        const cardDiv = $(this).closest('.card-info');
                        if (this.checked) {
                            cardDiv.addClass('checked');
                        } else {
                            cardDiv.removeClass('checked');
                        }
                    });

                    $(document).ready(function () {

                        const input_value = $("#password");

                        //disable input from typing
                        $("#password").keypress(function () {
                            return false;
                        });

                        //add password
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

                    document.addEventListener('DOMContentLoaded', function() {
                        var enterButton = document.getElementById('enter');

                        enterButton.addEventListener('click', function() {
                            // 폼 제출
                            document.getElementById('paymentForm').submit();
                        });
                    });


                </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
                <%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</body>
</html>
