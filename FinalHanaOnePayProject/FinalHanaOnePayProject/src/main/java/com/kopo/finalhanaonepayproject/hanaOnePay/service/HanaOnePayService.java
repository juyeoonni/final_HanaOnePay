package com.kopo.finalhanaonepayproject.hanaOnePay.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO.HanaOnePayDAO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HanaOnePayService {

    @Autowired
    private HanaOnePayDAO hanaOnePayDAO;

    public void insertSelectedCards(String selectedCardsJson, String identityNumber) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        List<HanaOnePayCardDTO> paycardList = objectMapper.readValue(selectedCardsJson, new TypeReference<List<HanaOnePayCardDTO>>(){});

        for(HanaOnePayCardDTO paycard : paycardList) {
            paycard.setIdentityNumber(identityNumber); // 주민번호 설정
            hanaOnePayDAO.insertCard(paycard);
        }
    }
}
