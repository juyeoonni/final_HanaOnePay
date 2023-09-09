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
        .OnePayCardCompany{
             margin-top: 120px;
        }
        .flex-card-container{
            margin-top: 30px;
        }

    </style
</head>

<body>

    <!-- 헤더위치 -->
    <%@ include file="/WEB-INF/views/comm/header.jsp"%>

    <main class="main-container">

        <div class="OnePayCardCompany">
            <div class="flex-card-container">
                <h2>내 카드 불러오기</h2>
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        전체 금융기관
                    </a>
                   <ul class="dropdown-menu">
                       <li><a class="dropdown-item" href="#" data-value="하나">하나카드</a></li>
                       <li><a class="dropdown-item" href="#" data-value="다른">다른금융기관</a></li>
                       <li><a class="dropdown-item" href="#" data-value="전체">전체금융기관</a></li>
                   </ul>

                </div>
            </div>

            <div class="flex-card-container">
                <div class="carddesc">
                    <c:forEach items="${matchedCards}" var="card">
                        <!-- 카드 정보를 출력 -->
                        <div class="card-item">
                            <div class="cardBank">
                                <div>${card.bankCode}</div>
                            </div>
                            <br><br>
                            <div>
                                <img class="card-image" src="/img/${card.cardImg}">
                            </div>
                            <div>
                                <div>${card.cardName}</div>
                                <div>${card.cardNumber}</div>
                            </div>
                            <div class="onepayCardCheckbox">
                                 <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"
                                                <c:if test="${card.bankCode eq '하나'}">checked</c:if>>
                                            </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


            </div>

         <!-- 하나원페이등록 버튼 위치 -->
                         <a href="/hanaOnePay/payCardList" class="centered-button">
                             <button class="card-button" id="card2">
                                 <svg class="icon" width="16" height="16"></svg>
                                 하나원페이등록
                             </button>
                         </a>
        </div>
    </main>

    <!-- 푸터위치 -->
    <%@ include file="/WEB-INF/views/comm/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function(){
        // 초기 로드시 하나카드 체크박스 체크
            $(".card-item").each(function() {
                var bankCode = $(this).find(".cardBank div").text().trim();
                if(bankCode === "하나") {
                    $(this).find(".form-check-input").prop("checked", true);
                }
            });

            $(".dropdown-menu a").click(function(){
                var selectedValue = $(this).attr("data-value");
                $("#dropdownMenuButton").text($(this).text());

                $(".card-item").each(function() {
                    var bankCode = $(this).find(".cardBank div").text().trim();

                    // 필터링 조건
                    if(selectedValue === "하나" && bankCode === "하나") {
                        $(this).show();
                    } else if(selectedValue === "다른" && bankCode !== "하나") {
                        $(this).show();
                    } else if(selectedValue === "전체") {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            });
        });

    </script>

</body>
</html>
