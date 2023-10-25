<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/home.css">
    <title>HanaOnePay Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <style>
        .modal-backdrop.show {
            opacity: 0 !important;
        }

        .outer-box {
            border: 2px solid #E2E6E9;
            padding: 20px;
            margin: 20px;
            width: 420px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
        }

        .agree-all-label {
            font-size: 1.5em;
            font-weight: bold;
        }

        .inner-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            border-radius: 10px;
        }

        .select_disable {
            color: grey;
        }

        .hanaCharacter {
            width: 250px;
            height: 250px;
            margin-left: 25%;

        }

        .close {
            border: none;
            background-color: white;
        }

        .btn-agree {
            color: #FFFFFF !important;
            background-color: #00857E !important;
        }

        .flex-container {
            display: flex;
        }

        .modal-backdrop {
            z-index: 1030 !important;
        }

        #confirmModal {
            z-index: 1050 !important;
            background-color: rgba(33, 37, 41, 0.66) !important;
        }

        .mainAD1 {
            width: 280px;
            height: 150px;
            border-radius: 5px;
            background-color: #BCD9D3;
            margin-left: 7%;
            margin-top: 8%;
        }

        .mainAD2 {
            width: 280px;
            height: 150px;
            border-radius: 5px;
            background-color: #E3F1FF;
            margin-left: 7%;
            margin-top: 8%;
        }

    </style>
