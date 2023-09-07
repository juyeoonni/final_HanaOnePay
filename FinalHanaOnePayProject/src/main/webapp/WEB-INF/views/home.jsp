<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/home.css">
    <title>HanaOnePay Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <style>
        /* 전체 상자 */
        .outer-box {
            border: 2px solid #E2E6E9;
            padding: 20px;
            margin: 20px;
            width: 420px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 20px;
        }

        /* 모두 동의 부분 */
        .agree-all-label {
            font-size: 1.5em;
            font-weight: bold;
        }

        /* 안의 내용들이 담길 상자 */
        .inner-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            border-radius: 10px;
        }

        /* 선택 불가능한 항목에 대한 스타일 */
        .select_disable {
            color: grey;
        }

        .hanaCharacter{
            width: 180px;
            height: 220px;
            margin-left: 30%;

        }


    </style>
</head>
<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<main>

    <!-- 캐러셀 슬라이드 -->
    <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="3000">
                <div class="flex-card-container">
                    <div class="mainOnePay">
                        <div class="mainText animate__animated animate__fadeInUp">
                            하나로 연결된 </br>
                            모두의 원페이
                        </div>
                        <div class="subText animate__animated animate__fadeInUp">
                            한번의 카드 등록으로
                            편리하게 즐기는 모두의 결제 생활!
                        </div>
                    </div>
                    <img class="mainCardImage animate__animated animate__fadeInUp" src="/img/mainCard.png">
                </div>

            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <div class="flex-card-container2">
                    <div class="mainOnePay2">
                        <div class="mainText2 animate__animated animate__fadeIn">
                            여행도 </br>
                            하나로 원페이
                        </div>
                        <div class="subText2 animate__animated animate__fadeIn">
                            해외여행도
                            하나카드 하나면 돼!
                        </div>
                    </div>
                    <img class="mainCardImage2 animate__animated animate__fadeIn" src="/img/mainCard.png">

                </div>
            </div>

            <div class="carousel-item" data-bs-interval="3000">
                <img src="/img/hanaMain2.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- 메뉴바 -->
    <div class="menu-bar">

        <!-- Trigger element -->
        <a data-href="/card/mydataCard" class="menu-item">
            <div class="menu-content">
                <img src="/img/menu1.png" alt="하나원페이">
                하나원페이
            </div>
        </a>

        <!-- Modal -->
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">하나원페이</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Your modal content here -->
                        <h3>◼ 마이 하나원페이</h3>
                        <hr>

                        <img class="hanaCharacter" src="/img/myCharacter.png">
                        <br>
                        <h6>마이하나원페이는 통합 결제수단 관리에 특화된 마이데이터 서비스 입니다.</h6>
                        <h6>지갑 연결 진행을 위해 약관에 동의해 주세요.</h6> <br>

                        <div>

                            <div class="accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            ▪ 통합결제관리서비스 이용약관
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <h5><strong>1. 서비스 목적</strong></h5>
                                            <p>
                                                마이데이터 서비스는 사용자의 개인정보를 효과적으로 관리하며, 사용자의 명시적 동의하에 해당 정보를 제3자에게 제공하는 서비스입니다. 이를 통해 사용자에게 맞춤형 서비스 제공이 가능합니다.
                                            </p>

                                            <h5><strong>2. 수집하는 데이터 정보</strong></h5>
                                            <ul>
                                                <li>기본 정보: 이름, 주민등록번호, 전화번호, 이메일</li>
                                                <li>서비스 이용 정보: 로그인 기록, 서비스 이용 기록</li>
                                                <li>기타 추가 정보: 선호하는 상품, 이용한 서비스 내역 등</li>
                                            </ul>

                                            <h5><strong>3. 데이터 제3자 제공</strong></h5>
                                            <p>
                                                사용자의 명시적인 동의 하에만, 위에서 수집한 데이터는 제3자와 공유됩니다. 공유하는 목적은 주로 사용자에게 더 나은 서비스 제공과 관련됩니다.
                                            </p>

                                            <h5><strong>4. 동의 철회와 데이터 삭제</strong></h5>
                                            <p>
                                                사용자는 언제든지 동의 철회를 원할 경우, 마이페이지에서 해당 기능을 선택하실 수 있습니다. 동의 철회 시, 모든 개인 데이터는 즉시 삭제되며, 복구가 불가능합니다.
                                            </p>

                                            <h5><strong>5. 데이터 보관 기간 및 정책</strong></h5>
                                            <p>
                                                사용자의 데이터는 동의 후 최대 3년간 보관됩니다. 보관 기간 이후에는 자동으로 파기되며, 별도의 안내 없이 파기될 수 있습니다.
                                            </p>

                                            <h5><strong>6. 동의 거부 및 제한</strong></h5>
                                            <p>
                                                사용자는 본 동의서에 대해 동의 거부 권리가 있으며, 동의하지 않을 경우 마이데이터 서비스의 일부 또는 전체 이용에 제한이 있을 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            ▪ 통합결제관리서비스 설명서
                                        </button>
                                    </h2>
                                    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <h5><strong>1. 서비스 목적</strong></h5>
                                            <p>
                                                마이데이터 서비스는 사용자의 개인정보를 효과적으로 관리하며, 사용자의 명시적 동의하에 해당 정보를 제3자에게 제공하는 서비스입니다. 이를 통해 사용자에게 맞춤형 서비스 제공이 가능합니다.
                                            </p>

                                            <h5><strong>2. 수집하는 데이터 정보</strong></h5>
                                            <ul>
                                                <li>기본 정보: 이름, 주민등록번호, 전화번호, 이메일</li>
                                                <li>서비스 이용 정보: 로그인 기록, 서비스 이용 기록</li>
                                                <li>기타 추가 정보: 선호하는 상품, 이용한 서비스 내역 등</li>
                                            </ul>

                                            <h5><strong>3. 데이터 제3자 제공</strong></h5>
                                            <p>
                                                사용자의 명시적인 동의 하에만, 위에서 수집한 데이터는 제3자와 공유됩니다. 공유하는 목적은 주로 사용자에게 더 나은 서비스 제공과 관련됩니다.
                                            </p>

                                            <h5><strong>4. 동의 철회와 데이터 삭제</strong></h5>
                                            <p>
                                                사용자는 언제든지 동의 철회를 원할 경우, 마이페이지에서 해당 기능을 선택하실 수 있습니다. 동의 철회 시, 모든 개인 데이터는 즉시 삭제되며, 복구가 불가능합니다.
                                            </p>

                                            <h5><strong>5. 데이터 보관 기간 및 정책</strong></h5>
                                            <p>
                                                사용자의 데이터는 동의 후 최대 3년간 보관됩니다. 보관 기간 이후에는 자동으로 파기되며, 별도의 안내 없이 파기될 수 있습니다.
                                            </p>

                                            <h5><strong>6. 동의 거부 및 제한</strong></h5>
                                            <p>
                                                사용자는 본 동의서에 대해 동의 거부 권리가 있으며, 동의하지 않을 경우 마이데이터 서비스의 일부 또는 전체 이용에 제한이 있을 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            ▪ 개인(신용)정보 수집 이용 동의서
                                        </button>
                                    </h2>
                                    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">

                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            ▪ 이벤트, 혜택정보 수신 동의
                                        </button>
                                    </h2>
                                    <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">

                                        </div>
                                    </div>
                                </div>


                            </div>


                        </div>


                        <br>
                        <small class="text-muted">본 동의서는 <span class="text-primary">하나카드</span>의 서비스 정책에 따라 변경될 수 있습니다.</small>

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
                        <button type="button" class="btn btn-success confirm-go">동의</button>
                    </div>
                </div>
            </div>
        </div>

        <a href="#" class="menu-item">
            <div class="menu-content">
                <img src="/img/menu2.png" alt="하나머니조회">
                하나머니조회
            </div>
        </a>
        <a href="#" class="menu-item">
            <div class="menu-content">
                <img src="/img/menu3.png" alt="카드조회">
                카드조회
            </div>
        </a>
        <a href="#" class="menu-item">
            <div class="menu-content">
                <img src="/img/menu4.png" alt="라이프">
                라이프
            </div>
        </a>
    </div>

    <!-- 혜택 디브
    <div class="card-container">
        <div class="card">
            <div class="card-content-detail">
                <div class="card-text">Content 1</div>
                <img class="card-image" src="path-to-image1.jpg" alt="Image 1">
            </div>
        </div>
        <div class="card">
            <div class="card-content-detail">
                <div class="card-text">Content 2</div>
                <img class="card-image" src="path-to-image2.jpg" alt="Image 2">
            </div>
        </div>
        <div class="card">
            <div class="card-content-detail">
                <div class="card-text">Content 3</div>
                <img class="card-image" src="path-to-image3.jpg" alt="Image 3">
            </div>
        </div>
        <div class="card">
            <div class="card-content-detail">
                <div class="card-text">Content 4</div>
                <img class="card-image" src="path-to-image4.jpg" alt="Image 4">
            </div>
        </div>
    </div>

    -->







</main>
<!-- 푸터위치
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
-->
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<img src="/img/footer.png">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>
    document.addEventListener("DOMContentLoaded", function(){
        var modalTriggerElement = document.querySelector('.menu-item');
        var myModal = new bootstrap.Modal(document.getElementById('confirmModal'), {
            keyboard: false
        });

        modalTriggerElement.addEventListener('click', function() {
            myModal.show();
        });

        document.querySelector('.confirm-go').addEventListener('click', function() {
            window.location.href = modalTriggerElement.getAttribute('data-href');
        });
    });

    // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for(let i = 0; i < agreeChk.length; i++){
            agreeChk[i].checked = e.target.checked;
        }
    });
</script>
</body>
</html>
