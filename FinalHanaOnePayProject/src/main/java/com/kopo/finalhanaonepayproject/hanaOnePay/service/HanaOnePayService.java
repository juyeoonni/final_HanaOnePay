package com.kopo.finalhanaonepayproject.hanaOnePay.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO.HanaOnePayDAO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayhanaCardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HanaOnePayService {

    @Autowired
    private HanaOnePayDAO hanaOnePayDAO;

    // 하나카드 조회
    public List<HanaOnePayCardDTO> getHanaCardDetailsByIdentity(String identityNumber) {
        return hanaOnePayDAO.getHanaCardDetailsByIdentity(identityNumber);
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

}
