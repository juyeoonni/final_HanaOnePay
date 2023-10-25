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
    .bank-btn {
        display: inline-block;
        border: none;
        background-color: transparent;
        padding: 10px;
        cursor: pointer;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
        text-decoration: none;
        color: inherit;
    }

    .bank-btn:hover {
        box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.2);
    }

    .bank-name {
        display: block;
        margin-top: 5px;
    }
    </style>

</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<main>

    <h1>마이하나원페이</h1>
    흩어진 내 카드를 모아 간편하게 결제하세요! <br>
    연결할 카드기관 선택<br>

<div class="flex-card-container">
    <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=hana.png', '하나카드')">
        <img src="/img/bank/bankName=hana.png">
        <span class="bank-name" data-bank-name="hana">하나카드</span>
    </div>
    <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=woori.png', '우리카드')">
            <img src="/img/bank/bankName=woori.png">
            <span class="bank-name" data-bank-name="woori">우리카드</span>
        </div>
        <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=shinhan.png', '신한카드')">
                <img src="/img/bank/bankName=shinhan.png">
                <span class="bank-name" data-bank-name="shinhan">신한카드</span>
            </div>
            <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=KB.png', 'KB국민카드')">
                    <img src="/img/bank/bankName=KB.png">
                    <span class="bank-name" data-bank-name="KB">KB국민카드</span>
                </div>
</div>

<div class="flex-card-container">
    <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=IBK.png', 'IBK카드')">
        <img src="/img/bank/bankName=IBK.png">
        <span class="bank-name" data-bank-name="IBK">IBK카드</span>
    </div>
    <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=KDB.png', 'KDB카드')">
            <img src="/img/bank/bankName=KDB.png">
            <span class="bank-name" data-bank-name="KDB">KDB카드</span>
        </div>
        <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=NH.png', 'NH농협카드')">
                <img src="/img/bank/bankName=NH.png">
                <span class="bank-name" data-bank-name="NH">NH농협카드</span>
            </div>
            <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=smy.png', '새마을금고')">
                    <img src="/img/bank/bankName=smy.png">
                    <span class="bank-name" data-bank-name="smy">새마을금고</span>
                </div>
</div>

<div class="flex-card-container">
    <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=SC.png', 'SC제일은행')">
        <img src="/img/bank/bankName=SC.png">
        <span class="bank-name" data-bank-name="SC">SC제일은행</span>
    </div>
    <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=K.png', 'K뱅크')">
            <img src="/img/bank/bankName=K.png">
            <span class="bank-name" data-bank-name="K">K뱅크</span>
        </div>
        <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=kakao.png', '카카오뱅크카드')">
                <img src="/img/bank/bankName=kakao.png">
                <span class="bank-name" data-bank-name="kakao">카카오뱅크카드</span>
            </div>
            <div class="bank bank-btn" onClick="displaySelectedBank('/img/bank/bankName=toss.png', '토스카드')">
                    <img src="/img/bank/bankName=toss.png">
                    <span class="bank-name" data-bank-name="toss">토스카드</span>
                </div>
</div>

선택기관</br>
<form id="selectedBankForm" action="/card/joinHanaOnePay" method="POST">

<div id="selected-bank-container"></div>
<div>
<a href="/api/loadCardData">
    <button class="connectBank" type="submit">기관연결 </button>
</a>
</div>
</form>
</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>
function displaySelectedBank(imgSrc, bankNameText) {
    let selectedBankContainer = document.getElementById('selected-bank-container');
    let existingBankContainer = document.querySelector(`[data-bank-name='${bankNameText}']`);

    // 이미 추가된 은행인지 확인
    if (existingBankContainer) {
        selectedBankContainer.removeChild(existingBankContainer);
        return;
    }

    let bankImg = document.createElement('img');
    bankImg.setAttribute('src', imgSrc);
    bankImg.style.width = '50px';
    bankImg.style.height = '50px';

    let bankNameElem = document.createElement('span');
    bankNameElem.innerText = bankNameText;
    bankNameElem.classList.add('bank-name');

    let bankContainer = document.createElement('div');
    bankContainer.setAttribute('data-bank-name', bankNameText);
    bankContainer.style.display = 'inline-block';
    bankContainer.style.marginRight = '10px';
    bankContainer.style.cursor = 'pointer';
    bankContainer.style.textAlign = 'center';

    bankContainer.addEventListener('click', function() {
        selectedBankContainer.removeChild(bankContainer);
    });

    bankContainer.appendChild(bankImg);
    bankContainer.appendChild(bankNameElem);

    selectedBankContainer.appendChild(bankContainer);

        let hiddenInput = document.createElement('input');
            hiddenInput.setAttribute('type', 'hidden');
            hiddenInput.setAttribute('name', 'selectedBankCodes');
            hiddenInput.setAttribute('value', bankNameText);
            document.getElementById('selectedBankForm').appendChild(hiddenInput);
}

</script>

</body>
</html>