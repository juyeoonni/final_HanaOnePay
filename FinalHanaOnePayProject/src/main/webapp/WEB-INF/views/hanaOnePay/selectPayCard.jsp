<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-19
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
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
    <title>joinHanaOnePay</title>
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

        /*아코디언 css*/
        * {
            box-sizing: border-box;
        }

        .que:first-child {
            border-top: 1px solid black;
        }

        .que {
            position: relative;
            padding: 17px 0;
            cursor: pointer;
            font-size: 14px;
            border-bottom: 1px solid #dddddd;

        }

        .que::before {
            display: inline-block;
            /*content: 'Q';*/
            font-size: 14px;
            color: #006633;
            margin: 0 5px;
        }

        .que.on > span {
            font-weight: bold;
            color: #006633;
        }

        .anw {
            display: flex; /* flex를 사용하여 아이템들을 가로로 나열합니다 */
            align-items: center; /* 아이템들을 수직 중앙에 배치합니다 */
            overflow: hidden;
            font-size: 14px;
            background-color: #F5F5F5;
            padding: 30px 0;
            align-items: center; /* 아이템을 수직으로 중앙에 배치 */
            gap: 10px; /* 아이템 간의 간격 설정 (브라우저 지원 여부 확인 필요) */
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }

        .anw span {
            display: block;
        }


        .anw::before {
            display: inline-block;
            /*content: 'A';*/
            font-size: 14px;
            font-weight: bold;
            color: #666;
            margin: 0 5px;
        }

        .arrow-wrap {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translate(0, -50%);
        }

        .que .arrow-top {
            display: none;
        }

        .que .arrow-bottom {
            display: block;
        }

        .que.on .arrow-bottom {
            display: none;
        }

        .que.on .arrow-top {
            display: block;
        }

        .AccAccordion {
            margin-left: 30px;
            width: 65%;
            height: 400px;
        }


        .payCardImg {
            margin-left: 20px;
            margin-right: 20px;
            order: -1;
            width: 150px;
            height: 100px;
        }

        .anw span:nth-child(2) { /* 첫 번째 span (카드명)을 대상으로 설정 */
            display: block;
        }

        .cardCode {
            font-size: 20px;
        }

        .outer-box {
            border: 2px solid #E2E6E9;
            padding: 20px;
            margin: 20px;
            width: 420px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 20px;
        }

        /* 모두 동의 부분 */
        .agree-all-label {
            font-size: 1.5em;
            font-weight: bold;
        }

        /* 안의 내용들이 담길 상자 */
        .inner-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            border-radius: 10px;
        }

        /* 선택 불가능한 항목에 대한 스타일 */
        .select_disable {
            color: grey;
        }

        .close {
            border: none;
            background-color: white;
        }

        .plusBtn{
            color: white;
            background-color:#00857E ;
            border-radius: 5px;
            border: none;
        }

        .cancleButton{
            color: white;
            background-color:#666666;
            border-radius: 5px;
            border: none;
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
            margin-top: 15px;
            display: flex;
            align-items: center; /* 수직 중앙 정렬을 위해 추가 */
            justify-content: center; /* 수평 중앙 정렬 */
            padding: 10px; /* 필요에 따라 패딩을 조절 */
        }

        .cardInfo{
            font-size: 16px;
        }

        .show-card-number-btn{
            margin-left: 50px;
            color: white;
            background-color:#666666 ;
            border-radius: 5px;
            border: none;
            font-size: 17px;
        }

        .show-card-benefit {
            margin-left: 50px;
            color: white;
            background-color:#666666 ;
            border-radius: 5px;
            border: none;
            font-size: 17px;
            padding: 2.5px;
            text-decoration: none; /* 기본 링크 밑줄 제거 */
        }



        .addPayCard{
            margin: 0 auto;
            margin-top: 30px;
            padding-top: 10px;
            padding-bottom: 10px;
            width: 25%;
            align-items: center; /* 수직 중앙 정렬을 위해 추가 */
            justify-content: center; /* 수평 중앙 정렬 */
            color: white;
            background-color: #00857E;
            border-radius: 5px;
            border: none;
            font-size: 17px;
            cursor: pointer; /* 커서 모양 변경 (마우스 호버 시 손가락 모양으로 변경) */
            text-decoration: none; /* 밑줄 제거 */
            display: flex; /* 요소를 플렉스 컨테이너로 설정하여 수직, 수평 정렬을 활성화합니다. */
        }

        /* 버튼 호버 시 스타일 변경 */
        .addPayCard:hover {
            background-color: #006D64; /* 호버 시 배경색 변경 */
        }

        /* 버튼 내부 링크 텍스트 숨김 */
        .addPayCard a {
            color: inherit; /* 링크 텍스트 색상을 부모 요소로 상속합니다. */
            text-decoration: none; /* 링크 텍스트의 밑줄 제거 */
        }

        .select-org {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            background-color: #404B57;
            border: none;
            border-radius: 5px 5px 0 0;
            text-decoration: none;
            font-size: 16px;
            margin-right: 10px;
            transition: background-color 0.3s;
        }

        .select-org:hover {
            background-color: #e1e2e6;
            color: #77727e;
        }

        .custom-line {
            border: none;
            height: 2px; /* 선의 높이 */
            background-color: #404B57; /* 선의 색상 */
            margin-top: 0px; /* 원하는 대로 상단 여백 조정 */
        }


    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<%--사이드바 시작--%>
