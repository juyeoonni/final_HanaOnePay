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
            width: 90.3%;
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
            margin-left: 20px;
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
            margin-top: 10px;
            align-items: center;
            background-color: white;
            padding: 20px;
            border-radius: 15px; /* 둥근 모서리 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            width: 60%;

        }

        .proImg {
            width: 100px;
            height: 100px;
            margin-right: 10px;
        }

        .profile {
            padding: 2px;
            font-size: 16px;
            text-align: center;
            color: white;
            background-color: #666666;
            border-radius: 10px;
            border: none;
            align-content: center;
            margin-top: 10px;
            margin-right: 20px;
            width: 150px;
            height: 30px;
            transition: background-color 0.3s ease; /* 부드러운 전환을 위한 트랜지션 설정 */
        }

        .profile:hover {
            /* 호버 상태에서의 스타일 */
            background-color: #6C757D; /* 호버 시 배경색 변경 등을 설정합니다. */
        }


        .proInfo {
            margin-right: 10px;
            margin-top: 10px;
            margin-left: 10px;
            font-size: 17px;
            color: #666666;
        }

        .holicontainer {
            margin-bottom: 100px;
            margin-left: 50px;
            display: flex;
            flex-direction: row;
        }

        .profile a {
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 부모 요소의 폰트색을 상속받음 */
        }
        .profile a:hover {
            text-decoration: none; /* 마우스 호버 상태에서도 밑줄 제거 */
        }

        .adPayTag{
            width: 90.3%;
            height: 50px;
            background-color: #d9ede8;
        }

        .adPayTag {
            display: flex;         /* flexbox를 사용합니다. */
            align-items: center;   /* 수직으로 가운데 정렬합니다. */
            justify-content: center; /* 수평으로 가운데 정합니다. */
            height: 65px;
        }

        /*토글스위치*/
        .toggleSwitch {
            width: 60px;
            height: 30px;
            display: block;
            position: relative;
            border-radius: 30px;
            background-color: #fff;
            box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
            cursor: pointer;
            margin: 30px;
        }

        .toggleSwitch .toggleButton {
            width: 20px;
            height: 20px;
            position: absolute;
            top: 50%;
            left: 4px;
            transform: translateY(-50%);
            border-radius: 50%;
            background: #00857E;
        }

        #toggle:checked ~ .toggleSwitch {
            background:#00857E;
        }

        #toggle:checked ~ .toggleSwitch .toggleButton {
            left: calc(100% - 44px);
            background: #fff;
        }

        .toggleSwitch, .toggleButton {
            transition: all 0.2s ease-in;
        }

        .toggleContainer {
            display: flex;
            align-items: center;  /* 항목들을 수직으로 중앙에 배치합니다. */
            gap: 10px;  /* 항목들 사이의 간격을 추가합니다. */
        }

        .using {
            display: flex;
            align-items: center;
            /*justify-content: space-between;*/
        }
        .toggleContainer {
            display: flex;
            align-items: center;
            margin-left: 570px;
        }
    </style>

</head>
<body>

