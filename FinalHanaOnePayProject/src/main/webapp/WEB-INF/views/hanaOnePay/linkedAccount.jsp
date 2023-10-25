<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-19
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>joinHanaOnePay</title>
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

        /*아코디언 css*/
        *{
            box-sizing: border-box;
        }

        .que:first-child{
            border-top: 1px solid black;
        }

        .que{
            position: relative;
            padding: 17px 0;
            cursor: pointer;
            font-size: 14px;
            border-bottom: 1px solid #dddddd;

        }

        .que::before{
            display: inline-block;
            content: 'Q';
            font-size: 14px;
            color: #006633;
            margin: 0 5px;
        }

        .que.on>span{
            font-weight: bold;
            color: #006633;
        }

        .anw {
            display: none;
            overflow: hidden;
            font-size: 14px;
            background-color: #f4f4f2;
            padding: 27px 0;
        }

        .anw::before {
            display: inline-block;
            content: 'A';
            font-size: 14px;
            font-weight: bold;
            color: #666;
            margin: 0 5px;
        }

        .arrow-wrap {
            position: absolute;
            top:50%; right: 10px;
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

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<%--사이드바 시작--%>
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
                        <li><a href="/api/linkedAccount" class="link-body-emphasis d-inline-flex text-decoration-none rounded">연동카드조회</a></li>
                        <li><a href="/hanaOnePay/selectPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">하나원페이카드 조회</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    거래내역조회
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">월사용금액 조회</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">명세서 조회</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                    내 소비분석
                </button>
                <div class="collapse" id="orders-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">New</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Processed</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Shipped</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Returned</a></li>
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
<%--사이드바 끝--%>



    <div id="Accordion_wrap" class="AccAccordion">
        <h2>연동계좌 조회</h2>
        <div class="que">
            <span>하나</span>
            <div class="arrow-wrap">
                <span class="arrow-top">↑</span>
                <span class="arrow-bottom">↓</span>
            </div>

        </div>
        <div class="anw">
            <span>This is first answer.</span>
        </div>
        <div class="que">
            <span>우리</span>
        </div>
        <div class="anw">
            <span>This is second answer.</span>
        </div>
        <div class="que">
            <span>신한</span>
        </div>
        <div class="anw">
            <span>This is third answer.</span>
        </div>
        <div class="que">
            <span>KB국민</span>
        </div>
        <div class="anw">
            <span>This is third answer.</span>
        </div>
    </div>

</div>
    <%@ include file="/WEB-INF/views/comm/footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>
    $(".que").click(function() {
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });
</script>

</body>
</html>
