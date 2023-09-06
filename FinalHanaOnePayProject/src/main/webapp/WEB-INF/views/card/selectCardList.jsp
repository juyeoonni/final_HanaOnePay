<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 카드 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/card.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<main>
    <div class="flex-card-container">
        <div class="d-flex flex-column flex-shrink-0 p-3 sidebar" style="width: 280px;">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                <span class="fs-4">카드조회</span>
            </a>
            <hr>
            <div class="button-container">
                <button class="card-button active" id="card1">
                    <svg class="icon" width="16" height="16"></svg>
                    하나카드 조회
                </button>
                <button class="card-button" id="card2">
                    <svg class="icon" width="16" height="16"></svg>
                    다른금융 조회
                </button>
                <a href="/card/joinHanaOnePay">
                               <button class="card-button" id="card2">
                               <a href="/card/joinHanaOnePay">
                                                                  <svg class="icon" width="16" height="16"></svg>
                                                                  하나원페이등록
                                                                   </a>
                                                              </button>
            </div>
            <hr>
        </div>
        <div class="content-container">
            <div class="rectangle">
                <div class="selectCardCompany">하나카드 조회</div>
            </div>
            <div class="myCardCount">정주연 고객님 총 <c:out value="${fn:length(cardList)}"/>개의 카드를 보유중입니다.</div>

            <!--
            <c:forEach items="${cardList}" var="card">
                ${card.cardName}
            </c:forEach>
            -->

            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <c:forEach items="${cardList}" var="card" varStatus="status">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}" aria-current="true" aria-label="Slide ${status.index + 1}"></button>
                    </c:forEach>
                </div>
               <div class="carousel-inner">
                   <c:forEach var="card" items="${cardList}" varStatus="status">
                       <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                            <a href="/card/selectCardDetail?cardNumber=${card.cardNumber}">
                           <img src="/img/${card.cardImg}" class="d-block w-100" alt="${card.cardName}">
                            </a>
                       </div>
                   </c:forEach>
               </div>




                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="myCardName">
                <c:if test="${not empty selectCardList}">
                    ${selectCardList[0].cardName}
                </c:if>
            </div>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
        // 초기 로드 시 첫 번째 아이템의 카드 이름 설정
        const firstCardName = $('#carouselExampleIndicators .carousel-item').eq(0).find('img').attr('alt');
        $('.myCardName').text(firstCardName);

        // Carousel의 이벤트 리스너를 추가
        $('#carouselExampleIndicators').on('slid.bs.carousel', function () {
            // 현재 active 상태의 슬라이드의 인덱스를 가져옵니다.
            const currentIndex = $('#carouselExampleIndicators .carousel-item.active').index();

            // 현재 인덱스에 해당하는 카드 정보를 가져와서 myCardName의 텍스트를 업데이트합니다.
            const cardName = $('#carouselExampleIndicators .carousel-item').eq(currentIndex).find('img').attr('alt');
            $('.myCardName').text(cardName);
        });
    });


</script>

</body>
</html>
