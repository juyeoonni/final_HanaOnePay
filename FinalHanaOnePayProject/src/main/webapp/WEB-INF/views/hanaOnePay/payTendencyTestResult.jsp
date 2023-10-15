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
    <title>마이하나페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%--    pdf --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.0.0-rc.7/html2canvas.min.js"></script>


    <link rel="stylesheet" href="/css/card.css">
    <title>마이하나</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <style>
        body {
            min-height: 100vh;
            min-height: -webkit-fill-available;
        }


        html {
            height: -webkit-fill-available;
        }

        main {
            height: 100vh;
            height: -webkit-fill-available;
            max-height: 100vh;
            overflow-x: auto;
            overflow-y: hidden;
        }

        .dropdown-toggle {
            outline: 0;
        }

        .btn-toggle {
            padding: .25rem .5rem;
            font-weight: 600;
            color: var(--bs-emphasis-color);
            background-color: transparent;
        }

        .btn-toggle:hover,
        .btn-toggle:focus {
            color: rgba(var(--bs-emphasis-color-rgb), .85);
            background-color: var(--bs-tertiary-bg);
        }

        .btn-toggle::before {
            width: 1.25em;
            line-height: 0;
            content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
            transition: transform .35s ease;
            transform-origin: .5em 50%;
        }

        [data-bs-theme="dark"] .btn-toggle::before {
            content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%28255,255,255,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
        }

        .btn-toggle[aria-expanded="true"] {
            color: rgba(var(--bs-emphasis-color-rgb), .85);
        }

        .btn-toggle[aria-expanded="true"]::before {
            transform: rotate(90deg);
        }

        .btn-toggle-nav a {
            padding: .1875rem .5rem;
            margin-top: .125rem;
            margin-left: 1.25rem;
        }

        .btn-toggle-nav a:hover,
        .btn-toggle-nav a:focus {
            background-color: var(--bs-tertiary-bg);
        }

        .scrollarea {
            overflow-y: auto;
        }

        .flex-container {
            display: flex;
        }

        .flex-shrink-0 {
            /* 필요에 따라 여기에 추가 스타일을 설정하세요 */
        }

        .mypageMain {
            flex: 1; /* 나머지 공간을 채우도록 설정 */
            /* 필요에 따라 여기에 추가 스타일을 설정하세요 */
        }

        .mypageMain {
            display: flex;
            flex-direction: column;
            margin-left: 30px;
            /*align-items: center;*/
            /*justify-content: center;*/
            /*height: 100vh;  !* 높이를 화면 높이와 동일하게 설정. 필요에 따라 조정할 수 있습니다. *!*/
        }

        .mypageName {
            margin-right: 130px;
            text-align: center; /* 텍스트 중앙 정렬 */
            width: 100%; /* 너비를 100%로 설정하여 왼쪽 및 오른쪽 여백 없음 */
        }


        .mypageMain > .mypageName {
            align-self: center;
        }

        .payTag {
            display: flex; /* Flexbox 레이아웃 사용 */
        }

        #tag1, #tag2 {
            font-size: 15px;
            padding: 5px;
            margin-right: 10px;
            color: #666666;
            border: #00857E 2px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .resultMessage {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            color: #00857E;
        }

        .resultContainer {
            display: flex;
            align-items: center; /* 컨텐츠를 중앙에 수직 정렬 */
        }

        .textContent {
            flex: 1; /* 텍스트가 가능한 많은 공간을 차지하게 함 */
            margin-right: 10px; /* 이미지와의 간격을 조절 */
        }

        .resultImage {
            /* 필요한 스타일 (예: width, height 등) */
        }

        .card-container {
            display: flex; /* card-item들을 수평으로 정렬하기 위해 flexbox를 사용합니다. */
            gap: 20px; /* card-item들 사이의 간격을 지정합니다. */
        }

        .card-item {
            display: flex; /* card-item 내부의 아이템들을 수직으로 정렬하기 위해 flexbox를 사용합니다. */
            flex-direction: column; /* 수직 정렬을 위해 flex의 방향을 column으로 지정합니다. */
            align-items: center; /* card-item 내부의 아이템들을 가로 중앙에 위치시킵니다. */

            animation-name: fadeIn;
            animation-duration: 1s;
            animation-fill-mode: forwards;
            opacity: 0; /* 시작 시 숨겨져 있어야 함 */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .recommandCard {
            width: 500px !important;
        }

        .recoCardImg {
            width: 300px;
            height: 200px;
        }

        .card-item {
            position: relative; /* 상대 위치 설정 */
        }

        .card-detail {
            position: absolute;
            width: 300px;
            height: 200px;
            top: 0;
            left: 0;
            background-color: #00907F;
            border-radius: 10px;
            color: white;
            visibility: hidden;  /* 초기에 숨김 */
            justify-content: center;  /* 내용을 중앙으로 정렬 */
            align-items: center;
            text-align: center;
            z-index: 10;
            opacity: 0;  /* 초기에는 완전히 투명하게 설정 */
            transform: translateY(20px); /* 초기 상태에서 아래로 조금 내려감 */
            transition: opacity 0.3s, transform 0.5s;  /* opacity와 transform이 0.3초 동안 변하도록 설정 */
        }

        .btn-detail {
            display: inline-block;
            padding: 10px 20px;
            background-color: #404B57;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            width: 250px;
            height: 40px;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-detail:hover {
            background-color: #2B333B;
        }

        .openTerms{
            display: inline-block;
            padding: 10px 20px;
            background-color: whitesmoke;
            color: #666666;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            width: 250px;
            height: 40px;
            margin-top: 10px;
            transition: background-color 0.3s ease-in-out;
        }





    </style>

</head>
<body>

<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<div class="flex-container">

    <%--    사이드바시작--%>
    <div class="flex-shrink-0 p-3" style="width: 280px; margin-left: 90px;">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
            <svg class="bi pe-none me-2" width="30" height="24">
                <use xlink:href="#bootstrap"/>
            </svg>
            <span class="fs-5 fw-semibold">마이하나</span>
        </a>
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                    하나원페이
                </button>

                <div class="collapse" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <%--                    <li><a href="/api/linkedAccount" class="link-body-emphasis d-inline-flex text-decoration-none rounded">연동카드조회</a></li>--%>
                        <%--                    <li><a href="/hanaOnePay/selectPayCard" class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>--%>
                        <li><a href="/hanaOnePay/selectHanaPayCard"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">간편결제 카드</a></li>
                        <li><a onclick="fetchAccountData()"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                               style="cursor: pointer;">간편결제 계좌</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    내 소비 분석
                </button>
                <div class="collapse show" id="home-collapse">

                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/api/payments-by-month?month=09"
                               class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비레포트</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">소비성향테스트</a></li>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>--%>
                        <%--                    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>--%>
                    </ul>
                </div>
            </li>

            <li class="border-top my-3"></li>
        </ul>
    </div>
    <%--    사이드바끝--%>

    <div class="mypageMain">
        <div class="payTag">
            <div id="tag1"># 쇼핑마스터</div>
            <div id="tag2"># 슬기로운 인터넷 웹서퍼</div>
        </div>


        <div class="resultContainer">
            <div class="textContent">
                소비태그를 기반하여<br>
                <span
                    style="font-size:25px; font-weight: bold; color: #00857E;">${sessionScope.name} </span>님의 소비 성향을 분석한 결과,
                <div class="resultMessage" id="resultMessage"></div>
                는 스타일로 나타났습니다!
            </div>
            <%--                <img class="resultImage" src="/img/resultShopping.png" alt="">--%>
        </div>

        <div class="recommandCard">
            <p style="margin-top: 20px; margin-bottom: 50px;">자주 소비하는 <span
                    style="font-size:25px; font-weight: bold; color: #00857E;">쇼핑</span>에 혜택이 있는 이런 카드들은 어떨까요?</p>

            <div class="cards">
                <div class="recoCard">
                    <div class="card-container">
                        <c:forEach var="card" items="${cards}">
                            <div class="card-item">
                                <img class="recoCardImg" src="/img/${card.cardName}.png" alt="">
                                <div class="card-detail">
                                    <c:choose>
                                        <c:when test="${card.cardName eq '모두의 쇼핑'}">
                                            <ul>
                                                <li>온라인 쇼핑 10% 적립</li>
                                                <li>생활 쇼핑 5% 적립</li>
                                                <li>아울렛 쇼핑 5% 적립</li>
                                            </ul>
                                            <a href="https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41011881P&CD_PD_SEQ=11881&" class="btn-detail">상세보기</a><br>
                                            <button class="openTerms" onclick="openTermsPage()">상품약관보기</button>
                                        </c:when>
                                        <c:when test="${card.cardName eq 'MULTI On 모바일카드'}">
                                            <ul>
                                                <li>국내외 전 가맹점 0.7% 적립</li>
                                                <li>페이결제 1.0% 적립</li>
                                                <li>온라인 쇼핑 2.0% 적립</li>
                                            </ul>
                                            <a href="https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41012934P&CD_PD_SEQ=12934&" class="btn-detail">상세보기</a>
                                            <button class="openTerms" onclick="openTermsPage()">상품약관보기</button>
                                        </c:when>
                                        <c:when test="${card.cardName eq 'MULTI Living 모바일카드'}">
                                            <ul>
                                                <li>온라인쇼핑, 마트 각각 월 최대 5%/10% 청구할인</li>
                                                <li>주유/백화점 주말 최대 10% 할인</li>
                                                <li>페이결제 매일 1% 할인</li>
                                            </ul>
                                            <a href="https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41012900P&CD_PD_SEQ=12900&" class="btn-detail">상세보기</a>
                                            <button class="openTerms" onclick="openTermsPage()">상품약관보기</button>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div>${card.cardName}</div>
                                <div style="color: #959595; font-size: 15px;">${card.cardDesc}</div>
                            </div>
                        </c:forEach>




                    </div>
                </div>

            </div>
        </div>


    </div>

</div>
<br><br><br><br>
<img src="/img/footer.png" style="margin-left: 7%;">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>
    window.onload = function () {
        var message = localStorage.getItem('resultMessage');
        if (message) {
            document.getElementById('resultMessage').innerText = message;
        } else {
            document.getElementById('resultMessage').innerText = "결과를 찾을 수 없습니다.";
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        var cardItems = document.querySelectorAll(".card-item");
        cardItems.forEach(function (card, index) {
            card.style.animationDelay = (index * 0.5) + "s";
        });
    });

    // DOM이 준비되었을 때 실행
    document.addEventListener('DOMContentLoaded', function() {
        var cardItems = document.querySelectorAll('.card-item');

        cardItems.forEach(function(cardItem) {
            cardItem.addEventListener('mouseover', function() {
                var cardDetail = this.querySelector('.card-detail');
                cardDetail.style.opacity = '1';
                cardDetail.style.visibility = 'visible';
                cardDetail.style.transform = 'translateY(0)'; // 원래 위치로 돌아감
            });

            cardItem.addEventListener('mouseout', function() {
                var cardDetail = this.querySelector('.card-detail');
                cardDetail.style.opacity = '0';
                cardDetail.style.transform = 'translateY(20px)'; // 아래로 조금 내려감
                // opacity 애니메이션 완료 후에 visibility를 hidden으로 설정
                setTimeout(function() {
                    if(cardDetail.style.opacity === '0') {
                        cardDetail.style.visibility = 'hidden';
                    }
                }, 500);  // CSS에서 설정한 transition 시간과 일치해야 함
            });
        });
    });

    function openTermsPage() {
        window.open('/hanaOnePay/cardTerms', '상품약관', 'width=600, height=400, scrollbars=yes');
    }
    function convertToPDF() {
        const termsContent = document.getElementById('terms-content');
        html2canvas(termsContent).then(canvas => {
            const pdf = new jsPDF();
            pdf.addImage(canvas.toDataURL('image/png'), 'PNG', 0, 0);
            pdf.save('상품약관.pdf');
        });
    }









</script>

</body>
</html>