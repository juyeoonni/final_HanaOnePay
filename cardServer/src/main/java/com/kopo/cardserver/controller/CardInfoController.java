package com.kopo.cardserver.controller;

import com.kopo.cardserver.model.DTO.*;
import com.kopo.cardserver.service.CardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class CardInfoController {

    @Autowired
    private CardService cardService;

    @PostMapping("/account-data")
    public ResponseEntity<List<AccountDTO>> getAccounts(@RequestBody Map<String, Object> requestData) {
        String identityNumber = (String) requestData.get("identityNumber");

        List<AccountDTO> accounts = cardService.getAllCustomerAccounts(identityNumber);

        return ResponseEntity.ok(accounts);
    }


    @PostMapping("/card-data")
    public ResponseEntity<List<CardDTO>> getCards(@RequestBody Map<String, Object> requestData) {
        System.out.println("1");
        String identityNumber = (String) requestData.get("identityNumber");
        List<String> selectedCards = (List<String>) requestData.get("selectedCards");

        List<CardDTO> cards = cardService.getCustomerCards(identityNumber, selectedCards);
        return ResponseEntity.ok(cards);
    }

    @PostMapping("/payRequest")
    public ResponseEntity<String> processPayment(@RequestBody Map<String, Object> requestData) {
        String activeCard = (String) requestData.get("activeCard");
        String activeCardCode = (String) requestData.get("activeCardCode");
        BigDecimal productPrice = new BigDecimal((String) requestData.get("productPrice"));
        String identityNumber = (String) requestData.get("identityNumber");

        String result = cardService.processPayment(activeCard, activeCardCode, identityNumber, productPrice);

        return ResponseEntity.ok(result);
    }

    @PostMapping("/payRequest/account")
    public ResponseEntity<String> processAccountPayment(@RequestBody Map<String, Object> requestData) {
        String accountNumber = (String) requestData.get("accountNumber");
        BigDecimal productPrice = new BigDecimal((String) requestData.get("productPrice"));
        String identityNumber = (String) requestData.get("identityNumber");

        String result = cardService.processAccountPayment(accountNumber, identityNumber, productPrice);

        return ResponseEntity.ok(result);
    }

//    @GetMapping("/byMonth")
//    public ResponseEntity<List<ChartDTO>> getPaymentsByMonth(@RequestParam int month) {
//        List<ChartDTO> results = paymentLogService.getWooriCardPaymentsByMonth(month);
//        return ResponseEntity.ok(results);
//    }

    @GetMapping("/monthly-payment-data")
    public ResponseEntity<List<ChartDTO>> getCardListforChart(@RequestParam int month) {
        List<ChartDTO> results = cardService.getCardListforChart(month);

        return ResponseEntity.ok(results);
    }

    @GetMapping("/monthly-payment-data2")
    public List<MonthTransDTO> getAllOrgTranDatabyMonth() {
        return cardService.getAllOrgTranDatabyMonth();
    }

    @PostMapping("/card-transactions")
    public ResponseEntity<List<HanaOnePayTransDTO>> selectTransactionsByCard(@RequestBody Map<String, String> payload) {
        System.out.println("카드사 서버 카드내역 컨트롤러 들어옴");

        String cardCode = payload.get("cardCode");
        String cardNumber = payload.get("cardNumber");

        List<HanaOnePayTransDTO> transactions = cardService.selectTransactionsByCard(cardCode, cardNumber);

        if (transactions.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(transactions, HttpStatus.OK);
    }

    @PostMapping("/account-transactions")
    public ResponseEntity<List<HanaOnePayAccTransDTO>> selectTransactionsByAccount(@RequestBody Map<String, String> payload) {
        System.out.println("카드사 서버 계좌내역 컨트롤러 들어옴");

        String cardCode = payload.get("cardCode");
        String accNumber = payload.get("accNumber");

        List<HanaOnePayAccTransDTO> transactions = cardService.selectTransactionsByAccount(cardCode, accNumber);

        if (transactions.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(transactions, HttpStatus.OK);
    }

}




