package com.kopo.finalhanaonepayproject.hanaOnePay.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
            paycard.setIdentityNumber(identityNumber); // 주민번호 설정
            hanaOnePayDAO.insertCard(paycard);
        }
    }

    // 페이카드 모두 select
    public List<HanaOnePayCardDTO> getAllCards() {
        return hanaOnePayDAO.getAllCards();
    }

//    // 거래내역 데이터 select
//    public List<HanaOnePayTransDTO> getHanaCardTransData(){
//        return hanaOnePayDAO.getHanaCardTransData();
//    }

    // 이번달 거래내역 데이터 select
    public Map<String, List<HanaOnePayTransDTO>> getThisMonthTransData(String identityNumber){
        //주민번호로 고객의 카드정보를 가져온다.
        List<HanaOnePayhanaCardDTO> cardList = hanaOnePayDAO.getOnlyHanaCardDetailsByIdentity(identityNumber);
        System.out.println("고객의 카드정보: " + cardList);
        //카드정보로 거래내역을 가져온다. return Type은 <카드번호, 거래내역 리스트>
        Map<String,List<HanaOnePayTransDTO>> resultMap = new HashMap<>();
        //갖고 있는 카드들을 하나씩 뽑아서 거래내역을 가져온다.
        for(HanaOnePayhanaCardDTO card : cardList){
            System.out.println("고객의 카드정보: " + card.getCardNumber());
            //거래내역 조회는 카드번호별로 해야함
            List<HanaOnePayTransDTO> transList = hanaOnePayDAO.getThisMonthTransData(card.getCardNumber());
            resultMap.put(card.getCardNumber(),transList);
        }
        return resultMap;
    }

    // 고고
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

//    public int getLastMonthTotalAmount(String identityNumber) {
//        return hanaOnePayDAO.getLastMonthTotalAmount(identityNumber);
//    }

}
