package com.kopo.cardserver.config;

import com.kopo.cardserver.JavaMailSender.EmailService;
import com.kopo.cardserver.model.DTO.CreditCardDTO;
import com.kopo.cardserver.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Component
@EnableScheduling
public class Schedule {

    @Autowired
    private EmailService emailService;

    @Autowired
    private CardService cardService;

    // 카드 리스트를 하나 초기화해놓고
    List<CreditCardDTO> creditCardList = new ArrayList<>();

    // 테이블코드 담은 리스트도 하나 만들고
    List<String> tableCodes = List.of("woori", "shinhan", "KB");


    //@Scheduled(fixedRate = 30000) // 테스트 30초마다 실행되게
    @Scheduled(cron = "0 0 10 13 * ?") // 매달 13일 오전 10시에 실행
    public void fetchDataAndProcess() {

        // 스케줄러가 실행될 때 메일을 보내는 로직
        emailService.sendSimpleMessage("yeonju_62@naver.com", "[하나카드] 정주연 님의 이용대금명세서입니다.", "정주연 고객님,\n" +
                "하나카드를 이용해주셔서 감사합니다.\n" +
                "지난달 이용대금명세서를 확인해 주세요");

        // 테이블 코드 담은 리스트 사이즈만큼 for문 돌려
        for (int i = 0; i < tableCodes.size(); i++) {
            String tableCode = tableCodes.get(i);

            // 각각의 은행들의 신용카드리스트 가져오기
            List<CreditCardDTO> bankCreditCards = cardService.getCreditCardsByBank(tableCode);

            // bankCreditCards가 비어있지 않을 때만 카드를 추가
            if (!bankCreditCards.isEmpty()) {
                CreditCardDTO selectedCard = bankCreditCards.get(0);
                creditCardList.add(selectedCard);

                // 각 카드의 전월 사용 금액을 조회
                BigDecimal totalSpentAmount = cardService.calculateTotalSpentAmountForPreviousMonth(selectedCard.getCardNumber(), tableCode);
                System.out.println("Selected Card: " + selectedCard);

                // 각 카드사별로 전월 사용 금액을 카드와 연동된 계좌에서 차감
                cardService.deductAmountFromLinkedAccount(selectedCard.getCardNumber(), totalSpentAmount, tableCode);
                System.out.println("지정일에 사용금액만큼 자동 차감 성공");

                // 각 카드사별로 차감된 금액만큼 거래내역 테이블에 기록

            }
        }
        // 처리된 카드 리스트를 출력
        for (CreditCardDTO card : creditCardList) {
            System.out.println("Selected Card: " + card);
        }
    }

}
