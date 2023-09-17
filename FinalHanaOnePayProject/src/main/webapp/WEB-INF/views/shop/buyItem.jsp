<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주문서 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/shop.css">

    <style>
        .centered-div {
        / display: flex;
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            height: 100vh; /* 브라우저 높이의 100%를 사용 */
            width: 100%; /* 브라우저 너비의 100%를 사용 */
        }

        /* 기본 버튼 스타일 */
        .btn-outline-dark {
            color: #5E5555 !important;
            border-color: #BCD9D3 !important;
            background-color: #BCD9D3 !important;
        }

        /* 마우스를 올렸을 때 버튼 스타일 */
        .btn-outline-dark:hover {
            color: #FFFFFF !important;
            border-color: #00857E !important;
            background-color: #00857E !important;
        }

        .navbar {
            background-color: #F8F9FA !important; /* 원하는 색상 코드를 여기에 입력하세요 */
        }

        /*스태퍼css*/
        body {
            margin-top: 20px;
        }

        .steps {
            border: 1px solid #e7e7e7
        }

        .steps-header {
            padding: .375rem;
            border-bottom: 1px solid #e7e7e7
        }

        .steps-header .progress {
            height: .25rem
        }

        .steps-body {
            display: table;
            table-layout: fixed;
            width: 100%
        }

        .step {
            display: table-cell;
            position: relative;
            padding: 1rem .75rem;
            -webkit-transition: all 0.25s ease-in-out;
            transition: all 0.25s ease-in-out;
            border-right: 1px dashed #dfdfdf;
            color: rgba(0, 0, 0, 0.65);
            font-weight: 600;
            text-align: center;
            text-decoration: none
        }

        .step:last-child {
            border-right: 0
        }

        .step-indicator {
            display: block;
            position: absolute;
            top: .75rem;
            left: .75rem;
            width: 1.5rem;
            height: 1.5rem;
            border: 1px solid #e7e7e7;
            border-radius: 50%;
            background-color: #fff;
            font-size: .875rem;
            line-height: 1.375rem
        }

        .has-indicator {
            padding-right: 1.5rem;
            padding-left: 2.375rem
        }

        .has-indicator .step-indicator {
            top: 50%;
            margin-top: -.75rem
        }

        .step-icon {
            display: block;
            width: 1.5rem;
            height: 1.5rem;
            margin: 0 auto;
            margin-bottom: .75rem;
            -webkit-transition: all 0.25s ease-in-out;
            transition: all 0.25s ease-in-out;
            color: #888
        }

        .step:hover {
            color: rgba(0, 0, 0, 0.9);
            text-decoration: none
        }

        .step:hover .step-indicator {
            -webkit-transition: all 0.25s ease-in-out;
            transition: all 0.25s ease-in-out;
            border-color: transparent;
            background-color: #f4f4f4
        }

        .step:hover .step-icon {
            color: rgba(0, 0, 0, 0.9)
        }

        .step-active,
        .step-active:hover {
            color: rgba(0, 0, 0, 0.9);
            pointer-events: none;
            cursor: default
        }

        .step-active .step-indicator,
        .step-active:hover .step-indicator {
            border-color: transparent;
            background-color: #00857E;
            color: #fff
        }

        .step-active .step-icon,
        .step-active:hover .step-icon {
            color: #959595
        }

        .step-completed .step-indicator,
        .step-completed:hover .step-indicator {
            border-color: transparent;
            background-color: rgba(51, 203, 129, 0.12);
            color: #33cb81;
            line-height: 1.25rem
        }

        .step-completed .step-indicator .feather,
        .step-completed:hover .step-indicator .feather {
            width: .875rem;
            height: .875rem
        }

        @media (max-width: 575.98px) {
            .steps-header {
                display: none
            }

            .steps-body,
            .step {
                display: block
            }

            .step {
                border-right: 0;
                border-bottom: 1px dashed #e7e7e7
            }

            .step:last-child {
                border-bottom: 0
            }

            .has-indicator {
                padding: 1rem .75rem
            }

            .has-indicator .step-indicator {
                display: inline-block;
                position: static;
                margin: 0;
                margin-right: 0.75rem
            }
        }

        .bg-secondary {
            background-color: #f7f7f7 !important;
        }

        .progress-bar {
            background-color: #00857E !important;
        }

        .btn-pay {
            background-color: #00857E !important;
            color: #f7f7f7 !important;
        }

        /* 캐러셀의 너비와 높이를 조절합니다. */
        .carousel {
            width: 100%; /* 원하는 너비로 설정하세요. */
            max-width: 500px; /* 최대 너비를 설정하세요. */
            height: auto; /* 높이를 자동으로 조절하려면 auto로 설정하세요. */
            /* height: 300px; 높이를 고정하려면 원하는 높이 값으로 설정하세요. */
        }

        /* 캐러셀 내부 이미지의 크기를 조절합니다. */
        .cardItem {
            width: 228px; /* 원하는 이미지 너비로 설정하세요. */
            height: 145px; /* 이미지 높이를 자동으로 조절하려면 auto로 설정하세요. */
            /* height: 200px; 이미지 높이를 고정하려면 원하는 높이 값으로 설정하세요. */
        }

        .accordion-item {
            width: 400px;
            height: 300px;
        }

        .transparentButton {
            opacity: 0;
            background-color: transparent;
            border: none;
        }



    </style>


