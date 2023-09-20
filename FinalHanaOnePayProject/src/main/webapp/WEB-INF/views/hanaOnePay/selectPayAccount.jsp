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


        .payCatdImg {
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

        .account {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
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
        <h2>간편결제 등록 계좌 조회</h2>
        <hr>


    </div>
<%--<%@ include file="/WEB-INF/views/comm/footer.jsp"%>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>


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
            bankDiv.innerHTML = '<h3>' +'<img src="/img/bank/'+ bankName +'.png">' +' '+ bankName + '</h3>' ;
            accountContainer.appendChild(bankDiv);

            // 각 은행의 계좌 정보 표시
            groupedAccounts[bankName].forEach(account => {
                const accountDiv = document.createElement('div');
                accountDiv.className = 'account';
                accountDiv.style.display = "flex"; // flex 설정
                accountDiv.style.justifyContent = "space-between"; // 왼쪽과 오른쪽으로 내용을 분리

                const accountInfoDiv = document.createElement('div'); // 계좌 정보를 담는 컨테이너
                accountInfoDiv.innerHTML =
                    '<h5>' + account.accName + ' (' + account.accNickName + ')</h5>' +
                    '<p>계좌 번호: ' + account.accNumber + '</p>';
                    //'<p>계좌 상태: ' + account.accStatus + '</p>';

                const balanceDiv = document.createElement('div'); // 잔액 정보를 담는 컨테이너
                balanceDiv.innerHTML = '<p>잔액: ' + account.accBalance + '</p>';
                balanceDiv.style.textAlign = "right"; // 잔액을 오른쪽으로 정렬
                balanceDiv.style.marginRight = "150px";

                // "조회" 버튼 추가
                const checkButton = document.createElement('button');
                checkButton.textContent = "조회";
                checkButton.style.marginTop = "10px"; // 버튼 위치 조절을 위한 마진 추가

                // 스타일 적용
                checkButton.style.color = "white";
                checkButton.style.backgroundColor = "#666666";
                checkButton.style.borderRadius = "5px";
                checkButton.style.border = "none";
                checkButton.style.fontSize = "20px";
                checkButton.style.width = "100px";


                balanceDiv.appendChild(checkButton); // balanceDiv 내에 버튼 추가

                accountDiv.appendChild(accountInfoDiv);
                accountDiv.appendChild(balanceDiv);

                accountContainer.appendChild(accountDiv);
            });
        }
    }




    // 페이지 로드 시 함수 실행
    window.onload = displayAccounts;


</script>

</body>
</html>