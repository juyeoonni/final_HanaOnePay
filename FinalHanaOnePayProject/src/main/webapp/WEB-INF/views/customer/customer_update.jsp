<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Document</title>
     <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

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
<h2>회원정보수정</h2>
<form id="updateForm" method="post">
    <p>고객ID : <span id="customerId">${customer.customerId}</span></p>
    <input type="hidden" name="customerId" value="${customer.customerId}">

    <p>비밀번호 : <input type="text" name="password" value="${customer.password}"></p>
    <input type="hidden" name="status" value="${customer.status}">
    <p>이름 : <input type="text" name="name" value="${customer.name}"></p>
    <input type="hidden" name="identityNumber" value="${customer.identityNumber}">
    <p>전화번호 : <input type="text" name="phoneNumber" value="${customer.phoneNumber}"></p>
    <p>이메일 : <input type="text" name="email" value="${customer.email}"></p>
    <p>주소 : <input type="text" name="address" value="${customer.address}"></p>
    <input type="hidden" name="joinDate" value="${customer.joinDate}">

    <input type="button" class="button" value="수정완료" onclick="updateFormFunc(); return false;">
</form>
</div>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>

<script>
    function updateFormFunc() {
        const form = document.getElementById('updateForm');
        const formData = new FormData(form);
        const jsonData = {};

        formData.forEach((value, key) => {
            jsonData[key] = value;
        });

        const jsonString = JSON.stringify(jsonData);

        $.ajax({
            type: 'POST',
            url: '/customer/updateCustomer',
            data: jsonString,
            contentType: 'application/json',
            success: function(response) {
                if (response === "고객 정보 수정 성공") {
                    alert("고객 정보 수정 성공");
                    var link = document.createElement("a");
                    link.href = "/customer/customer_myPage";
                    link.click();
                } else {
                    console.error("고객 정보 수정 실패");
                }
            }
        });
    }
</script>
</html>