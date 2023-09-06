package com.kopo.finalhanaonepayproject.card.service;


import com.kopo.finalhanaonepayproject.card.model.DAO.CardDAO;
import com.kopo.finalhanaonepayproject.card.model.DTO.CardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    @Autowired
    CardDAO cardDAO;


    public List<CardDTO> selectCardList() {
        return  cardDAO.selectCardList();
    }

    public List<CardDTO> selectCardByBankCode(List<String> modifiedBankCodes) {
        return cardDAO.selectCardByBankCode(modifiedBankCodes);
    }

    public CardDTO selectCardDetailByCardNumber(String cardNumber) {
        return  cardDAO.selectCardDetailByCardNumber(cardNumber);
    }

}