</head>
<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<main>

    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner" style="position: relative;"> <!-- Relative positioning for carousel -->

            <div class="animate__animated animate__fadeInDown"
                 style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1; color:#FFFFFF; font-size: 26px; font-weight: bold; margin-left: -500px; margin-top: -14%;">
                모두의 하나원페이
            </div>
            <div class="animate__animated animate__fadeInUp"
                 style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1; color:#FFFFFF; font-size: 25px; font-weight: bold; margin-left: -470px; margin-top: -11%;">
                간편하게 등록하고 결제하는 생활
            </div>

            <!-- Wrapping div -->
            <div class="mainBox1"
                 style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); margin-left: 21.5%; z-index: 2;">
                <!-- Original div -->
                <div class="mainBox2"
                     style="background-color: #FFFFFF; width: 600px; height: 270px; padding-top: 20px;">
                    <div class="parentBox" style="display: flex; justify-content: start; align-items: center;">
                        <div class="userName" style="margin-left: 10%; font-size: 20px; width: 100%;">${name} 님</div>
                        <a href="/customer/customer_myHanaPage"
                           style="text-decoration: none; color: inherit; display: inline-block; width: 100%; margin-left: 230px;">
                            <div class="myPage" style="color: #666666; ">마이페이지 ☰</div>
                        </a>
                    </div>
                    <hr style="margin-left: 10%; width: 80%;">


                    <c:set var="card1" value="${cardInfos[0]}"/>
                    <c:set var="card2" value="${cardInfos[1]}"/>

                    <c:set var="cardPayLog1" value="${thisMonthTransData[card1.cardNumber]}"/>
                    <c:set var="cardPayLog2" value="${thisMonthTransData[card2.cardNumber]}"/>

                    <div style="display: flex;">
                        <div style="color:#666666; width: 230px; height: 150px;  margin-left: 10%; margin-top: 2%; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4); transition: all 0.3s;">
                            <div class="creditCardWithDraw" style="padding: 8px; ">
                                <div style="margin-top: 15px; margin-left: 10px;">다가오는 결제</div>
                                <div payCreditCardList>
                                    <br>

                                    <div class="flex-container"
                                         style="font-size: 15px; margin-top: 2px; margin-left: 10px;">
                                        <p style="color: #959595; margin-right: 15px; ">결제일 </p>
                                        <p style="text-align: right;">매월${creditCards[0].paymentDate}일</p>
                                    </div>
                                    <br>
                                    <div class="flex-container"
                                         style="font-size: 15px; margin-top: -30px; margin-left: 10px;">
                                        <p style="color: #959595; margin-right: 15px;">결제 예정금액 </p>
                                        <div id="totalSpentAmount">총 ${totalSpentAmount}원</div>
                                    </div>
                                    <br>
                                    <br>
                                </div>
                            </div>
                        </div>

                        <div style="color:#666666; width: 230px; height: 150px; margin-left: 3.7%; margin-top: 2%; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4); transition: all 0.3s;">
                            <div class="creditCardWithDraw" style="padding: 8px;">
                                <div style="margin-top: 15px; margin-left: 10px;">대표하나카드</div>
                            </div>
                            <div class="flex-container">
                                <img src="/img/${cardInfos[0].cardName}.png" class="d-block payCardImg" id="cardImage"
                                     alt="${cardInfos[0].cardName}"
                                     style="width: 104px; height: 69px; margin-left: 8%; margin-top: 2%;">
                                <div id="cardName"
                                     style="color: #666666; font-size: 14px; margin-left: 9px; margin-top: 25px;">${card1.cardName}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="background-color: #00857E; width: 600px; height: 50px; margin-top: 22px; display: flex; justify-content: space-around; align-items: center; font-size: 15px;">
                    <a href="#" style="text-decoration: none; color: #FFFFFF;">하나원페이</a>
                    <span style="color: #FFFFFF;">|</span>
                    <a href="/hanaOnePay/selectHanaPayCard" style="text-decoration: none; color: #FFFFFF;">결제수단조회</a>
                    <span style="color: #FFFFFF;">|</span>
                    <a href="#" style="text-decoration: none; color: #FFFFFF;">즉시결제</a>
                    <span style="color: #FFFFFF;">|</span>
                    <a href="/hanaOnePay/event" style="text-decoration: none; color: #FFFFFF;">이벤트</a>
                </div>
            </div>

            <div class="carousel-item active">
                <img src="/img/mainPageImg.jpg" class="d-block w-100" alt="..." style="height: 470px;">
            </div>
            <div class="carousel-item">
                <img src="..." class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="..." class="d-block w-100" alt="...">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>


        <div style="display: flex; justify-content: space-between; width: 100%;  height: 450px;padding-top: 100px; background-color: #f5f6f8;">
            <!-- First div -->
            <div style="background-color: #FFFFFF; width: 600px; height: 285px; margin-left: 11%; display: flex; flex-direction: column; align-items: start;">
                <p style="margin-left: 6%; margin-top: 5%; margin-bottom: -5%;">추천 하나카드</p>
                <div style="display: flex; justify-content: space-between; width: 100%;">
                    <div style="flex-direction: column; align-items: center; margin-left: 5%; margin-top: 8%;">
                        <img src="/img/travellogCard.gif" alt="Image 1" style="width: 147px; height: 93px;">
                        <a href="https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41016787P&CD_PD_SEQ=16787&" class="btn" style="width: 147px; background-color: #00857E; color:#FFFFFF; margin-top: 10px;">상세보기</a>
                    </div>
                    <div style="flex-direction: column; align-items: center; margin-top: 8%;">
                        <img src="/img/샵마이웨이.gif" alt="Image 2" style="width: 147px; height: 93px;">
                        <a href="https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41015444P&CD_PD_SEQ=15444&" class="btn" style="width: 147px; background-color: #00857E; color:#FFFFFF; margin-top: 10px;">상세보기</a>
                    </div>
                    <div style="flex-direction: column; align-items: center; margin-right: 5%; margin-top: 8%;">
                        <img src="/img/샵애니하나카드.gif" alt="Image 3" style="width: 147px; height: 93px;">
                        <a href="https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41015249P&CD_PD_SEQ=15249&" class="btn" style="width: 147px; background-color: #00857E; color:#FFFFFF; margin-top: 10px;">상세보기</a>
                    </div>
                </div>
            </div>

            <!-- Second div -->
            <div style="background-color: #FFFFFF; width: 600px; height: 285px; margin-right: 130px; display: flex; flex-direction: column; align-items: start;">
                <p style="margin-left: 7%; margin-top: 5%; margin-bottom: -5%;">서비스</p>
                <div style="display: flex">
                    <div class="mainAD1">
                        <div style="display: flex;">
                            <div style= "margin-left: 10%; padding-top: 35px;">
                                <div style="color: #FFFFFF">마이페이</div>
                                <div style="color: #FFFFFF;  margin-top: 5px;">내 카드 <br>불러오기</div>
                            </div>
                            <img src="/img/mainAD1.png" style="width: 140px; height: 130px; margin-left: 11px;">
                        </div>
                    </div>
                    <div class="mainAD2">
                        <div style="display: flex;">
                            <div style= "margin-left: 10%; padding-top: 35px;">
                                <div>하나원페이</div>
                                <div style="font-size: 14px; margin-top: 5px;">간편한 <br>온라인 결제</div>
                            </div>
                            <img src="/img/mainAD2.png" style="width: 140px; height: 130px; margin-left: 11px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 메뉴바 -->
        <div class="menu-bar"
             style="border-radius:0px; background-color:#FFFFFF; position: absolute; top: 10px; left: 10px; z-index: 2; margin-left: 10.5%; width:80%; margin-top: 28%;">

            <!-- Trigger element -->
            <a data-href="/card/mydataCard" class="menu-item">
                <div class="menu-content" style="font-size: 20px;">
                    마이페이
                </div>
            </a>

            <a href="/customer/customer_myHanaPage" class="menu-item">
                <div class="menu-content" style="font-size: 20px;">
                    마이하나
                </div>
            </a>
            <a href="/hanaOnePay/payManage" class="menu-item">
                <div class="menu-content" style="font-size: 20px;">
                    즉시결제
                </div>
            </a>

            <a href="/shop/shopMain" class="menu-item">
                <div class="menu-content" style="font-size: 19px;">
                    하나원쇼핑
                </div>
            </a>

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true" style="z-index: 10;">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="/img/hanaLogo.png" alt="하나원페이 로고"
                         style="margin-right: 10px; width: 45px; height: 45px;">
                    <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">하나원페이</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h4 style="background-color: #00857E; color: #FFFFFF;">[하나원페이 약관동의서]</h4>

                    <br>
                    <h6>마이하나원페이는 통합 결제수단 관리에 특화된 마이데이터 서비스 입니다.</h6>
                    <h6>지갑 연결 진행을 위해 약관에 동의해 주세요.</h6> <br>

                    <div>

                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">
                                        ▪ 통합결제관리서비스 이용약관
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show"
                                     data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <h5><strong>1. 서비스 목적</strong></h5>
                                        <p>
                                            마이데이터 서비스는 사용자의 개인정보를 효과적으로 관리하며, 사용자의 명시적 동의하에 해당 정보를 제3자에게 제공하는
                                            서비스입니다. 이를 통해 사용자에게 맞춤형 서비스 제공이 가능합니다.
                                        </p>

                                        <h5><strong>2. 수집하는 데이터 정보</strong></h5>
                                        <ul>
                                            <li>기본 정보: 이름, 주민등록번호, 전화번호, 이메일</li>
                                            <li>서비스 이용 정보: 로그인 기록, 서비스 이용 기록</li>
                                            <li>기타 추가 정보: 선호하는 상품, 이용한 서비스 내역 등</li>
                                        </ul>

                                        <h5><strong>3. 데이터 제3자 제공</strong></h5>
                                        <p>
                                            사용자의 명시적인 동의 하에만, 위에서 수집한 데이터는 제3자와 공유됩니다. 공유하는 목적은 주로 사용자에게 더 나은
                                            서비스
                                            제공과 관련됩니다.
                                        </p>

                                        <h5><strong>4. 동의 철회와 데이터 삭제</strong></h5>
                                        <p>
                                            사용자는 언제든지 동의 철회를 원할 경우, 마이페이지에서 해당 기능을 선택하실 수 있습니다. 동의 철회 시, 모든 개인
                                            데이터는
                                            즉시 삭제되며, 복구가 불가능합니다.
                                        </p>

                                        <h5><strong>5. 데이터 보관 기간 및 정책</strong></h5>
                                        <p>
                                            사용자의 데이터는 동의 후 최대 3년간 보관됩니다. 보관 기간 이후에는 자동으로 파기되며, 별도의 안내 없이 파기될 수
                                            있습니다.
                                        </p>

                                        <h5><strong>6. 동의 거부 및 제한</strong></h5>
                                        <p>
                                            사용자는 본 동의서에 대해 동의 거부 권리가 있으며, 동의하지 않을 경우 마이데이터 서비스의 일부 또는 전체 이용에 제한이
                                            있을
                                            수 있습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                            aria-expanded="false" aria-controls="collapseTwo">
                                        ▪ 통합결제관리서비스 설명서
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse"
                                     data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <h5><strong>1. 서비스 목적</strong></h5>
                                        <p>
                                            마이데이터 서비스는 사용자의 개인정보를 효과적으로 관리하며, 사용자의 명시적 동의하에 해당 정보를 제3자에게 제공하는
                                            서비스입니다. 이를 통해 사용자에게 맞춤형 서비스 제공이 가능합니다.
                                        </p>

                                        <h5><strong>2. 수집하는 데이터 정보</strong></h5>
                                        <ul>
                                            <li>기본 정보: 이름, 주민등록번호, 전화번호, 이메일</li>
                                            <li>서비스 이용 정보: 로그인 기록, 서비스 이용 기록</li>
                                            <li>기타 추가 정보: 선호하는 상품, 이용한 서비스 내역 등</li>
                                        </ul>

                                        <h5><strong>3. 데이터 제3자 제공</strong></h5>
                                        <p>
                                            사용자의 명시적인 동의 하에만, 위에서 수집한 데이터는 제3자와 공유됩니다. 공유하는 목적은 주로 사용자에게 더 나은
                                            서비스
                                            제공과 관련됩니다.
                                        </p>

                                        <h5><strong>4. 동의 철회와 데이터 삭제</strong></h5>
                                        <p>
                                            사용자는 언제든지 동의 철회를 원할 경우, 마이페이지에서 해당 기능을 선택하실 수 있습니다. 동의 철회 시, 모든 개인
                                            데이터는
                                            즉시 삭제되며, 복구가 불가능합니다.
                                        </p>

                                        <h5><strong>5. 데이터 보관 기간 및 정책</strong></h5>
                                        <p>
                                            사용자의 데이터는 동의 후 최대 3년간 보관됩니다. 보관 기간 이후에는 자동으로 파기되며, 별도의 안내 없이 파기될 수
                                            있습니다.
                                        </p>

                                        <h5><strong>6. 동의 거부 및 제한</strong></h5>
                                        <p>
                                            사용자는 본 동의서에 대해 동의 거부 권리가 있으며, 동의하지 않을 경우 마이데이터 서비스의 일부 또는 전체 이용에 제한이
                                            있을
                                            수 있습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                            aria-expanded="false" aria-controls="collapseTwo">
                                        ▪ 개인(신용)정보 수집 이용 동의서
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse"
                                     data-bs-parent="#accordionExample">
                                    <div class="accordion-body">

                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                            aria-expanded="false" aria-controls="collapseTwo">
                                        ▪ 이벤트, 혜택정보 수신 동의
                                    </button>
                                </h2>
                                <div id="collapseFour" class="accordion-collapse collapse"
                                     data-bs-parent="#accordionExample">
                                    <div class="accordion-body">

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>


                    <br>
                    <small class="text-muted">본 동의서는 <span class="text-primary">하나카드</span>의 서비스 정책에 따라 변경될 수
                        있습니다.</small>

                    <%--                        약간동의체크박스--%>
                    <div class="outer-box">
                        <label class="agree-all-label" for="agree_all">
                            <input type="checkbox" name="agree_all" id="agree_all">
                            <span>모두 동의합니다</span>
                        </label>
                        <div class="inner-box">
                            <label for="agree">
                                <input type="checkbox" name="agree" value="1">
                                <span><strong>[필수]</strong> 통합결제관리서비스 이용약관</span>
                            </label>
                            <br>
                            <label for="agree">
                                <input type="checkbox" name="agree" value="2">
                                <span><strong>[필수]</strong> 통합결제관리서비스 설명서</span>
                            </label>
                            <br>
                            <label for="agree">
                                <input type="checkbox" name="agree" value="3">
                                <span><strong>[필수]</strong> 개인(신용)정보 수집 이용 동의서</span>
                            </label>
                            <br>
                            <label for="agree">
                                <input type="checkbox" name="agree" value="4">
                                <span><strong>[선택]</strong> 이벤트, 혜택정보 수신 동의</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <a href="/home">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </a>
                    <button type="button" class="btn btn-agree confirm-go">동의</button>
                </div>
            </div>
        </div>
    </div>

