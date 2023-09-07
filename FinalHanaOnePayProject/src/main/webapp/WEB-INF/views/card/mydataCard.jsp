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
    <title>joinHanaOnePay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">

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
            width: 300px;
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


    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<div class="container">
    <div class="intro" style="padding-top: 20px;">
        <h1 style="text-align: center; font-size: 2em;">마이하나원페이</h1>
        <img class="mycardConnect" src="/img/mycardConnect.gif">
        <p style="text-align: center;">흩어진 내 카드를 모아 간편하게 결제하세요!</p>
        <%--        <p style="text-align: center; font-weight: bold;">연결할 카드기관 선택</p>--%>
    </div>
</div>

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
<br>

<br>
<button onclick="loadCardData()" class="center-button">
    연동하기
</button>



<script>
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
                    successText.style.color = '#00857E'; // 초록색으로 설정
                    successText.style.fontWeight = 'bold'; // 볼드체로 설정

// 이미지 엘리먼트 생성
                    const successImage = document.createElement('img');
                    successImage.src = '/img/greenCheck.png'; // 이미지 경로 입력
                    successImage.alt = 'Success Image'; // 이미지 대체 텍스트 설정

// 이미지 크기 조절
                    successImage.style.width = '30px'; // 가로 크기 조절
                    successImage.style.height = '30px'; // 세로 크기 조절

// Flexbox를 사용하여 요소를 가로로 정렬
                    div.style.display = 'flex';
                    div.style.alignItems = 'center'; // 요소를 수직 중앙으로 정렬
                    div.style.justifyContent = 'space-between'; // 요소 사이에 공간을 두고 정렬

// "정보요청 성공" 텍스트와 이미지가 div의 가장 오른쪽에 배치되도록 스타일을 설정합니다.
                    successText.style.margin = '0'; // 텍스트의 여백을 초기화합니다.
                    successImage.style.margin = '0'; // 이미지의 여백을 초기화합니다.
                    successImage.style.marginLeft = 'auto'; // 이미지를 가장 오른쪽으로 이동합니다.

// div 엘리먼트에 텍스트와 이미지 추가
                    div.appendChild(successImage);
                    div.appendChild(successText);


                    // cardList에 div 엘리먼트 추가
                    cardList.appendChild(div);
                });

                // 모달 표시
                var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {});
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



</script>

<%--<!-- Button trigger modal -->--%>
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">기관연동</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5 id="selectedCardCount">
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
                <button type="button" class="btn btn-success" onclick="window.location.href='/card/connectMyData'">연동</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>




<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</body>
</html>
