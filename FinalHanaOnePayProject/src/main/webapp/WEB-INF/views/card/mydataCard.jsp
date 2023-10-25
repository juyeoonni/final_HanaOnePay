
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
            border-radius: 15px;
            margin-bottom: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .selectCard label img {
            margin-right: 10px;
        }

        .selectCard label input[type="checkbox"] {
            margin-left: auto;
        }

        .selectCard .card-item input[type=checkbox] {
            margin-right: 10px;
        }
        .selectCard .card-item label {
            margin: 0;
        }

        .selectCard label:hover {
            background-color: rgba(224, 221, 221, 0.41);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
        }
        .checked {
            background-color: rgba(224, 221, 221, 0.41);
        }

        .selectCard label input[type="checkbox"] {
            display: none;
        }

        .selectCard label span.fake-checkbox {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 2px solid #ccc;
            border-radius: 4px;
            margin-left: auto;
            position: relative;
        }

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

        .selectCard label input[type="checkbox"]:checked + span.fake-checkbox::before {
            width: 18px;
            height: 18px;
            background-color: #00857E;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) scale(1);
            transition: transform 0.2s ease;
            border-radius: 2px;
        }
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
            padding: 10px;
            margin-bottom: 10px;
            margin-right: 50px;
            width: 400px;
            background-color: #fff;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

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
            background-color: #7E7E7E;
            color: #ffffff;
            border: none;
            padding: 8px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .custom-button:hover {
            background-color: #00664e;
        }


        .card.text-center {
            max-width: 90%;
            margin: 0 auto;
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
    </div>
</div>

<div class="card text-center">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs" style="margin-left: 70px;">
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
                                <button onclick="sendSmsRequest()" class="button">인증번호 전송</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumberCheck">인증확인</label>
                            <div class="input-wrapper">
                                <input type="tel" id="phoneNumberCheck" name="phoneNumberCheck" placeholder="인증번호 6자리를 입력하세요" required maxlength="11" oninput="sanitizePhoneNumber()">
                                <button type="button" onclick="showConfirmationAlert(); displayConfirmationMessage()">인증</button>
                            </div>
                            <p id="confirmationMessage"></p>
                        </div>

                    </form>
                </div>



            </div>
            <div class="modal-footer">
                <button type="button" class="custom-button" id="confirmButton" onclick="hideModal1AndShowModal2()">확인</button>
            </div>

        </div>
    </div>
</div>

<!-- Modal2 -->
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
<br><br><br><br>
<img src="/img/footer.png" style="margin-left: 7%;">
</body>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    // 하나원페이 마이데이터 서비스 신규 등록 알림 문자
    document.getElementById('confirmButton').addEventListener('click', function() {
        const requestData = {
            recipientPhoneNumber: '01032649073',
            content: `[하나원페이] 정하나 고객님께서 신청하신 마이데이터 지갑연동 동의가 신규 등록 되었습니다. `
        };

        fetch('/hanaOnePay/sms', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                $('#exampleModal2').modal('show');
            })
            .catch(error => {
                console.error('Error sending SMS request:', error);
                alert('인증번호 전송 중 오류가 발생했습니다.');
            });
    });

    // 은행 링크 클릭 시 스크롤 방지
    $("#bankLink").click(function(e) {
        e.preventDefault();
    });

    // 카드 링크 클릭 시 스크롤 방지
    $("#cardLink").click(function(e) {
        e.preventDefault();
    });

    document.addEventListener('DOMContentLoaded', (event) => {
        var modals = document.querySelectorAll('.modal');
        modals.forEach(m => new bootstrap.Modal(m));
    });

    $(document).ready(function(){
        $('.nav-link.active').tab('show');

        $('.nav-link').on('click', function() {
            var tabId = $(this).attr('href');
            $(tabId).addClass('show active').siblings().removeClass('show active');
        });
    });

        $(document).ready(function(){
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
                console.log(data);
                sessionStorage.setItem('cardData', JSON.stringify(data));
                sessionStorage.setItem('selectedCards', JSON.stringify(selectedCards));

                const cardList = document.getElementById('selectedCardList');
                cardList.innerHTML = '';

                selectedCards.forEach(card => {
                    const div = document.createElement('div');
                    div.className = 'cardname-box';

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

                    const successText = document.createElement('p');
                    successText.textContent = '정보요청 성공';
                    successText.style.color = '#00857E';
                    successText.style.fontWeight = 'bold';

                    const successImage = document.createElement('img');
                    successImage.src = '/img/greenCheck.png';
                    successImage.alt = 'Success Image';

                    successImage.style.width = '30px';
                    successImage.style.height = '30px';

                    div.style.display = 'flex';
                    div.style.alignItems = 'center';
                    div.style.justifyContent = 'space-between';

                    successText.style.margin = '0';
                    successImage.style.margin = '0';
                    successImage.style.marginLeft = 'auto';

                    div.appendChild(successImage);
                    div.appendChild(successText);

                    cardList.appendChild(div);
                });

                var myModal = new bootstrap.Modal(document.getElementById('exampleModal1'), {});
                myModal.show();

            })
            .catch(error => {
                console.error('Error fetching card data:', error);
                alert("연동 오류! 다시 시도하세요.");
            });
    }
    document.addEventListener('DOMContentLoaded', function() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const label = this.closest('label');
                if (this.checked) {
                    label.classList.add('checked');
                } else {
                    label.classList.remove('checked');
                }
            });
        });
    });

    const sendSmsButton = document.getElementById('sendSmsButton');
    sendSmsButton.addEventListener('click', function () {
        const phoneNumberInput = document.getElementById('phoneNumber');
        const phoneNumber = phoneNumberInput.value.replace(/\D/g, '');

        console.log(`SMS를 전송합니다. 전화번호: ${phoneNumber}`);
    });

    function sanitizePhoneNumber() {
        const phoneNumberInput = document.getElementById('phoneNumber');
        const inputValue = phoneNumberInput.value;

        const sanitizedValue = inputValue.replace(/\D/g, '');

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
            content: `[하나원페이] 하나원페이 사용을 위해 인증번호 452125 입력하세요.`
        };

        fetch('/user/sms', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
            })
            .catch(error => {
                console.error('Error sending SMS request:', error);
                alert('인증번호 전송 중 오류가 발생했습니다.');
            });
    }

    function showConfirmationAlert() {
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

</html>
