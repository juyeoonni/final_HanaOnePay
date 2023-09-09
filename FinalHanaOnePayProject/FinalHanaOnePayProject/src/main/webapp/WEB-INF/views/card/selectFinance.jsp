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
        // 이미 선택된 은행 이미지라면 삭제
        selectedBankContainer.removeChild(existingBankContainer);
        return; // 추가적인 동작을 수행하지 않기 위해 함수를 종료
    }

    // 아직 선택되지 않은 은행 이미지라면 추가
    let bankImg = document.createElement('img');
    bankImg.setAttribute('src', imgSrc);
    bankImg.style.width = '50px';
    bankImg.style.height = '50px';

    // 은행 이름을 표시하는 엘리먼트 생성
    let bankNameElem = document.createElement('span');
    bankNameElem.innerText = bankNameText;
    bankNameElem.classList.add('bank-name');  // 스타일을 적용하기 위한 클래스 추가

    // 선택된 은행의 이미지와 이름을 함께 감싸는 컨테이너 생성
    let bankContainer = document.createElement('div');
    bankContainer.setAttribute('data-bank-name', bankNameText);
    bankContainer.style.display = 'inline-block';
    bankContainer.style.marginRight = '10px';
    bankContainer.style.cursor = 'pointer';  // 커서를 포인터로 설정하여 클릭 가능하게 보이게 합니다.
    bankContainer.style.textAlign = 'center';  // 컨테이너 내부의 이미지와 텍스트를 중앙 정렬

    // 선택된 이미지를 다시 클릭하면 컨테이너를 삭제하는 이벤트 리스너를 추가
    bankContainer.addEventListener('click', function() {
        selectedBankContainer.removeChild(bankContainer);
    });

    // 컨테이너 안에 이미지와 이름 추가
    bankContainer.appendChild(bankImg);
    bankContainer.appendChild(bankNameElem);

    // 최종적으로 컨테이너를 selectedBankContainer에 추가
    selectedBankContainer.appendChild(bankContainer);

     // 이미지 및 은행 이름 추가 부분 아래에 hidden input 추가
        let hiddenInput = document.createElement('input');
            hiddenInput.setAttribute('type', 'hidden');
            hiddenInput.setAttribute('name', 'selectedBankCodes'); // 이 부분이 중요합니다.
            hiddenInput.setAttribute('value', bankNameText); // bankNameText는 실제 코드로 대체해야 할 수도 있습니다.
            document.getElementById('selectedBankForm').appendChild(hiddenInput);
}


</script>

</body>
</html>