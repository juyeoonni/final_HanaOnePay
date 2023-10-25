package com.kopo.finalhanaonepayproject.card.controller;


import com.kopo.finalhanaonepayproject.card.model.DTO.CardDTO;
import com.kopo.finalhanaonepayproject.card.service.CardService;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CardController {

    private final CardService cardService;
    private final HanaOnePayService hanaOnePayService;

    @Autowired
    public CardController(CardService cardService, HanaOnePayService hanaOnePayService) {
        this.cardService = cardService;
        this.hanaOnePayService = hanaOnePayService;
    }

    @GetMapping("/card/selectCardList")
    public String selectCardList(HttpServletRequest request) {
        List<CardDTO> list = cardService.selectCardList();

        for (CardDTO card : list) {
            System.out.println(card.getCardNumber());
            System.out.println(card.getCardId());
            System.out.println(card.getCardName());
            System.out.println(card.getAccNumber());
            System.out.println(card.getBankCode());
            System.out.println(card.getValidityPeriod());
            System.out.println(card.getJoinDate());
            System.out.println(card.getCardStatus());
            System.out.println(card.getCardImg());
        }

        request.setAttribute("cardList", list);

        return "card/selectCardList";
    }


    @GetMapping("/card/selectCardDetail")
    public String selectCardDetailByCardNumber(HttpServletRequest request, @RequestParam String cardNumber) {
        CardDTO card = cardService.selectCardDetailByCardNumber(cardNumber);
        request.setAttribute("card", card);
        return "card/selectCardDetail";
    }

    @GetMapping("/card/joinHanaOnePay")
    public String joinHanaOnePay() {
        return "card/joinHanaOnePay";
    }

    @PostMapping("/card/joinHanaOnePay")
    public String joinHanaOnePay(@RequestParam List<String> selectedBankCodes, HttpServletRequest request) {
        System.out.println("controller 시작");

        List<String> modifiedBankCodes = selectedBankCodes.stream()
                .map(code -> code.substring(0, 2))
                .distinct()
                .collect(Collectors.toList());

        List<CardDTO> matchedCards = cardService.selectCardByBankCode(modifiedBankCodes);

        request.setAttribute("selectedBankCodes", modifiedBankCodes);
        request.setAttribute("matchedCards", matchedCards);

        for(String bankCode : modifiedBankCodes){
            System.out.println("은행코드 값: " + bankCode);
        }

        return "card/joinHanaOnePay";
    }




    @GetMapping("/card/joinHanaOnePayOk")
    public String joinHanaOnePayOk() {
        return  "card/joinHanaOnePayOk";
    }

    @GetMapping("/card/selectFinance")
    public String selectFinance() {
        return "card/selectFinance";
    }

    @GetMapping("/card/mydataCard")
    public String mydataCard() {
        return  "card/mydataCard";
    }

    @GetMapping("/card/connectMyData")
    public String mydataConnect(HttpSession session) {
        String identityNumber = (String) session.getAttribute("identityNumber");

        if (identityNumber != null) {
            List<HanaOnePayCardDTO> registeredCards = hanaOnePayService.getRegisteredCards(identityNumber);
            session.setAttribute("registeredCards", registeredCards);
        }

        return "/card/connectMyData";
    }

}



