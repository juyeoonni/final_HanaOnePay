<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 카드 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/shop.css">

    <style>
        .card-img-top mb-5 mb-md-0 {
            width: 600px !important;
            height: 700px !important;
        }


        /* 기본 버튼 스타일 */
        .btn-outline-dark {
            color: #5E5555 !important;
            border-color: #BCD9D3 !important;
            background-color: #BCD9D3 !important;
        }

        /* 마우스를 올렸을 때 버튼 스타일 */
        .btn-outline-dark:hover {
            color: #FFFFFF !important;
            border-color: #00857E !important;
            background-color: #00857E !important;
        }

        /* 카드 기본 스타일 (섀도우와 크기 변화) */
        .col.mb-5 .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .col.mb-5:hover .card {
            transform: scale(1.05);
            transition: transform 0.2s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        /* 헤더 배경 이미지 설정 */
        .header-with-background {
            background-image: url('/img/shop/shopMain.png');
            background-size: cover;
            background-position: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        .buyBtn {
            margin-top: -50px;
            color: #FFFFFF !important;
            border-color: #BCD9D3 !important;
            background-color: #00857E !important;
            margin-left: 15px;
            width: 530px;
            height: 57.7px;
        }

        .buyBtn:hover {
            color: #5E5555 !important;
            border: none;
            background-color: #BCD9D3 !important;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 50px 0;
            font-size: 18px;
            text-align: left;
            border: 0;
        }

        tr {
            border-bottom: 1px solid #dddddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        td {
            padding: 8px 15px;
            border: none;
            width: 30px;
        }

        button {
            padding: 5px 10px;
            font-size: 16px;
            background-color: #00857E;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:focus {
            outline: none;
        }

        input[type=number] {
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 50px;
            text-align: center;
        }




    </style>

    </style>

</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<main>
    <body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5 shopping_nav">
            <a class="navbar-brand" href="#!">하나원쇼핑</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">팍팍딜</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">기획전</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <!-- Product section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="/img/shop/shopItem2.jpg" alt="...">
                </div>
                <div class="col-md-6">
                    <div class="small mb-1">하나원페이로 결제 시 9월 5% 할인</div>
                    <h1 class="display-5 fw-bolder product-name">Apple 애플워치 SE 2세대</h1>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-line-through">329,000</span>
                        <span>319,000원</span>
                    </div>
                    <p class="lead">
                    <table border="1">
                        <tr>
                            <td>제조사/원산지</td>
                            <td>한국 (기타 세부사항 상품설명 참조)</td>
                        </tr>
                        <tr>
                            <td>상품코드</td>
                            <td>224639</td>
                        </tr>
                        <tr>
                            <td>배송</td>
                            <td>CJ대한통운 택배</td>
                        </tr>
                        <tr>
                            <td>평균배송기간</td>
                            <td>0일 이내 배송가능 (토,일 공휴일 제외) <br> 전국(일부지역제외) 배송가능</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>
                                <button onclick="decreaseQuantity()">-</button>
                                <input type="number" id="quantity" name="quantity" value="1">
                                <button onclick="increaseQuantity()">+</button>
                            </td>
                        </tr>

                        <tr>
                            <td class="product-price-label">총 합계 금액</td>
                            <td class="product-price-value" style="color: #00857E; font-size: 25px;">319000</td>
                        </tr>

                        <input type="hidden" id="businessCode" name="businessCode" value="5500">
                    </table>
                    </table>

                    <br>
                    </p>
                    <div class="d-flex">
<%--                        &lt;%&ndash;                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem">&ndash;%&gt;--%>
<%--                        <button class="btn btn-outline-dark flex-shrink-0" type="button">--%>
<%--                            <i class="bi-cart-fill me-1"></i>--%>
<%--                            카트담기--%>
<%--                        </button>--%>


                        <!-- 로딩 모달 (초기에는 숨겨져 있음) -->
                        <div class="modal fade" id="loadingModal" tabindex="-1" role="dialog"
                             aria-labelledby="loadingModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-body text-center">  <!-- text-center를 사용하여 내용을 중앙 정렬합니다. -->
                                        <span style="font-size: 20px;">주문서로 이동중입니다...</span><br>
                                        <img src="/img/loadingCheck.gif" alt="Loading"
                                             style="width: 350px; height: 250px;">  <!-- 로딩 .gif 이미지 추가 -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- "바로 구매" 버튼 -->
                        <button class="btn btn-outline-dark flex-shrink-0 buyBtn" type="button"
                                onclick="purchaseItem()">
                            <i class="bi-cart-fill me-1"></i>
                            바로구매
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related items section-->
    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="fw-bolder mb-4">다른 상품 둘러보기</h2>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/img/shop/shopItem5.jpg" alt="...">
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">[리앤쿡] 펫 쿨매트 M</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">29,000원</span>
                                15,000원
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                            Sale
                        </div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/img/shop/shopItem6.jpg" alt="...">
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">[kopo타월] KING 무지 수건타올 170g 10장</h5>
                                <!-- Product reviews-->
                                <div class="d-flex justify-content-center small text-warning mb-2">
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                </div>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">67,000원</span>
                                47,000원
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                            Sale
                        </div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/img/shop/shopItem7.jpg" alt="...">
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Cocod'or Signature Diffuser 200ml</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">29,900원</span>
                                19,500원
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/img/shop/shopItem8.jpg" alt="...">
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">아로하트리즈 솔루션 미스트 100ml</h5>
                                <!-- Product reviews-->
                                <div class="d-flex justify-content-center small text-warning mb-2">
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                </div>
                                <!-- Product price-->
                                28,000원
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright © Your Website 2023</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>


    </body>


</main>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- 여기에서 slim.min.js를 min.js로 변경하였습니다. -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>
    // 숫자 포맷팅 함수
    function formatNumber(number) {
        return new Intl.NumberFormat('ko-KR').format(number);
    }

    // 특정 요소에서 숫자를 가져와 포맷팅 적용 후 다시 설정
    const priceElement = document.querySelector('.product-price-value');
    const price = parseInt(priceElement.textContent);
    priceElement.textContent = formatNumber(price) + '원';
    // rh

    function decreaseQuantity() {
        var quantityInput = document.getElementById('quantity');
        var currentValue = parseInt(quantityInput.value, 10);
        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
        }
    }

    function increaseQuantity() {
        var quantityInput = document.getElementById('quantity');
        var currentValue = parseInt(quantityInput.value, 10);
        quantityInput.value = currentValue + 1;
    }

    // function purchaseItem() {
    //     // 로딩 모달을 표시
    //     $('#loadingModal').modal('show');
    //
    //     // 4초 후에 페이지 이동
    //     setTimeout(function() {
    //         window.location.href = "/shop/buyItem";  // 컨트롤러의 경로로 이동
    //     }, 1800);
    // }

    function purchaseItem() {

        // 로딩 모달을 표시
        $('#loadingModal').modal('show');

        // 4초 후에 페이지 이동
        setTimeout(function () {
            window.location.href = "/shop/buyItem";  // 컨트롤러의 경로로 이동
        }, 1800);

        // 상품명과 가격 정보를 가져옴
        let productName = document.querySelector(".product-name").innerText;
        let productPrice = document.querySelector(".product-price-value").innerText;
        productPrice = productPrice.replace('원', '');
        productPrice = productPrice.replace(',', '');
        console.log(productPrice);
        console.log(productName);

        // 상품명 인코딩
        let encodedProductName = encodeURIComponent(productName);
        console.log(encodedProductName);

        // 상품 정보를 JSON 형태로 직렬화
        let productData = {
            'productName': encodedProductName,
            'productPrice': productPrice
        };
        let productDataJSON = JSON.stringify(productData);
        console.log(productDataJSON);  // 직렬화된 JSON 문자열을 출력

        var form = document.createElement("form");
        form.setAttribute("method", "get");
        form.setAttribute("action", "/shop/buyItem");

        var productNameInput = document.createElement("input");
        productNameInput.setAttribute("type", "hidden");
        productNameInput.setAttribute("name", "productName");
        productNameInput.setAttribute("value", encodedProductName);

        var priceInput = document.createElement("input");
        priceInput.setAttribute("type", "hidden");
        priceInput.setAttribute("name", "productPrice");
        priceInput.setAttribute("value", productPrice);

        let productDataJSONInput = document.createElement("input");
        productDataJSONInput.setAttribute("type", "hidden");
        productDataJSONInput.setAttribute("name", "productDataJSON");
        productDataJSONInput.setAttribute("value", productDataJSON);

        form.appendChild(productNameInput);
        form.appendChild(priceInput);
        form.appendChild(productDataJSONInput);
        document.body.appendChild(form);
        form.submit();

    }


    // 캐러셀 자동 재생 비활성화
    $('#carouselExample').carousel({
        interval: false
    });
</script>


</body>
</html>