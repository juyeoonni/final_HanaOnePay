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
            width: 200px;
            height: auto;
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

        .payAgree {
            font-size: 13px;
            color: #959595;
            margin-top: 3px;
        }

        .itemDesc {
            font-size: 22px;
            margin-left: 22px;
            margin-top: 25px;
        }

        .selectPayCard {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0.1, 0, 0, 0.1);
            padding: 20px;
            margin-left: 20px;
            margin-right: 20px;
            border-radius: 8px;
            background-color: #FFFFFF;
        }

        .payMsg {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .headerImg {
            width: 40px;
            height: 40px;
        }

        .headername {
            font-size: 25px;
            margin-left: 4px;
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .password-panel {
            background: #ffffff;
            border-radius: 10px;
            padding: 25px 15px;
            margin: 15px 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.05);
        }

        .password-dots {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .dot {
            width: 20px;
            height: 20px;
            background-color: #e6e6e6;
            border-radius: 50%;
        }

        .dot-filled {
            background-color: #00857E;
        }

        .keypad {
            display: grid;
            gap: 10px;
            grid-template-columns: repeat(3, 1fr);
        }

        .keypad-btn {
            padding: 10px 0;
            border: 2px solid #e6e6e6;
            background-color: #ffffff;
            font-size: 20px;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .keypad-btn:active {
            background-color: #f2f2f2;
        }

        .keypad-btn:disabled {
            visibility: hidden;
        }

        .keypad-btn-delete {
            background-color: #BCD9D3;
            color: #FFFFFF;
            border: none;
        }

        #confirmPayment {
            background-color: #00857E;
            border-color: #00857E;
        }

        #confirmPayment:hover {
            background-color: #BCD9D3;
            border-color: #BCD9D3;
        }

    </style>
</head>
<body>
<div class="card-header">
    <img class="headerImg" src="/img/hanaLogo.png">
    <div class="headername">하나원페이</div>
</div>
<div class="itemDesc">
    <div class="productName">${sessionScope.productName}</div>
    <br>
    <div class="productPrice" data-price="${sessionScope.productPrice}">${sessionScope.productPrice}원</div>


</div>

<br><br>
<div class="selectPayCard">
    <h2>결제 카드 선택</h2>
    <hr>
    <!-- 캐러셀 -->
    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <!-- cardInfos 캐러셀 인디케이터 추가 -->
            <c:forEach items="${cardInfos}" var="card" varStatus="status">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="<c:if test="${status.index == 0}">active</c:if>" aria-label="Slide ${status.index + 1}"></button>
            </c:forEach>

            <!-- allCards 캐러셀 인디케이터 추가 -->
            <c:forEach items="${allCards}" var="card" varStatus="status">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index + cardInfos.size()}" class="" aria-label="Slide ${status.index + cardInfos.size() + 1}"></button>
            </c:forEach>
        </div>

        <div class="carousel-inner">
            <!-- cardInfos를 순회하여 캐러셀 아이템 추가 -->
            <c:forEach items="${cardInfos}" var="card" varStatus="status">
                <div class="carousel-item <c:if test="${status.index == 0}">active</c:if>">
                    <img src="/img/${card.cardName}.png" class="d-block w-100" alt="${card.cardName}">
                    <div class="text-center mt-2">${card.cardName}</div>
                    <div class="text-center card--number" data-cardnumber="${card.cardNumber}">${card.cardNumber}</div>
                    <div class="text-center" style="display: none;">hana</div>
                    <hr>
                </div>
            </c:forEach>

            <!-- 기존 allCards를 순회하여 캐러셀 아이템 추가 -->
            <c:forEach items="${allCards}" var="card" varStatus="status">
                <div class="carousel-item">
                    <img src="/img/${card.cardName}.png" class="d-block w-100" alt="${card.cardName}">
                    <div class="text-center mt-2">${card.cardName}</div>
                    <div class="text-center card--number">${card.cardNumber}</div>
                    <div class="text-center" style="display: none;">${card.cardCode}</div>
                    <hr>
                </div>
            </c:forEach>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<br><br>

<div class="payMsg">
    <button type="button" class="btn-qr" id="payStart" data-bs-toggle="modal" data-bs-target="#paymentModal">결제하기
    </button>
    <div class="payAgree">결제조건 확인 및 개인정보 제공에 동의합니다.</div>
    <br><br><br>
</div>

<!-- 결제비밀번호 모달시작 -->
<div class="modal modal-fullscreen" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">결제 비밀번호 입력</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="password-panel text-center mb-3">
                    <div class="password-dots">
                        <div class="dot"></div>
                        <div class="dot"></div>
                        <div class="dot"></div>
                        <div class="dot"></div>
                        <div class="dot"></div>
                        <div class="dot"></div>
                    </div>
                    <input type="password" class="form-control" id="paymentPassword" hidden="hidden" readonly>
                </div>
                <div class="keypad">
                    <button class="btn btn-light keypad-btn" data-value="1">1</button>
                    <button class="btn btn-light keypad-btn" data-value="2">2</button>
                    <button class="btn btn-light keypad-btn" data-value="3">3</button>
                    <button class="btn btn-light keypad-btn" data-value="4">4</button>
                    <button class="btn btn-light keypad-btn" data-value="5">5</button>
                    <button class="btn btn-light keypad-btn" data-value="6">6</button>
                    <button class="btn btn-light keypad-btn" data-value="7">7</button>
                    <button class="btn btn-light keypad-btn" data-value="8">8</button>
                    <button class="btn btn-light keypad-btn" data-value="9">9</button>
                    <button class="btn btn-danger keypad-btn-delete">C</button>
                    <button class="btn btn-light keypad-btn" data-value="0">0</button>
                    <button class="btn btn-light keypad-btn-delete">⬅</button>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="confirmPayment">결제</button>
            </div>
        </div>
    </div>
