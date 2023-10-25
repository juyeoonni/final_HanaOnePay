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
    <title>내 지출 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link rel="stylesheet" href="/css/card.css">
    <title>내 지출 조회</title>

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
            margin-left: 80px;
            width: 450px;
            height: 300px;
            background-color: whitesmoke;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            margin-right: 130px;
            text-align: center; /* 텍스트 중앙 정렬 */
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

        .plusBtn {
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
            align-items: center;
            border: #BCD9D3 5px solid;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin-top: -20px;
            padding: 20px;
            border-radius: 15px;
            width: 90%;
            height: 200px;
            margin-top: 100px;
            background-color: rgba(1, 85, 80, 0.18);
        }

        .payTagDetail {
            padding-top: 12px;
            padding-left: 20px;
            border: #BCD9D3 5px solid;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            height: 80px;
            margin-top: 25px;
            margin-right: 18px;
            transition: box-shadow 0.3s ease, transform 0.3s ease; /* 부드러운 변환과 그림자 효과 */
            background-color: #FFFFFF;
        }

        .payTagDetail:hover {
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자를 더 진하게 */
            transform: scale(1.05); /* 스케일을 약간 키움 */
        }


        .payTagDetails {
            display: flex; /* 두 payTagDetail을 수평으로 정렬 */
            margin-right: 10px; /* 오른쪽 이미지와의 간격을 조절 */
        }

        .payTagUser {
            height: 80px;
            display: flex;
            align-items: center; /* 중앙 정렬 */
            margin-right: 10px; /* 오른쪽에 간격 추가 */
        }

        .payTagStar {
            margin-left: 50px;
            margin-bottom: 50px;
            height: 200px; /* 이미지의 높이. 필요에 따라 조절 가능 */
            width: auto; /* 이미지의 너비를 자동으로 설정 */
        }

        .payTagMessage {
            font-size: 17px;
            margin-right: 20px;
        }

        .pieChart {
            width: 450px;
            height: 700px;
        }

        .pieChartContainer {
            display: flex;
        }

        .pieChart, .anotherDiv {
            margin-right: 50px;
        }

        .pieChartsideDiv {
            padding: 13px;
            font-size: 20px;
            width: 500px;
            height: 600px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-top: 1px;
        }

        .businessCode {
            padding: 10px;
            margin: 0 auto;
            margin-top: 25px;
            background-color: whitesmoke;
            width: 450px;
            height: 80px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
        }

        /*슬라이드 css*/
        #slider-container {
            display: flex;
            align-items: center;
        }

        #slider-container button {
            padding: 10px;
            margin: 10px;
        }

        .arrow {
            border: none;
            background-color: white;
        }

        .monthlyChartDiv {
            font-size: 20px;
            width: 1000px;
            height: 500px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-top: -10px;
        }

        .business-layout {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .business-name {
            flex: 1;
        }

        .business-percentage {
            margin-left: 8px; /* or any space you want between the name and the percentage */
            flex: 0;
        }

        .business-amount {
            flex: 1;
            text-align: right;
        }

        .testdiv {
            margin-right: 50px;
            margin-bottom: 100px;
            padding: 13px;
            font-size: 20px;
            width: 480px;
            height: 200px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            /*text-align: center; !* 텍스트 중앙 정렬 *!*/
            margin-top: 70px;

            display: flex; /* flexbox를 활용하여 내부 아이템들을 가로로 배열합니다. */
            align-items: center; /* 세로로 중앙 정렬을 위한 속성입니다. */
            justify-content: space-between; /* 내부 아이템들 사이에 공간을 동일하게 분배합니다. */
            padding: 16px;
            transition: box-shadow 0.3s ease, transform 0.3s ease; /* 부드러운 변환과 그림자 효과 */
            background-color: #FFFFFF;
        }


        .testdiv:hover {
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자를 더 진하게 */
            transform: scale(1.05); /* 스케일을 약간 키움 */
        }

        .highlight {
            color: #00857E;
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

                <div class="collapse" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <%--                    <li><a href="/api/linkedAccount" class="link-body-emphasis d-inline-flex text-decoration-none rounded">연동카드조회</a></li>--%>
                        <%--                    <li><a href="/hanaOnePay/selectPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>--%>
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
                <div class="collapse show" id="home-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/api/payments-by-month?month=09"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
                        <li><a href="javascript:void(0);"
                               onclick="goToTest();"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded" >소비성향테스트</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="border-top my-3"></li>
        </ul>
    </div>
    <%--    사이드바끝--%>


    <div class="mypageMain">
        <div class="mypageName">
            <div style="font-size: 30px">내 소비 분석</div>
            <div style="color: #959595">이번달 내 소비 추이를 확인하세요</div>
        </div>
        <br>


        <div>
            ${sessionScope.name}님의 월간 소비 분포입니다.
        </div>

        <%--        월 나타내기 슬라이드--%>

        <%--        슬라이드끝--%>

        <div class="pieChartContainer">
            <div class="pieChart">
                <div id="slider-container">
                    <button id="prev" class="arrow">◀</button>
                    <h2 id="month-text">월 지출 리포트</h2>
                    <button id="next" class="arrow">▶</button>
                </div>
                <canvas id="myChart" width="200" height="200"></canvas>
            </div>
            <div class="pieChartsideDiv">
                <!-- 다른 div의 내용 -->
                <p>월간 지출 TOP 5</p>

                <div class="businessCode" id="top1"></div>
                <div class="businessCode" id="top2"></div>
                <div class="businessCode" id="top3"></div>
                <div class="businessCode" id="top4"></div>
                <div class="businessCode" id="top5"></div>

            </div>
        </div>

        <div class="monthlyChartDiv">
            <div class="monthlyChartMent">
                ${sessionScope.name}님의 1년간 소비 추이입니다.
            </div>
            <canvas id="myChart2" width="400" height="200"></canvas>
            <%--            <img src="/img/starChracterPay.gif">--%>
        </div>

        <div class="payTag">
            <div class="payTagMessage">
                ${sessionScope.name}님, <br>
                <span class="underlineText"
                      style="font-size: 25px; color: #666666; display: inline-block; border-bottom: 4px solid #BCD9D3;">소비태그 2개</span>를
                획득했어요!
            </div>
            <div class="payTagUser">
                <div class="payTagDetails">
                    <div class="payTagDetail">
                        <%-- 첫번째 소비태그 --%>
                    </div>
                    <div class="payTagDetail">
                        <%-- 두번째 소비태그 --%>
                    </div>
                </div>
                <img class="payTagStar" src="/img/payTagStar.png">
            </div>
        </div>

        <div class="pieChartContainer">
            <div class="testdiv">
                <div class="text-section" style="margin-left: 5px; font-size: 18px;">
                    라이프 스타일로 알아보는<br>
                    나만의 <span class="highlight" style="font-size:18px;">소비 성향 테스트</span> <br>
                    <button class="plusBtn" onclick="goToTest()" style="margin-top: 7px;">소비 성향 테스트 GO!</button>
                </div>

                <img style="margin-right: 10px; width: 200px; height: 200px;" class="image-section"
                     src="/img/Group 64.png" alt="대체 텍스트">
            </div>

            <div class="testdiv">
                <div class="text-section" style="margin-left: 5px; font-size: 18px;">
                    하나원페이에서<br>
                    <span class="highlight" style="font-size:18px;">마이페이</span>로 결제수단 연동하고<br>
                    편리하게 결제하세요!<br>
                    <button class="plusBtn" onclick="goToTest()"
                            style="background-color:#BCD9D3; color: #666666; margin-top: 7px;">마이페이 연동 GO!
                    </button>
                </div>

                <img style="margin-left:-550px; margin-top: 10px; width: 230px; height: 250px;" class="image-section"
                     src="/img/myhanamodal.png" alt="대체 텍스트">
            </div>


        </div>


    </div>
</div>

</div>


<%--<%@ include file="/WEB-INF/views/comm/footer.jsp" %>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>


<script>
    function goToTest() {
        window.location.href = "/hanaOnePay/payTendencyTest";
    }

    let currentMonth = new Date().getMonth(); // 0 (January) to 11 (December)
    const months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];

    document.getElementById('prev').addEventListener('click', () => {
        if (currentMonth > 0) {
            currentMonth--;
            updateMonth();
            getMonthPaylog();
        }
    });

    document.getElementById('next').addEventListener('click', () => {
        if (currentMonth < 11) {
            currentMonth++;
            updateMonth();
            getMonthPaylog();
        }
    });

    function updateMonth() {
        document.getElementById('month-text').textContent = months[currentMonth] + '월 지출 리포트';
    }

    // Initial setup
    updateMonth();

    function getImageUrlForBusinessCode(businessCode) {
        return "/img/payCategory/" + businessCode + ".png";
    }

    function updateTop5Businesses(dataFromServer) {
        // 서버로부터 받은 데이터를 payAmount 기준으로 내림차순 정렬합니다.
        var sortedData = dataFromServer.sort((a, b) => b.payAmount - a.payAmount);

        // 전체 지출 금액을 계산합니다.
        var totalAmount = dataFromServer.reduce((sum, data) => sum + data.payAmount, 0);

        // 상위 5개 데이터만 선택합니다.
        var top5Data = sortedData.slice(0, 5);

        // 각 데이터를 순서대로 해당 div에 표시합니다.
        for (var i = 0; i < top5Data.length; i++) {
            var businessName = getBusinessName(top5Data[i].businessCode);

            // 각 항목의 payAmount 값이 전체 지출 중 얼마의 비율을 차지하는지 계산합니다.
            var percentage = ((top5Data[i].payAmount / totalAmount) * 100).toFixed(1);  // 소수점 두 번째 자리까지 표시

            var divId = "top" + (i + 1);
            var divElement = document.getElementById(divId);
            if (divElement) {
                divElement.textContent = ""; // Clear the content
                divElement.classList.add("business-layout");

                // 이미지 요소를 생성합니다.
                var imgElement = document.createElement("img");
                imgElement.src = getImageUrlForBusinessCode(top5Data[i].businessCode);
                imgElement.alt = businessName + " 이미지";
                imgElement.classList.add("business-image");

                // 이미지 요소를 divElement에 추가합니다.
                divElement.appendChild(imgElement);

                let nameElement = document.createElement("div");
                nameElement.textContent = businessName;
                nameElement.classList.add("business-name");

                let amountElement = document.createElement("div");
                amountElement.textContent = top5Data[i].payAmount.toLocaleString() + "원";
                amountElement.classList.add("business-amount");

                let percentageElement = document.createElement("div");
                percentageElement.textContent = percentage + "%";
                percentageElement.classList.add("business-percentage");

                // 기존과 같이 나머지 요소들을 divElement에 추가합니다.
                divElement.appendChild(nameElement);
                divElement.appendChild(percentageElement);
                divElement.appendChild(amountElement);
            }
        }
    }


    //ajax
    function getMonthPaylog() {

        $.ajax({
            url: "/api/payments-by-month2",
            type: "GET",
            data: {"month": months[currentMonth]},
            dataType: "json",
            success: function (data) {
                console.log(data);
                updateChartData(data);
                updateTop5Businesses(data);
                updatePayTag(data);
                // alert("월별 차트 조회 성공");
            },
            error: function (request, status, error) {
                alert("월별 차트 조회 실패");
            }
        });
    }


    // 서버로부터 받은 데이터를 JavaScript 객체로 파싱
    var dataFromServer = ${response};
    var labels = [];
    var dataset = [];

    // 업종 코드에 해당하는 이름을 가져오기 위한 함수
    function getBusinessName(code) {
        var businessNames = {
            '1000': '쇼핑',
            '2000': '요식',
            '2500': '카페',
            '5100': '대형마트',
            '5200': '편의점',
            '6600': '주유',
            '6306': '항공',
            '6301': '대중교통',
            '8000': '문화시설',
            '6000': '여행',
            '4000': '의료',
            '7000': '교육',
            '5500': '인터넷상거래'
        };
        return businessNames[code] || '기타';  // 코드에 해당하는 이름이 없으면 '기타' 반환
    }

    for (var i = 0; i < dataFromServer.length; i++) {
        labels.push(getBusinessName(dataFromServer[i].businessCode));  // 업종 코드에 해당하는 이름으로 라벨 설정
        dataset.push(dataFromServer[i].payAmount);
    }

    var pieChart;

    var ctxPie = document.getElementById('myChart').getContext('2d');
    pieChart = new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                label: '지출',
                data: dataset,
                backgroundColor: [
                    'rgba(255, 182, 193, 1)',  // Light Pink
                    'rgba(173, 216, 230, 1)',  // Light Blue
                    'rgba(240, 230, 140, 1)',  // Khaki
                    'rgba(152, 251, 152, 1)',  // Pale Green
                    'rgba(221, 160, 221, 1)',  // Plum
                    'rgba(244, 164, 96, 1)',   // Sandy Brown
                    'rgba(135, 206, 235, 1)',  // Sky Blue
                    'rgba(255, 192, 203, 1)',  // Pink
                    'rgba(255, 218, 185, 1)',  // Peach Puff
                    'rgba(176, 224, 230, 1)',  // Powder Blue
                    'rgba(255, 240, 245, 1)',  // Lavender Blush
                    'rgba(250, 250, 210, 1)',  // Light Goldenrod Yellow
                    'rgba(245, 245, 220, 1)'   // Beige
                ],
                borderColor: [
                    'rgba(255, 182, 193, 1)',  // Light Pink
                    'rgba(173, 216, 230, 1)',  // Light Blue
                    'rgba(240, 230, 140, 1)',  // Khaki
                    'rgba(152, 251, 152, 1)',  // Pale Green
                    'rgba(221, 160, 221, 1)',  // Plum
                    'rgba(244, 164, 96, 1)',   // Sandy Brown
                    'rgba(135, 206, 235, 1)',  // Sky Blue
                    'rgba(255, 192, 203, 1)',  // Pink
                    'rgba(255, 218, 185, 1)',  // Peach Puff
                    'rgba(176, 224, 230, 1)',  // Powder Blue
                    'rgba(255, 240, 245, 1)',  // Lavender Blush
                    'rgba(250, 250, 210, 1)',  // Light Goldenrod Yellow
                    'rgba(245, 245, 220, 1)'   // Beige
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        usePointStyle: true,    // 이 옵션을 true로 설정
                        boxWidth: 1000            // 이 값을 조절하여 원하는 간격을 설정
                    }
                },
                title: {
                    display: true,
                    position: 'top',
                    text: '<월별 지출 분포>'
                }
            }
        }
    });


    // 차트 데이터를 업데이트하는 함수
    function updateChartData(dataFromServer) {
        var labels = [];
        var dataset = [];
        var totalBusiness = {};

        for (var i = 0; i < dataFromServer.length; i++) {
            var businessName = getBusinessName(dataFromServer[i].businessCode);
            labels.push(businessName);
            dataset.push(dataFromServer[i].payAmount);

            // 여기서 totalBusiness 객체에 각 업종별 지출 금액을 합산합니다.
            totalBusiness[dataFromServer[i].businessCode] = (totalBusiness[dataFromServer[i].businessCode] || 0) + dataFromServer[i].payAmount;
        }

        // 여기서 각 업종별 지출 금액을 해당 <div>에 표시합니다.
        for (var code in totalBusiness) {
            var divId = "business_" + code;
            var divElement = document.getElementById(divId);
            if (divElement) {
                divElement.textContent = getBusinessName(code) + " " + totalBusiness[code].toLocaleString() + "원";
            }
        }

        if (pieChart) {  // 기존 차트가 존재하면 차트를 파괴
            pieChart.destroy();
        }

        var ctxPie = document.getElementById('myChart').getContext('2d');
        pieChart = new Chart(ctxPie, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: '지출',
                    data: dataset,
                    backgroundColor: [
                        'rgba(255, 182, 193, 1)',  // Light Pink
                        'rgba(173, 216, 230, 1)',  // Light Blue
                        'rgba(240, 230, 140, 1)',  // Khaki
                        'rgba(152, 251, 152, 1)',  // Pale Green
                        'rgba(221, 160, 221, 1)',  // Plum
                        'rgba(244, 164, 96, 1)',   // Sandy Brown
                        'rgba(135, 206, 235, 1)',  // Sky Blue
                        'rgba(255, 192, 203, 1)',  // Pink
                        'rgba(255, 218, 185, 1)',  // Peach Puff
                        'rgba(176, 224, 230, 1)',  // Powder Blue
                        'rgba(255, 240, 245, 1)',  // Lavender Blush
                        'rgba(250, 250, 210, 1)',  // Light Goldenrod Yellow
                        'rgba(245, 245, 220, 1)'   // Beige
                    ],
                    borderColor: [
                        'rgba(255, 182, 193, 1)',  // Light Pink
                        'rgba(173, 216, 230, 1)',  // Light Blue
                        'rgba(240, 230, 140, 1)',  // Khaki
                        'rgba(152, 251, 152, 1)',  // Pale Green
                        'rgba(221, 160, 221, 1)',  // Plum
                        'rgba(244, 164, 96, 1)',   // Sandy Brown
                        'rgba(135, 206, 235, 1)',  // Sky Blue
                        'rgba(255, 192, 203, 1)',  // Pink
                        'rgba(255, 218, 185, 1)',  // Peach Puff
                        'rgba(176, 224, 230, 1)',  // Powder Blue
                        'rgba(255, 240, 245, 1)',  // Lavender Blush
                        'rgba(250, 250, 210, 1)',  // Light Goldenrod Yellow
                        'rgba(245, 245, 220, 1)'   // Beige
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            usePointStyle: true,    // 이 옵션을 true로 설정
                            boxWidth: 1000            // 이 값을 조절하여 원하는 간격을 설정
                        }
                    },
                    title: {
                        display: true,
                        position: 'top',
                        text: '<월별 지출 분포>'
                    }
                }
            }
        });
    }

    // 차트 막대
    var barChart = JSON.parse('${response2}');
    console.log(barChart);

    // businessCode와 payAmount 데이터를 분리합니다.
    var month = [];
    var payAmount = [];
    for (var i = 0; i < barChart.length; i++) {
        month.push(barChart[i].month);
        payAmount.push(barChart[i].totalAmount);
    }

    var ctx = document.getElementById('myChart2').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: month,
            datasets: [{
                label: '1년간 월별 지출 금액',
                data: payAmount,
                backgroundColor: 'rgba(50, 205, 50, 0.2)', // 진한 민트색, 20% 투명도
                borderColor: 'rgba(50, 205, 50, 1)', // 진한 민트색, 불투명

                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    max: 3000000
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return context[0].label + '월';
                        },
                        label: function (context) {
                            return context.label + '월 총 지출 금액: ' + context.parsed.y.toLocaleString() + '원';
                        }
                    }
                }
            }
        }

    });


    // 소비태그
    // 소비태그에 대한 매핑 객체
    var payTagMapping = {
        '1000': '# 쇼핑마스터',
        '2000': '# 맛집컬렉터',
        '2500': '# 카페인홀릭',
        '5100': '# 생활의 달인',
        '5200': '# 편의점족',
        '6600': '# 드라이브 러버',
        '6306': '# 자유로운 트래블러',
        '6301': '# 대중교통 이용러',
        '8000': '# 교양있는 생활자',
        '6000': '# 자유로운 여행가',
        '4000': '# 괜찮아 잘될거야! 아프지마',
        '7000': '# 똑똑이',
        '5500': '# 슬기로운 인터넷 웹서퍼'
    };

    var payTagSubtitles = {
        '1000': '쇼핑에 진심이에요. 쇼핑없인 못살아!',
        '2000': '매일 매일 새로운 맛집 탐방!',
        '2500': '커피 수혈 없이는 못살아~',
        '5100': '생활의 달인이 되고 싶어요!',
        '5200': '편의점은 내 두번째 집!',
        '6600': '드라이브가 취미에요!',
        '6306': '여행은 언제나 환영이에요!',
        '6301': '대중교통을 이용해 환경을 지켜요!',
        '8000': '교양있는 생활을 위해 노력해요!',
        '6000': '여행은 언제나 환영이에요!',
        '4000': '건강은 최고의 부! 건강을 위해 노력해요!',
        '7000': '똑똑한 사람이 되고 싶어요!',
        '5500': '웹이란 바다의 슬기로운 인터넷 서퍼!'
    };

    function updatePayTag(dataFromServer) {
        // 데이터를 payAmount 기준으로 내림차순 정렬
        dataFromServer.sort((a, b) => b.payAmount - a.payAmount);

        // 상위 2개의 데이터를 추출
        var top2Data = dataFromServer.slice(0, 2);

        var payTagElements = document.querySelectorAll('.payTagDetail');

        for (var i = 0; i < top2Data.length; i++) {
            var tag = payTagMapping[top2Data[i].businessCode];
            var subtitle = payTagSubtitles[top2Data[i].businessCode];  // 부제목 가져오기

            if (tag) {
                payTagElements[i].innerHTML = tag;  // innerHTML을 사용하여 태그 내용 갱신

                if (subtitle) {
                    // 부제목을 추가하기 위한 div 생성
                    var subtitleDiv = document.createElement('div');
                    subtitleDiv.textContent = subtitle;
                    subtitleDiv.classList.add('payTagSubtitle');  // CSS 스타일을 위한 클래스 추가
                    payTagElements[i].appendChild(subtitleDiv);  // payTagDetail 내에 부제목 div 추가
                }
            }
        }

    }


</script>
</body>
</html>
