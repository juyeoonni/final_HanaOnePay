package com.kopo.finalhanaonepayproject.config;

import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import com.kopo.finalhanaonepayproject.javaMailSender.EmailService;
import com.kopo.finalhanaonepayproject.naverSMS.SmsService;
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
    private HanaOnePayService hanaOnePayService;

    @Autowired
    private SmsService smsService;

    List<CreditCardDTO> creditCardList = new ArrayList<>();

    List<String> tableCodes = List.of("hana");

    //@Scheduled(fixedRate = 30000) // 테스트 30초마다 실행되게
    @Scheduled(cron = "0 0 10 13 * ?") // 매달 13일 오전 10시에 실행
    public void fetchDataAndProcess() {

        // 스케줄러가 실행될 때 메일을 보내는 로직
        String pdfAttachmentPath = "static/img/[하나원페이]이용대금결제알림.pdf";
        emailService.sendEmailWithAttachment(
                "yeonju_62@naver.com",
                "[하나원페이] 정하나 님의 이용대금 결제알림",
                "안녕하세요 정하나 고객님,\n언제나 하나원페이를 이용해주셔서 감사합니다.\n지난달 신용카드 결제 대금이 청구되었습니다.\n첨부파일을 확인해주세요.",
                pdfAttachmentPath
        );

        // 테이블 코드 담은 리스트 사이즈만큼 for문
        for (int i = 0; i < tableCodes.size(); i++) {
            String tableCode = tableCodes.get(i);

            // 각각의 은행들의 신용카드리스트 가져오기
            List<CreditCardDTO> bankCreditCards = hanaOnePayService.getCreditCardsByBank(tableCode);

            // bankCreditCards가 비어있지 않을 때만 카드를 추가
            if (!bankCreditCards.isEmpty()) {
                CreditCardDTO selectedCard = bankCreditCards.get(0);
                creditCardList.add(selectedCard);

                // 각 카드의 전월 사용 금액을 조회
                BigDecimal totalSpentAmount = hanaOnePayService.calculateTotalSpentAmountForPreviousMonth(selectedCard.getCardNumber(), tableCode);
                System.out.println("Selected Card: " + selectedCard);

                // 각 카드사별로 전월 사용 금액을 카드와 연동된 계좌에서 차감
                hanaOnePayService.deductAmountFromLinkedAccount(selectedCard.getCardNumber(), totalSpentAmount, tableCode);
                System.out.println("지정일에 사용금액만큼 자동 차감 성공");

            }
        }
        // 처리된 카드 리스트를 출력
        for (CreditCardDTO card : creditCardList) {
            System.out.println("Selected Card: " + card);
        }
    }

    //@Scheduled(fixedRate = 30000) // 테스트 30초마다 실행되게
    @Scheduled(cron = "0 0 10 12 * ?") // 매달 12일 오전 10시에 실행
    public void sendMonthlyMessage() throws Exception {
        String recipientPhoneNumber = "01032649073";
        String content = "[하나원페이] 정하나 님의 하나카드 신용카드 결제 대금이 내일 출금될 예정입니다.";
        smsService.sendSms(recipientPhoneNumber, content);
    }

}
