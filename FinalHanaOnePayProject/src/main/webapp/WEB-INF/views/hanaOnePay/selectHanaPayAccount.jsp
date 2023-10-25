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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">
    <title>마이하나</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

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
            align-items: center;
            overflow: hidden;
            font-size: 14px;
            background-color: #FFFFFF;
            padding: 30px 0;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            margin-bottom: 40px;
            padding: 10px;
        }

        .anw span {
            display: block;
        }

        .anw::before {
            display: inline-block;
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

        .anw span:nth-child(2) {
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

        .agree-all-label {
            font-size: 1.5em;
            font-weight: bold;
        }

        .inner-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            border-radius: 10px;
        }

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
            align-items: center;
            justify-content: center;
            padding: 10px;
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
            text-decoration: none;
        }



        .addPayCard{
            margin: 0 auto;
            margin-top: 30px;
            padding-top: 10px;
            padding-bottom: 10px;
            width: 25%;
            align-items: center;
            justify-content: center;
            color: white;
            background-color: #00857E;
            border-radius: 5px;
            border: none;
            font-size: 17px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
        }

        .addPayCard:hover {
            background-color: #006D64;
        }

        .addPayCard a {
            color: inherit;
            text-decoration: none;
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
            height: 2px;
            background-color: #404B57;
            margin-top: 0px;
        }

        .inner-flex {
            display: flex;
            align-items: center;
            gap: 20px;
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
            <span class="fs-5 fw-semibold">마이하나</span>
        </a>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                    하나원페이
                </button>

                <div class="collapse show" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/hanaOnePay/selectHanaPayCard"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>
                        <li><a onclick="fetchAccountData()"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                               style="cursor: pointer;">간편결제 계좌</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    내 소비 분석
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/api/payments-by-month?month=09"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
                        <li><a href="#"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비성향테스트</a></li>
                    </ul>
                </div>
            </li>

            <li class="border-top my-3"></li>
        </ul>
    </div>
    <%--    사이드바끝--%>

    <%--간편결제 등록 카드 화면 조회--%>
    <div id="Accordion_wrap" class="AccAccordion">
        <h2>간편결제 등록 계좌 조회</h2>
        <br>
        <a href="/hanaOnePay/selectHanaPayAccount" class="select-org">하나은행</a>
        <a href="/hanaOnePay/selectPayAccount" class="select-org">다른기관</a>
        <hr class="custom-line">

        <div class="flex-container" style="display: flex; align-items: center;">
            <img src="/img/bank/bankName=hana.png">
            <h3 style="margin-left: 10px;">하나은행</h3>
        </div>

        <c:forEach var="accountInfos" items="${accountInfos}">
            <div class="hanaCardcontainer">
                <div class="anw" style="font-size: 16px">
                    <div class="inner-flex">
                        <div>
                            <h5>${accountInfos.accName} (${accountInfos.accNickName})</h5>
                            <p class="account-number">계좌번호: ${accountInfos.accNumber}</p>
                        </div>
                        <div style="margin-left: 45%;">
                            <p class="balance">잔액: ${accountInfos.accBalance}원</p>
                            <a href="/hanaOnePay/selectAccountTransList?accNumber=${accountInfos.accNumber}">
                                <button style="margin-top: 10px; color: white; background-color: rgb(102, 102, 102); border-radius: 5px; border: none; font-size: 20px; width: 100px;">조회</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
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
    function fetchAccountData() {
        fetch(`/api/account-data`, {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({"banks": ["woori", "shinhan", "KB"]})
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

    document.querySelector("button").addEventListener("click", function() {
        window.location.href = "/hanaOnePay/selectAccountTransList";
    });

    document.addEventListener("DOMContentLoaded", function() {
        const balances = document.querySelectorAll('.balance');
        balances.forEach(balance => {
            const amount = balance.innerText.match(/\d+/)[0];
            const formattedAmount = numberWithCommas(amount);
            balance.innerText = balance.innerText.replace(amount, formattedAmount);
        });

        // 계좌번호 포맷팅
        const accountNumbers = document.querySelectorAll('.account-number');
        accountNumbers.forEach(account => {
            let number = account.innerText.match(/\d+-\d+-\d+/)[0]; // 숫자와 하이픈만 가져오기
            let maskedNumber = maskAccountNumber(number);
            account.innerText = account.innerText.replace(number, maskedNumber);
        });
    });

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function maskAccountNumber(number) {
        // 5번째부터 13자리까지 *로 대체
        return number.slice(0, 4) + number.slice(4, 13).replace(/./g, '*') + number.slice(13);
    }


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
        var selectedPrefix = document.getElementById("phone-prefix").value;

        var enteredNumber = document.getElementById("phone-input").value;

        var recipientPhoneNumber = selectedPrefix + enteredNumber;

        const randomSixDigitNumber = generateRandomSixDigitNumber();

        console.log(recipientPhoneNumber)
        const requestData = {
            recipientPhoneNumber: recipientPhoneNumber,
            content: `[하나원페이] 하나원페이 사용을 위해 인증번호` + randomSixDigitNumber + `를 입력하세요.`, // 메시지 내용을 형식에 맞게 수정
            randomNumber: randomSixDigitNumber
        };

        // 서버로 POST 요청
        fetch('/user/sms', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
            })
            .catch(error => {
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
                // 모달 닫기
                $('#myModal').modal('hide');

                var cardItem = $('.anw');

                var cardNumberField = cardItem.find('.card-number-field');
                var hiddenCardNumber = cardItem.find('.hidden-card-number');
                var cardValidationField = cardItem.find('.card-validation-field');
                var hiddenCardValidation = cardItem.find('.hidden-card-validation');

                if (cardNumberField.is(':visible')) {
                    cardNumberField.hide();
                    hiddenCardNumber.show();
                    cardValidationField.hide();
                    hiddenCardValidation.show();
                } else {
                    cardNumberField.show();
                    hiddenCardNumber.hide();
                    cardValidationField.show();
                    hiddenCardValidation.hide();
                }

                alert("[하나원페이] 인증이 성공적으로 완료되었습니다.");
            } else {
                alert("[하나원페이] 인증에 실패했습니다. 다시 시도해주세요.");
            }
        };
    }

    function generateRandomSixDigitNumber() {
        // 100000에서 999999 사이의 랜덤한 정수 생성
        const randomNumber = Math.floor(100000 + Math.random() * 900000);

        // 생성된 숫자를 문자열로 변환하고 앞에 0을 추가
        const sixDigitNumber = randomNumber.toString().padStart(6, '0');

        return sixDigitNumber;
    }

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