</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp" %>


<main>
    <%--    <!-- 정 중앙에 위치할 div -->--%>
    <%--    <div class="centered-div">--%>
    <%--        <div class="page-name">--%>
    <%--            주문서 작성--%>
    <%--        </div>--%>

    <%--        <div class="deliveryAddress">--%>
    <%--            배송지 정보--%>
    <%--        </div>--%>


    <%--    </div>--%>

    <body class="bg-body-tertiary">
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="check2" viewBox="0 0 16 16">
            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
        </symbol>
        <symbol id="circle-half" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"></path>
        </symbol>
        <symbol id="moon-stars-fill" viewBox="0 0 16 16">
            <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"></path>
            <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"></path>
        </symbol>
        <symbol id="sun-fill" viewBox="0 0 16 16">
            <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"></path>
        </symbol>
    </svg>

    <div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
        <button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center" id="bd-theme" type="button"
                aria-expanded="false" data-bs-toggle="dropdown" aria-label="테마 전환(자동)">
            <svg class="bi my-1 theme-icon-active" width="1em" height="1em">
                <use href="#circle-half"></use>
            </svg>
            <span class="visually-hidden" id="bd-theme-text"><font style="vertical-align: inherit;"><font
                    style="vertical-align: inherit;">테마 전환</font></font></span>
        </button>
        <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
            <li>
                <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light"
                        aria-pressed="false">
                    <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                        <use href="#sun-fill"></use>
                    </svg>
                    <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        빛
                    </font></font>
                    <svg class="bi ms-auto d-none" width="1em" height="1em">
                        <use href="#check2"></use>
                    </svg>
                </button>
            </li>
            <li>
                <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark"
                        aria-pressed="false">
                    <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                        <use href="#moon-stars-fill"></use>
                    </svg>
                    <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        어두운
                    </font></font>
                    <svg class="bi ms-auto d-none" width="1em" height="1em">
                        <use href="#check2"></use>
                    </svg>
                </button>
            </li>
            <li>
                <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto"
                        aria-pressed="true">
                    <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                        <use href="#circle-half"></use>
                    </svg>
                    <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        자동
                    </font></font>
                    <svg class="bi ms-auto d-none" width="1em" height="1em">
                        <use href="#check2"></use>
                    </svg>
                </button>
            </li>
        </ul>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!">하나원쇼핑</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="/img/buyItemStar.png" alt="" width="300" height="150">
                <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주문서 작성</font></font>
                </h2>

                <%--                stepper--%>
                <div class="container pb-5 mb-sm-4">

                    <!-- Progress-->
                    <div class="steps">
                        <div class="steps-header">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 40%" aria-valuenow="40"
                                     aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="steps-body">
                            <div class="step step-completed"><span class="step-indicator"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-check"><polyline
                                    points="20 6 9 17 4 12"></polyline></svg></span><span class="step-icon"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-check-circle"><path
                                    d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline
                                    points="22 4 12 14.01 9 11.01"></polyline></svg></span>상품 선택
                            </div>
                            <div class="step step-active"><span class="step-indicator"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-check"><polyline
                                    points="20 6 9 17 4 12"></polyline></svg></span><span class="step-icon"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12"
                                                                                                     r="3"></circle><path
                                    d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></span>주문서
                                작성
                            </div>
                            <div class="step"><span class="step-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                           height="24" viewBox="0 0 24 24" fill="none"
                                                                           stroke="currentColor" stroke-width="2"
                                                                           stroke-linecap="round"
                                                                           stroke-linejoin="round"
                                                                           class="feather feather-award"><circle cx="12"
                                                                                                                 cy="8"
                                                                                                                 r="7"></circle><polyline
                                    points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg></span>입금/결제 확인
                            </div>
                            <div class="step"><span class="step-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                           height="24" viewBox="0 0 24 24" fill="none"
                                                                           stroke="currentColor" stroke-width="2"
                                                                           stroke-linecap="round"
                                                                           stroke-linejoin="round"
                                                                           class="feather feather-truck"><rect x="1"
                                                                                                               y="3"
                                                                                                               width="15"
                                                                                                               height="13"></rect><polygon
                                    points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon><circle cx="5.5" cy="18.5"
                                                                                                r="2.5"></circle><circle
                                    cx="18.5" cy="18.5" r="2.5"></circle></svg></span>배송
                            </div>
                            <div class="step"><span class="step-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                           height="24" viewBox="0 0 24 24" fill="none"
                                                                           stroke="currentColor" stroke-width="2"
                                                                           stroke-linecap="round"
                                                                           stroke-linejoin="round"
                                                                           class="feather feather-home"><path
                                    d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline
                                    points="9 22 9 12 15 12 15 22"></polyline></svg></span>배송 완료
                            </div>
                        </div>
                    </div>
                    <!-- Footer-->

                </div>
                <%--                stepper 끝--%>


            </div>

            <div class="row g-3">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">쇼핑 카트</font></font></span>
                        <span class="badge bg-secondary rounded-pill"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">삼</font></font></span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">상품명 : ${productName}</font></font></h6>
                                <small class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">간단한 설명</font></font></small>
                            </div>
                            <span class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">${productPrice}</font></font></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">두 번째 제품</font></font></h6>
                                <small class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">간단한 설명</font></font></small>
                            </div>
                            <span class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">$8</font></font></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">세 번째 항목</font></font></h6>
                                <small class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">간단한 설명</font></font></small>
                            </div>
                            <span class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">$5</font></font></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between bg-body-tertiary">
                            <div class="text-success">
                                <h6 class="my-0"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">프로모션 코드</font></font></h6>
                                <small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">예시코드</font></font></small>
                            </div>
                            <span class="text-success"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">-$5</font></font></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">총액(USD)</font></font></span>
                            <strong><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">$20</font></font></strong>
                        </li>
                    </ul>

                    <form class="card p-2">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="프로모션 코드">
                            <button type="submit" class="btn btn-secondary"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">확인</font></font></button>
                        </div>
                    </form>
                </div>
                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">청구지
                        주소</font></font></h4>
                    <form class="needs-validation" novalidate="">
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">이름</font></font></label>
                                <input type="text" class="form-control" id="firstName" placeholder="" value=""
                                       required="">
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    유효한 이름을 입력하세요.
                                </font></font></div>
                            </div>

                            <div class="col-sm-6">
                                <label for="lastName" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">성</font></font></label>
                                <input type="text" class="form-control" id="lastName" placeholder="" value=""
                                       required="">
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    올바른 성을 입력하세요.
                                </font></font></div>
                            </div>

                            <div class="col-12">
                                <label for="username" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">사용자 이름</font></font></label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text"><font style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">@</font></font></span>
                                    <input type="text" class="form-control" id="username" placeholder="사용자 이름"
                                           required="">
                                    <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">
                                        귀하의 사용자 이름이 필요합니다.
                                    </font></font></div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="email" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">이메일 </font></font><span
                                        class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">(선택사항)</font></font></span></label>
                                <input type="email" class="form-control" id="email" placeholder="you@example.com">
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    배송 업데이트를 받으려면 유효한 이메일 주소를 입력하세요.
                                </font></font></div>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">주소</font></font></label>
                                <input type="text" class="form-control" id="address" placeholder="1234 퍼스트 스트리트"
                                       required="">
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    배송지 주소를 입력해주세요.
                                </font></font></div>
                            </div>

                            <div class="col-12">
                                <label for="address2" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">제목 2 </font></font><span
                                        class="text-body-secondary"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">(선택사항)</font></font></span></label>
                                <input type="text" class="form-control" id="address2" placeholder="아파트먼트 24">
                            </div>

                            <div class="col-md-5">
                                <label for="country" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">국가</font></font></label>
                                <select class="form-select" id="country" required="">
                                    <option value=""><font style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">선택하다...</font></font></option>
                                    <option><font style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">미국</font></font></option>
                                </select>
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    유효한 국가를 선택하세요.
                                </font></font></div>
                            </div>

                            <div class="col-md-4">
                                <label for="state" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">지역</font></font></label>
                                <select class="form-select" id="state" required="">
                                    <option value=""><font style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">선택하다...</font></font></option>
                                    <option><font style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">캘리포니아</font></font></option>
                                </select>
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    유효한 지역 이름을 선택하세요.
                                </font></font></div>
                            </div>

                            <div class="col-md-3">
                                <label for="zip" class="form-label"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">우편 번호</font></font></label>
                                <input type="text" class="form-control" id="zip" placeholder="" required="">
                                <div class="invalid-feedback"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">
                                    우편번호가 필요합니다.
                                </font></font></div>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="same-address">
                            <label class="form-check-label" for="same-address"><font
                                    style="vertical-align: inherit;"><font style="vertical-align: inherit;">귀하의 배송 주소가 내
                                청구서 수신 주소와 동일합니다</font></font></label>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="save-info">
                            <label class="form-check-label" for="save-info"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">다음 시간을 위해 이 정보를 저장하세요.</font></font></label>
                        </div>

                        <hr class="my-4">

                        <h4 class="mb-3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">결제수단</font></font>
                        </h4>

                        <div class="my-3">
                            <div class="form-check">
                                <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked=""
                                       required="">
                                <label class="form-check-label" for="credit"><font
                                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">하나머니
                                    결제</font></font></label>
                            </div>
                            <div class="form-check">
                                <input id="kakaoPay" name="paymentMethod" type="radio" class="form-check-input" required="">
                                <label class="form-check-label" for="cash"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">계좌 간편결제</font></font></label>
                            </div>

                            <div class="form-check">
                                <input id="kakaoPay" name="paymentMethod" type="radio" class="form-check-input" required="">
                                <label class="form-check-label" for="kakaoPay"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">카카오페이</font></font></label>
                            </div>

                            <div class="form-check">
                                <input id="hanaOnePay" name="paymentMethod" type="radio" class="form-check-input">
                                <label class="form-check-label" for="hanaOnePay">하나원페이</label>
                            </div>


                            <!-- 원페이를 위한 Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <img src="/img/hanaLogo.png" alt="하나원페이 로고" style="margin-right: 10px; width: 45px; height: 45px;">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel"  style="font-weight: bold;">하나원페이</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
