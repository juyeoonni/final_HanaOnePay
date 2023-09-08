<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-07
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>joinHanaOnePay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .card-info:hover {
            /* 호버 효과를 주고자 하는 스타일 설정 */
            background-color: #CFEBE5; /* 배경색 변경 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 변경 */
            transform: scale(1.02); /* 크기 조정 */
            transition: all 0.3s ease; /* 부드러운 전환 효과 */
        }
    </style>

</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
<!-- 부모 컨테이너 시작 -->
<div class="d-flex justify-content-start align-items-center">
    <h3 class="mb-0 me-3">내 카드 불러오기</h3>

    <!-- 드롭다운 시작 -->
    <div class="dropdown" style="display: inline-block;">
        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            전체카드조회
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">전체카드조회</a></li>
            <li><a class="dropdown-item" href="#">하나카드조회</a></li>
            <li><a class="dropdown-item" href="#">다른카드조회</a></li>
        </ul>
    </div>
    <!-- 드롭다운 끝 -->

</div>
<!-- 부모 컨테이너 끝 -->

<div id="selectedCardCount">
    연동된 카드 개수: <span id="count">0</span> 개
</div>
<br><br>
<!-- 데이터를 표시할 컨테이너 -->
<div id="cardDataContainer">

</div>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
    $(document).ready(function () {
        try {
            const selectCardCompanyFromSession = JSON.parse(sessionStorage.getItem('selectedCards') || "[]");
            const cardDataFromSession = JSON.parse(sessionStorage.getItem('cardData') || "[]");

            console.log(cardDataFromSession);

            function maskCardNumber(cardNumber) {
                // 카드 번호를 '-'로 분리
                const parts = cardNumber.split('-');

                // 중간 2개의 부분을 '*'로 대체
                if (parts.length === 4) {
                    const maskedParts = [
                        parts[0],
                        '****',
                        '****',
                        parts[3].substr(-4) // 마지막 4자리는 그대로 유지
                    ];
                    return maskedParts.join('-');
                }

                return cardNumber; // 형식이 맞지 않는 경우 그대로 반환
            }

            function displayCards(cards) {
                $('#count').text(cards.length);
                $('#cardDataContainer').empty();

                cards.forEach((cardData) => {
                    const cardDiv = document.createElement("div");
                    cardDiv.classList.add("card-info");

                    cardDiv.style.border = "1px solid #ccc";
                    cardDiv.style.width = "600px";
                    cardDiv.style.padding = "10px";
                    cardDiv.style.marginBottom = "10px";
                    cardDiv.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.1)";
                    cardDiv.style.display = "flex";
                    cardDiv.style.flexDirection = "row";
                    cardDiv.style.alignItems = "center";
                    cardDiv.style.borderRadius = "10px";

                    const imageUrl = "/img/" + cardData.cardName + ".png";
                    let cardCompany = cardData.cardCode;

                    // cardCode에 따라 카드 회사 이름 변경
                    if (cardData.cardCode === "shinhan") {
                        cardCompany = "신한카드";
                    } else if (cardData.cardCode === "KB") {
                        cardCompany = "KB국민카드";
                    } else if (cardData.cardCode === "woori") {
                        cardCompany = "우리카드";
                    } else if (cardData.cardCode === "hana") {
                        cardCompany = "하나카드";
                    }
                    cardDiv.innerHTML =
                        '<img src="' + imageUrl + '" style="width: 200px; height: 130px; margin-right: 10px;">' +
                        '<div style="flex: 1;">' +
                        '<div class="card-code" style="width: 100px; color: white; background-color: #BCD9D3; border-radius: 5px; padding: 5px;">' +
                        cardCompany +
                        '</div>' +
                        '카드 이름: ' + cardData.cardName + '<br>' +
                        '카드 번호: ' + maskCardNumber(cardData.cardNumber) + // 카드 번호 마스킹 적용
                        '</div>' +
                        '<input type="checkbox" style="margin-left: 20px;">';

                    cardDataContainer.appendChild(cardDiv);
                });

                // "등록" 버튼을 페이지에 추가
                const registerButton = document.createElement("button");
                registerButton.textContent = "원페이 등록";
                registerButton.className = "btn btn-primary";
                registerButton.addEventListener("click", registerSelectedCards);

                // "등록" 버튼을 페이지에 추가
                const buttonContainer = document.createElement("div");
                buttonContainer.appendChild(registerButton);
                cardDataContainer.appendChild(buttonContainer);
            }

            $('.dropdown-item').click(function () {
                const filterType = $(this).text();

                if (filterType === "전체카드조회") {
                    displayCards(cardDataFromSession);
                } else if (filterType === "하나카드조회") {
                    const hanaCards = cardDataFromSession.filter(card => card.cardCode === "hana");
                    displayCards(hanaCards);
                } else if (filterType === "다른카드조회") {
                    const otherCards = cardDataFromSession.filter(card => card.cardCode !== "hana");
                    displayCards(otherCards);
                }
            });

            // 초기 로드 시 전체 카드 목록 표시
            displayCards(cardDataFromSession);

            // "등록" 버튼을 클릭할 때 선택한 카드 데이터를 처리하는 함수
            function registerSelectedCards() {
                const selectedCards = [];

                // 모든 카드 정보를 가져오기
                const cardDivs = document.querySelectorAll('.card-info');
                cardDivs.forEach((cardDiv, index) => {
                    const checkbox = cardDiv.querySelector('input[type="checkbox"]');
                    if (checkbox.checked) {
                        // 체크된 카드 정보를 선택한 목록에 추가
                        selectedCards.push(cardDataFromSession[index]);
                    }
                });

                // 선택한 카드 데이터를 처리하고 원하는 작업 수행
                // 여기서는 간단히 콘솔에 출력하는 예제를 제공합니다.
                console.log("Selected Cards:", selectedCards);
            }

        } catch (error) {
            console.error("Error parsing JSON:", error);
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</body>
</html>
