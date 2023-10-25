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
            font-size: 14px;
            color: #006633;
            margin: 0 5px;
        }

        .que.on > span {
            font-weight: bold;
            color: #006633;
        }

        .anw {
            display: flex;
            align-items: center;
            overflow: hidden;
            font-size: 14px;
            background-color: #F5F5F5;
            padding: 30px 0;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
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


        .payCatdImg {
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
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

        .plusBtn {
            color: white;
            background-color: #00857E;
            border-radius: 5px;
            border: none;
        }

        .cancleButton {
            color: white;
            background-color: #666666;
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

        .cardInfo {
            font-size: 16px;
        }

        .show-card-number-btn {
            margin-left: 50px;
            color: white;
            background-color: #666666;
            border-radius: 5px;
            border: none;
            font-size: 17px;
        }

        .addPayCard {
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

        .account {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
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
    <div id="Accordion_wrap" class="AccAccordion">
        <h2>간편결제 등록 계좌 조회</h2>
        <br>
        <a href="/hanaOnePay/selectHanaPayAccount" class="select-org">하나은행</a>
        <a href="/hanaOnePay/selectPayAccount" class="select-org">다른기관</a>
        <hr class="custom-line">
    </div>
</div>


<%--<%@ include file="/WEB-INF/views/comm/footer.jsp"%>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
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

    function getBankNameByAccount(accNumber) {
        if (accNumber.includes('1002')) {
            return '우리은행';
        } else if (accNumber.includes('110')) {
            return '신한은행';
        } else if (accNumber.includes('04')) {
            return '국민은행';
        } else {
            return '기타';
        }
    }

    const accountData = JSON.parse(sessionStorage.getItem('accountData'));

    function groupAccountsByBank() {
        const grouped = {};
        accountData.forEach(account => {
            const bankName = getBankNameByAccount(account.accNumber);
            if (!grouped[bankName]) {
                grouped[bankName] = [];
            }
            grouped[bankName].push(account);
        });
        return grouped;
    }

    function displayAccounts() {
        const accountContainer = document.getElementById('Accordion_wrap');
        const groupedAccounts = groupAccountsByBank();

        for (const bankName in groupedAccounts) {

            // 은행 이름 표시
            const bankDiv = document.createElement('div');
            bankDiv.className = 'bank';
            bankDiv.innerHTML = '<h3>' + '<img src="/img/bank/' + bankName + '.png">' + ' ' + bankName + '</h3>';
            accountContainer.appendChild(bankDiv);

            // 각 은행의 계좌 정보 표시
            groupedAccounts[bankName].forEach(account => {
                const accountDiv = document.createElement('div');
                accountDiv.className = 'account';
                accountDiv.style.display = "flex";
                accountDiv.style.justifyContent = "space-between";

                const accountInfoDiv = document.createElement('div');

                // 계좌 번호에서 마지막 6자리를 '*'로 대체한 문자열 생성
                const accountNumber = account.accNumber;
                const maskedAccountNumber = '******' + accountNumber.slice(-6);

                accountInfoDiv.innerHTML =
                    '<h5>' + account.accName + ' (' + account.accNickName + ')</h5>' +
                    '<p>계좌 번호: ' + maskedAccountNumber + '</p>';

                const balanceDiv = document.createElement('div');

                const formattedBalance = new Intl.NumberFormat().format(account.accBalance);

                balanceDiv.innerHTML = '<p>잔액: ' + formattedBalance + '</p>';
                balanceDiv.style.textAlign = "right";
                balanceDiv.style.marginRight = "150px";


                // "조회" 버튼 추가
                const checkButton = document.createElement('button');
                checkButton.textContent = "조회";
                checkButton.style.marginTop = "10px";

                // 버튼 클릭시 연결될 URL 설정
                checkButton.addEventListener("click", function () {
                    const accNumber = account.accNumber;
                    window.location.href = "/hanaOnePay/selectAccountTransList?accNumber=" + accNumber;
                });

                checkButton.style.color = "white";
                checkButton.style.backgroundColor = "#666666";
                checkButton.style.borderRadius = "5px";
                checkButton.style.border = "none";
                checkButton.style.fontSize = "20px";
                checkButton.style.width = "100px";


                balanceDiv.appendChild(checkButton);
                accountDiv.appendChild(accountInfoDiv);
                accountDiv.appendChild(balanceDiv);
                accountContainer.appendChild(accountDiv);
            });
        }
    }

    window.onload = displayAccounts;
</script>

</body>
</html>