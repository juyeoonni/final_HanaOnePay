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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link rel="stylesheet" href="/css/card.css">
    <title>내 지출 조회</title>

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

        .pieChart {
            width: 500px;
            height: 500px;
        }

        .pieChartContainer{
            display: flex;
        }

        .pieChart, .anotherDiv {
            margin-right: 50px;
        }

        .pieChartsideDiv{
            font-size: 20px;
            width: 450px;
            height: 500px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            text-align: center;  /* 텍스트 중앙 정렬 */
            margin-top: 70px;
        }

        .businessCode{
            margin: 0 auto;
            margin-top: 25px;
            background-color: whitesmoke;
            width: 350px;
            height: 50px;
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

        .arrow{
            border: none;
            background-color: white;
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
                        <li><a href="/hanaOnePay/payHistory" class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 지출 조회</a></li>
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
                        <li><a href="/hanaOnePay/payReport" class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
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
            <div style="font-size: 30px">내 소비 분석</div>
            <div style="color: #959595">이번달 내 소비 추이를 확인하세요</div>
        </div>
        <br>


        <div>
            ${sessionScope.name}님의 이번달 소비 분포입니다.
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
                <p>여기에 다른 내용을 넣습니다.</p>

                <div class="businessCode">요식</div>
                <div class="businessCode">문화시설</div>
                <div class="businessCode">쇼핑</div>
                <div class="businessCode">카페</div>
                <div class="businessCode">편의점</div>
                <div class="businessCode">그 외</div>
            </div>
        </div>







    </div>
</div>

</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


<script>
    let currentMonth = new Date().getMonth(); // 0 (January) to 11 (December)
    const months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];

    document.getElementById('prev').addEventListener('click', () => {
        if(currentMonth > 0) {
            currentMonth--;
            updateMonth();
        }
    });

    document.getElementById('next').addEventListener('click', () => {
        if(currentMonth < 11) {
            currentMonth++;
            updateMonth();
        }
    });

    function updateMonth() {
        document.getElementById('month-text').textContent = months[currentMonth] + '월 지출 리포트';
    }

    // Initial setup
    updateMonth();



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

    for(var i=0; i<dataFromServer.length; i++) {
        labels.push(getBusinessName(dataFromServer[i].businessCode));  // 업종 코드에 해당하는 이름으로 라벨 설정
        dataset.push(dataFromServer[i].payAmount);
    }

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                label: '지출',
                data: dataset,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)', // red
                    'rgba(54, 162, 235, 0.2)', // blue
                    'rgba(255, 206, 86, 0.2)', // yellow
                    'rgba(75, 192, 192, 0.2)', // teal
                    'rgba(153, 102, 255, 0.2)', // purple
                    'rgba(255, 159, 64, 0.2)', // orange
                    'rgba(201, 203, 207, 0.2)', // grey
                    'rgba(131, 117, 224, 0.2)', // violet
                    'rgba(85, 239, 196, 0.2)', // mint
                    'rgba(129, 236, 236, 0.2)', // cyan
                    'rgba(250, 177, 160, 0.2)', // coral
                    'rgba(253, 121, 168, 0.2)', // pink
                    'rgba(178, 190, 195, 0.2)', // light grey
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(201, 203, 207, 1)',
                    'rgba(131, 117, 224, 1)',
                    'rgba(85, 239, 196, 1)',
                    'rgba(129, 236, 236, 1)',
                    'rgba(250, 177, 160, 1)',
                    'rgba(253, 121, 168, 1)',
                    'rgba(178, 190, 195, 1)',
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


</script>
</body>
</html>
