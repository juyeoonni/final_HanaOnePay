<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-02
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>마이하나페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>

  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
  <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script type="text/javascript" charset="utf8"
          src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


  <link rel="stylesheet" href="/css/card.css">
  <title>마이하나</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">


  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

  <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

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

    .myCardInfo {
      font-size: 20px;
      width: 450px;
      height: 300px;
      background-color: whitesmoke;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      border-radius: 20px;
      text-align: center; /* 텍스트 중앙 정렬 */
    }

    .monthlyCardInfo {
      font-size: 20px;
      margin-left: 80px;
      width: 450px;
      height: 300px;
      background-color: whitesmoke;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      border-radius: 20px;
      margin-right: 130px;
      text-align: center; /* 텍스트 중앙 정렬 */
    }

    table {
      width: 90.3%;
      border-collapse: collapse;
      text-align: center;
    }

    th, td {
      padding: 10px;
      border: 1px solid #ddd;
    }

    th {
      background-color: #f2f2f2;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #ddd;
    }

    .plusBtn {
      margin-left: 20px;
      color: white;
      background-color: #00857E;
      border-radius: 10px;
      border: none;
    }

    .mainCard {
      display: flex; /* flex를 사용하여 아이템들을 가로로 나열합니다 */
      align-items: center; /* 아이템들을 수직 중앙에 배치합니다 */
      text-align: left;
    }

    .payCardImg {
      margin-left: 20px;
      margin-right: 20px;
      order: -1;
      width: 200px;
      height: 150px;
    }

    .custom-flex-container {
      flex-direction: column;
    }

    .payTag {
      margin-top: 10px;
      align-items: center;
      background-color: white;
      padding: 20px;
      border-radius: 15px; /* 둥근 모서리 */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
      width: 60%;

    }

    .proImg {
      width: 100px;
      height: 100px;
      margin-right: 10px;
    }

    .profile {
      padding: 2px;
      font-size: 16px;
      text-align: center;
      color: white;
      background-color: #666666;
      border-radius: 10px;
      border: none;
      align-content: center;
      margin-top: 10px;
      margin-right: 20px;
      width: 150px;
      height: 30px;
      transition: background-color 0.3s ease; /* 부드러운 전환을 위한 트랜지션 설정 */
    }

    .profile:hover {
      /* 호버 상태에서의 스타일 */
      background-color: #6C757D; /* 호버 시 배경색 변경 등을 설정합니다. */
    }


    .proInfo {
      margin-right: 10px;
      margin-top: 10px;
      margin-left: 10px;
      font-size: 17px;
      color: #666666;
    }

    .holicontainer {
      margin-bottom: 100px;
      margin-left: 50px;
      display: flex;
      flex-direction: row;
    }

    .profile a {
      text-decoration: none; /* 밑줄 제거 */
      color: inherit; /* 부모 요소의 폰트색을 상속받음 */
    }

    .profile a:hover {
      text-decoration: none; /* 마우스 호버 상태에서도 밑줄 제거 */
    }

    .adPayTag {
      width: 90.3%;
      height: 50px;
      background-color: #d9ede8;
    }

    .adPayTag {
      display: flex; /* flexbox를 사용합니다. */
      align-items: center; /* 수직으로 가운데 정렬합니다. */
      justify-content: center; /* 수평으로 가운데 정합니다. */
      height: 65px;
    }

    /*토글스위치*/
    .toggleSwitch {
      width: 60px;
      height: 30px;
      display: block;
      position: relative;
      border-radius: 30px;
      background-color: #fff;
      box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
      cursor: pointer;
      margin: 30px;
    }

    .toggleSwitch .toggleButton {
      width: 20px;
      height: 20px;
      position: absolute;
      top: 50%;
      left: 4px;
      transform: translateY(-50%);
      border-radius: 50%;
      background: #00857E;
    }

    #toggle:checked ~ .toggleSwitch {
      background: #00857E;
    }

    #toggle:checked ~ .toggleSwitch .toggleButton {
      left: calc(100% - 44px);
      background: #fff;
    }

    .toggleSwitch, .toggleButton {
      transition: all 0.2s ease-in;
    }

    .toggleContainer {
      display: flex;
      align-items: center; /* 항목들을 수직으로 중앙에 배치합니다. */
      gap: 10px; /* 항목들 사이의 간격을 추가합니다. */
    }

    .using {
      display: flex;
      align-items: center;
      /*justify-content: space-between;*/
    }

    .toggleContainer {
      display: flex;
      align-items: center;
      margin-left: 570px;
    }

    #transactionTable_wrapper { /* DataTables가 .wrapper 클래스를 테이블 주변에 추가합니다. 이 클래스로 너비와 여백을 조정해보세요. */
      width: 95%;

    }

    #transactionTable {
      width: 100% !important; /* !important를 사용하여 다른 스타일의 우선순위를 덮어쓰기 시도해보세요. */
    }

    /*카드선택 디브들 css*/
    .selectCard {
      display: flex; /* Flexbox 사용 */
      align-items: center; /* 수직 중앙 정렬 */
      background-color: #ffffff; /* 배경색을 흰색으로 변경 */
      border: 4px solid #d9ede8; /* 테두리 색상 설정 */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 박스 섀도우 효과 추가 */
      border-radius: 10px;
      width: 90.3%;
      height: 100px;
      padding: 0 10px; /* 좌우 패딩 추가 */
    }

    .TransPageCardImg img {
      width: auto; /* 이미지 크기에 따라 수정 가능 */
      height: 70px; /* 이미지 크기에 따라 수정 가능 */
      margin-right: 20px; /* 이미지 우측 간격 추가 */
      margin-left: 20px;
    }

    .cardDesc {
      flex-grow: 1; /* 남은 공간을 cardDesc 요소가 차지하도록 설정 */
      display: flex;
      flex-direction: column;
      justify-content: center; /* 수직 중앙 정렬 */
    }

    .changeCardBtn {
      margin-right: 30px;
      padding-top: 4px;
      text-align: center;
      align-items: center;
      justify-content: center;
      height: 30px;
      width: 100px;
      background-color: #d9ede8;
      border: none; /* 기본 테두리 제거 */
      border-radius: 4px; /* 모서리 둥글게 */
      color: #333; /* 버튼의 글자색 */
      font-size: 16px;
      cursor: pointer; /* 마우스 오버시 손가락 모양으로 변경 */
      transition: background-color 0.3s; /* 버튼 클릭 효과 */
    }

    .changeCardBtn:hover {
      background-color: #c4e0d0; /* 마우스 오버시 버튼 색상 변경 */
    }

    .changeCardBtn:active {
      background-color: #b0d5c2; /* 버튼 클릭시 색상 변경 */
    }

    .changeCardBtn:focus {
      outline: none; /* 포커스시 테두리 제거 */
      box-shadow: 0 0 0 2px rgba(217, 237, 232, 0.5); /* 포커스시 박스 섀도우 추가 */
    }

    /*모달 css*/
    .selectCardModal {
      /* 다른 스타일을 여기에 추가하세요. */
      display: flex;
      justify-content: space-between; /* 내용을 양쪽으로 분산 정렬합니다. */
      align-items: center; /* 수직 정렬을 가운데로 설정합니다. */
    }

    .cardInfo {
      /* 카드 정보 스타일을 여기에 추가하세요. */
      display: flex;
      align-items: center; /* 수직 정렬을 가운데로 설정합니다. */
    }

    .modalCardImg {
      margin-right: 20px;
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

        <div class="collapse show" id="home-collapse">
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
        <div class="collapse" id="dashboard-collapse">
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
    <div class="mypageName">
      <div style="font-size: 30px">내 카드 조회</div>
      <div style="color: #959595">나만의 카드 생활</div>
    </div>
    <br>


    <div class="selectCard">
      <div class="TransPageCardImg">
        <img src="/img/${selectedCardName}.png" alt="">
      </div>
      <div class="cardDesc">
        ${selectedCardName}<br>
        <%--               [본인] ${selectedCardNumber.substring(0, 5)} **** - **** ${selectedCardNumber.substring(selectedCardNumber.length() - 5)}--%>
      </div>
      <button type="button" class="changeCardBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
        카드변경
      </button>
      <!-- 모달 시작 -->
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
           aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <img src="/img/hanaLogo.png" alt="하나원페이 로고"
                   style="margin-right: 10px; width: 45px; height: 45px;">
              <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">하나원페이</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              ■ 변경할 카드를 선택하세요.
              <hr>
              <c:forEach items="${allHanaCards}" var="card">
                <c:if test="${card.cardName ne selectedCardName}">
                  <div class="selectCardModal">
                    <div class="cardInfo">
                      <img src="/img/${card.cardName}.png" class="modalCardImg"
                           style="width: 100px; height: 70px;">
                        ${card.cardName}
                    </div>
                    <div class="changeCardBtn">
                      카드변경
                    </div>
                  </div>
                  <hr>
                </c:if>
              </c:forEach>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            </div>
          </div>
        </div>
      </div>
      <!-- 모달 끝 -->
    </div>

    <br>

    <%--        <c:forEach items="${allCards}" var="card">--%>

    <%--            <div class="que">--%>
    <%--                 <span class="cardCode">--%>
    <%--            <c:choose>--%>
    <%--                <c:when test="${card.cardCode == 'shinhan'}">신한</c:when>--%>
    <%--                <c:when test="${card.cardCode == 'KB'}">KB국민</c:when>--%>
    <%--                <c:when test="${card.cardCode == 'woori'}">우리</c:when>--%>
    <%--                <c:otherwise>${card.cardCode}</c:otherwise>--%>
    <%--            </c:choose>--%>
    <%--        </span>--%>
    <%--                <div class="arrow-wrap">--%>
    <%--                    <span class="arrow-top">↑</span>--%>
    <%--                    <span class="arrow-bottom">↓</span>--%>
    <%--                </div>--%>
    <%--            </div>--%>

    <%--            <div class="anw">--%>
    <%--                <img src="/img/${card.cardName}.png" class="d-block payCardImg" alt="${card.cardName}">--%>
    <%--                <div class="cardInfo">--%>
    <%--                    <span>${card.cardName}</span>--%>

    <%--                    <span class="hidden-card-number">--%>
    <%--                         [본인] ${card.cardNumber.substring(0, 5)} **** - **** ${card.cardNumber.substring(card.cardNumber.length() - 5)}--%>
    <%--                    </span>--%>
    <%--                    <span class="card-number-field" style="display: none">--%>
    <%--                        [본인] ${card.cardNumber}--%>
    <%--                    </span>--%>
    <%--                </div>--%>

    <%--                <button class="show-card-number-btn">--%>
    <%--                    카드번호/유효기간 보기--%>
    <%--                </button>--%>
    <%--                <a href="/hanaOnePay/selectCardTransList">내역조회</a>--%>

    <%--            </div>--%>
    <%--        </c:forEach>--%>

    <div id="transactionTable_wrapper" class="dataTables_wrapper no-footer" style="width: 90.3% !important;">
      <table id="transactionTable" class="display" style="width: 90.3%;">
        <thead>
        <tr>
          <th>승인번호</th>
          <th>카드번호</th>
          <th>승인일시</th>
          <th>결제금액</th>
<%--          <th>사업 코드</th>--%>
          <th>가맹점명</th>
          <th>승인상태</th>
          <th>결제방법</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="transaction" items="${transactions}">
          <tr>
            <td>${transaction.payId}</td>
            <td>
              <!-- 카드번호를 '-' 로 분할합니다. -->
              <c:set var="cardParts" value="${fn:split(transaction.cardNumber, '-')}" />
              <!-- 첫 번째 및 마지막 섹션을 제외하고 '*' 로 치환합니다. -->
                ${cardParts[0]}-****-****-${cardParts[3]}
            </td>
            <td>${transaction.payDate}</td>
            <td><fmt:formatNumber value="${transaction.payAmount}" type="number" pattern="#,##0"/></td>
            <td>${transaction.businessMall}</td>
            <td>${transaction.payStatus}</td>
            <td>${transaction.payType}</td>
          </tr>
        </c:forEach>

        </tbody>
      </table>
    </div>

  </div>

</div>

</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>

  window.onload = function () {
    // console.log("Script is running"); // 로그 추가
    //
    // let phoneElement = document.getElementById("phone");
    // let originalPhone = phoneElement.textContent.trim();
    //
    // console.log("Original phone:", originalPhone); // 로그 추가

    <%--if (originalPhone) {--%>
    <%--    let phoneParts = originalPhone.split('-');--%>
    <%--    if (phoneParts.length === 3) {--%>
    <%--        phoneParts[2] = "****";--%>
    <%--        let modifiedPhone = phoneParts.join('-');--%>
    <%--        phoneElement.textContent = modifiedPhone;--%>
    <%--    }--%>
    <%--}--%>

    <%--const targetAmount = parseInt('${thisMonthTotalAmounts[card1.cardNumber]}'.replace(/[^0-9]/g, ''));--%>
    <%--const displayElement = document.getElementById("monthlyUsage");--%>
    <%--const duration = 500; // 애니메이션 시간 (2초)--%>
    <%--const stepTime = 10;--%>
    <%--let currentAmount = 0;--%>
    <%--const increment = targetAmount / (duration / stepTime);--%>

    <%--const intervalId = setInterval(function () {--%>
    <%--    currentAmount += increment;--%>
    <%--    if (currentAmount >= targetAmount) {--%>
    <%--        clearInterval(intervalId);--%>
    <%--        currentAmount = targetAmount;--%>
    <%--    }--%>
    <%--    displayElement.textContent = numberWithCommas(Math.round(currentAmount)) + "원";--%>
    <%--}, stepTime);--%>

  }

  var cardNames = ['${card1.cardName}', '${card2.cardName}'];
  var cardImages = ['/img/${card1.cardName}.png', '/img/${card2.cardName}.png'];
  var cardAmounts = ['${thisMonthTotalAmounts[card1.cardNumber]}원', '${thisMonthTotalAmounts[card2.cardNumber]}원'];
  var thisMonthTransData = {
    '${card1.cardNumber}': '${thisMonthTransData[card1.cardNumber]}',
    '${card2.cardNumber}': '${thisMonthTransData[card2.cardNumber]}'
  };
  console.log(thisMonthTransData);


  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  function formatCardAmount(amountStr) {
    var numberPart = amountStr.replace(/[^0-9]/g, '');
    return numberWithCommas(numberPart) + '원';
  }

  function parseTransList(transListString) {
    var regex = /\(payId=(\d+), cardNumber=([\d\-]+), payDate=([\d\- :]+), payAmount=(\d+), businessCode=(\d+), businessMall=([^,]+), payStatus=([^,]+), payType=([^\)]+)\)/g;
    var result = [];
    var match;

    while (match = regex.exec(transListString)) {
      result.push({
        payId: parseInt(match[1]),
        cardNumber: match[2],
        payDate: match[3],
        payAmount: parseInt(match[4]),
        businessCode: parseInt(match[5]),
        businessMall: match[6].trim(),
        payStatus: match[7].trim(),
        payType: match[8].trim()
      });
    }

    return result;
  }

  function showTransData(cardNumber) {
    // tbody 참조
    var tbody = document.querySelector('.recentCardUse tbody');

    // tbody 내용 초기화
    tbody.innerHTML = '';

    // cardTransData에서 해당 카드번호의 거래내역 문자열을 가져옵니다.
    var transListString = thisMonthTransData[cardNumber];

    // 문자열을 파싱하여 JSON 형식의 객체 배열로 변환
    var transList = parseTransList(transListString);

    console.log("transList:", transList);

    // 거래내역 리스트를 순회하면서 테이블 row를 추가합니다.
    for (var i = 0; i < transList.length; i++) {
      var trans = transList[i];
      console.log("중8ㅑㄴ", trans);

      // 새로운 row와 cells 생성
      var newRow = tbody.insertRow();

      var cell1 = newRow.insertCell(0); // 결제일시
      var cell2 = newRow.insertCell(1); // 거래처
      var cell3 = newRow.insertCell(2); // 카드 번호
      var cell4 = newRow.insertCell(3); // 상태
      var cell5 = newRow.insertCell(4); // 거래금액

      // 각 cell에 데이터 할당
      cell1.textContent = trans.payDate;
      cell2.textContent = trans.businessMall;
      cell3.textContent = trans.cardNumber;
      cell4.textContent = trans.payStatus;
      cell5.textContent = numberWithCommas(trans.payAmount) + "원";

    }
  }

  <%--function showCardInfo(index) {--%>
  <%--    // 카드 이미지와 이름 업데이트--%>
  <%--    document.querySelector('#cardImage').src = cardImages[index];--%>
  <%--    document.querySelector('#cardImage').alt = cardNames[index];--%>
  <%--    document.querySelector('#cardName').textContent = cardNames[index];--%>

  <%--    // 카드 사용금액 업데이트--%>
  <%--    var formattedAmount = formatCardAmount(cardAmounts[index]);--%>
  <%--    document.querySelector('#monthlyUsage').textContent = formattedAmount;--%>

  <%--    // 추가된 거래내역 표시 로직--%>
  <%--    var cardNumber = (index === 0) ? '${card1.cardNumber}' : '${card2.cardNumber}';--%>
  <%--    showTransData(cardNumber);--%>
  <%--}--%>


  // function fetchAccountData() {
  //     fetch(`/api/account-data`, {
  //         method: 'post',
  //         headers: {
  //             'Content-Type': 'application/json'
  //         },
  //         body: JSON.stringify({"banks": ["woori", "shinhan", "KB"]})  //모든 은행의 계좌를 조회
  //     })
  //         .then(response => response.json())
  //         .then(data => {
  //             console.log(data);
  //             // 계좌 정보를 화면에 출력하는 코드
  //             // 예: 계좌 정보를 테이블에 추가
  //             sessionStorage.setItem('accountData', JSON.stringify(data));
  //
  //             // 계좌 조회가 성공적으로 완료되었으므로 해당 경로로 리디렉션
  //             window.location.href = "/hanaOnePay/selectHanaPayAccount";
  //         })
  //         .catch(error => {
  //             console.error("계좌 정보 조회 중 오류 발생:", error);
  //         });
  // }

  var rawData = '${transactions}';

  // rawData 정제하기
  var cleanedData = rawData.replace(/HanaOnePayTransDTO/g, "")
          .replace(/\(/g, "{")
          .replace(/\)/g, "}")
          .replace(/=/g, ":\"")
          .replace(/, /g, "\", ")
          .replace(/:\"\{/g, ":{")
          .replace(/\},\" /g, "}, ")
          .replace(/}\"/g, "}")
          .replace(/(\w+):/g, "\"$1\":"); // 프로퍼티 이름에 큰따옴표 추가

  // businessMall 값 내에 쌍따옴표 추가하기
  cleanedData = cleanedData.replace(/"businessMall":([^\,]*),/g, function (match, p1) {
    return '"businessMall":"' + p1.trim().replace(/"/g, '') + '",';
  });

  // 날짜 형식 정제하기
  cleanedData = cleanedData.replace(/\"([0-9]{4}-[0-9]{2}-[0-9]{2}) \"(\d{2})\":\"(\d{2})\":(\d{2})\"/g, "\"$1 $2:$3:$4\"");
  cleanedData = cleanedData.replace(/:(\"[^\"]*)}$/g, "$1\"}");

  // payType 필드 값의 닫는 따옴표 추가
  cleanedData = cleanedData.replace(/(\"payType\":\")([^\"]+)(\"?})/g, "$1$2\"$3");

  console.log(cleanedData);

  // // DataTable 초기화
  // var transactions = JSON.parse(cleanedData);
  // $('#transactionTable').DataTable({
  //   data: transactions,
  //   columns: [
  //     {data: 'payId'},
  //     {data: 'cardNumber'},
  //     {data: 'payDate'},
  //     {data: 'payAmount'},
  //     {data: 'businessCode'},
  //     {data: 'businessMall'},
  //     {data: 'payStatus'},
  //     {data: 'payType'}
  //   ]
  // });

  var selectedCardImage = document.querySelector('.selectCard .TransPageCardImg img');
  var selectedCardName = document.querySelector('.selectCard .cardDesc').textContent.trim();


</script>


</body>
</html>
