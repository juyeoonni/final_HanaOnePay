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

    .mypageMain {
      flex: 1;
    }

    .mypageMain {
      display: flex;
      flex-direction: column;
      margin-left: 30px;
    }

    .mypageName {
      margin-right: 130px;
      text-align: center;
      width: 100%;
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
      text-align: center;
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
      text-align: center;
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
      display: flex;
      align-items: center;
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
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
      transition: background-color 0.3s ease;
    }

    .profile:hover {
      background-color: #6C757D;
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
      text-decoration: none;
      color: inherit;
    }

    .profile a:hover {
      text-decoration: none;
    }

    .adPayTag {
      width: 90.3%;
      height: 50px;
      background-color: #d9ede8;
    }

    .adPayTag {
      display: flex;
      align-items: center;
      justify-content: center;
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
      align-items: center;
      gap: 10px;
    }

    .using {
      display: flex;
      align-items: center;
    }

    .toggleContainer {
      display: flex;
      align-items: center;
      margin-left: 570px;
    }

    #transactionTable_wrapper {
      width: 95%;
    }

    #transactionTable {
      width: 100% !important;
    }

    /*카드선택 디브들 css*/
    .selectCard {
      display: flex;
      align-items: center;
      background-color: #ffffff;
      border: 4px solid #d9ede8;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      width: 90.3%;
      height: 100px;
      padding: 0 10px;
    }

    .TransPageCardImg img {
      width: auto;
      height: 70px;
      margin-right: 20px;
      margin-left: 20px;
    }

    .cardDesc {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
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
      border: none;
      border-radius: 4px;
      color: #333;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .changeCardBtn:hover {
      background-color: #c4e0d0;
    }

    .changeCardBtn:active {
      background-color: #b0d5c2;
    }

    .changeCardBtn:focus {
      outline: none;
      box-shadow: 0 0 0 2px rgba(217, 237, 232, 0.5);
    }

    /*모달 css*/
    .selectCardModal {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .cardInfo {
      display: flex;
      align-items: center;
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

    <div id="transactionTable_wrapper" class="dataTables_wrapper no-footer" style="width: 90.3% !important;">
      <table id="transactionTable" class="display" style="width: 90.3%;">
        <thead>
        <tr>
          <th>승인번호</th>
          <th>카드번호</th>
          <th>승인일시</th>
          <th>결제금액</th>
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
              <!-- 카드번호를 '-' 로 분할 -->
              <c:set var="cardParts" value="${fn:split(transaction.cardNumber, '-')}" />
              <!-- 첫 번째 및 마지막 섹션을 제외하고 '*' 로 치환 -->
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
    var tbody = document.querySelector('.recentCardUse tbody');

    tbody.innerHTML = '';

    var transListString = thisMonthTransData[cardNumber];

    var transList = parseTransList(transListString);

    console.log("transList:", transList);

    for (var i = 0; i < transList.length; i++) {
      var trans = transList[i];
      console.log("중8ㅑㄴ", trans);

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

  var rawData = '${transactions}';

  // rawData 정제
  var cleanedData = rawData.replace(/HanaOnePayTransDTO/g, "")
          .replace(/\(/g, "{")
          .replace(/\)/g, "}")
          .replace(/=/g, ":\"")
          .replace(/, /g, "\", ")
          .replace(/:\"\{/g, ":{")
          .replace(/\},\" /g, "}, ")
          .replace(/}\"/g, "}")
          .replace(/(\w+):/g, "\"$1\":"); // 프로퍼티 이름에 큰따옴표 추가

  // businessMall 값 내에 쌍따옴표 추가
  cleanedData = cleanedData.replace(/"businessMall":([^\,]*),/g, function (match, p1) {
    return '"businessMall":"' + p1.trim().replace(/"/g, '') + '",';
  });

  // 날짜 형식 정제하기
  cleanedData = cleanedData.replace(/\"([0-9]{4}-[0-9]{2}-[0-9]{2}) \"(\d{2})\":\"(\d{2})\":(\d{2})\"/g, "\"$1 $2:$3:$4\"");
  cleanedData = cleanedData.replace(/:(\"[^\"]*)}$/g, "$1\"}");

  // payType 필드 값의 닫는 따옴표 추가
  cleanedData = cleanedData.replace(/(\"payType\":\")([^\"]+)(\"?})/g, "$1$2\"$3");

  console.log(cleanedData);

  var selectedCardImage = document.querySelector('.selectCard .TransPageCardImg img');
  var selectedCardName = document.querySelector('.selectCard .cardDesc').textContent.trim();

</script>

</body>
</html>
