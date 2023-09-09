<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/nav.css">
</head>

<body>
<header>
    <%-- 로그인이 된 상태이면 로그아웃, 아니면 로그인 --%>
    <% String name = (String) session.getAttribute("name");
       if (name != null) {
    %>
    <div class="col-md-3 text-end">
        <span class="myinfo"><%=name%>님 반갑습니다!</span>
        <a href="/logout" class="custom_login_btn">로그아웃</a>
    <% } else { %>
    <div class="col-md-3 text-end">
        <a href="/customer/customer_login">
            <button type="button" class="custom_login_btn">로그인</button>
        </a>

        <a href="/customer/customer_join">
            <button type="button" class="custom_join_btn">회원가입</button>
        </a>
    <% } %>
    </div>

    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <div class="col-md-3 mb-2 mb-md-0">
                <img class="hanaLogo" src="/img/hanaLogo.png">
                <span class="hana-logo-text">하나원페이</span>
            </div>

            <!-- nav바 버튼 -->
            <ul class="nav">
                <li><a href="/home" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="/card/selectCardList" class="nav-link px-2 link-secondary">마이카드</a></li>
                <li><a href="/customer/selectAllCustomer" class="nav-link px-2">조회</a></li>
                <li><a href="/shop/shopMain" class="nav-link px-2">라이프</a></li>

                <% if (name != null) { %>
                <li><a href="/customer/customer_myHana" class="nav-link px-2">마이하나</a></li>
                <% } %>

                <li><a href="#" class="nav-link px-2">About</a></li>
            </ul>
        </header>
    </div>
</header>
</body>
</html>