<%--                                            모달 바디입니다--%>
    <div class="card text-center">
        <div class="card-header">
            <ul class="nav nav-pills card-header-pills">
                <li class="nav-item">
                    <a class="nav-link active" href="#" style="background-color: #00857E; color: white !important;">하나원페이</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">더휴결제</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <img src="/img/hanapayAppIcon.png"  style="margin-right: 10px; width: 250px; height: 130px;">
            <p class="card-text">하나원페이 앱카드로 <br>쉽고 빠르게 결제하세요</p>
            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#secondModal" style="border:none; width: 300px; background-color: #00857E; color: white !important;">결제하기</a>

        </div>
    </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

<%--                            두번째 모달입니다--%>
                            <!-- Second Modal -->
                            <div class="modal fade" id="secondModal" tabindex="-1" aria-labelledby="secondModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <img src="/img/hanaLogo.png" alt="하나원페이 로고" style="margin-right: 10px; width: 45px; height: 45px;">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel2"  style="font-weight: bold;">하나원페이</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body d-flex justify-content-center align-items-center flex-column">
                                            휴대폰으로 스캔하면
                                            결제 화면으로 이동합니다. <br>
                                            <span style="color: #999;">스마트폰 카메라 및 모든 QR 스캐너로 가능</span><br>
                                            <div class="createQR" style="border: 5px solid #00857E; border-radius:25px;">
