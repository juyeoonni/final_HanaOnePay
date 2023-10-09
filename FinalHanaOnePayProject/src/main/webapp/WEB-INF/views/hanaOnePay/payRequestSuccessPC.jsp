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
    <title>주문완료</title>
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
            width: 300px !important;
            height: 50px !important;
            border: none;
            border-radius: 10px;
            margin-left: 260px;
            font-size: 20px;
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
            /*width: 400px;*/
            /*height: 300px;*/
        }

        .transparentButton {
            opacity: 0;
            background-color: transparent;
            border: none;
        }

        .scrolled-down {
            /* 여기에 요소가 스크롤될 때 적용할 스타일을 추가합니다. */
            position: fixed;
            top: 0;
            left: 0;
            /* 추가 스타일을 여기에 추가하세요. */
        }

        .scrolled-right {
            /* 여기에 요소가 스크롤될 때 오른쪽으로 내려가는 스타일을 추가합니다. */
            position: fixed;
            top: 0;
            right: 0;
            /* 추가 스타일을 여기에 추가하세요. */
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
            align-items: center; /* 수직 중앙 정렬을 위해 추가 */
            justify-content: center; /* 수평 중앙 정렬 */
            padding: 10px; /* 필요에 따라 패딩을 조절 */
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

        /* 스크롤 가능한 디브의 스타일 설정 */
        .scrollable-div {
            background-color: #FFFFFF;
            height: 250px; /* 디브의 높이 설정 */
            overflow: auto; /* 스크롤 가능하도록 설정 */
            border: 1px solid #ccc; /* 테두리 스타일 설정 */
            padding: 10px; /* 내부 여백 설정 */
        }

        .useBtn {
            border: none;
            background-color: #00857E;
            color: #FFFFFF;
            border-radius: 5px;
        }

        /*토글*/
        label {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }

        [type="checkbox"] {
            appearance: none;
            position: relative;
            border: max(2px, 0.1em) solid gray;
            border-radius: 1.25em;
            width: 2.25em;
            height: 1.25em;
        }

        [type="checkbox"]::before {
            content: "";
            position: absolute;
            left: 0;
            width: 1em;
            height: 1em;
            border-radius: 50%;
            transform: scale(0.8);
            background-color: gray;
            transition: left 250ms linear;
        }

        [type="checkbox"]:checked {
            background-color: #00857E;
            border-color: #00857E;
        }

        [type="checkbox"]:checked::before {
            background-color: white;
            left: 1em;
        }

        [type="checkbox"]:disabled {
            border-color: lightgray;
            opacity: 0.7;
            cursor: not-allowed;
        }

        [type="checkbox"]:disabled:before {
            background-color: lightgray;
        }

        [type="checkbox"]:disabled + span {
            opacity: 0.7;
            cursor: not-allowed;
        }

        [type="checkbox"]:focus-visible {
            outline-offset: max(2px, 0.1em);
            outline: max(2px, 0.1em) solid #00857E;
        }

        [type="checkbox"]:enabled:hover {
            box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
        }

        /* Global CSS */
        body {
            display: grid;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        fieldset {
            border: none;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        /*포인트사용 인풋박스*/
        #usePointInput {
            padding: 4px; /* 내부 패딩으로 텍스트와 인풋 박스 경계 사이의 간격을 설정 */
            font-size: 16px; /* 폰트 크기 설정 */
            border: 2px solid #ddd; /* 테두리 설정 */
            border-radius: 5px; /* 테두리 둥글게 */
            outline: none; /* 포커스 시 생기는 기본 테두리 스타일 제거 */
            width: 200px; /* 너비 설정 */
            height: 30px;
            transition: border-color 0.3s ease; /* 테두리 색상 변화에 애니메이션 효과 추가 */
        }

        #usePointInput:disabled {
            background-color: #f3f3f3; /* 비활성화 상태의 배경색 */
            cursor: not-allowed; /* 비활성화 상태의 마우스 커서 스타일 */
        }

        #usePointInput:focus {
            border-color: #00857E; /* 포커스 상태의 테두리 색상 */
        }

        .hanaMoney {
            display: flex; /* Flexbox를 사용하여 .hanaMoney의 자식 요소들을 수평 정렬 */
            align-items: center; /* 자식 요소들을 수직으로 가운데 정렬 */
        }

        .hanaMoney h4.mb-3 {
            margin-right: 20px; /* 오른쪽 여백을 추가하여 h4와 fieldset 사이에 간격 제공 */
        }

        .hanaMoney fieldset {
            margin: 0; /* 기본 margin을 0으로 설정하여 불필요한 간격 제거 */
        }

        /*계좌선택 체크박스*/
        .custom-checkbox {
            width: 20px;
            height: 20px;
            border: 2px solid #00857E;
            border-radius: 50%;
            margin-right: 10px;
            position: relative;
            cursor: pointer;
        }

        input[type="radio"]:checked + .custom-checkbox {
            background-color: #00857E;
        }

        input[type="radio"]:checked + .custom-checkbox::before {
            content: "";
            position: absolute;
            width: 12px;
            height: 12px;
            background-color: white;
            border-radius: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* 각 계좌 디브에 대해 아래와 같은 CSS 스타일을 추가합니다. */
        #accountCollapse .accordion-body > div {
            margin-bottom: 15px; /* 원하는 간격 값으로 설정 */
        }

        /* 활성화된 아코디언의 버튼 배경색 변경 */
        .accordion-button:not(.collapsed) {
            background-color: #00857E; /* 원하는 색으로 변경 */
        }

        .list-group-item .text.right-aligned {
            text-align: right;
            width: 100%; /* 요소의 전체 너비를 차지하도록 지정 */
        }

        .pay-Info {
            background-color: #FFFFFF;
            margin-right: 8px;
            border: none;
            border-radius: 5px;
            padding: 13px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .userInfo {
            background-color: #FFFFFF;
            margin-right: 8px;
            border: none;
            border-radius: 5px;
            padding: 13px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .deliveryInfo {
            background-color: #FFFFFF;
            margin-right: 8px;
            border: none;
            border-radius: 5px;
            padding: 13px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .hanaMoney {
            background-color: #FFFFFF;
            margin-right: 8px;
            border: none;
            border-radius: 5px;
            padding: 13px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* 왼쪽 정렬 */
        }

        .payMethod {
            background-color: #FFFFFF;
            margin-right: 8px;
            border: none;
            border-radius: 5px;
            padding: 13px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 스크롤 시 우측에 고정되는 스타일*/
        /*.scrolled-right {*/
        /*    position: fixed;*/
        /*    right: 0; !* 오른쪽에 고정 *!*/
        /*    top: 340px; !* 위에 고정 *!*/
        /*    width: 300px; !* 원하는 너비로 조절 *!*/
        /*    background-color: #fff; !* 배경색을 설정하세요. *!*/
        /*    padding: 10px;*/
        /*    border: 1px solid #ddd;*/
        /*}*/

        #scrolling-element {
            position: fixed;
            right: 0;
            top: 500px;
            /* bottom: 100px; */
            width: 500px;
            background-color: #fff;
            padding: 10px;
            border: 1px solid #ddd;
            transition: none;
            /* margin-top: 20%; */
            /* padding: 5%; */
            /* margin-bottom: 10%; */
        }

        .row {
            position: relative;
        }

        .scroll-box {
            position: fixed;
            max-height: 100%; /* 혹은 .row의 높이 값에 따라 조정 */
            overflow-y: auto;
        }

        .hanaBankAccount {
            display: flex;
            align-items: center;
            color: #FFFFFF;
            width: 600px;
            height: 60px;
            border-radius: 5px;
            padding: 20px;
            background-color: #BCD9D3; /* 하나은행에 대한 예시 배경색 */
            margin-bottom: 10px; /* 각 계좌 항목 사이에 간격을 주기 위해 추가 */
        }

        .hanaBankAccount img {
            margin-right: 15px;
        }

        .bill{
            color: #FFFFFF !important;
            background-color: #00857E !important;
            text-align: center;
            border-radius: 5px !important;
            border: #00857E 3px solid !important;
            width: 100px !important;
            height: 40px !important;
            margin-left: 46% !important;
        }

        .receipt {
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .receipt::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 10px;
            background: linear-gradient(90deg, transparent 10px, white 10px, white 20px, transparent 20px);
            background-size: 20px 10px;
        }




    </style>


</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp" %>


<main>
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
                    <li class="nav-item"><a class="nav-link" href="#!">팍팍딜</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">기획전</a>
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
                <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주문완료</font></font>
                </h2>
                <div><font style="vertical-align: inherit; font-size: 16px; color: #959595;"><font
                        style="vertical-align: inherit;">결제가 완료되었습니다.</font></font></div>
                <br>

                <%--                stepper--%>
                <div class="container pb-5 mb-sm-4">

                    <!-- Progress-->
                    <div class="steps">
                        <div class="steps-header">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="40"
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
                            <div class="step step-completed"><span class="step-indicator"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-check"><polyline
                                    points="20 6 9 17 4 12"></polyline></svg></span><span class="step-icon"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-settings"><path
                                    d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline
                                    points="22 4 12 14.01 9 11.01"></polyline></svg></span>주문서 작성
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
                                    d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></span>
                                결제 확인
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
            </div>
            <%--                stepper 끝--%>

            <div class="paySuccessPage">
                <img src="/img/paySuccess.gif" alt="paySuccess" style="width: 20%; height: 20%; margin-left: 40%; margin-top: -8%;"><br>
                <div style="text-align: center; font-weight: bold; font-size: 25px;">
                결제가 <br>
                완료되었습니다 <br>
                    <p style="font-size: 18px; color: #959595; margin-top: 6px;">하나원쇼핑을 이용해주셔서 감사합니다</p>
                </div>
                <button type="button" class="btn bill" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    영수증 확인
                </button>
            </div>


            <!-- 영수증 Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <img src="/img/hanaLogo.png" alt="하나원페이 로고"
                                 style="margin-right: 10px; width: 45px; height: 45px;">
                            <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">
                                하나원쇼핑</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body receipt">
                            <h3>영수증</h3>
                            <p>=============================================</p>
                            <div class="receipt-content">
                                <div class="receipt-info">
                                    <p>가맹점명: 하나원쇼핑</p>
                                    <p>대표자: 정주연</p>
                                    <p>대표번호: 1800-1111</p>
                                    <p>주소: 서울특별시 중구 을지로 66</p>
                                    <p>=============================================</p>
                                    <p>결제카드: 6894-****-****-1029</p>
                                    <p>결제구분: 일시불</p>
                                    <p>승인번호: 521422</p>
                                    <p>승인일시: ${time}</p>
                                    <p>--------------------------------------------------</p>
                                    <h5>총 결제 금액 <p style="color: #00857E">319,000원</p></h5>


                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>





        </main>
    </body>
    <!-- 푸터위치 -->
    <%@ include file="/WEB-INF/views/comm/footer.jsp" %>


    <script>
        // input 요소에 값을 입력할 때 호출되는 함수
        function formatNumberInput() {
            const inputElement = document.getElementById('usePointInput');
            let value = inputElement.value.replace(/\D/g, ''); // 숫자 이외의 문자 제거
            value = parseInt(value).toLocaleString(); // 숫자를 세 자리마다 쉼표로 구분하여 포맷팅

            if (value === 'NaN') {
                // 값이 "NaN"인 경우, 화면에서 숨기기
                inputElement.value = 0;
            } else {
                inputElement.value = value; // 포맷팅된 값과 ' 원'을 추가하여 표시
            }
        }

        // input 요소에 이벤트 핸들러 등록
        const inputElement = document.getElementById('usePointInput');
        inputElement.addEventListener('input', formatNumberInput);

        // 초기화할 때 한 번 호출하여 현재 값 포맷팅
        formatNumberInput();


        const productPrice = parseInt("${productPrice}");
        const newProductPrice = parseInt("${productPrice}");
        const hanaMoney = parseInt("${hanaMoney}");

        // 숫자를 세 자리마다 쉼표로 구분하여 표시합니다.
        const formattedPrice = productPrice.toLocaleString();
        const formattedHanaMoney = hanaMoney.toLocaleString();

        // formattedPrice를 화면에 표시합니다.
        document.getElementById('productPriceDisplay').innerText = formattedPrice;
        document.getElementById('realProductPriceDisplay').innerText = formattedPrice;
        document.getElementById('hanaMoneyDisplay').innerText = formattedHanaMoney;


        function toggleInput() {
            const checkbox = document.getElementById('agreeCheckbox');
            const input = document.getElementById('usePointInput');

            if (checkbox.checked) {
                input.removeAttribute('disabled');
            } else {
                input.setAttribute('disabled', 'disabled');
            }
        }

        function checkAgreement() {
            const checkbox = document.getElementById('agreeCheckbox');
            if (!checkbox.checked) {
                alert('동의해주세요!');
            }
        }


        function useAllPoints() {
            const initialHanaMoney = parseInt("${hanaMoney}");
            document.getElementById('usePointInput').value = initialHanaMoney.toLocaleString();
            calculateNewAmounts();
        }

        function calculateNewAmounts() {
            const initialHanaMoney = parseInt("${hanaMoney}");
            const initialProductPrice = parseInt("${productPrice}");

            let usePoint = parseInt(document.getElementById('usePointInput').value) || 0;

            if (usePoint > initialHanaMoney) {
                usePoint = initialHanaMoney;
                document.getElementById('usePointInput').value = usePoint;
            }

            const newHanaMoney = initialHanaMoney - usePoint;
            const newProductPrice = initialProductPrice - usePoint;

            const formattedProductPrice = newProductPrice.toLocaleString();

            document.getElementById('hanaMoneyDisplay').innerText = newHanaMoney.toLocaleString();
            document.getElementById('productPriceDisplay').innerText = newProductPrice.toLocaleString();
            document.getElementById('usePointDisplay').innerText = usePoint.toLocaleString();
        }


        function redirectToSuccessPage() {
            window.location.href = "/hanaOnePay/payRequestSuccessPC";
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

        document.addEventListener('DOMContentLoaded', function () {
            const hanaOnePayRadio = document.getElementById('hanaOnePay');
            const accountPayRadio = document.getElementById('accountPay');  // accountPay radio 버튼
            const payButton = document.querySelector('.btn-pay');

            payButton.addEventListener('click', function (event) {
                if (hanaOnePayRadio.checked) {
                    event.preventDefault(); // 폼의 기본 제출을 방지합니다.
                    const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
                    modal.show();
                } else if (accountPayRadio.checked) {  // accountPay radio 버튼이 체크된 경우
                    event.preventDefault();
                    const paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
                    paymentModal.show();
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

        // 0922
        $(document).ready(function () {
            // 결제하기 버튼을 누르면 실행될 이벤트
            $('[data-bs-target="#secondModal"]').on('click', function () {

                let productName = $(this).data('product-name'); // 버튼의 data-product-name 값 가져오기
                let encodedProductName = encodeURIComponent(productName); // productName 인코딩

                // QR 코드 생성 API 요청
                $.get("/QR/api/generateQRCode", {productName: encodedProductName}, function (data, status) { // 인코딩된 productName을 매개변수로 추가
                    if (status === "success") {
                        // base64로 인코딩된 응답 데이터를 이미지로 변환하여 .createQR div에 삽입
                        $('.createQR').html('<img src="data:image/png;base64,' + data + '" alt="QR Code"/>');
                    } else {
                        console.error("Error generating QR code");
                    }
                });
            });
        });

        // $(document).ready(function () {
        //     $('[data-bs-target="#secondModal"]').on('click', function () {
        //         let productName = $(this).data('product-name');
        //
        //         // data attribute에서 상품의 원래 가격 가져오기
        //         let originalProductPrice = parseInt($('#productInfo').data('product-price'));
        //
        //         let usedPoint = parseInt($('#usePointInput').val()) || 0;
        //         let finalProductPrice = originalProductPrice - usedPoint;
        //
        //         let encodedProductName = encodeURIComponent(productName);
        //
        //         $.get("/QR/api/generateQRCode", {productName: encodedProductName, price: finalProductPrice}, function (data, status) {
        //             if (status === "success") {
        //                 $('.createQR').html('<img src="data:image/png;base64,' + data + '" alt="QR Code"/>');
        //             } else {
        //                 console.error("Error generating QR code");
        //             }
        //         });
        //     });
        // });

        // 페이지 스크롤 자스
        // 페이지가 로드되면 스크롤 이벤트를 추가
        // document.addEventListener("DOMContentLoaded", function () {
        //     var element = document.getElementById("scrolling-element");
        //     var initialTop = 640;
        //
        //     window.addEventListener("scroll", function () {
        //         var scrollPosition = window.scrollY;
        //
        //         if (scrollPosition >= initialTop) {
        //             element.style.top = scrollPosition + "px";
        //         } else {
        //             element.style.top = initialTop + "px";
        //         }
        //     });
        // });

        // // 페이지가 로드될 때 아코디언을 비활성화 상태로 설정합니다.
        // document.addEventListener("DOMContentLoaded", function() {
        //     var accountAccordion = new bootstrap.Collapse(document.getElementById("accountCollapse"), {
        //         toggle: false
        //     });
        // });
        //
        // "계좌 간편결제" 라디오 버튼 클릭 시 아코디언을 활성화합니다.

        document.getElementById("accountPay").addEventListener("click", function () {
            var accountAccordion = new bootstrap.Collapse(document.getElementById("accountCollapse"), {
                toggle: true
            });
        });

        var accountData = JSON.parse(sessionStorage.getItem("accountData"));
        console.log("accountData:", accountData);
        document.addEventListener("DOMContentLoaded", function () {
            if (accountData) {
                var accountList = document.querySelector("#accountCollapse .accordion-body");
                console.log("accountList:", accountList)

                accountData.forEach(function (account, index) {
                    console.log("account:", account);
                    var accountDiv = document.createElement("div");
                    var label = document.createElement("label");
                    var input = document.createElement("input");
                    var accInfoDiv = document.createElement("div");
                    var accNameDiv = document.createElement("div");
                    var accNumberDiv = document.createElement("div");
                    var bankImg = document.createElement("img");

                    // input 엘리먼트의 값으로 account.accNumber 설정
                    input.value = account.accNumber;
                    input.addEventListener('change', function() {
                        // 선택된 계좌번호 읽어와서 sessionStorage에 저장
                        sessionStorage.setItem('selectedAccountNumber', this.value);
                        console.log("저장된 계좌번호:", this.value);
                    });

                    // 계좌 번호에 따른 은행 이름과 로고 설정
                    let bankName = "";
                    if (account.accNumber.includes("1002")) {
                        bankName = "우리은행";
                        bankImg.src = "/img/bank/bankName=woori.png";
                    } else if (account.accNumber.includes("110")) {
                        bankName = "신한은행";
                        bankImg.src = "/img/bank/bankName=shinhan.png";
                    } else if (account.accNumber.includes("04")) {
                        bankName = "국민은행";
                        bankImg.src = "/img/bank/bankName=KB.png";
                    }

                    accNameDiv.textContent = bankName + " - " + account.accName;

                    // accInfoDiv 스타일 설정 및 flexbox 적용
                    accInfoDiv.style.display = "flex";            // flexbox를 사용하여 이미지와 텍스트를 가로로 배치
                    accInfoDiv.style.alignItems = "center";       // 내용을 수직 중앙에 배치
                    accInfoDiv.style.color = "#FFFFFF";
                    accInfoDiv.style.width = "600px";
                    accInfoDiv.style.height = "60px";
                    accInfoDiv.style.borderRadius = "5px";
                    accInfoDiv.style.padding = "20px";

                    // 계좌 번호에 따른 배경색 설정
                    if (account.accNumber.includes("1002")) {
                        accInfoDiv.style.backgroundColor = "#0182CD";
                    } else if (account.accNumber.includes("110")) {
                        accInfoDiv.style.backgroundColor = "#3253BC";
                    } else if (account.accNumber.includes("04")) {
                        accInfoDiv.style.backgroundColor = "#7C7268";
                    }

                    // 커스텀 체크박스 스타일링
                    input.type = "radio";
                    input.id = "account" + (index + 1); // 각 체크박스에 고유한 ID 부여
                    input.name = "account";
                    input.value = "account" + (index + 1);
                    input.style.display = "none"; // 기본 체크박스 숨기기

                    var customCheckbox = document.createElement("span");
                    customCheckbox.classList.add("custom-checkbox");

                    label.style.display = "flex";
                    label.style.alignItems = "center";
                    label.htmlFor = input.id; // 라벨 연결

                    bankImg.style.marginRight = "15px";

                    label.appendChild(input);
                    label.appendChild(customCheckbox);
                    accInfoDiv.appendChild(bankImg);
                    accInfoDiv.appendChild(accNameDiv);
                    accInfoDiv.appendChild(accNumberDiv);
                    label.appendChild(accInfoDiv);

                    accountDiv.appendChild(label);
                    accountList.appendChild(accountDiv);
                });
            }
        });


        // 기존 함수
        // document.getElementById("accountPay").addEventListener("click", function() {
        //     var accountAccordion = new bootstrap.Collapse(document.getElementById("accountCollapse"), {
        //         toggle: true
        //     });
        // });
        //
        // var accountData = JSON.parse(sessionStorage.getItem("accountData"));
        //
        // document.addEventListener("DOMContentLoaded", function () {
        //     if (accountData) {
        //         var accountList = document.querySelector("#accountCollapse .accordion-body");
        //
        //         accountData.forEach(function (account, index) {
        //             var label = document.createElement("label");
        //             var input = document.createElement("input");
        //             var br = document.createElement("br");
        //             var labelText = document.createTextNode(" " + account.accName + " : " + account.accNumber);
        //
        //             input.type = "radio";
        //             input.name = "account";
        //             input.value = "account" + (index + 1);
        //
        //             label.appendChild(input);
        //             label.appendChild(labelText);
        //
        //             // 줄 바꿈 추가
        //             accountList.appendChild(label);
        //             accountList.appendChild(document.createElement("br"));
        //         });
        //     }


        // "계좌 간편결제" 라디오 버튼 클릭 시 아코디언 활성화
        // document.getElementById("accountPay").addEventListener("click", function () {
        //     var accountAccordion = new bootstrap.Collapse(document.getElementById("accountCollapse"), {
        //         toggle: true
        //     });
        // });

        // 체크된 계좌번호를 가져오는 함수
        function getCheckedAccountNumber() {
            var radios = document.getElementsByName("account");
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    var selectedAccountNumber = accountData[i].accNumber;
                    sessionStorage.setItem('selectedAccountNumber', selectedAccountNumber);
                    return selectedAccountNumber;
                }
            }
            return null; // 선택된 계좌 없음
        }

        // 계좌 선택시 저장
        document.querySelectorAll('input[name="account"]').forEach(function (radio) {
            radio.addEventListener('change', getCheckedAccountNumber);
        });

        //시작
        $(document).ready(function () {

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
                if (passwordInput.val().length < 6) {
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
                var selectedAccount = getCheckedAccountNumber();
                console.log("getChecked",selectedAccount);

                if (!selectedAccount) {
                    // alert("계좌를 선택해주세요.");
                    return;
                }

                sessionStorage.setItem('selectedAccountNumber', selectedAccount);
                sessionStorage.setItem('productName', productName);
                // sessionStorage.setItem('productPrice', productPrice);

                var paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
                passwordInput.val('');
                dots.removeClass('dot-filled');
                paymentModal.show();
            });

            function getCheckedAccountNumber() {
                var radios = document.getElementsByName("account");
                for (var i = 0; i < radios.length; i++) {
                    if (radios[i].checked) {
                        return accountData[i].accNumber;  // 실제 계좌 번호를 반환
                    }
                }
                return null; // 선택된 계좌 없음
            }


            $("#confirmPayment").click(function () {
                var enteredPassword = passwordInput.val();
                var sessionPassword = '<%= session.getAttribute("payPw") %>';

                var selectedAccountNumber = sessionStorage.getItem('selectedAccountNumber');
                var productName = "<%= session.getAttribute("productName") %>";
                //var productPrice = document.getElementById("productPriceDisplay").textContent;
                var productPrice = document.getElementById("productPriceDisplay").getAttribute("data-raw-price");

                sessionStorage.setItem('productPrice', document.getElementById("productPriceDisplay").textContent);
                var identityNumber = "${sessionScope.identityNumber}";

                // 콘솔에 정보 출력
                console.log("선택한 계좌번호:", selectedAccountNumber);
                console.log("상품명:", productName);
                console.log("상품금액:", productPrice);
                console.log("주민번호:", identityNumber);

                if (enteredPassword === sessionPassword) {
                    var requestData = {
                        accountNumber: selectedAccountNumber,
                        productName: productName,
                        productPrice: productPrice,
                        identityNumber: identityNumber
                    };

                    $.ajax({
                        type: "POST",
                        url: "/api/payRequest/account",
                        data: JSON.stringify(requestData),
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {
                            if (response === "Payment Approved") {
                                window.location.href = "/hanaOnePay/payRequestSuccess";
                            } else {
                                alert('결제 실패: ' + response.message);
                                // sessionStorage.setItem('productPrice', document.getElementById("productPriceDisplay").textContent);
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>


</body>
</html>

<%--saveTest--%>