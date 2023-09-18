package com.kopo.cardserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchedulerService {

    @Autowired
    private CardService cardService;

    //@Scheduled(cron = "0 0 10 13 * ?") // 매달 13일 오전 10시에 실행
    //@Scheduled(fixedRate = 30000) // 테스트 30초마다 실행되게
    public void monthlyPaymentProcessing() {
        //List<String> bankTableCodes = List.of("woori", "shinhan", "KB");
        List<String> bankTableCodes = List.of("woori");
        for (String tableCode : bankTableCodes) {
            cardService.processPendingPayments(tableCode);
        }
    }
}