<div class="flex-container">
    <div class="flex-shrink-0 p-3" style="width: 280px; margin-left: 90px;">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
            <svg class="bi pe-none me-2" width="30" height="24">
                <use xlink:href="#bootstrap"/>
            </svg>
            <span class="fs-5 fw-semibold">마이하나</span>
        </a>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                    하나원페이
                </button>
                <div class="collapse show" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
<%--                        <li><a href="/api/linkedAccount"--%>
<%--                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">연동카드조회</a></li>--%>
    <li><a href="/hanaOnePay/selectPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>
    <li><a href="/hanaOnePay/selectPayAccount" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 계좌</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    거래내역조회
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">월사용금액
                            조회</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">명세서 조회</a>
                        </li>
                        <li><a href="#"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>
                        <li><a href="#"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                    내 소비분석
                </button>
                <div class="collapse" id="orders-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">New</a>
                        </li>
                        <li><a href="#"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">Processed</a></li>
                        <li><a href="#"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">Shipped</a></li>
                        <li><a href="#"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">Returned</a></li>
                    </ul>
                </div>
            </li>
            <li class="border-top my-3"></li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                    Account
                </button>
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
    <%--사이드바 끝--%>

    <%--간편결제 등록 카드 화면 조회--%>
    <div id="Accordion_wrap" class="AccAccordion">
        <h2>간편결제 등록 카드 조회</h2>

        <br>
        <a href="/hanaOnePay/selectHanaPayCard" class="select-org">하나카드</a>
        <a href="/hanaOnePay/selectPayCard" class="select-org">다른기관</a>
        <hr class="custom-line">

        <c:forEach items="${allCards}" var="card">

            <div class="que">
                 <span class="cardCode">
            <c:choose>
                <c:when test="${card.cardCode == 'shinhan'}">신한</c:when>
                <c:when test="${card.cardCode == 'KB'}">KB국민</c:when>
                <c:when test="${card.cardCode == 'woori'}">우리</c:when>
                <c:otherwise>${card.cardCode}</c:otherwise>
            </c:choose>
        </span>
                <div class="arrow-wrap">
                    <span class="arrow-top">↑</span>
                    <span class="arrow-bottom">↓</span>
                </div>
            </div>

            <div class="anw">
                <img src="/img/${card.cardName}.png" class="d-block payCardImg" alt="${card.cardName}">
                <div class="cardInfo">
                    <span>${card.cardName}</span>

                    <span class="hidden-card-number">
                         [본인] ${card.cardNumber.substring(0, 5)} **** - **** ${card.cardNumber.substring(card.cardNumber.length() - 5)}
                    </span>
                    <span class="card-number-field" style="display: none">
                        [본인] ${card.cardNumber}
                    </span>
                </div>

                <button class="show-card-number-btn">
                    카드번호 보기
                </button>
                <a class="show-card-number-btn" href="/hanaOnePay/selectCardTransList?cardCode=${card.cardCode}&cardNumber=${card.cardNumber}&cardName=${card.cardName}">내역조회</a>




            </div>
        </c:forEach>

        <button class="addPayCard" >
            <a href="/hanaOnePay/addPayCard">페이카드 등록</a>
        </button>

    </div>


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="card-header">
                    <img class="headerImg" src="/img/hanaLogo.png">
                    <div class="headername">하나원페이</div>
                </div>
                <hr>
                <form id="auth-form">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>통신사</option>
                                    <option value="1">SKT</option>
                                    <option value="2">KT</option>
                                    <option value="3">LG U+</option>
                                </select>
                            </div>
                            <div class="col">
                                <select class="form-select" aria-label="Default select example" id="phone-prefix">
                                    <option selected>010</option>
                                    <option value="1">010</option>
                                    <option value="2">011</option>
                                    <option value="3">016</option>
                                </select>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="'-'제외하고 입력" aria-label="phone-number"
                                       id="phone-input">
                            </div>
                        </div>

                        <div class="outer-box">
                            <label class="agree-all-label" for="agree_all">
                                <input type="checkbox" name="agree_all" id="agree_all">
                                <span><strong>전체 동의</strong></span>
                            </label>
                            <div class="inner-box">
                                <label for="agree">
                                    <input type="checkbox" name="agree" value="1">
                                    <span>개인정보 제공 및 이용</span>
                                </label>
                                <br>
                                <label for="agree">
                                    <input type="checkbox" name="agree" value="2">
                                    <span>고유식별 정보처리</span>
                                </label>
                                <br>
                                <label for="agree">
                                    <input type="checkbox" name="agree" value="3">
                                    <span>통신사 이용약관</span>
                                </label>

                            </div>
                        </div>

                        <div class="col">
                            <input type="text" class="form-control" placeholder="인증번호 6자리 입력" aria-label="auth-number">
                            <br>
                            <input class="cancleButton" onclick="sendSmsRequest()" type="button" value="인증번호 발송">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="Btn" class="cancleButton" data-bs-dismiss="modal">취소</button>
                        <button class="plusBtn" type="button" class="btn" onclick="sendAuthNumber()">인증 확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<%@ include file="/WEB-INF/views/comm/footer.jsp"%>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>
    $(".que").click(function () {
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });

    // 카드번호/유효기간 보기 버튼누르면 모달 쇼
    $('.show-card-number-btn').click(function () {
        $('#myModal').modal('show');
    });

    // 모달 내 인증요청 보내는 함수
    function sendSmsRequest() {
        // select 요소의 선택된 옵션 값을 가져옵니다.
        var selectedPrefix = document.getElementById("phone-prefix").value;

        // input 요소의 값을 가져옵니다.
        var enteredNumber = document.getElementById("phone-input").value;

        // 선택한 값과 입력한 값을 합칩니다.
        var recipientPhoneNumber = selectedPrefix + enteredNumber;

        const randomSixDigitNumber = generateRandomSixDigitNumber();

        console.log(recipientPhoneNumber)
        const requestData = {
            recipientPhoneNumber: recipientPhoneNumber,
            content: `[sms테스트] 인증번호 :` + randomSixDigitNumber, // 메시지 내용을 형식에 맞게 수정
            randomNumber: randomSixDigitNumber
        };

        // 서버로 POST 요청을 보냅니다.
        fetch('/user/sms', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                // 서버에서 받은 응답을 처리합니다.
                console.log(data);
                // 여기에서 원하는 동작을 수행할 수 있습니다.
            })
            .catch(error => {
                // 오류가 발생한 경우 처리합니다.
                console.error('Error sending SMS request:', error);
                alert('인증번호 전송 중 오류가 발생했습니다.');
            });
    }

    function sendAuthNumber() {
        // 선택한 인증번호 값을 가져오기
        var authNumber = $('input[aria-label="auth-number"]').val();
        console.log(authNumber);

        // AJAX 요청 설정
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/user/auth", true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

        // 요청 본문 데이터 설정
        var data = JSON.stringify({ authNumber: authNumber });

        // AJAX 요청 보내기
        xhr.send(data);

        // AJAX 요청이 완료되면 처리할 코드
        xhr.onload = function () {
            if (xhr.status === 200 && xhr.responseText === 'Success') {
                // 모달을 닫습니다.
                $('#myModal').modal('hide');

                // 현재 클릭한 버튼을 포함하는 카드 아이템을 찾습니다.
                var cardItem = $('.anw');

                // 카드 번호와 유효기간을 나타내는 div 요소 및 숨겨진 div 요소를 찾습니다.
                var cardNumberField = cardItem.find('.card-number-field');
                var hiddenCardNumber = cardItem.find('.hidden-card-number');
                var cardValidationField = cardItem.find('.card-validation-field');
                var hiddenCardValidation = cardItem.find('.hidden-card-validation');

                if (cardNumberField.is(':visible')) {
                    // 카드 번호와 유효기간을 가려줍니다.
                    cardNumberField.hide();
                    hiddenCardNumber.show();
                    cardValidationField.hide();
                    hiddenCardValidation.show();
                } else {
                    // 카드 번호와 유효기간을 보여줍니다.
                    cardNumberField.show();
                    hiddenCardNumber.hide();
                    cardValidationField.show();
                    hiddenCardValidation.hide();
                }

                // 요청이 성공적으로 처리되었을 때 수행할 작업
                alert("인증이 성공적으로 완료되었습니다.");
            } else {
                // 요청이 실패했을 때 수행할 작업
                alert("인증에 실패했습니다. 다시 시도해주세요.");
            }
        };
    }

    function generateRandomSixDigitNumber() {
        // 100000에서 999999 사이의 랜덤한 정수를 생성합니다.
        const randomNumber = Math.floor(100000 + Math.random() * 900000);

        // 생성된 숫자를 문자열로 변환하고 앞에 0을 추가합니다.
        const sixDigitNumber = randomNumber.toString().padStart(6, '0');

        return sixDigitNumber;
    }
    // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for(let i = 0; i < agreeChk.length; i++){
            agreeChk[i].checked = e.target.checked;
        }
    });

</script>

</body>
</html>