</div>
<!-- 결제비밀번호 모달 끝 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>

    // 금액을 3자리마다 콤마로 구분하여 표시하는 함수
    function formatNumberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    $(document).ready(function () {
        // 가격을 data-price 속성에서 가져옴
        var originalPrice = $(".productPrice").data("price");

        // 금액을 3자리마다 콤마로 구분하여 표시
        var formattedPrice = formatNumberWithCommas(originalPrice);

        // 표시할 요소에 값 설정
        $(".productPrice").text(formattedPrice + "원");
    });


    $(document).ready(function () {

        var businessCode = sessionStorage.getItem('businessCode');
        console.log(businessCode); // businessCode 값을 로그에 출력

        var passwordInput = $('#paymentPassword');
        var dots = $('.dot');

        function updateDots() {
            var length = passwordInput.val().length;
            dots.removeClass('dot-filled');
            for (var i = 0; i < length; i++) {
                $(dots[i]).addClass('dot-filled');
            }
        }

        $('.keypad-btn').click(function () {
            var value = $(this).data('value');
            if (passwordInput.val().length < 6) { // 4자리 비밀번호 제한
                passwordInput.val(passwordInput.val() + value);
                updateDots();
            }
        });

        $('.keypad-btn-clear').click(function () {
            passwordInput.val('');
            updateDots();
        });

        $('.keypad-btn-delete').click(function () {
            passwordInput.val(passwordInput.val().slice(0, -1));
            updateDots();
        });

        $("#payStart").click(function () {
            var paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
            passwordInput.val('');
            dots.removeClass('dot-filled');
            paymentModal.show();
        });

        // 캐러셀에서 슬라이드가 변경될 때마다 이벤트 실행
        $('#carouselExampleIndicators').on('slid.bs.carousel', function (e) {
            var activeCardNumber = $(e.relatedTarget).find(".text-center").eq(1).text();
            var activeCardCode = $(e.relatedTarget).find(".text-center").eq(2).text();  // 활성화된 슬라이드의 카드 코드 가져오기
            console.log(activeCardNumber);
            console.log(activeCardCode);  // 콘솔에 활성화된 카드 코드 출력
            sessionStorage.setItem('activeCardNumber', activeCardNumber);
            sessionStorage.setItem('activeCardCode', activeCardCode);  // 세션에 활성화된 카드 코드 저장
        });


        $("#confirmPayment").click(function () {

            // 사용자가 입력한 비밀번호
            var enteredPassword = passwordInput.val();

            var sessionPassword = '<%= session.getAttribute("payPw") %>';

            var storedActiveCardNumber = sessionStorage.getItem('activeCardNumber');
            var storedActiveCardCode = sessionStorage.getItem('activeCardCode');
            var productName = "${sessionScope.productName}";
            var productPrice = "${sessionScope.productPrice}";
            var hanaMoney = "${sessionScope.hanaMoney}";
            sessionStorage.setItem("productPrice", productPrice);
            sessionStorage.setItem("hanaMoney", hanaMoney);
            var identityNumber = "${sessionScope.identityNumber}";

            // 값을 콘솔에 출력
            console.log("Stored Active Card Number:", storedActiveCardNumber);
            console.log("Stored Active Card Code:", storedActiveCardCode);
            console.log("Stored Product Name:", productName);
            console.log("Stored Product Price:", productPrice);
            console.log("Stored Identity Number:", identityNumber);

            var isHanaCard = storedActiveCardCode === "hana";
            var endpoint = isHanaCard ? "/hanaOnePay/card-payRequest" : "/api/payRequest";

            if (enteredPassword === sessionPassword) {
                console.log("간편결제 비밀번호 일치")
                console.log("결제할 카드 번호:", storedActiveCardNumber);
                console.log("결제할 카드 코드:", storedActiveCardCode);

                // AJAX로 결제 요청 전송
                var requestData = {
                    activeCard: storedActiveCardNumber,
                    activeCardCode: storedActiveCardCode,
                    productName: productName,
                    productPrice: productPrice,
                    identityNumber: identityNumber
                };

                // 타 카드사 결제 로직
                $.ajax({
                    type: "POST",
                    url: endpoint,
                    data: JSON.stringify(requestData),
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        console.log(response);
                        if (response === "Payment Approved") {
                            window.location.href = "/hanaOnePay/payRequestSuccess";
                        } else if (response === "Insufficient Credit Limit") {
                            window.location.href = "/hanaOnePay/payRequestFailforLimit";
                        } else if (response === "Insufficient Balance") {
                            window.location.href = "/hanaOnePay/payRequestFailforBalance";
                        } else {
                            alert('결제 실패: ' + response);
                            window.location.href = "/hanaOnePay/payRequestFail";
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("AJAX Error Status:", jqXHR.status);
                        console.log("Text Status:", textStatus);
                        console.log("Error Thrown:", errorThrown);
                    }

                });

            } else {
                alert("[하나원페이]\n비밀번호가 일치하지 않습니다. \n다시 입력해주세요.");
            }
        });

    });

</script>


</body>


</html>
