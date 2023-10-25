<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <style>
body {
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #00857E;
}

.customerInfo {
    width: 80%;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    border-radius: 10px;
}

.customerInfo h2 {
    text-align: center;
    color: #333;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.customerInfo p {
    margin-bottom: 10px;
}

.customerInfo a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #00857E;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
}

.customerInfo a:hover {
    background-color: #BCD9D3;
}

        </style>
</head>
<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<div class="customerInfo">
    <h2>마이페이지</h2>
        <p>고객ID : ${customer.customerId}</p>
        <input type="hidden" name="password" value="${customer.password}">
        <input type="hidden" name="status" value="${customer.status}">
        <p>이름 : ${customer.name}</p>
        <input type="hidden" name="identityNumber" value="${customer.identityNumber}">
        <p>전화번호 : ${customer.phoneNumber}</p>
        <p>이메일 : ${customer.email}</p>
        <p>주소 : ${customer.address}</p>
        <input type="hidden" name="joinDate" value="${customer.joinDate}">
        <a href="/customer/customer_update">회원정보수정</a>
</div>

<div>
    <a href="/card/joinHanaOnePay">하나페이등록</a>
</div>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>

</body>
</html>