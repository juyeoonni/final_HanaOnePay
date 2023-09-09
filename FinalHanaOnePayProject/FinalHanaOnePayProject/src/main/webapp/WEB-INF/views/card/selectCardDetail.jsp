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

    <style>
            .content-container {
                max-width: 500px;
            }

            .myCardNameDetail {
                margin-top: 80px;
                margin-bottom: 20px;
                font-size: 30px;
                color: #5E5555;
                font-weight: bold;
            }

            .cardInfo {
                margin-top: 150px;
            }
            .cardInfo .card-detail {
                /* 테두리 스타일: 너비, 스타일, 색상 */
                border: 2px solid #cccccc;

                /* 테두리를 둥글게 만들기 (예: 10px의 radius를 적용) */
                border-radius: 10px;

                /* 내부 여백 (패딩) */
                padding: 10px;

                /* 박스간의 마진 */
                margin: 10px 0;

                /* 박스의 배경색 */
                background-color: #f9f9f9;
            }

            .cardInfo .card-detail-center {
                /* 테두리 스타일: 너비, 스타일, 색상 */
                    border: 1px ;

                    /* 테두리를 둥글게 만들기 (예: 10px의 radius를 적용) */
                    border-radius: 10px;

                    /* 내부 여백 (패딩) */
                    padding: 10px;

                    /* 박스간의 마진 */
                    margin: 10px 0;

                    /* 박스의 배경색 */
                    background-color: #BCD9D3;

                    /* 텍스트를 div의 정중앙에 배치하기 위한 스타일 */
                    display: flex;
                    align-items: center;
                    justify-content: center;

                    border: none;
            }

            .cardInfo .card-detail-center:hover {
                /* 마우스 호버 시의 배경색 */
                background-color: #00857E;


            }

            /* 거래내역조회와 하나원페이 등록 div에만 특별한 스타일을 적용 */
            .cardInfo .cardHistory {
                /* 배경색 */
                background-color: #BCD9D3;

                /* 마우스 호버 시의 배경색 */
                cursor: pointer;
            }
    </style>
</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<main>
    <!-- 사이드바와 컨텐츠를 감싸는 flex container -->
    <div class="flex-card-container">

        <!-- 사이드바 -->
        <div class="d-flex flex-column flex-shrink-0 p-3 sidebar" style="width: 280px;">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
              <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
              <span class="fs-4">카드조회</span>
            </a>
            <hr>

            <!-- 카드조회 사이드바 내용 -->
            <div class="button-container">
              <button class="card-button active" id="card1">
                <svg class="icon" width="16" height="16"></svg>
                하나카드 조회
              </button>
              <button class="card-button" id="card2">
                <svg class="icon" width="16" height="16"></svg>
                다른금융 조회
              </button>
               <a href="/card/joinHanaOnePay">
               <button class="card-button" id="card2">
                                                  <svg class="icon" width="16" height="16"></svg>
                                                  하나원페이등록

                                              </button>
</a>
            </div>

            <hr>
            <!--
            <div class="dropdown">
              <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                <strong>mdo</strong>
              </a>
              <ul class="dropdown-menu text-small shadow">
                <li><a class="dropdown-item" href="#">New project...</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Sign out</a></li>
              </ul>
            </div>
            -->
        </div>


        <!-- 사이드바 오른쪽 컨텐츠를 감싸는 flex container -->
        <div class="content-container">
            <!-- 사각형 -->
            <div class="rectangle">
                <div class="selectCardCompany">마이카드 관리</div>
            </div>

            <!-- 보유카드명 -->
            <div class="myCardNameDetail">${card.cardName}</div>

            <!-- 보유카드 이미지  -->
            <div class="myCard">
                <img src="/img/${card.cardImg}">
            </div>
        </div>


         <div class="cardInfo">
            <!-- 카드번호 -->
            <div class="cardNumber card-detail">
            카드번호: ${card.cardNumber}
             </div>

             <!-- 유효기간 -->
            <div class="cardValidate card-detail">
                유효기간: ${card.validityPeriod}
             </div>

             <!-- 카드발급일 -->
            <div class="cardJoinDate card-detail">
                카드발급일: ${card.cardNumber}
            </div>

            <!-- 거래내역조회 -->
            <div class="cardHistory card-detail-center">
                거래내역조회
            </div>

            <!-- 하나원페이 등록 -->
            <a href="/card/joinHanaOnePay">
            <div class="cardHistory card-detail-center">
                하나원페이 등록
            </div>
            </a>

    </div>





    </div>

</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
