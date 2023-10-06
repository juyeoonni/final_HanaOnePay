
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

<%--    <link rel="stylesheet" href="/css/card.css">--%>

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
        .selectCard label {
            display: flex;
            align-items: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 15px; /* 둥근 모서리 */
            margin-bottom: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  /* 섀도우 효과 추가 */
        }
        .selectCard label img {
            margin-right: 10px;
        }

        .selectCard label input[type="checkbox"] {
            margin-left: auto; /* 레이블의 오른쪽에 체크박스를 배치 */
        }

        .selectCard .card-item input[type=checkbox] {
            margin-right: 10px;
        }
        .selectCard .card-item label {
            margin: 0;
        }

        .selectCard label:hover {
            background-color: #CFEBE5;
        }
        .checked {
            background-color: #CFEBE5;
        }
        /* 실제 체크박스를 숨김 */
        .selectCard label input[type="checkbox"] {
            display: none;
        }

        /* 가짜 체크박스 */
        .selectCard label span.fake-checkbox {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 2px solid #ccc;
            border-radius: 4px;
            margin-left: auto;
            position: relative;
        }

        /* 체크 표시 */
        .selectCard label span.fake-checkbox::before {
            content: "";
            width: 10px;
            height: 10px;
            background-color: #00857E;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) scale(0);
            transition: transform 0.2s ease;
            border-radius: 2px;
        }

        /* 실제 체크박스가 선택됐을 때의 스타일 */
        .selectCard label input[type="checkbox"]:checked + span.fake-checkbox::before {
            /*transform: translate(-50%, -50%) scale(1);*/
            content: "";
            width: 18px;  /* 너비를 늘림 */
            height: 18px;  /* 높이를 늘림 */
            background-color: #00857E;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) scale(1);  /* scale 값을 1로 변경 */
            transition: transform 0.2s ease;
            border-radius: 2px;
        }
        /* ... 기존의 스타일 ... */
        .center-button {
            display: block;
            margin: auto;
            padding-left:  10px;
            padding-right:  10px;
            border-radius: 10px;
            font-size: 20px;
            background-color: #00857E;
            color: white;
            border: #00857E;
        }

        /* Additional Styles */
        .intro {
            padding-bottom: 20px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
        }

        .mycardConnect{
            width: 500px;
            height: 200px;
            display: block;
            margin: auto;
        }
        .cardname-box {
            border: 1px solid #ccc;
            border-radius: 15px !important;
            padding: 10px; /* Add padding for spacing */
            margin-bottom: 10px;
            margin-right: 50px;
            width: 400px;
            background-color: #fff; /* Background color for the box */
            color: #333; /* Text color */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Add more specific styling if needed */
        .cardname-box h3 {
            font-size: 16px;
            font-weight: bold;
        }
        .hanaAuth{
            width: 250px;
            height: 250px;
            margin-left: 20%;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        .input-wrapper {
            display: flex;
            align-items: center;
        }

        .input-wrapper input[type="text"],
        .input-wrapper input[type="tel"] {
            flex: 1;
            margin-right: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .input-wrapper button {
            padding: 6px 12px;
            border: none;
            background-color: #00857E;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .input-wrapper button:hover {
            background-color: #00664e;
        }

        #confirmationMessage {
            margin-top: 10px;
            color: #00857E;
        }

        .custom-button {
            background-color: #7E7E7E; /* 배경색 */
            color: #ffffff; /* 글자색 */
            border: none; /* 테두리 제거 */
            padding: 8px 10px;
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 마우스 포인터 변경 */
            font-size: 16px; /* 글자 크기 */
            transition: background-color 0.3s; /* 배경색 애니메이션 효과 */
        }

        .custom-button:hover {
            background-color: #00664e; /* 마우스 오버 시 배경색 */
        }

        /* 전체를 감싸고 있는 div의 너비 조절 */
        .card.text-center {
            max-width: 90%; /* 원하는 최대 너비 값으로 설정하세요. */
            margin: 0 auto; /* 가운데 정렬을 위해 추가 */
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<div class="container">
    <div class="intro" style="padding-top: 20px;">
        <div style="text-align: center; font-size:18px; color: #00857E;">마이카드</div>
        <h1 style="text-align: center; font-size: 2em;">마이하나원페이</h1>
        <img class="mycardConnect" src="/img/connectMydata.png">
        <p style="text-align: center;">흩어진 내 자산을 모아 간편하게 결제하세요!</p>
        <%--        <p style="text-align: center; font-weight: bold;">연결할 카드기관 선택</p>--%>
    </div>
</div>

<div class="card text-center">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a class="nav-link active" aria-current="true" data-toggle="tab" href="#" id="bankLink">은행</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#cardContent" id="cardLink">카드</a>
            </li>
        </ul>
    </div>
    <div class="card-body">
        <div class="tab-content">
            <div id="cardContent" class="tab-pane fade">
                <!-- 카드 탭 내용 -->
                <div class="selectCard">
                    <div class="selectCard">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4"> <!-- 첫 번째 열 -->
                                    <label for="hana">
                                        <img src="/img/bank/bankName=hana.png">
                                        하나카드
                                        <input type="checkbox" id="hana" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="woori">
                                        <img src="/img/bank/bankName=woori.png">
                                        우리카드
                                        <input type="checkbox" id="woori" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="IBK">
                                        <img src="/img/bank/bankName=IBK.png">
                                        IBK기업은행(카드)
                                        <input type="checkbox" id="IBK" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="KDB">
                                        <img src="/img/bank/bankName=KDB.png">
                                        KDB산업은행(카드)
                                        <input type="checkbox" id="KDB" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                </div>
                                <div class="col-md-4"> <!-- 두 번째 열 -->
                                    <label for="shinhan">
                                        <img src="/img/bank/bankName=shinhan.png">
                                        신한카드
                                        <input type="checkbox" id="shinhan" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="SC">
                                        <img src="/img/bank/bankName=SC.png">
                                        SC제일은행(카드)
                                        <input type="checkbox" id="SC" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="kakao">
                                        <img src="/img/bank/bankName=kakao.png">
                                        카카오뱅크(카드)
                                        <input type="checkbox" id="kakao" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="K">
                                        <img src="/img/bank/bankName=K.png">
                                        케이뱅크(카드)
                                        <input type="checkbox" id="K" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                </div>
                                <div class="col-md-4"> <!-- 세 번째 열 -->
                                    <label for="KB">
                                        <img src="/img/bank/bankName=KB.png">
                                        국민카드
                                        <input type="checkbox" id="KB" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="NH">
                                        <img src="/img/bank/bankName=NH.png">
                                        NH농협카드
                                        <input type="checkbox" id="NH" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="toss">
                                        <img src="/img/bank/bankName=toss.png">
                                        토스뱅크(카드)
                                        <input type="checkbox" id="toss" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="smy">
                                        <img src="/img/bank/bankName=smy.png">
                                        새마을금고(카드)
                                        <input type="checkbox" id="smy" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="bankContent" class="tab-pane fade show active">
                <!-- 은행 탭 내용 -->
                <div class="selectCard">
                    <div class="selectCard">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4"> <!-- 첫 번째 열 -->
                                    <label for="hana">
                                        <img src="/img/bank/bankName=hana.png">
                                        하나은행
                                        <input type="checkbox" id="hana" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="woori">
                                        <img src="/img/bank/bankName=woori.png">
                                        우리은행
                                        <input type="checkbox" id="woori" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="IBK">
                                        <img src="/img/bank/bankName=IBK.png">
                                        IBK기업은행
                                        <input type="checkbox" id="IBK" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="KDB">
                                        <img src="/img/bank/bankName=KDB.png">
                                        KDB산업은행
                                        <input type="checkbox" id="KDB" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                </div>
                                <div class="col-md-4"> <!-- 두 번째 열 -->
                                    <label for="shinhan">
                                        <img src="/img/bank/bankName=shinhan.png">
                                        신한은행
                                        <input type="checkbox" id="shinhan" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="SC">
                                        <img src="/img/bank/bankName=SC.png">
                                        SC제일은행
                                        <input type="checkbox" id="SC" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="kakao">
                                        <img src="/img/bank/bankName=kakao.png">
                                        카카오뱅크
                                        <input type="checkbox" id="kakao" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="K">
                                        <img src="/img/bank/bankName=K.png">
                                        케이뱅크
                                        <input type="checkbox" id="K" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                </div>
                                <div class="col-md-4"> <!-- 세 번째 열 -->
                                    <label for="KB">
                                        <img src="/img/bank/bankName=KB.png">
                                        국민은행
                                        <input type="checkbox" id="KB" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="NH">
                                        <img src="/img/bank/bankName=NH.png">
                                        NH농협은행
                                        <input type="checkbox" id="NH" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="toss">
                                        <img src="/img/bank/bankName=toss.png">
                                        토스뱅크
                                        <input type="checkbox" id="toss" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                    <label for="smy">
                                        <img src="/img/bank/bankName=smy.png">
                                        새마을금고
                                        <input type="checkbox" id="smy" name="card">
                                        <span class="fake-checkbox"></span> <!-- 가짜 체크박스 -->
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<%--<!-- Button trigger modal -->--%>
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>
<!--Modal 1 -->
<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <img src="/img/hanaLogo.png" alt="하나원페이 로고"
                     style="margin-right: 10px; width: 45px; height: 45px;">
                <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">
                    하나원페이</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5 id="authentification">

                </h5>
                    <div style="color: #FFFFFF; background-color: #00857E; border-radius: 5px; width: 460px; height: 40px; padding: 10px;">[하나 SMS 본인인증]</div>
                <hr>

                <div class="container">
                    <!-- <h2>SMS 문자 인증</h2> -->
                    <form id="smsForm" action="/user/sms" method="POST">

                        <div class="form-group">
                            <label for="name">이름</label>
                            <div class="input-wrapper">
                                <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="birth">생년월일</label>
                            <div class="input-wrapper">
                                <input type="text" id="birth" name="birth" placeholder="YYYYMMDD" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber">전화번호</label>
                            <div class="input-wrapper">
                                <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="010XXXXXXXX" required maxlength="11" oninput="sanitizePhoneNumber()">
                                <!-- <button type="submit" id="sendSmsButton">인증번호 전송</button> -->
                                <button onclick="sendSmsRequest()" class="button">인증번호 전송</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumberCheck">인증확인</label>
                            <div class="input-wrapper">
                                <input type="tel" id="phoneNumberCheck" name="phoneNumberCheck" placeholder="인증번호 4자리를 입력하세요" required maxlength="11" oninput="sanitizePhoneNumber()">
                                <button type="button" onclick="showConfirmationAlert(); displayConfirmationMessage()">인증</button>
                            </div>
                            <p id="confirmationMessage"></p>
                        </div>

                    </form>
                </div>



            </div>
            <div class="modal-footer">
                <button type="button" class="custom-button" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-dismiss="modal">확인</button>

            <%--                <button type="button" class="custom-button" onclick="hideModal1AndShowModal2()">확인</button>--%>
            </div>

        </div>
    </div>
</div>

<<!-- Modal2 -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <img src="/img/hanaLogo.png" alt="하나원페이 로고"
                     style="margin-right: 10px; width: 45px; height: 45px;">
                <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold;">
                    하나원페이</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5 id="selectedCardCount" style="font-size: 18px;">
                    다음의 기관에
                    <% out.print((String) session.getAttribute("name")); %> 님의 <br>
                    카드 정보 연결을 요청했어요.
                </h5>
                <hr>
                <p>요청 기관</p>
                <ul id="selectedCardList">
                    <!-- 여기에 선택한 카드사의 이름이 들어갑니다. -->
                </ul>


            </div>
            <div class="modal-footer">
                <button type="button" class="custom-button" onclick="window.location.href='/card/connectMyData'">연동</button>
            </div>
        </div>
    </div>
</div>







<br>
<button onclick="loadCardData()" class="center-button">
    연동하기
</button>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    // 은행 링크 클릭 시 스크롤 방지
    $("#bankLink").click(function(e) {
        e.preventDefault(); // 기본 동작 중지
        // 여기에 원하는 동작을 추가할 수 있습니다.
    });

    // 카드 링크 클릭 시 스크롤 방지
    $("#cardLink").click(function(e) {
        e.preventDefault(); // 기본 동작 중지
        // 여기에 원하는 동작을 추가할 수 있습니다.
    });


    document.addEventListener('DOMContentLoaded', (event) => {
        var modals = document.querySelectorAll('.modal');
        modals.forEach(m => new bootstrap.Modal(m));
    });

    $(document).ready(function(){
        // 초기에 '은행' 탭이 활성화되도록 설정
        $('.nav-link.active').tab('show');

        // 탭이 변경될 때마다 해당 내용을 보여주도록 이벤트 핸들러 추가
        $('.nav-link').on('click', function() {
            var tabId = $(this).attr('href');
            $(tabId).addClass('show active').siblings().removeClass('show active');
        });
    });

        $(document).ready(function(){
        // 탭을 활성화합니다.
        $('.nav-tabs a').click(function(){
            $(this).tab('show');
        });
    });

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
                // 받아온 데이터와 선택한 카드의 정보를 세션 스토리지에 저장
                sessionStorage.setItem('cardData', JSON.stringify(data));
                sessionStorage.setItem('selectedCards', JSON.stringify(selectedCards));

                // 선택한 카드사를 모달에 표시
                const cardList = document.getElementById('selectedCardList');
                cardList.innerHTML = '';  // 기존의 내용을 비웁니다.

                selectedCards.forEach(card => {
                    // div 엘리먼트 생성
                    const div = document.createElement('div');
                    div.className = 'cardname-box';  // CSS 클래스 적용

                    // 카드 아이디를 체크하고 원하는 텍스트를 설정합니다.
                    if (card === 'shinhan') {
                        div.textContent = '신한카드';
                    } else if (card === 'hana') {
                        div.textContent = '하나카드';
                    } else if (card === 'woori') {
                        div.textContent = '우리카드';
                    } else if (card === 'KB') {
                        div.textContent = 'KB국민카드';
                    } else {
                        div.textContent = card;
                    }

                    // "정보요청 성공" 텍스트 생성
                    const successText = document.createElement('p');
                    successText.textContent = '정보요청 성공';
                    successText.style.color = '#00857E';
                    successText.style.fontWeight = 'bold';

// 이미지 엘리먼트 생성
                    const successImage = document.createElement('img');
                    successImage.src = '/img/greenCheck.png'; // 이미지 경로 입력
                    successImage.alt = 'Success Image'; // 이미지 대체 텍스트 설정

// 이미지 크기 조절
                    successImage.style.width = '30px';
                    successImage.style.height = '30px';

// Flexbox를 사용하여 요소를 가로로 정렬
                    div.style.display = 'flex';
                    div.style.alignItems = 'center';
                    div.style.justifyContent = 'space-between';

// "정보요청 성공" 텍스트와 이미지가 div의 가장 오른쪽에 배치되도록 스타일을 설정
                    successText.style.margin = '0';
                    successImage.style.margin = '0';
                    successImage.style.marginLeft = 'auto';

// div 엘리먼트에 텍스트와 이미지 추가
                    div.appendChild(successImage);
                    div.appendChild(successText);


                    // cardList에 div 엘리먼트 추가
                    cardList.appendChild(div);
                });

                // 모달 표시
                var myModal = new bootstrap.Modal(document.getElementById('exampleModal1'), {});
                myModal.show();

            })
            .catch(error => {
                //document.getElementById('loadingIndicator').style.display = 'none';
                console.error('Error fetching card data:', error);
                alert("연동 오류! 다시 시도하세요.");
            });
    }
    document.addEventListener('DOMContentLoaded', function() {
        // 체크박스에 이벤트 리스너를 추가
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const label = this.closest('label');
                if (this.checked) {
                    label.classList.add('checked');  // 체크되면 'checked' 클래스 추가
                } else {
                    label.classList.remove('checked');  // 체크 해제되면 'checked' 클래스 제거
                }
            });
        });
    });



    // SMS 전송 버튼 클릭 시의 동작 (실제로 SMS를 전송하는 코드를 여기에 추가)
    const sendSmsButton = document.getElementById('sendSmsButton');
    sendSmsButton.addEventListener('click', function () {
        const phoneNumberInput = document.getElementById('phoneNumber');
        const phoneNumber = phoneNumberInput.value.replace(/\D/g, ''); // 숫자 이외의 문자 제거

        // 실제로 SMS를 전송하는 코드를 여기에 추가
        console.log(`SMS를 전송합니다. 전화번호: ${phoneNumber}`);
    });

    function sanitizePhoneNumber() {
        const phoneNumberInput = document.getElementById('phoneNumber');
        const inputValue = phoneNumberInput.value;

        // 숫자 이외의 문자 제거
        const sanitizedValue = inputValue.replace(/\D/g, '');

        // 11자리 초과의 입력을 방지
        if (sanitizedValue.length > 11) {
            phoneNumberInput.value = sanitizedValue.slice(0, 11);
        } else {
            phoneNumberInput.value = sanitizedValue;
        }
    }

    function sendSmsRequest() {
        const name = document.getElementById('name').value;
        const birth = document.getElementById('birth').value;
        const phoneNumber = document.getElementById('phoneNumber').value;

        const requestData = {
            recipientPhoneNumber: '01032649073',
            content: `[하나원페이] 하나원페이 사용을 위해 인증번호 5235를 입력하세요.`
        };

        // 서버로 POST 요청을 보냅니다.
        fetch('/user/sms', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                // 서버에서 받은 응답을 처리합니다.
                console.log(data);
                // 여기에서 원하는 동작을 수행할 수 있습니다.
            })
            .catch(error => {
                // 오류가 발생한 경우 처리합니다.
                console.error('Error sending SMS request:', error);
                alert('인증번호 전송 중 오류가 발생했습니다.');
            });
    }

    function showConfirmationAlert() {
        // "인증이 완료되었습니다" 메시지를 alert로 표시
        alert("[하나원페이] 인증되었습니다.");
    }

    function displayConfirmationMessage() {
        const confirmationMessage = document.getElementById('confirmationMessage');
        confirmationMessage.textContent = '인증성공';
    }

    function hideModal1AndShowModal2() {
        $('#exampleModal1').modal('hide');
        $('#exampleModal2').modal('show');
    }



</script>

<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</body>
</html>