<%@ include file="/WEB-INF/views/comm/header.jsp" %>

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
                    거래내역조회
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/api/payments-by-month?month=09"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 지출 조회</a></li>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">명세서 조회</a></li>--%>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>--%>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>--%>
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
                        <li><a href="/api/payments-by-month?month=09"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Processed</a></li>--%>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Shipped</a></li>--%>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Returned</a></li>--%>
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

    <div class="mypageMain">

        <h2 style="margin-bottom: 30px;">나의 소비성향은?</h2>
        <section id="mbtiSection" class="section" style="margin-top: 50px;" >
            <div class="container" style="display: flex; flex-direction:column; align-items:center;  height: 500px;">
                <div id="mainBox"  class="row justify-content-center" style="border: 2px solid #BDBDBD; width: 500px; border-radius: 10px;">
                    <div  id="testBox" class="row justify-content-center" style="padding-bottom: 20px; padding-top: 20px;">
                        <div style="width: 300px;">
                            <img src="/finalproject1/resources/images/mbti/mbti_main.png" style="width: 100%;">
                        </div>
                        <div style="text-align: center; margin-top: 20px;">
                            <h3>소비성향 테스트</h3>
                        </div>
                        <div style="text-align: center; margin-top: 10px;">
                            <p class="text-muted" style="font-weight: 600;">하나원페이에서 제공하는 투자성향 테스트를 통해</p>
                            <p class="text-muted" style="font-weight: 600;">나만의 소비 유형을 확인해 보세요!</p>
                        </div>
                        <div class="text-center">
                            <button id="startTest" name="submit" class="btn btn" style="background-color: #398175; color: white;" onclick="startTest()">테스트 시작하기<i class="uil uil-message ms-1"></i></button>
                        </div>
                    </div>
                </div>
                <div id="questionBox" style="display: flex; align-items: center; height: 200px;">

                    <div id="leftBtn" style="margin-right: 80px; margin-top: 60px;"><i class="fa-solid fa-arrow-left" style="font-size: 50px;"></i></div>
                    <div style="width: 850px;">
                        <div id="question1" style="display: flex; flex-direction: column; margin-left: 100px;">
                            <h3>1/7</h3>
                            <p class="text answer1" style="font-size: 20px;">1. 위험관리도 필요하다 주식, 채권 혼합형</p>
                            <p class="text answer1" style="font-size: 20px;">2. 스트레스가 덜한 펀드</p>
                            <p class="text answer1" style="font-size: 20px;">3. 남한테는 못 맡긴다, 직접 투자족</p>
                            <p class="text answer1" style="font-size: 20px;">4. 레버리지도 OK 돈 되는건 다한다</p>
                        </div>
                        <div id="question2" style="display: flex; flex-direction: column; margin-left: 10px; display: none; margin-left: 100px;">
                            <h3>2/7</h3>
                            <h2 style="margin-bottom: 30px;">고객님의 추구하는 주식 투자 기간은 어느정도 인가요? </h2>
                            <p class="text answer2" style="font-size: 20px;">1. 분기, 연간 실적은 보고 판단한다</p>
                            <p class="text answer2" style="font-size: 20px;">2. 한 달만 보면 답이 나온다</p>
                            <p class="text answer2" style="font-size: 20px;">3. 1주일은 지켜본다</p>
                            <p class="text answer2" style="font-size: 20px;">4. 단타</p>
                        </div>
                        <div id="question3" style="display: flex; flex-direction: column; margin-left: 10px; display: none; margin-left: 100px;">
                            <h3>3/7</h3>
                            <h2 style="margin-bottom: 30px; ">고객님의  전체 금융자산 중 주식 투자 비중은 어느정도 인가요?</h2>
                            <p class="text answer3" style="font-size: 20px;">1. 0 ~ 30</p>
                            <p class="text answer3" style="font-size: 20px;">2. 30 ~ 50</p>
                            <p class="text answer3" style="font-size: 20px;">3. 50 ~ 80</p>
                            <p class="text answer3" style="font-size: 20px;">4. 80 ~ 100</p>
                        </div>
                        <div id="question4" style="display: flex; flex-direction: column; margin-left: 10px; display: none; margin-left: 100px;">
                            <h3>4/7</h3>
                            <h2 style="margin-bottom: 30px; ">고객님이 가장 많이 보유하고 있는 주식은 어떤건가요?</h2>
                            <p class="text answer4" style="font-size: 20px;">1. 믿고 기다리는 가치주</p>
                            <p class="text answer4" style="font-size: 20px;">2. 망할일 없는 대형주</p>
                            <p class="text answer4" style="font-size: 20px;">3. 혁신 테마주</p>
                            <p class="text answer4" style="font-size: 20px;">4. 바이오</p>
                        </div>
                        <div id="question5" style="display: flex; flex-direction: column; margin-left: 10px; display: none; margin-left: 100px;">
                            <h3>5/7</h3>
                            <h2 style="margin-bottom: 30px; ">고객님의 1년 목표 수익률은 어느정도 인가요?</h2>
                            <p class="text answer5" style="font-size: 20px;">1. 예금 금리 수준</p>
                            <p class="text answer5" style="font-size: 20px;">2. 1년에 10%</p>
                            <p class="text answer5" style="font-size: 20px;">3. 위험을 감수하고 50%</p>
                            <p class="text answer5" style="font-size: 20px;">4. 100% 고수익</p>
                        </div>
                        <div id="question6" style="display: flex; flex-direction: column; margin-left: 10px; display: none; margin-left: 100px;">
                            <h3>6/7</h3>
                            <h2 style="margin-bottom: 30px; ">고객님의 주식투자의 가장 중요한 덕목은 무엇인가요?</h2>
                            <p class="text answer6" style="font-size: 20px;">1. 돈을 잃지 않는 것</p>
                            <p class="text answer6" style="font-size: 20px;">2. 기다림의 미덕</p>
                            <p class="text answer6" style="font-size: 20px;">3. 트렌드를 읽어내는 인사이트</p>
                            <p class="text answer6" style="font-size: 20px;">4. 수익의 기회를 맡는 동물적인 감각</p>
                        </div>
                        <div id="question7" style="display: flex; flex-direction: column; margin-left: 10px; display: none; margin-left: 100px;">
                            <h3>7/7</h3>
                            <h2 style="margin-bottom: 30px; ">고객님이 믿고 산 종목이 하락하고 있습니다. 어떻게 하실 건가요?</h2>
                            <p class="text answer7" style="font-size: 20px;">1. 끝까지 기다린다</p>
                            <p class="text answer7" style="font-size: 20px;">2. 1년은 기다린다</p>
                            <p class="tex answer7" style="font-size: 20px;">3. 20%이상 조정 받지 않는다면 반년은 기다린다</p>
                            <p class="text answer7" style="font-size: 20px;">4. 당일이라도 매도한다</p>
                        </div>
                    </div>
                    <div id="rightBtn" style="margin-left: 50px; margin-top: 60px;"><i class="fa-solid fa-arrow-right" style="font-size: 50px;"></i></div>

                </div>
                <div id="submitBtn" style="text-align: center; display:none; margin-top: 170px;">
                    <button  name="submit" class="btn btn" style=" background-color: #398175; color: white;">테스트 결과보기<i class="uil uil-message ms-1"></i></button>
                </div>
            </div>

        </section>
        <div id="loading" style="display: flex; height: 500px; flex-direction: column; align-items: center; margin-top: 100px; display: none; text-align: center;">
            <h2 style="margin-bottom: 20px;">고객님의 투자 MBTI	 성향을 파악하고 있어요</h2>
            <img  src="/finalproject1/resources/images/loading.gif" style="width: 200px; height: 200px;">
        </div>
        <section id="resultSectionL" class="section" style="margin-top: 50px; display: none;" >
            <div class="container" style="display: flex; flex-direction:column; align-items:center;  height: 700px;">
                <div  class="justify-content-center" style="display: flex; align-items: center;">
                    <h2 style="margin-right: 20px;">${loginVO.name}님의 투자 MBTI 유형은</h2>
                    <h1 style="background:linear-gradient(to top, #FFE400 30%, transparent 30%);">열심히 일하는 개미! 안전추구형입니다.</h1>
                </div>
                <div style="display: flex; align-items: center; margin-top: 40px;">
                    <img  src="/finalproject1/resources/images/mbti/mbtiTypeL.gif" style="width: 400px; height: 500px;">
                    <div style="display: flex; flex-direction: column; margin-left: 30px; margin-top: 20px;">
                        <div class="candidate-education-content  d-flex">
                            <h2>시장의 큰 흐름을 읽고 트렌드에 따라 투자한다!</h2>
                            <div class="circle flex-shrink-0 bg-soft" style="margin-bottom: 0; background-color: #7DC8B7;">
                                <i class="fa-solid fa-arrow-trend-up" style=" --fa-beat-fade-opacity: 0.1; --fa-beat-fade-scale: 1.25;"></i>
                            </div>
                        </div>
                        <div class="candidate-education-content  d-flex" style="display: flex; flex-direction: column; margin-top: 20px;" >
                            <div style="display: flex; align-items: center;">
                                <i class="fa-solid fa-sack-dollar" style=" color:#E5D85C; font-size: 30px; margin-right: 10px; margin-bottom: 3px;"></i>
                                <h5 style="background-color: #BDBDBD; color: #F6F6F6; border-radius: 10px; padding: 7px; width: fit-content;">#터무니없는_적금금리</h5>
                            </div>
                            <p class="text-muted" style="font-size: 18px;">터무니없는 적금 수익률에 지쳐 우량주 위주로 투자계 입문</p>
                        </div>
                        <div class="candidate-education-content  d-flex" style="display: flex; flex-direction: column; margin-top: 20px;" >
                            <div style="display: flex; align-items: center;">
                                <i class="fa-solid fa-shield" style=" color:#B2CCFF; font-size: 30px; margin-right: 10px; margin-bottom: 3px;"></i>
                                <h5 style="background-color: #BDBDBD; color: #F6F6F6; border-radius: 10px; padding: 7px; width: fit-content;">#안전이_최고</h5>
                            </div>
                            <p class="text-muted" style="font-size: 18px;">노후를 위한 적립식의 성격이 강해 무리한 투자는 잘 피해 다님</p>
                        </div>
                        <div class="candidate-education-content  d-flex" style="display: flex; flex-direction: column; margin-top: 20px;" >
                            <div style="display: flex; align-items: center;">
                                <i class="fa-solid fa-user-tie" style=" color:#CEF279; font-size: 30px; margin-right: 10px; margin-bottom: 3px;"></i>
                                <h5 style="background-color: #BDBDBD; color: #F6F6F6; border-radius: 10px; padding: 7px; width: fit-content;">#전문가_무한신뢰</h5>
                            </div>
                            <p class="text-muted" style="font-size: 18px;">전문가의 말은 언제나 믿을 만하다는 귀가 얇은 특징</p>
                        </div>
                    </div>
                </div>
                <img  src="/finalproject1/resources/images/mbti/underArrow.gif" style="width: 170px; height: 170px; margin-top: -50px;">
                <div  class="justify-content-center" style="display: flex; align-items: center; margin-top: 20px; margin-bottom: 40px;">
                    <h2><span style="background:linear-gradient(to top, #FFE400 30%, transparent 30%);">안전추구형</span> 고객님에게 추천드리는 빌딩입니다</h2>
                </div>
            </div>
        </section>
    </div>