<%--                                                <img src="/api/generateQRCode" alt="QR Code" />--%>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="transparentButton" onclick="redirectToSuccessPage()">Go to Success Page</button>

                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                            <br><br>
                            <div>주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
                            <hr class="my-4">

                            <button class="w-100 btn btn-pay btn-lg" type="submit"><font
                                    style="vertical-align: inherit;"><font style="vertical-align: inherit;">결제하기</font></font>
                            </button>
                    </form>
                </div>
            </div>
        </main>


    </div>
    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>


    </body>


</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>
    function redirectToSuccessPage() {
        window.location.href = "/hanaOnePay/payRequestSuccess";
    }


    $(document).ready(function () {
        $('#hanaOnePay').change(function () {
            if ($(this).prop('checked')) {
                $('#collapseOne').collapse('show'); // 아코디언 펼치기
            }
        });

        // 다른 결제 수단을 선택할 경우 아코디언 닫기 기능을 위한 코드 (예: PayPal)
        $('#paypal').change(function () {
            if ($(this).prop('checked')) {
                $('#collapseOne').collapse('hide'); // 아코디언 닫기
            }
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const hanaOnePayRadio = document.getElementById('hanaOnePay');
        const payButton = document.querySelector('.btn-pay');

        payButton.addEventListener('click', function(event) {
            if (hanaOnePayRadio.checked) {
                event.preventDefault(); // 폼의 기본 제출을 방지합니다.
                const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
                modal.show();
            }
        });
    });

    // $(document).ready(function(){
    //     // 결제하기 버튼을 누르면 실행될 이벤트
    //     $('[data-bs-target="#secondModal"]').on('click', function(){
    //         // QR 코드 생성 API 요청
    //         $.get("/QR/api/generateQRCode", function(data, status){
    //             if (status === "success") {
    //                 // base64로 인코딩된 응답 데이터를 이미지로 변환하여 .createQR div에 삽입
    //                 $('.createQR').html('<img src="data:image/png;base64,' + data + '" alt="QR Code"/>');
    //             } else {
    //                 console.error("Error generating QR code");
    //             }
    //         });
    //     });
    // });

    $(document).ready(function(){
        // 결제하기 버튼을 누르면 실행될 이벤트
        $('[data-bs-target="#secondModal"]').on('click', function(){
            let productName = $(this).data('product-name'); // 버튼의 data-product-name 값 가져오기
            let encodedProductName = encodeURIComponent(productName); // productName 인코딩

            // QR 코드 생성 API 요청
            $.get("/QR/api/generateQRCode", {productName: encodedProductName}, function(data, status){ // 인코딩된 productName을 매개변수로 추가
                if (status === "success") {
                    // base64로 인코딩된 응답 데이터를 이미지로 변환하여 .createQR div에 삽입
                    $('.createQR').html('<img src="data:image/png;base64,' + data + '" alt="QR Code"/>');
                } else {
                    console.error("Error generating QR code");
                }
            });
        });
    });



</script>

</body>
</html>

<%--saveTest--%>