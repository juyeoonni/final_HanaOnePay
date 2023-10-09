<%@ page import="com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>상품약관</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        @font-face {
            font-family: 'Hana2CM';
            src: url('/fonts/Hana2-CM.ttf') format('truetype');
        }

        body {
            font-family: 'Hana2CM', sans-serif !important;
            background-color: #f7f7f8;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        .section {
            margin-bottom: 20px;
        }
        .section-title {
            font-weight: bold;
            font-size: 18px;
        }
        .section-content {
            margin-left: 20px;
        }
        .list-item {
            margin-top: 5px;
        }

        /* 추가된 CSS 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
<div id="terms-content">
    <div style="background-color: #cfd8dd; border-radius: 7px; height: 50px;">하나카드</div>

    <h1>모두의 쇼핑 카드</h1>


    <div class="container">
        <h3>온라인 쇼핑 적립</h3>

        <div class="section">
            <div class="section-title">지난달 실적 적립한도</div>
            <div class="section-content">30만원 이상 온라인 쇼핑 10% 월 최대 1만 하나머니</div>
        </div>

        <div class="section">
            <div class="section-title">적립대상 적립률</div>
            <div class="section-content">
                <table>
                    <tr>
                        <th>구 분</th>
                        <th>적립률</th>
                    </tr>
                    <tr>
                        <td>온라인 쇼핑</td>
                        <td>10%</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="section">
            <div class="section-title">해외결제 및 기타안내</div>
            <div class="section-content">
                <p>해외 이용 시(해외사이트 거래 포함) 미화(USD)기준 거래금액의 접수일의 하나은행 최초고시</p>
                <p>전신환매도율을 적용한 후, 국제브랜드사 부과하는 국제브랜드수수료(mastercard 1.0%)와</p>
                <p>하나카드가 부과하는 해외서비스 수수료(신용카드 0.2%)를 포함하여 원화로 청구됩니다.</p>
            </div>
        </div>

        <div class="section">
            <div class="section-title">지난달 실적과 관계없이 서비스 제공하는 기간</div>
            <div class="section-content">
                <p>최초카드 사용등록일부터 다음달 말일까지 지난달 실적 30만원 미만이어도</p>
                <p>지난달 실적 30만원 이상 기준으로 서비스 제공됩니다.</p>
            </div>
        </div>

        <h3 class="section">
            <h3>생활 쇼핑 적립</h3>
            <div class="section-content">
                <table>
                    <tr>
                        <th>지난달 실적 적립한도</th>
                        <th>적립률</th>
                        <th>월 최대 적립 한나머니</th>
                    </tr>
                    <tr>
                        <td>마트</td>
                        <td>5%</td>
                        <td>1만 하나머니</td>
                    </tr>
                    <tr>
                        <td>백화점</td>
                        <td>5%</td>
                        <td>1만 하나머니</td>
                    </tr>
                    <tr>
                        <td>가구</td>
                        <td>5%</td>
                        <td></td>
                    </tr>
                </table>
            </div>
    </div>

    <div class="section">
        <h3>아울렛 쇼핑 적립</h3>
        <div class="section-content">
            <p>지난달 실적 적립한도: 30만원 이상 프리미엄 아울렛 5% 월 최대 1만 하나머니</p>
            <p>- 국내 가맹점 기준 서비스 제공</p>
            <p>- 오프라인 이용금액에 한함 / 식음료 매장 및 편의시설 이용금액 제외</p>
            <p>- 상품권/기프트카드 구매, 선불카드 및 선불전자지급수단 구매 및 충전금액 제외</p>
        </div>
    </div>

    <div class="section">
        <div class="section-title">서비스 제공 조건</div>
        <div class="section-content">
            <p>[지난달 실적 제외 대상]</p>
            <ul>
                <li>국세, 지방세, 공과금(인터넷/모바일앱을 통한 공과금 납부금액 포함), 국민연금/고용보험료/산재보험료/건강보험료 납부금액, 상품권 및 기프트카드 구매, 선불카드 및 선불전자지급수단 (하나머니 등) 충전금액, 수도/전기요금, 아파트관리비, 도시가스, 대학등록금, 초·중·고 학교납입금, 적립 적용된 매출금액 전체</li>
            </ul>
            <p>[실적 산정 기준]</p>
            <ul>
                <li>지난달 실적 산정 조건 : 지난달 1일부터 말일까지(승인시점 기준) 국내외 일시불/할부 이용금액 30만원 이상 시 서비스가 제공됩니다.</li>
                <li>교통요금, 통신요금, 해외 이용금액 등 무승인 매입(카드사의 승인없이 이용금액이 카드사로 접수됨)의 경우 매출접수 월의 이용금액으로 반영됩니다.</li>
                <li>할부이용 전체금액은 할부 이용월의 이용금액으로 반영됩니다.</li>
                <li>매출취소 시 취소 접수된 월의 실적에서 차감됩니다.</li>
            </ul>
            <p>[적립 기준]</p>
            <ul>
                <li>적립기준 : 하나머니 (1하나머니=1원)</li>
                <li>하나머니란? 하나카드의 하나머니가맹점, 상품권교환, 공익기부 등 다양한 사용처에서 사용하시거나 연회비, 카드대금 등을 납부하실 때 사용하실 수 있습니다. (하나카드 홈페이지 → ‘포인트’ 메뉴 참고)</li>
                <li>매출 접수된 일시불/할부 이용금액에 따라 혜택이 제공됩니다.</li>
                <li>매출 적립에 따른 하나머니는 매출접수된 다음날 적립됩니다.</li>
                <li>하나카드에 등록된 가맹점 기준으로 제공합니다.</li>
            </ul>
            <p>[유의사항]</p>
            <ul>
                <li>해당 상품은 모바일 카드 전용 상품입니다.</li>
                <li>플라스틱 카드 발급 신청 시 신청일 기준으로 5천원이 별도로 청구됩니다. (신규 및 재발급, 갱신 발급 시)</li>
                <li>해당 상품은 가족카드 발급이 불가합니다</li>
            </ul>
        </div>
    </div>

</div>
</div>
<button onclick="convertToPDF()">PDF 다운로드</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script>
    window.onload = function() {
        // 이 부분에서 스크립트를 로드한 후에 convertToPDF 함수를 호출합니다.
        loadJSPDFLibrary().then(() => {
            convertToPDF();
        });
    };

    function loadJSPDFLibrary() {
        return new Promise((resolve, reject) => {
            // jsPDF 라이브러리 스크립트를 동적으로 로드합니다.
            const script = document.createElement('script');
            script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.min.js';
            script.onload = resolve;
            script.onerror = reject;
            document.head.appendChild(script);
        });
    }

    function convertToPDF() {
        const termsContent = document.getElementById('terms-content');
        html2canvas(termsContent, { useCORS: true }).then(canvas => {
            const pdf = new jsPDF();
            pdf.addImage(canvas.toDataURL('image/png'), 'PNG', 0, 0);
            pdf.save('상품약관.pdf');
        });
    }
</script>
</body>
</html>
