<%--
  Created by IntelliJ IDEA.
  User: JuYeon
  Date: 2023-09-13
  Time: 오후 2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>원페이결제요청</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <style>

        @font-face {
            font-family: 'Hana2CM';
            src: url('/fonts/Hana2-CM.ttf') format('truetype');
        }

        body {
            font-family: 'Hana2CM', sans-serif !important; /* sans-serif는 폰트가 로드되지 않을 때 사용될 대체 폰트입니다. */
            background-color: #f7f7f8;
        }

        .carousel-inner img {
            width: 200px;
            height: auto;
            margin: auto;
            display: block;
        }

        .btn-qr {
            background-color: #00857E !important;
            color: #f7f7f7 !important;
            border: none;
            border-radius: 5px;
            width: 45%;
            height: 7vh;
            padding: 5px;
            font-size: 4.5vw;
        }

        .payAgree {
            font-size: 13px;
            color: #959595;
            margin-top: 3px;
        }

        .itemDesc {
            font-size: 22px;
            margin-left: 22px;
            margin-top: 25px;
        }

        .selectPayCard {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0.1, 0, 0, 0.1);
            padding: 20px;
            margin-left: 20px;
            margin-right: 20px;
            border-radius: 8px;
            background-color: #FFFFFF;
        }

        .payMsg {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .headerImg {
            width: 40px;
            height: 40px;
        }

        .headername {
            font-size: 25px;
            margin-left: 4px;
        }

        .card-header {
            display: flex;
            align-items: center; /* 수직 중앙 정렬을 위해 추가 */
            justify-content: center; /* 수평 중앙 정렬 */
            padding: 10px; /* 필요에 따라 패딩을 조절 */
        }

        .password-panel {
            background: #ffffff;
            border-radius: 10px;
            padding: 25px 15px;
            margin: 15px 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.05);
        }

        .password-dots {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .dot {
            width: 12px;
            height: 12px;
            background-color: #e6e6e6;
            border-radius: 50%;
        }

        .keypad {
            display: grid;
            gap: 10px;
            grid-template-columns: repeat(3, 1fr);
        }

        .keypad-btn {
            padding: 10px 0;
            border: 2px solid #e6e6e6;
            background-color: #ffffff;
            font-size: 20px;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .keypad-btn:active {
            background-color: #f2f2f2;
        }

        .keypad-btn:disabled {
            visibility: hidden;
        }




    </style>
</head>
<body>
<div class="card-header">
    <img class="headerImg" src="/img/hanaLogo.png">
    <div class="headername">하나원페이</div>
</div>
<div class="itemDesc">
    [기획] 르바인 차렷이불 3종세트 <br>
    99,000 원<br><br>
</div>

<br><br>
<div class="selectPayCard">
    <h2>결제 카드 선택</h2>
    <hr>
    <%--                                            캐러셀--%>
    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <c:forEach items="${allCards}" var="card"
                       varStatus="status">
                <button type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="${status.index}"
                        class="<c:if test="${status.index == 0}">active</c:if>"
                        aria-label="Slide ${status.index + 1}"></button>
            </c:forEach>

        </div>


        <div class="carousel-inner">
            <c:forEach items="${allCards}" var="card" varStatus="status">
                <div class="carousel-item <c:if test="${status.index == 0}">active</c:if>">
                    <!-- 이미지 경로 생성 -->
                    <img src="/img/${card.cardName}.png" class="d-block w-100" alt="${card.cardName}">
                    <div class="text-center mt-2">${card.cardName}</div>
                    <hr>
                </div>
            </c:forEach>
        </div>


        <button class="carousel-control-prev" type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<%--<a href="/hanaOnePay/addPayCard" class="add-button">새 페이카드 등록</a>--%>
<br><br>

<div class="payMsg">
    <button type="button" class="btn-qr" id="payStart" data-bs-toggle="modal" data-bs-target="#paymentModal">결제하기</button>
    <div class="payAgree">결제조건 확인 및 개인정보 제공에 동의합니다.</div>
</div>

<%--결제비밀번호 모달시작--%>
<!-- Modal -->
<div class="modal modal-fullscreen" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">결제 비밀번호 입력</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="password-panel text-center">
                    <div class="password-dots">
                        <span class="dot"></span>
                        <span class="dot"></span>
                        <span class="dot"></span>
                        <span class="dot"></span>
                    </div>
                    <div class="keypad">
                        <button class="keypad-btn" data-value="1">1</button>
                        <button class="keypad-btn" data-value="2">2</button>
                        <button class="keypad-btn" data-value="3">3</button>
                        <button class="keypad-btn" data-value="4">4</button>
                        <button class="keypad-btn" data-value="5">5</button>
                        <button class="keypad-btn" data-value="6">6</button>
                        <button class="keypad-btn" data-value="7">7</button>
                        <button class="keypad-btn" data-value="8">8</button>
                        <button class="keypad-btn" data-value="9">9</button>
                        <button class="keypad-btn" disabled></button>
                        <button class="keypad-btn" data-value="0">0</button>
                        <button class="keypad-btn" id="keypad-clear">C</button>
                    </div>
                </div>
            </div>



            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="confirmPayment" >결제</button>
            </div>
        </div>
    </div>
</div>

<%--결제비밀번호 모달 끝--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        var passwordInput = $('#paymentPassword');

        $('.keypad-btn').click(function() {
            var value = $(this).data('value');
            if(passwordInput.val().length < 6) { // 6자리 비밀번호 제한
                passwordInput.val(passwordInput.val() + value);
            }
        });

        $('.keypad-btn-clear').click(function() {
            passwordInput.val('');
        });

        $('.keypad-btn-delete').click(function() {
            passwordInput.val(passwordInput.val().slice(0, -1));
        });

        $("#payStart").click(function() {
            var paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
            passwordInput.val('');
            paymentModal.show();
        });

        $("#confirmPayment").click(function() {
            // 결제 처리를 수행하세요.
        });
    });
</script>




</body>


</html>
