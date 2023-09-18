package com.kopo.cardserver.service;

import com.kopo.cardserver.model.DAO.CardDAO;
import com.kopo.cardserver.model.DTO.CardDTO;
import com.kopo.cardserver.model.DTO.PendingPaymentDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class CardService {
    private static final Logger logger = LoggerFactory.getLogger(CardService.class);

    @Autowired
    private CardDAO cardDAO;

    public List<CardDTO> getCustomerCards(String identityNumber, List<String> selectedCards) {
        System.out.println("2");
        List<CardDTO> resultList = new ArrayList<>();
        for (String card : selectedCards) {
            String tableCode = "";
            switch (card) {
                case "woori":
                    tableCode = "woori";
                    break;
                case "shinhan":
                    tableCode = "shinhan";
                    break;
                case "KB":
                    tableCode = "KB";
                    break;
                default:
                    // Handle default case
                    break;
            }

            List<CardDTO> cardList = cardDAO.getCustomerCards(identityNumber, tableCode);
            resultList.addAll(cardList);
            System.out.println("4");
        }
        return resultList;
    }

    public String processPayment(String cardNumber, String cardCode, String identityNumber, BigDecimal productPrice) {
        String tableCode = determineTableCode(cardCode);
        String cardType = cardDAO.getCardTypeByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

        // cardType == 2 (체크카드)
        if ("2".equals(cardType)) {
            String cardStatus = cardDAO.getCardStatusByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

            if ("활성".equalsIgnoreCase(cardStatus)) {
                BigDecimal balance = cardDAO.getAccountBalanceByCardNumber(cardNumber, tableCode);

                if (balance.compareTo(productPrice) >= 0) {
                    return "Payment Approved";
                } else {
                    return "Insufficient Balance";
                }
            } else {
                return "Inactive Card";
            }
        }
        // cardType == 1 (신용카드)
        else if ("1".equals(cardType)) {
            String cardStatus = cardDAO.getCardStatusByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

            if ("활성".equalsIgnoreCase(cardStatus)) {
                BigDecimal limit = cardDAO.getCreditCardLimitByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

                if (limit.compareTo(productPrice) >= 0) {
                    cardDAO.updateCreditCardLimitByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode, productPrice);

                    // 결제 승인 후 미결제 금액 관리 테이블에 해당 금액을 기록하는 로직
                    String withdrawalDate = LocalDate.now().plusMonths(1).withDayOfMonth(13).toString(); // 다음 달 13일로 설정.
                    cardDAO.insertPendingPayment(cardNumber, productPrice, withdrawalDate, "Pending", tableCode);

                    return "Payment Approved";
                } else {
                    return "Insufficient Credit Limit";
                }
            } else {
                return "Inactive Card";
            }
        }
        else {
            return "Invalid Card Type";
        }
    }

    private String determineTableCode(String cardCode) {
        switch (cardCode.toLowerCase()) {
            case "woori":
                return "woori";
            case "shinhan":
                return "shinhan";
            case "kb":
                return "KB";
            default:
                throw new IllegalArgumentException("Invalid card code");
        }
    }

    public void processPendingPayments(String tableCode) {
        String withdrawalDate = LocalDate.now().plusMonths(1).withDayOfMonth(13).toString();

        List<PendingPaymentDTO> pendingPayments = cardDAO.getPendingPaymentsByDate(tableCode, withdrawalDate);

        for (PendingPaymentDTO pendingPayment : pendingPayments) {
            // 계좌에서 금액을 인출하는 로직
            BigDecimal currentBalance = cardDAO.getAccountBalanceByCardNumber(tableCode, pendingPayment.getCardNumber());
            BigDecimal payAmount = new BigDecimal(pendingPayment.getPayAmount());

            if (currentBalance.compareTo(payAmount) >= 0) { // 잔액이 충분한 경우
                BigDecimal newBalance = currentBalance.subtract(payAmount);
                cardDAO.updateAccountBalanceByCardNumber(tableCode, pendingPayment.getCardNumber(), newBalance);
                cardDAO.updatePayStatusToApproval(tableCode, pendingPayment.getPendingId());
            } else {
                // 잔액이 부족한 경우에 대한 처리 (예: 알림 전송 등)
            }
        }
    }
}