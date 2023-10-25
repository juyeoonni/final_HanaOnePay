package com.kopo.finalhanaonepayproject.hanaOnePay.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalhanaonepayproject.config.CreditCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO.HanaOnePayDAO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HanaOnePayService {

    @Autowired
    private HanaOnePayDAO hanaOnePayDAO;

    // 하나계좌 조회
    public List<HanaOnePayAccountDTO> getHanaAccountDetailsByIdentity(String identityNumber) {
        return hanaOnePayDAO.getHanaAccountDetailsByIdentity(identityNumber);
    }

    // 하나카드 조회
    public List<HanaOnePayCardDTO> getHanaCardDetailsByIdentity(String identityNumber) {
        return hanaOnePayDAO.getHanaCardDetailsByIdentity(identityNumber);
    }

    // 하나카드 거래내역 조회
    public List<HanaOnePayTransDTO> hanaTransactionsByCard(String cardNumber) {
        return hanaOnePayDAO.hanaTransactionsByCard(cardNumber);
    }

    // 하나계좌 거래내역 조회
    public List<HanaOnePayAccTransDTO> hanaTransactionsByAccount(String accNumber){
        return  hanaOnePayDAO.hanaTransactionsByAccount(accNumber);
    }

    // 대표 하나카드 조회
    public List<HanaOnePayhanaCardDTO> getMainHanaCardByIdentity(String identityNumber) {
        return hanaOnePayDAO.getMainHanaCardByIdentity(identityNumber);
    }

    // 하나카드 중 신용카드 조회
    public List<HanaOnePayhanaCardDTO> getHanaCreditCardByIdentity(String identityNumber) {
        return hanaOnePayDAO.getHanaCreditCardByIdentity(identityNumber);
    }

    //신용카드의 전월 1일부터 말일까지의 거래내역에서 금액합산
    public BigDecimal calculateTotalSpentAmountForPreviousMonth(String cardNumber) {
        return hanaOnePayDAO.getLastMonthTotalAmount(cardNumber);
    }

    // 페이카드 등록전 이미 등록된 카드를 확인하기 위해 페이카드 select
    public List<HanaOnePayCardDTO> getRegisteredCards(String identityNumber) {
        return hanaOnePayDAO.getRegisteredCards(identityNumber);
    }

    // 선택한 페이카드 insert
    public void insertSelectedCards(String selectedCardsJson, String identityNumber) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        List<HanaOnePayCardDTO> paycardList = objectMapper.readValue(selectedCardsJson, new TypeReference<List<HanaOnePayCardDTO>>(){});

        for(HanaOnePayCardDTO paycard : paycardList) {
            paycard.setIdentityNumber(identityNumber);
            hanaOnePayDAO.insertCard(paycard);
        }
    }

    // 페이카드 모두 select
    public List<HanaOnePayCardDTO> getAllCards() {
        return hanaOnePayDAO.getAllCards();
    }

    // 이번달 거래내역 데이터 select
    public Map<String, List<HanaOnePayTransDTO>> getThisMonthTransData(String identityNumber){
        List<HanaOnePayhanaCardDTO> cardList = hanaOnePayDAO.getOnlyHanaCardDetailsByIdentity(identityNumber);
        System.out.println("고객의 카드정보: " + cardList);
        Map<String,List<HanaOnePayTransDTO>> resultMap = new HashMap<>();
        for(HanaOnePayhanaCardDTO card : cardList){
            System.out.println("고객의 카드정보: " + card.getCardNumber());
            List<HanaOnePayTransDTO> transList = hanaOnePayDAO.getThisMonthTransData(card.getCardNumber());
            resultMap.put(card.getCardNumber(),transList);
        }
        return resultMap;
    }

    public List<HanaOnePayTransDTO> getThisMonthTransDataByCard(String cardNumber){
        return hanaOnePayDAO.getThisMonthTransData(cardNumber);
    }


    public List<HanaOnePayTransDTO> getTransactionsByCardNumber(String cardNumber){
        return hanaOnePayDAO.getThisMonthTransData(cardNumber);
    }

    // 이번달 사용금액
    public int getThisMonthTotalAmount(String cardNumber){
        return hanaOnePayDAO.getThisMonthTotalAmount(cardNumber);
    };

    public List<CardItemDTO> getCardsByBusinessCodes(List<String> businessCodes) {
        return hanaOnePayDAO.getCardsByBusinessCodes(businessCodes);
    }

    // 하나카드 결제
    private void insertCardPaymentLog(String cardNumber, BigDecimal payAmount, String tableCode) {
        hanaOnePayDAO.insertCardPaymentLog(cardNumber, payAmount, tableCode);
    }
    public String hanaCardPaymentProcess(String cardNumber, String cardCode, String identityNumber, BigDecimal productPrice) {
        String tableCode = "hana";
        String cardType = hanaOnePayDAO.getCardTypeByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

        // cardType == 2 (체크카드)
        if ("2".equals(cardType)) {
            String cardStatus = hanaOnePayDAO.getCardStatusByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

            if ("활성".equalsIgnoreCase(cardStatus)) {
                BigDecimal balance = hanaOnePayDAO.getAccountBalanceByCardNumber(cardNumber, tableCode);

                if (balance.compareTo(productPrice) >= 0) {
                    // 계좌에서 금액 차감
                    hanaOnePayDAO.updateAccountBalanceByCardNumber(cardNumber, tableCode, productPrice);

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
            String cardStatus = hanaOnePayDAO.getCardStatusByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

            if ("활성".equalsIgnoreCase(cardStatus)) {
                BigDecimal limit = hanaOnePayDAO.getCreditCardLimitByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode);

                if (limit.compareTo(productPrice) >= 0) {

                    // 신용카드 한도에서 결제 금액만큼 차감
                    hanaOnePayDAO.updateCreditCardLimitByCardNumberAndIdentityNumber(cardNumber, identityNumber, tableCode, productPrice);

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

    // 하나카드 스케줄러
    public List<CreditCardDTO> getCreditCardsByBank(String bankCode) {
        String tableCode = "hana";
        return hanaOnePayDAO.getCustomerCreditCards(tableCode);
    }

    // 각 은행의 신용카드의 전월 거래내역을 조회해서 전월 1일부터 말일까지 사용금액을 조회하는 메서드
    public BigDecimal calculateTotalSpentAmountForPreviousMonth(String cardNumber, String tableCode) {
        return hanaOnePayDAO.calculateTotalSpentAmountForPreviousMonth(cardNumber, tableCode);
    }

    public void deductAmountFromLinkedAccount(String cardNumber, BigDecimal totalSpentAmount, String tableCode) {
        hanaOnePayDAO.deductAmountFromLinkedAccount(cardNumber, totalSpentAmount, tableCode);
    }


}
