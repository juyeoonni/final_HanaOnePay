package com.kopo.cardserver.service;

import com.kopo.cardserver.model.DAO.CardDAO;
import com.kopo.cardserver.model.DTO.CardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
        } else {
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




}

