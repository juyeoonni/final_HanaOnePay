<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 카드 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">
</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<main>
    <h2>하나원페이 지갑관리</h2>
    <%
        String selectedCards = (String) session.getAttribute("selectedCards");
    %>

    <div id="cardDataContainer"></div>


</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


<script>
    let cards = <%= selectedCards %>;

    function maskCardNumber(cardNumber) {
        // Same masking function as in connectMyData.jsp
    }

    cards.forEach(card => {
        const cardDiv = document.createElement("div");
        cardDiv.classList.add("card-info");

        const imageUrl = "/img/" + card.cardName + ".png";
        let cardCompany = card.cardCode;

        if (card.cardCode === "shinhan") {
            cardCompany = "신한카드";
        } else if (card.cardCode === "KB") {
            cardCompany = "KB국민카드";
        } else if (card.cardCode === "woori") {
            cardCompany = "우리카드";
        } else if (card.cardCode === "hana") {
            cardCompany = "하나카드";
        }

        cardDiv.innerHTML =
            '<img src="' + imageUrl + '" style="width: 200px; height: 130px; margin-right: 10px;">' +
            '<div style="flex: 1;">' +
            '<div class="card-code" style="width: 100px; color: white; background-color: #BCD9D3; border-radius: 5px; padding: 5px;">' +
            cardCompany +
            '</div>' +
            '카드 이름: ' + card.cardName + '<br>' +
            '카드 번호: ' + card.cardNumber +
            '</div>';

        document.getElementById('cardDataContainer').appendChild(cardDiv);
    });
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>