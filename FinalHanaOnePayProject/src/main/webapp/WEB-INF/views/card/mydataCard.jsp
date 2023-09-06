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
    <title>joinHanaOnePay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">

    <style>
        .card-btn:hover {
            background-color: #eee;
        }

        .selected {
            background-color: #ddd;
        }

        .not-selected {
            background-color: #fff;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<h1>마이하나원페이</h1>
흩어진 내 카드를 모아 간편하게 결제하세요! <br>
연결할 카드기관 선택<br>

<div class="selectCard">
    <input type="checkbox" id="hana" name="card">
    <label for="hana">
        <img src="/img/bank/bankName=hana.png"> <br>
        하나카드
    </label>

    <input type="checkbox" id="shinhan" name="card">
    <label for="shinhan">
        <img src="/img/bank/bankName=shinhan.png"> <br>
        신한카드
    </label>

    <input type="checkbox" id="woori" name="card">
    <label for="woori">
        <img src="/img/bank/bankName=woori.png"> <br>
        우리카드
    </label>

    <input type="checkbox" id="KB" name="card">
    <label for="KB">
        <img src="/img/bank/bankName=KB.png"> <br>
        국민카드
    </label>

</div>

<br>
<button onclick="loadCardData()">
    연동하기
</button>
<%
    out.println(session.getAttribute("identityNumber"));
%>

<script>
    let selectedCardIds = [];

    function loadCardData() {
        const query = document.getElementsByName("card");
        const selectedCards = [];

        for(let i = 0; i < query.length; i++) {
            if(query[i].checked) {
                selectedCards.push(query[i].id);
            }
        }

        // 콘솔에 선택한 카드사 출력
        console.log("Selected cards: ", selectedCards);

        if(selectedCards.length === 0) {
            alert('하나 이상의 카드를 선택해 주세요.');
            return;
        }

        <%--// selectedCards를 쿼리 파라미터 형태로 변환합니다.--%>
        <%--const queryParams = new URLSearchParams({--%>
        <%--    "cards": JSON.stringify(selectedCards)--%>
        <%--}).toString();--%>

        <%--fetch(`/api/card-data?${queryParams}`, {--%>
        <%--    method: 'GET',--%>
        <%--    headers: {--%>
        <%--        'Content-Type': 'application/json'--%>
        <%--    }--%>
        <%--})--%>
        <%--    .then(response => response.json())--%>
        <%--    .then(data => {--%>
        <%--        document.getElementById('loadingIndicator').style.display = 'none';--%>
        <%--        console.log(data);--%>
        <%--    })--%>
        <%--    .catch(error => {--%>
        <%--        document.getElementById('loadingIndicator').style.display = 'none';--%>
        <%--        console.error('Error fetching card data:', error);--%>
        <%--        alert("연동 오류! 다시 시도하세요.");--%>
        <%--    });--%>



        fetch(`/api/card-data`, {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({"cards": selectedCards})
        })
            .then(response => response.json())
            .then(data => {
                //document.getElementById('loadingIndicator').style.display = 'none';
                console.log(data);
            })
            .catch(error => {
                //document.getElementById('loadingIndicator').style.display = 'none';
                console.error('Error fetching card data:', error);
                alert("연동 오류! 다시 시도하세요.");
            });
    }
</script>
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</body>
</html>