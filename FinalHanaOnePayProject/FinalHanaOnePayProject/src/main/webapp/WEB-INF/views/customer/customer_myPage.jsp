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
    background-color: #00857E; /* 배경색 설정 */
}

.customerInfo {
    width: 80%;
    padding: 20px; /* 패딩 추가 */
    background-color: #fff; /* 배경색 흰색으로 설정 */
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* 그림자 효과 추가 */
    border-radius: 10px; /* 모서리 둥글게 설정 */
}

.customerInfo h2 {
    text-align: center;
    color: #333; /* 제목 색 설정 */
    border-bottom: 2px solid #ddd; /* 제목 아래 경계선 추가 */
    padding-bottom: 10px; /* 제목 아래 패딩 추가 */
    margin-bottom: 20px; /* 제목 아래 마진 추가 */
}

.customerInfo p {
    margin-bottom: 10px; /* 각 요소들 사이의 간격 설정 */
}

.customerInfo a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #00857E; /* 버튼 배경색 설정 */
    color: #fff; /* 텍스트 색 흰색으로 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 설정 */
    text-decoration: none; /* 밑줄 제거 */
}

.customerInfo a:hover {
    background-color: #BCD9D3; /* 마우스 오버시 버튼 배경색 변경 */
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