</main>
<!-- 푸터위치
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
-->
<br/>
<img src="/img/footer.png" style="margin-left: 8.8%;">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>


    document.addEventListener("DOMContentLoaded", function () {
        var modalTriggerElement = document.querySelector('.menu-item');
        var myModal = new bootstrap.Modal(document.getElementById('confirmModal'), {
            keyboard: false
        });

        modalTriggerElement.addEventListener('click', function () {
            myModal.show();
        });

        document.querySelector('.confirm-go').addEventListener('click', function () {
            window.location.href = modalTriggerElement.getAttribute('data-href');
        });
    });

    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for (let i = 0; i < agreeChk.length; i++) {
            agreeChk[i].checked = e.target.checked;
        }
    });

    window.onload = function () {
        console.log("Script is running"); // 로그 추가

        let phoneElement = document.getElementById("phone");
        let originalPhone = phoneElement.textContent.trim();

        console.log("Original phone:", originalPhone); // 로그 추가

        if (originalPhone) {
            let phoneParts = originalPhone.split('-');
            if (phoneParts.length === 3) {
                phoneParts[2] = "****";
                let modifiedPhone = phoneParts.join('-');
                phoneElement.textContent = modifiedPhone;
            }
        }

        const targetAmount = parseInt('${thisMonthTotalAmounts[card1.cardNumber]}'.replace(/[^0-9]/g, ''));
        const displayElement = document.getElementById("monthlyUsage");
        const duration = 500;
        const stepTime = 10;
        let currentAmount = 0;
        const increment = targetAmount / (duration / stepTime);

        const intervalId = setInterval(function () {
            currentAmount += increment;
            if (currentAmount >= targetAmount) {
                clearInterval(intervalId);
                currentAmount = targetAmount;
            }
            displayElement.textContent = numberWithCommas(Math.round(currentAmount)) + "원";
        }, stepTime);

        // 하나머니
        const targetHanaMoney = parseInt('${hanaMoney}'.replace(/[^0-9]/g, ''));
        const displayHanaMoneyElement = document.getElementById("hanaMoney");

        let currentHanaMoney = 0;

        const hanaMoneyIntervalId = setInterval(function () {
            currentHanaMoney += increment;
            if (currentHanaMoney >= targetHanaMoney) {
                clearInterval(hanaMoneyIntervalId);
                currentHanaMoney = targetHanaMoney;
            }
            displayHanaMoneyElement.textContent = numberWithCommas(Math.round(currentHanaMoney)) + "원";
        }, stepTime);

    }

    window.addEventListener('DOMContentLoaded', (event) => {
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        let totalSpentAmountDiv = document.getElementById('totalSpentAmount');
        let value = parseInt(totalSpentAmountDiv.textContent.replace(/[^0-9]/g, '')); // 숫자만 추출
        totalSpentAmountDiv.textContent = "총 " + numberWithCommas(value) + "원";
    });

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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

    function showCardInfo(index) {
        // 카드 이미지와 이름 업데이트
        document.querySelector('#cardImage').src = cardImages[index];
        document.querySelector('#cardImage').alt = cardNames[index];
        document.querySelector('#cardName').textContent = cardNames[index];

        // 카드 사용금액 업데이트
        var formattedAmount = formatCardAmount(cardAmounts[index]);
        document.querySelector('#monthlyUsage').textContent = formattedAmount;

        // 추가된 거래내역 표시 로직
        var cardNumber = (index === 0) ? '${card1.cardNumber}' : '${card2.cardNumber}';
        showTransData(cardNumber);
    }


    function fetchAccountData() {
        fetch(`/api/account-data`, {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({"banks": ["woori", "shinhan", "KB"]})  //모든 은행의 계좌를 조회
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                sessionStorage.setItem('accountData', JSON.stringify(data));

                // 계좌 조회가 성공적으로 완료되었으므로 해당 경로로 리디렉션
                window.location.href = "/hanaOnePay/selectHanaPayAccount";
            })
            .catch(error => {
                console.error("계좌 정보 조회 중 오류 발생:", error);
            });
    }

</script>
</body>
</html>
