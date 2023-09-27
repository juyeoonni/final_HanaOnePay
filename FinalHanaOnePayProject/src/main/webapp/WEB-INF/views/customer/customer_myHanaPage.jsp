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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">
    <title>마이하나</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

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

        .dropdown-toggle { outline: 0; }

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
            flex: 1;  /* 나머지 공간을 채우도록 설정 */
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
            text-align: center;  /* 텍스트 중앙 정렬 */
            width: 100%;         /* 너비를 100%로 설정하여 왼쪽 및 오른쪽 여백 없음 */
        }

        .mypageMain > .mypageName {
            align-self: center;
        }

        .myCardInfo{
            font-size: 20px;
            width: 450px;
            height: 300px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center;  /* 텍스트 중앙 정렬 */
        }

        .monthlyCardInfo{
            font-size: 20px;
            margin-left: 80px;
            width: 450px;
            height: 300px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            margin-right: 130px;
            text-align: center;  /* 텍스트 중앙 정렬 */
        }

        table {
            width: 88%;
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

        .plusBtn{
            color: white;
            background-color:#00857E ;
            border-radius: 10px;
            border: none;
        }

        .mainCard{
            display: flex; /* flex를 사용하여 아이템들을 가로로 나열합니다 */
            align-items: center; /* 아이템들을 수직 중앙에 배치합니다 */
            text-align: left;
        }

        .payCardImg{
            margin-left: 20px;
            margin-right: 20px;
            order: -1;
            width: 200px;
            height: 150px;
        }

        .custom-flex-container {
            flex-direction: column;
        }

        .payTag{
            margin-top: 10px;
            align-items: center;
            background-color: white;
            padding: 20px;
            border-radius: 15px;  /* 둥근 모서리 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  /* 그림자 효과 */
            width: 60%;

        }



    </style>

</head>
<body>

<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<div class="flex-container">
<div class="flex-shrink-0 p-3" style="width: 280px; margin-left: 90px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
        <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
        <span class="fs-5 fw-semibold">마이하나</span>
    </a>
    <ul class="list-unstyled ps-0">
        <li class="mb-1">
            <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                하나원페이
            </button>
            <div class="collapse show" id="home-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
<%--                    <li><a href="/api/linkedAccount" class="link-body-emphasis d-inline-flex text-decoration-none rounded">연동카드조회</a></li>--%>
<%--                    <li><a href="/hanaOnePay/selectPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>--%>
                    <li><a href="/hanaOnePay/selectHanaPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>
                    <li><a onclick="fetchAccountData()" class="link-body-emphasis d-inline-flex text-decoration-none rounded" style="cursor: pointer;">간편결제 계좌</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                거래내역조회
            </button>
            <div class="collapse" id="dashboard-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/api/payments-by-month?month=09"  class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 지출 조회</a></li>
<%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">명세서 조회</a></li>--%>
<%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>--%>
<%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>--%>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                내 소비분석
            </button>
            <div class="collapse" id="orders-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/api/payments-by-month?month=09" class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
<%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Processed</a></li>--%>
<%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Shipped</a></li>--%>
<%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Returned</a></li>--%>
                </ul>
            </div>
        </li>
        <li class="border-top my-3"></li>
        <li class="mb-1">
            <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                Account
            </button>
            <div class="collapse" id="account-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">New...</a></li>
                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Profile</a></li>
                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Settings</a></li>
                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Sign out</a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>

    <div class="mypageMain">
        <div class="mypageName">
            <div style="font-size: 30px">마이하나페이지</div>
            <div style="color: #959595">나만의 카드 생활</div>
        </div>
        <br>


        <div>
            ${sessionScope.name}님은 일반고객이십니다.
        </div>

        <br>

        <c:set var="card1" value="${cardInfos[0]}" />
        <c:set var="card2" value="${cardInfos[1]}" />

        <c:set var="cardPayLog1" value="${thisMonthTransData[card1.cardNumber]}" />
        <c:set var="cardPayLog2" value="${thisMonthTransData[card2.cardNumber]}" />
        <div class="flex-container">
        <div class="myCardInfo">
            <div class=" fs-3 mx-auto mt-2">대표카드</div>
            <div class="dropdown" style="margin-left: 300px;">
                <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    카드 선택
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item"  onclick="showCardInfo(0)">${card1.cardName}</a></li>
                    <li><a class="dropdown-item" onclick="showCardInfo(1)">${card2.cardName}</a></li>
                </ul>
            </div>
            <div class="mainCard mt-4" style="font-size: 20px" id="cardInfoDiv">
                <img src="/img/${cardInfos[0].cardName}.png" class="d-block payCardImg" id="cardImage" alt="${cardInfos[0].cardName}">

                <br>

                <div class="flex-container custom-flex-container">
                    <div id="cardName" style="color: #666666; font-size: 18px;">${card1.cardName}</div>
                    <span id="monthlyUsageTitle" style="color: #666666; font-size: 18px;">이번달 사용금액</span> <br>
                    <span id="monthlyUsage" style="font-size: 25px">${thisMonthTotalAmounts[card1.cardNumber]}원 ></span>

                </div>

            </div>



            <br><br>
<%--            <div class="btn-group" role="group" aria-label="Basic outlined example" style="border: none">--%>
<%--                <button type="button" class="btn btn-outline-primary" style="background-color: #00857E; color: white;">카드관리</button>--%>
<%--                <button type="button" class="btn btn-outline-primary" style="background-color: #00857E; color: white;">받은혜택</button>--%>
<%--                <button type="button" class="btn btn-outline-primary" style="background-color: #00857E; color: white;">한도조회</button>--%>
<%--            </div>--%>


        </div>

        <div class="monthlyCardInfo fs-3 mx-auto">
            <p class="mt-2">마이 소비 태그</p>
            <div class="withdralDate" style="text-align: left; margin-left: 5%; margin-top: 3%; margin-bottom: 3%; font-size: 18px">
                ${sessionScope.name}님, <br>
                    소비 태그 2개를 획득했어요!

                    <div class="payTag mx-auto w-75" style="font-size: 15px">
                        # 인터넷 쇼핑 홀릭
                    </div>

                    <div class="payTag mx-auto w-75" style="font-size: 15px">
                    # 카페인 뱀파이어
                </div>
            </div>
        </div>
        </div>

        <br><br>

        <div class="recentCardUse">
            <div class="using" style="font-size: 20px">최근 거래내역 <button class="plusBtn">더보기 +</button></div>
            <br>
            <div>
                <table>
                    <thead>
                    <tr>
                        <th>결제일시</th>
                        <th>거래처</th>
                        <th>카드 번호</th>
                        <th>상태</th>
                        <th>거래금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 이 부분은 JavaScript에서 동적으로 채워집니다. -->
                    </tbody>
                </table>
            </div>
        </div>


    </div>
    </div>

</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>

    window.onload = function() {
        const targetAmount = parseInt('${thisMonthTotalAmounts[card1.cardNumber]}'.replace(/[^0-9]/g, ''));
        const displayElement = document.getElementById("monthlyUsage");
        const duration = 500; // 애니메이션 시간 (2초)
        const stepTime = 10;
        let currentAmount = 0;
        const increment = targetAmount / (duration / stepTime);

        const intervalId = setInterval(function() {
            currentAmount += increment;
            if (currentAmount >= targetAmount) {
                clearInterval(intervalId);
                currentAmount = targetAmount;
            }
            displayElement.textContent = numberWithCommas(Math.round(currentAmount)) + "원";
        }, stepTime);
    }

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
            cell3.textContent = trans.cardNumber;
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
</script>

</body>
</html>
