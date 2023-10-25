package com.kopo.cardserver.service;

import com.kopo.cardserver.model.DAO.CardDAO;
import com.kopo.cardserver.model.DTO.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class CardService {
    private static final Logger logger = LoggerFactory.getLogger(CardService.class);

    @Autowired
    private CardDAO cardDAO;

    // 고객 계좌 조회
    // 고객의 모든 계좌 조회
    public List<AccountDTO> getAllCustomerAccounts(String identityNumber) {
        System.out.println("2");

        List<String> allBanks = Arrays.asList("woori", "shinhan", "KB");
        List<AccountDTO> resultList = new ArrayList<>();

        for (String bank : allBanks) {
            List<AccountDTO> accountList = cardDAO.getCustomerAccounts(identityNumber, bank);
            resultList.addAll(accountList);
            System.out.println("4");
        }

        return resultList;
    }




    // 고객 카드 조회
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
                    break;
            }

            List<CardDTO> cardList = cardDAO.getCustomerCards(identityNumber, tableCode);
            resultList.addAll(cardList);
            System.out.println("4");
        }
        return resultList;
    }

    // 간편 결제 계좌
    public String processAccountPayment(String accountNumber, String identityNumber, BigDecimal productPrice) {
        String table = determineTableByAccountNumber(accountNumber);

        // 잔액 조회
        BigDecimal balance = cardDAO.getAccountBalanceByAccountNumber(accountNumber, table);

        if (balance.compareTo(productPrice) >= 0) {
            // 결제 금액만큼 잔액에서 차감
            cardDAO.updateAccountBalanceByAccountNumber(accountNumber, productPrice.negate(), table);

            // 거래 내역 생성 및 저장
            AccPaymentLogDTO paymentLog = new AccPaymentLogDTO();
            paymentLog.setAccNumber(accountNumber);
            paymentLog.setPayAmount(productPrice);

            cardDAO.insertAccPaymentLog(paymentLog, table);

            return "Payment Approved";
        } else {
            return "Insufficient Balance";
        }
    }

    public String determineTableByAccountNumber(String accNumber) {
        if (accNumber.startsWith("1002")) {
            return "woori";
        } else if (accNumber.startsWith("110")) {
            return "shinhan";
        } else if (accNumber.startsWith("04")) {
            return "kb";
        } else {
            throw new IllegalArgumentException("Invalid account number");
        }
    }

    // 간편 결제 카드
    public String processPayment(String cardNumber, String cardCode, String identityNumber, BigDecimal productPrice) {
        String tableCode = determineTableCode(cardCode);
        String cardType = cardDAO.getCardTypeByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

        // cardType == 2 (체크카드)
        if ("2".equals(cardType)) {
            String cardStatus = cardDAO.getCardStatusByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

            if ("활성".equalsIgnoreCase(cardStatus)) {
                BigDecimal balance = cardDAO.getAccountBalanceByCardNumber(cardNumber, tableCode);

                if (balance.compareTo(productPrice) >= 0) {
                    // 계좌에서 금액 차감
                    cardDAO.updateAccountBalanceByCardNumber(cardNumber, tableCode, productPrice);

                    // 체크카드 거래 내역 생성 및 저장
                    insertCardPaymentLog(cardNumber, productPrice, tableCode);
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

                    // 신용카드 한도에서 결제 금액만큼 차감
                    cardDAO.updateCreditCardLimitByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode, productPrice);

                    // 신용카드 거래 내역 생성 및 저장
                    insertCardPaymentLog(cardNumber, productPrice, tableCode);

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


    private void insertCardPaymentLog(String cardNumber, BigDecimal payAmount, String tableCode) {
        cardDAO.insertCardPaymentLog(cardNumber, payAmount, tableCode);
    }

    private String determineTableCode(String cardCode) {
        switch (cardCode.toLowerCase()) {
            case "woori":
                return "woori";
            case "shinhan":
                return "shinhan";
            case "kb":
                return "KB";
            case "hana":
                return "hana";
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
            }
        }
    }

    public List<ChartDTO> getCardListforChart(int month) {
        // 전체 리스트에 일단 우리카드 리스트 넣음 (업종 비교)
        List<ChartDTO> allResults = cardDAO.getWooriCardPaymentsByMonth(month);

        logger.info("Woori Card Results: {}", allResults);

        List<ChartDTO> wooriAccountResults = cardDAO.getWooriAccountPaymentsByMonth(month);
        logger.info("Woori Account Results: {}", wooriAccountResults);

        List<ChartDTO> toBeAdded = new ArrayList<>();

        for(ChartDTO wooriAcc : wooriAccountResults ){
            boolean matched = false;
            for(ChartDTO allResult : allResults){
                if(wooriAcc.getBusinessCode().equals(allResult.getBusinessCode())){
                    allResult.setPayAmount(allResult.getPayAmount() + wooriAcc.getPayAmount());
                    matched = true;
                    break;
                }
            }
            if (!matched) {
                toBeAdded.add(wooriAcc);
            }
        }
        allResults.addAll(toBeAdded);
        //tobeAdded를 초기화
        toBeAdded.clear();
        
        logger.info("Allresult Account Results 우리카드, 우리계좌까지: {}", allResults);

        List<ChartDTO> shinhanCardResults = cardDAO.getShinhanCardPaymentsByMonth(month);

        for(ChartDTO shinhanCard : shinhanCardResults ){
            boolean matched = false;
            for(ChartDTO allResult : allResults){
                if(shinhanCard.getBusinessCode().equals(allResult.getBusinessCode())){
                    allResult.setPayAmount(allResult.getPayAmount() + shinhanCard.getPayAmount());
                    matched = true;
                    break;
                }
            }
            if (!matched) {
                toBeAdded.add(shinhanCard);
            }
        }


        allResults.addAll(toBeAdded);

        logger.info("Allresult Account Results 우리카드, 우리계좌, 신한카드까지: {}", allResults);

        // 신한계좌로의 결제 정보를 월별로 가져옴.
        List<ChartDTO> shinhanAccountResults = cardDAO.getShinhanAccountPaymentsByMonth(month);
        for(ChartDTO shinhanAcc : shinhanAccountResults ){
            boolean matched = false;
            for(ChartDTO allResult : allResults){
                if(shinhanAcc.getBusinessCode().equals(allResult.getBusinessCode())){
                    allResult.setPayAmount(allResult.getPayAmount() + shinhanAcc.getPayAmount());
                    matched = true;
                    break;
                }
            }
            if (!matched) {
                toBeAdded.add(shinhanAcc);
            }
        }
        allResults.addAll(toBeAdded);
        toBeAdded.clear();
        logger.info("Allresult Account Results 우리카드, 우리계좌, 신한카드, 신한계좌까지: {}", allResults);

        // 국민카드로의 결제 정보를 월별로 가져옴.
        List<ChartDTO> kbCardResults = cardDAO.getKBCardPaymentsByMonth(month);
        for(ChartDTO kbCard : kbCardResults ){
            boolean matched = false;
            for(ChartDTO allResult : allResults){
                if(kbCard.getBusinessCode().equals(allResult.getBusinessCode())){
                    allResult.setPayAmount(allResult.getPayAmount() + kbCard.getPayAmount());
                    matched = true;
                    break;
                }
            }
            if (!matched) {
                toBeAdded.add(kbCard);
            }
        }
        allResults.addAll(toBeAdded);
        toBeAdded.clear();
        logger.info("Allresult Account Results 우리카드, 우리계좌, 신한카드, 신한계좌, 국민카드까지: {}", allResults);

        // 국민계좌로의 결제 정보를 월별로 가져옴.
        List<ChartDTO> kbAccountResults = cardDAO.getKBAccountPaymentsByMonth(month);
        for(ChartDTO kbAcc : kbAccountResults ){
            boolean matched = false;
            for(ChartDTO allResult : allResults){
                if(kbAcc.getBusinessCode().equals(allResult.getBusinessCode())){
                    allResult.setPayAmount(allResult.getPayAmount() + kbAcc.getPayAmount());
                    matched = true;
                    break;
                }
            }
            if (!matched) {
                toBeAdded.add(kbAcc);
            }
        }
        allResults.addAll(toBeAdded);
        logger.info("Allresult Account Results 우리카드, 우리계좌, 신한카드, 신한계좌, 국민카드, 국민계좌까지: {}", allResults);

        return allResults;
    }

    public List<MonthTransDTO> getAllOrgTranDatabyMonth() {
        List<MonthTransDTO> result = cardDAO.getAllOrgTranDatabyMonth();

        logger.info("Retrieved Data: " + result);

        return result;
    }

    public List<HanaOnePayTransDTO> selectTransactionsByCard(String cardCode, String cardNumber) {
        return cardDAO.selectTransactionsByCard(cardCode, cardNumber);
    }

    public List<HanaOnePayAccTransDTO> selectTransactionsByAccount(String cardCode, String accNumber) {
        return cardDAO.selectTransactionsByAccount(cardCode, accNumber);
    }

    // 각 은행의 신용카드 리스트를 가져오는 메서드
    public List<CreditCardDTO> getCreditCardsByBank(String bankCode) {
        String tableCode = determineTableCode(bankCode);
        return cardDAO.getCustomerCreditCards(tableCode);
    }

    // 각 은행의 신용카드의 전월 거래내역을 조회해서 전월 1일부터 말일까지 사용금액을 조회하는 메서드
    public BigDecimal calculateTotalSpentAmountForPreviousMonth(String cardNumber, String tableCode) {
        return cardDAO.calculateTotalSpentAmountForPreviousMonth(cardNumber, tableCode);
    }

    public void deductAmountFromLinkedAccount(String cardNumber, BigDecimal totalSpentAmount, String tableCode) {
        cardDAO.deductAmountFromLinkedAccount(cardNumber, totalSpentAmount, tableCode);
    }


}