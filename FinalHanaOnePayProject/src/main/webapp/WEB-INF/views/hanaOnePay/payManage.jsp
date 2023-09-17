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
    <title>하나원페이 QR결제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">

    <style>
        @font-face {
            font-family: 'Hana2CM';
            src: url('/fonts/Hana2-CM.ttf') format('truetype');
        }


        body {
            font-family: 'Hana2CM', sans-serif !important; /* sans-serif는 폰트가 로드되지 않을 때 사용될 대체 폰트입니다. */
        }

        .add-button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #007BFF;
            color: #FFFFFF;
            text-align: center;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .add-button:hover {
            background-color: #0056b3;
        }

        .btn-qr {
            background-color: #00857E !important;
            color: #f7f7f7 !important;
            border: none;
            border-radius: 10px;
            width: 20%;
        }

        .headerImg{
            width: 40px;
            height: 40px;
        }

        .headername{
            font-size: 25px;
            margin-left: 4px;
        }

        .card-header {
            display: flex;
            align-items: center; /* 수직 중앙 정렬을 위해 추가 */
            justify-content: center; /* 수평 중앙 정렬 */
            padding: 10px; /* 필요에 따라 패딩을 조절 */
        }


    </style>

</head>

<body>
<%--<!-- 헤더위치 -->--%>
<%--<%@ include file="/WEB-INF/views/comm/header.jsp"%>--%>

<main>


<%--    QR 코드 스캐너 자리입니다--%>
    <div class="card text-center">
        <div class="card-header">
            <img class="headerImg" src="/img/hanaLogo.png">
            <div class="headername">하나원페이</div>
        </div>
        <div class="card-body">
            <h5 class="card-title">QR스캔 / 결제</h5>
            <p class="QRSpace">홈페이지에 보이는 QR코드를 스캔해주세요.</p>
            <input type="button" class="btn-qr" id="button1" onclick="openCamera();" value="QR 스캔" style="width:45%;height:45px"/>

            <div class="qr">
                <main align="center">
                    <div align="center">
                        <div></div>
                        <div id="frame">
                            <div id="loadingMessage">
<%--                                🎥 비디오 스트림에 액세스 할 수 없습니다<br/>웹캠이 활성화되어 있는지 확인하십시오--%>
                            </div>
                            <canvas id="canvas"></canvas>
                        </div>
                    </div>

                    <br/>
                    <br/>
                    <div></div>
                    <div id="test" width="100%">
                        <h1>QR 코드 스캔 결과</h1>
                        <div id="output">
                            <div id="outputMessage">

                            </div>
                            <div id="outputLayer" hidden>
                                <span id="outputData"></span>
                            </div>
                        </div>
                    </div>
                </main>

            </div>

<%--            <div id="reader"></div>--%>
<%--            <input type="file" id="qr-input-file" accept="image/*" capture>--%>


        </div>

    </div>
<%--    QR 스캐너 끝--%>

    <!-- 로딩 모달 시작 -->
    <div class="modal fade" id="loadingModal" tabindex="-1" aria-labelledby="loadingModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <h5></h5>
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 로딩 모달 끝 -->

    <!-- 모달 시작 -->
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="/img/hanaLogo.png" alt="하나원페이 로고" style="margin-right: 10px; width: 45px; height: 45px;">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"  style="font-weight: bold;">하나원페이</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <h5>하나원페이 결제를 위해<br> 다음 버튼을 눌러주세요!</h5>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-qr" id="nextPageButton">다음</button>
                </div>
            </div>
        </div>
    </div>
<%--    저장테스트--%>
    <!-- 모달 끝 -->
</main>

<%--<!-- 푸터위치 -->--%>
<%--<%@ include file="/WEB-INF/views/comm/footer.jsp"%>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/vendors/scripts/jsQR.js"></script>




<script>
    // const html5QrCode = new Html5Qrcode("reader");
    // const qrCodeSuccessCallback = (decodedText, decodedResult) => {
    //     alert('아래의 주소로 이동합니다: \n' + decodedText);
    //     document.getElementById("resultBtn").setAttribute('data-url', decodedText);
    //     $('#payment-modal').modal('show');
    // };
    // const config = { fps: 10, qrbox: { width: 250, height: 250 } };
    // html5QrCode.start({ facingMode: { exact: "environment"} }, config, qrCodeSuccessCallback);
    //
    // function clickTohref(e) {
    //     location.href = $(e).attr('data-url');
    // }

    // 스캔
    function startScan() {
        var video = document.createElement("video");
        var canvasElement = document.getElementById("canvas");
        var canvas = canvasElement.getContext("2d");
        var loadingMessage = document.getElementById("loadingMessage");
        var outputContainer = document.getElementById("output");
        var outputMessage = document.getElementById("outputMessage");
        var outputData = document.getElementById("outputData");

        function drawLine(begin, end, color) {
            canvas.beginPath();
            canvas.moveTo(begin.x, begin.y);
            canvas.lineTo(end.x, end.y);
            canvas.lineWidth = 4;
            canvas.strokeStyle = color;
            canvas.stroke();
        }

        // 카메라 사용시
        navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
            video.srcObject = stream;
            video.setAttribute("playsinline", true);      // iOS 사용시 전체 화면을 사용하지 않음을 전달
            video.play();
            requestAnimationFrame(tick);
        });

        function tick() {
            loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

            if(video.readyState === video.HAVE_ENOUGH_DATA) {
                loadingMessage.hidden = true;
                canvasElement.hidden = false;
                outputContainer.hidden = false;

                // 읽어들이는 비디오 화면의 크기
                canvasElement.height = video.videoHeight;
                canvasElement.width = video.videoWidth;
                canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);

                var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
                var code = jsQR(imageData.data, imageData.width, imageData.height, {
                    inversionAttempts : "dontInvert",
                });

                // QR코드 인식에 성공한 경우
                if(code) {
                    // 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
                    drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#00857E");
                    drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#00857E");
                    drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#00857E");
                    drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#00857E");

                    outputMessage.hidden = true;
                    outputData.parentElement.hidden = false;

                    // QR코드 메시지 출력
                    outputData.innerHTML = code.data;

                    // QR 코드의 결과값을 사용하여 URL로 리다이렉트
                    // window.location.href = "/hanaOnePay/payRequest" + encodeURIComponent(code.data);
                    // QR 코드의 결과값을 사용하여 URL로 리다이렉트
                    //window.location.href = "/hanaOnePay/payRequest?qrData=" + encodeURIComponent(code.data);

                    // AJAX 요청을 사용하여 서버에 스캔된 결과 전송
                    $.post("/saveQrToSession", { qrData: code.data }, function(response) {
                        console.log("QR값 서버에 전송");
                    });

                    // 모달을 보여줌
                    $('#confirmModal').modal('show');

                    // 버튼 클릭 이벤트 리스너
                    document.getElementById('nextPageButton').addEventListener('click', function() {
                        // 모달을 숨김
                        $('#confirmModal').modal('hide');

                        // QR 코드의 결과값을 사용하여 URL로 리다이렉트
                        window.location.href = "/hanaOnePay/payRequest?qrData=" + encodeURIComponent(code.data);
                    });

                    // return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
                    return;
                }
                // QR코드 인식에 실패한 경우
                else {
                    outputMessage.hidden = false;
                    outputData.parentElement.hidden = true;
                }
            }
            requestAnimationFrame(tick);
        }
    }

    // 카메라 열기
    function openCamera() {
        startScan();
    }

</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>