</div>

</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<!-- JAVASCRIPT -->
<script
        src="/finalproject1/resources/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
        src="https://unicons.iconscout.com/release/v4.0.0/script/monochrome/bundle.js"></script>


<!-- Switcher Js -->
<script src="/finalproject1/resources/js/pages/switcher.init.js"></script>

<script src="/finalproject1/resources/js/app.js"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
        src="/finalproject1/resources/signature-pad-main/assets/json2.min.js"></script>
<script
        src="/finalproject1/resources/signature-pad-main/jquery.signaturepad.js"></script>

<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
        src="https://unicons.iconscout.com/release/v4.0.0/script/monochrome/bundle.js"></script>


<!-- Choice Js -->
<script
        src="/finalproject1/resources/libs/choices.js/public/assets/scripts/choices.min.js"></script>

<!-- Light Box Js -->
<script
        src="/finalproject1/resources/libs/glightbox/js/glightbox.min.js"></script>

<script src="/finalproject1/resources/js/pages/lightbox.init.js"></script>


<script src="/finalproject1/resources/libs/swiper/swiper-bundle.min.js"></script>

<script src="/finalproject1/resources/js/pages/index.init.js"></script>

<script src="/finalproject1/resources/js/app.js"></script>
<script src="/finalproject1/resources/js/appToken.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
    $('#startTest').hover(function(){
        $('#mainBox').animate({
            marginTop: '-10px',
            marginBottom : '10px'
        },500)
        $('#mainBox').css('border','3px solid #398175')
    },function(){
        $('#mainBox').animate({
            marginTop : '3px',
            marginBottom : '-10px'
        },500)
        $('#mainBox').css('border','2px solid #BDBDBD')
    })
    $('#questionBox').hide()
    $('.your-class').hide()
    function startTest(){
        $('#mainBox').hide(500,function(){
            $('#questionBox').show(500)
            $('.your-class').fadeIn(500)
        })
    }

    let page = 1
    $('#rightBtn').on('click',function(){
        if(page == 1){
            page = 2
            $('#question1').fadeOut(500,function(){
                $('#question2').fadeIn(500)
            })
        }else if(page == 2){
            page = 3
            $('#question2').fadeOut(500,function(){
                $('#question3').fadeIn(500)
            })
        }else if(page == 3){
            page = 4
            $('#question3').fadeOut(500,function(){
                $('#question4').fadeIn(500)
            })
        }else if(page ==  4){
            page = 5
            $('#question4').fadeOut(500,function(){
                $('#question5').fadeIn(500)
            })
        }else if(page == 5){
            page = 6
            $('#question5').fadeOut(500,function(){
                $('#question6').fadeIn(500)
            })
        }else if(page == 6){
            page = 7
            $('#question6').fadeOut(500,function(){
                $('#question7').fadeIn(500)
            })
        }
    })
    $('#leftBtn').on('click',function(){
        if(page == 2){
            page = 1
            $('#question2').fadeOut(500,function(){
                $('#question1').fadeIn(500)
            })
        }else if(page == 3){
            page = 2
            $('#question3').fadeOut(500,function(){
                $('#question2').fadeIn(500)
            })
        }else if(page == 4){
            page = 3
            $('#question4').fadeOut(500,function(){
                $('#question3').fadeIn(500)
            })
        }else if(page == 5){
            page = 4
            $('#question5').fadeOut(500,function(){
                $('#question4').fadeIn(500)
            })
        }else if(page == 6){
            page = 5
            $('#question6').fadeOut(500,function(){
                $('#question5').fadeIn(500)
            })
        }else if(page ==7){
            page = 6
            $('#question7').fadeOut(500,function(){
                $('#question6').fadeIn(500)
            })
        }
    })
    let questionPoint1 = 0
    let questionPoint2 = 0
    let questionPoint3 = 0
    let questionPoint4 = 0
    let questionPoint5 = 0
    let questionPoint6 = 0
    let questionPoint7 = 0
    let totalPoint = 0
    $('.answer1').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer1').css('font-size','20px')
        $(this).siblings('.answer1').css('color','black')
        questionPoint1 = $(this).text().substr(0,1)*1
    })
    $('.answer2').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer2').css('font-size','20px')
        $(this).siblings('.answer2').css('color','black')
        questionPoint2 = $(this).text().substr(0,1)*1
    })
    $('.answer3').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer3').css('font-size','20px')
        $(this).siblings('.answer3').css('color','black')
        questionPoint3 = $(this).text().substr(0,1)*1
    })
    $('.answer4').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer4').css('font-size','20px')
        $(this).siblings('.answer4').css('color','black')
        questionPoint4 = $(this).text().substr(0,1)*1
    })
    $('.answer5').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer5').css('font-size','20px')
        $(this).siblings('.answer5').css('color','black')
        questionPoint5 = $(this).text().substr(0,1)*1
    })
    $('.answer6').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer6').css('font-size','20px')
        $(this).siblings('.answer6').css('color','black')
        questionPoint6 = $(this).text().substr(0,1)*1
    })
    $('.answer7').on('click',function(){
        $(this).css('color','#398175')
        $(this).css('font-size','25px')
        $(this).siblings('.answer7').css('font-size','20px')
        $(this).siblings('.answer7').css('color','black')
        questionPoint7 = $(this).text().substr(0,1)*1
        $('#submitBtn').show()
    })
    let mbtiType = ''
    $('#submitBtn').on('click',function(){
        totalPoint = questionPoint1+questionPoint2+questionPoint3+questionPoint4+questionPoint5+questionPoint6+questionPoint7
        if(totalPoint >= 7 && totalPoint <=13){
            mbtiType = 'L'
        }else if(totalPoint >= 14 && totalPoint <=21){
            mbtiType = 'M'
        }else{
            mbtiType = 'H'
        }
        fetch('${pageContext.request.contextPath}/insertMbti',{
            method : 'POST'	,
            headers:{"Content-Type" : "application/json"},
            body : JSON.stringify({
                mbtiPoint : totalPoint+'',
                mbtiType : mbtiType,
                customerId : '${loginVO.id}'
            })
        }).then(res=>res.json()).then(response=>{
            $('#mbtiSection').hide()
            $('#loading').show()
            getCustomerMbtiType()
            setTimeout(function() {
                $('#loading').hide()
                if(mbtiType == 'L'){
                    $('#resultSectionL').show()
                }else if(mbtiType == 'M'){
                    $('#resultSectionM').show()
                }else{
                    $('#resultSectionH').show()
                }
                $('#buildingSection').show()
            }, 3000);



        })
    })
    async function getCustomerMbtiType(){
        let obj = {}
        await fetch('${pageContext.request.contextPath}/getCustomerMbtiType?customerId=${loginVO.id}').then(res=>res.json()).then(response=>{
            if(response != null){
                getPrStck(response[0].FID+'').then(
                    res => {
                        $('#prStck').text('현재가 : '+res+' 원')
                    }
                )
                $('#buildingName').text(response[0].BUILDING_NAME)
                $('#buildingLocation').text(response[0].LOCATION)
                $('#buildingPoint1').text(response[0].POINT_HEAD1)
                $('#buildingPoint2').text(response[0].POINT_HEAD2)
                $('#buildingPoint3').text(response[0].POINT_HEAD3)
                $('#buildingImage').attr('src','/finalproject1/resources/images/detail/'+response[0].IMAGE_NAME1)
                $('#getBuildingDetail').attr('href','${pageContext.request.contextPath}/building/detail?propertyNo='+response[0].PROPERTY_NO+'&buildingNo='+response[0].BUILDING_NO)
                obj = response[0]
            }
        })
        return obj;
    }
    async function getPrStck(fid){
        let prStck


        const headers = {"Content-Type":"application/json",
            "authorization": 'Bearer '+ACCESS_TOKEN,
            "appKey":APP_KEY,
            "appSecret":APP_SECRET,
            "tr_id":"FHKST01010100",
        }
        try {
            await fetch('http://localhost:3001/uapi/domestic-stock/v1/quotations/inquire-price?fid_cond_mrkt_div_code=J&fid_input_iscd='+fid,{headers}).then(
                (res) => res.json()
            ).then(response=>{
                prStck = (response.output.stck_prpr*1).toLocaleString('ko-KR')
            })
        }catch (error) {
            console.log('error')
        }
        return prStck
    }


</script>

</body>
</html>
