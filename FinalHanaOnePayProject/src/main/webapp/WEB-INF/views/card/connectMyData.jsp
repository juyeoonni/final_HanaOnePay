<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-07
  Time: 오후 1:44
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

<head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<h3>내 카드 불러오기</h3>

<div id="selectedCardCount">
    연동된 카드 개수: <span id="count">0</span> 개
</div>

<!-- 데이터를 표시할 컨테이너 -->
<div id="cardDataContainer">
    <!-- 데이터가 여기에 동적으로 추가됩니다. -->
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 세션 스토리지에서 cardData 가져오기
        const cardData = JSON.parse(sessionStorage.getItem('cardData') || "[]");
        const count = cardData.length;

        // HTML 요소에 개수 표시
        document.getElementById('count').textContent = count;

        // 데이터를 동적으로 화면에 추가
        const cardDataContainer = document.getElementById('cardDataContainer');
        cardData.forEach(data => {
            const cardDiv = document.createElement('div');
            cardDiv.textContent = `카드 번호: ${data.cardNumber}, 계좌 번호: ${data.accNumber}, 카드 이름: ${data.cardName}`;
            cardDataContainer.appendChild(cardDiv);
        });
    });

    window.onload = function() {
    const cardData = sessionStorage.getItem('cardData');
    if(cardData) {
    const parsedData = JSON.parse(cardData);
    // parsedData를 사용하여 필요한 작업을 수행
    console.log(parsedData);
    } else {
    console.error('cardData가 세션에 없습니다.');
    }
    }




</script>
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</body>


</html>


