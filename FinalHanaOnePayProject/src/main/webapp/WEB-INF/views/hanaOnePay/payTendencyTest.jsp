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

            .testStart{
                border-radius: 15px;
                width: 1000px;
                height: 500px;
                border: #BCD9D3 5px solid;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }
            .payTestStart{
                width: 230px;
                height: 320px;
                margin-left: 50px;
            }

            #unique_startButton {
                font-size: 20px;
                border-radius: 10px;
                margin-top: 15px;
                color: #FFFFFF;
                background-color: #00857E;
                border: none;
                width: 150px;
                height: 40px;
                transition: background-color 0.3s, transform 0.3s;
            }

            #unique_startButton:hover {
                background-color: #005a53;
                transform: scale(1.1);
                cursor: pointer;
            }

            .custom-underline {
                text-decoration: underline;
                color: #00857E;
                text-underline-offset: 6px;
            }


            .unique_choice {
                z-index: 10;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                width: 500px;
                display: block;
                margin: 10px 0;
                background-color: #00857E;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 10px 20px;
                cursor: pointer;
            }

            .unique_choice:hover {
                background-color: #BCD9D3;
                color: #666666;
            }

            .unique_choice.clicked {
                background-color: #BCD9D3;
                color: #666666;
            }

            /*스태퍼*/
            .stepper {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 20px 0;
                position: relative;
            }

            .step {
                width: 40px;
                height: 40px;
                border: 2px solid #00857E;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 50px;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
                background-color: white;
                z-index: 2;
                font-weight: bold;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
            }

            .stepper:before {
                position: absolute;
                height: 2px;
                background-color: #00857E;
                top: 50%;
                width: calc(100% - 100px);
                left: 30px;
                z-index: 1;
            }

            .step.active {
                background-color: #00857E;
                color: white;
            }

            .question_wrapper {
                padding: 50px;
                margin-top: 50px;
                display: flex;
                align-items: center;
                width: 90.3%;
                height: 450px;
            }

            .question_content {
                padding-right: 100px;
                margin-left: 100px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .prev_btn, .next_btn {
                color: #00857E;
                font-size: 30px;
                background-color: white;
                border: none;
                margin: 0 20px;
            }

            .payQuestion{
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 100px;
                height: 10px;
            }

            .payQuestionImg{
                width: 300px;
                height: 300px;
                margin-bottom: 10px;
            }

            #resultButton {
                position: relative;
                z-index: 1000;
                font-size: 20px;
                border-radius: 10px;
                margin-top: 15px;
                color: #FFFFFF;
                background-color: #00857E;
                border: none;
                width: 150px;
                height: 40px;
                transition: background-color 0.3s, transform 0.3s;
            }

            #resultButton:hover {
                background-color: #005a53;
                transform: scale(1.1);
                cursor: pointer;
            }

            .modal-body {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                height: 100%;
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
                        </ul>
                    </div>
                </li>

                <li class="border-top my-3"></li>
            </ul>
        </div>
        <%--    사이드바끝--%>

        <div class="mypageMain">

            <div class="mypageName">
                <div style="font-size: 30px">내게 맞는 카드</div>
                <div style="color: #00857E;">테스트와 소비태그 기반 나에게 딱 맞는 카드 추천</div>

<%--                스태퍼--%>
                <div class="stepper" style="display: none;">
                    <span class="step" id="step1">1</span>
                    <span class="step" id="step2">2</span>
                    <span class="step" id="step3">3</span>
                    <span class="step" id="step4">4</span>
                    <span class="step" id="step5">5</span>
                </div>
            </div>

            <div class="testStart">
                <div class="testMsg">
                    <h2>나에게 <span class="custom-underline">딱 맞는</span> 카드를 추천해드립니다</h2>
                    <div>하나원페이의 소비성향 테스트를 진행하고</div>
                    <div>테스트와 소비태그 기반 나에게 딱 맞는 카드를 찾아보세요!</div>
                    <button id="unique_startButton" onclick="startTest()">테스트 시작</button>
                </div>
                <img class="payTestStart animate__animated animate__backInRight" src="/img/payTestStart.png" alt="">
            </div>

            <div class="unique_question" id="unique_question1" style="display:none;">
                <div class="question_wrapper">
                    <button class="prev_btn" onclick="prevQuestion()">&#8592;</button>
                    <div class="question_content">
                        <img class="payQuestionImg" src="/img/Q1.png" alt="">
                        <p class="payQuestion">Q. 기다리고 기다리던 주말! 당신의 주말 활동은 주로 어떤 것인가요?</p>
                        <button class="unique_choice" onclick="selectAnswer(1, 'A')">A. 힐링이 최고야! 집에서 편히 쉬거나 책 읽기, 영화 보기</button>
                        <button class="unique_choice" onclick="selectAnswer(1, 'B')">B. 밖에서 친구들과 쇼핑하기, 영화나 연극 보기, 전시회 방문하기</button>
                    </div>
                    <button class="next_btn" onclick="nextQuestion()">&#8594;</button>
                </div>
            </div>

            <div class="unique_question" id="unique_question2" style="display:none;">
                <div class="question_wrapper">
                    <button class="prev_btn" onclick="prevQuestion()">&#8592;</button>
                    <div class="question_content">
                        <img class="payQuestionImg" src="/img/Q2.png" alt="">
                        <p class="payQuestion">Q. 힐링이 필요해~ 휴가 시즌이 되면 당신은 어떻게 보내는 편인가요?</p>
                        <button class="unique_choice" onclick="selectAnswer(2, 'A')">A. 집나가면 고생이지! 집에서 휴식이나 집 주변 도시 탐방</button>
                        <button class="unique_choice" onclick="selectAnswer(2, 'B')">B. 지금이 기회다! 해외나 멀리 떨어진 지역으로의 여행</button>
                    </div>
                    <button class="next_btn" onclick="nextQuestion()">&#8594;</button>
                </div>
            </div>

            <div class="unique_question" id="unique_question3" style="display:none;">
                <div class="question_wrapper">
                    <button class="prev_btn" onclick="prevQuestion()">&#8592;</button>
                    <div class="question_content">
                        <img class="payQuestionImg" src="/img/Q3.png" alt="">
                        <p class="payQuestion">Q. 스트레스를 받았을 때, 당신은 어떻게 해소하나요?</p>
                        <button class="unique_choice" onclick="selectAnswer(3, 'A')">A. 나만의 생각을 갖어야 겠어! 음악 듣기, 취미 활동, 또는 운동하기</button>
                        <button class="unique_choice" onclick="selectAnswer(3, 'B')">B. 나를 위한 기분전환이 필요해... 쇼핑하러 나가기</button>
                    </div>
                    <button class="next_btn" onclick="nextQuestion()">&#8594;</button>
                </div>
            </div>

            <div class="unique_question" id="unique_question4" style="display:none;">
                <div class="question_wrapper">
                    <button class="prev_btn" onclick="prevQuestion()">&#8592;</button>
                    <div class="question_content">
                        <img class="payQuestionImg" src="/img/Q4.png" alt="">
                        <p class="payQuestion">Q. 당신이 가장 많은 시간과 노력을 투자하는 것은 무엇인가요?</p>
                        <button class="unique_choice" onclick="selectAnswer(4, 'A')">A. 대화가 필요해~ 친구나 가족과의 소통, 여가 활동</button>
                        <button class="unique_choice" onclick="selectAnswer(4, 'B')">B. 지금은 스펙시대! 스터디나 강의 듣기, 자기 계발</button>
                    </div>
                    <button class="next_btn" onclick="nextQuestion()">&#8594;</button>
                </div>
            </div>

            <div class="unique_question" id="unique_question5" style="display:none;">
                <div class="question_wrapper">
                    <button class="prev_btn" onclick="prevQuestion()">&#8592;</button>
                    <div class="question_content">
                        <img class="payQuestionImg" src="/img/Q5.png" alt="">
                        <p class="payQuestion">Q. 가장 중요하게 생각하는 시간은 어떤 것인가요?</p>
                        <button class="unique_choice" onclick="selectAnswer(5, 'A')">A. 나만의 시간 혹은 친구들과의 시간</button>
                        <button class="unique_choice" onclick="selectAnswer(5, 'B')">B. 가족과 보내는 시간</button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"id="resultButton" style="display:none" onclick="showResult()">결과보기</button>
                        <br>
                    </div>
                </div>
            </div>

            <!-- 로딩 모달 -->
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <img src="/img/hanaLogo.png" alt="하나원페이 로고" style="margin-right: 10px; width: 45px; height: 45px;">
                            <h1 class="modal-title fs-5" id="exampleModalLabel"  style="font-weight: bold;">하나원페이</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div style="font-size: 20px">결과를 분석 중입니다...</div>
                            <img src="/img/loadingCheck.gif" alt="" style="width: 300px; height: 200px;">
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>


            <br><br><br>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <script>

        let currentQuestion = 0;
        let userAnswers = {};

        function startTest() {
            document.querySelector('.testStart').style.display = 'none';
            document.querySelector('.stepper').style.display = 'flex'; // 스태퍼를 보이게 함
            currentQuestion = 1;
            document.getElementById('unique_question' + currentQuestion).style.display = 'block';
            updateStepper();
        }

        function selectAnswer(questionNumber, choice) {
            userAnswers[questionNumber] = choice;

            let buttons = document.querySelectorAll('.unique_choice');
            buttons.forEach(button => button.classList.remove('clicked'));

            event.target.classList.add('clicked');

            if (questionNumber === 5) {
                document.querySelector("#resultButton").style.display = "block";
            }
        }


        var exampleModal = document.getElementById('exampleModal');

        function showResult() {
            let resultMessage = "";

            if (userAnswers[1] === 'B' && userAnswers[3] === 'B') {
                resultMessage = "\"알고보니 내가 쇼핑의 신? 스트레스를 쇼핑으로 풀어버리자!\"";
            } else if (userAnswers[2] === 'B') {
                resultMessage = "수고한 당신에게 준비된 티켓! 지금 바로 여행을 떠나보세요!";
            } else if (userAnswers[4] === 'B') {
                resultMessage = "무기? 그건 바로 당신의 지식! 학습의 세계로 뛰어들 준비가 됐나요?";
            } else if (userAnswers[5] === 'B') {
                resultMessage = "웃음과 사랑이 가득한, 가족과의 소중한 시간. 함께 보내는 모든 순간이 행복의 기록이에요.";
            } else {
                resultMessage = "영화 한 편, 책 한 권. 주말, 문화의 품격으로 채워보세요!";
            }

            // 결과 메시지를 로컬에 저장
            localStorage.setItem('resultMessage', resultMessage);

            // 로딩 모달 표시
            var bootstrapModal = new bootstrap.Modal(exampleModal);
            bootstrapModal.show();

            exampleModal.addEventListener('shown.bs.modal', function (event) {
                setTimeout(function() {
                    window.location.href = "/hanaOnePay/payTendencyTestResult";
                }, 2000); // 2초 후에 리디렉션
            });
        }

        function nextQuestion() {
            if (currentQuestion === 5) {
                document.querySelector("#resultButton").style.display = "none";
            }
            if (currentQuestion < 5) {
                document.getElementById('unique_question' + currentQuestion).style.display = 'none';
                currentQuestion++;
                document.getElementById('unique_question' + currentQuestion).style.display = 'block';
                updateStepper();
            }
        }


        function prevQuestion() {
            if(currentQuestion > 1) {
                document.getElementById('unique_question' + currentQuestion).style.display = 'none';
                currentQuestion--;
                document.getElementById('unique_question' + currentQuestion).style.display = 'block';
                updateStepper();
            }
        }

        function updateStepper() {
            for (let i = 1; i <= 5; i++) {
                const stepElem = document.getElementById('step' + i);
                if (i === currentQuestion) {
                    stepElem.classList.add('active');
                } else {
                    stepElem.classList.remove('active');
                }
            }
        }

    </script>

    </body>
    </html>
