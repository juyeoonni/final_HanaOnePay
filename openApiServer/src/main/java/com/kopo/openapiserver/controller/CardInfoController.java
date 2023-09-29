package com.kopo.openapiserver.controller;

import com.kopo.openapiserver.service.CardCompanyAPIService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*")
public class CardInfoController {

    private static final Logger logger = LoggerFactory.getLogger(CardInfoController.class);

    @Autowired
    private CardCompanyAPIService cardCompanyAPIService;

    // 계좌 조회
    @PostMapping("/api/account-data")
    public ResponseEntity<String> fetchAccountData(@RequestBody Map<String, Object> payload) {
        try {
            String identityNumber = (String) payload.get("identityNumber");

            String accountData = cardCompanyAPIService.fetchAccountData(identityNumber);

            if (accountData != null) {
                return new ResponseEntity<>(accountData, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("No Data Found", HttpStatus.NOT_FOUND);
            }

        } catch (Exception e) {
            logger.error("Failed to fetch account data", e);
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }




    // 카드 데이터 조회
    @PostMapping("/api/card-data")  // POST 방식으로 변경
    public ResponseEntity<String> fetchCardData(
            @RequestBody Map<String, Object> payload) {  // RequestBody를 사용

        try {
            String identityNumber = (String) payload.get("identityNumber");
            List<String> selectedCards = (List<String>) payload.get("selectedCards");  // "cards" 키로 받아옴

            // 로깅
            for (String cards: selectedCards) {
                System.out.println("서버 :" + cards);
            }

            // 실제 카드사 API로부터 데이터를 가져옵니다.
            String cardData = cardCompanyAPIService.fetchCardData(identityNumber, selectedCards);

            if (cardData != null) {
                return new ResponseEntity<>(cardData, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("No Data Found", HttpStatus.NOT_FOUND);
            }

        } catch (Exception e) {
            logger.error("Failed to fetch card data", e);
            logger.error("Failed to fetch card data: {}", e.getMessage());
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // OpenAPIController에 추가
    @PostMapping("/api/payRequest")
    public ResponseEntity<String> executePayment(@RequestBody Map<String, Object> paymentData) {
        try {
            String activeCard = (String) paymentData.get("activeCard");
            String activeCardCode = (String) paymentData.get("activeCardCode");
            String productName = (String) paymentData.get("productName");
            String productPrice = (String) paymentData.get("productPrice");
            String identityNumber = (String) paymentData.get("identityNumber");

            String response = cardCompanyAPIService.sendPaymentRequestToCardCompany(activeCard, activeCardCode, productName, productPrice, identityNumber);

            if (response != null) {
                return new ResponseEntity<>(response, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Payment Failed", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            logger.error("Failed to execute payment", e);
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 계좌 결제 요청
    @PostMapping("/api/payRequest/account")
    public ResponseEntity<String> executeAccountPayment(@RequestBody Map<String, Object> paymentData) {
        try {
            String accountNumber = (String) paymentData.get("accountNumber");
            String productName = (String) paymentData.get("productName");
            String productPrice = (String) paymentData.get("productPrice");
            String identityNumber = (String) paymentData.get("identityNumber");

            String response = cardCompanyAPIService.sendAccountPaymentRequestToCardCompany(accountNumber, productName, productPrice, identityNumber);

            if (response != null) {
                return new ResponseEntity<>(response, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Payment Failed (account)", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            logger.error("Failed to execute payment (account)", e);
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/api/monthly-payment-data")
    public ResponseEntity<String> fetchMonthlyPaymentData(@RequestParam("month") int month) {
        try {
            String monthlyPaymentData = cardCompanyAPIService.fetchMonthlyPaymentData(month);

            if (monthlyPaymentData != null) {
                return new ResponseEntity<>(monthlyPaymentData, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("No Data Found", HttpStatus.NOT_FOUND);
            }

        } catch (Exception e) {
            logger.error("Failed to fetch monthly payment data", e);
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/api/monthly-payment-data2")
    public ResponseEntity<String> fetchMonthlyPaymentData2() {
        try {
            String monthlyPaymentData = cardCompanyAPIService.fetchMonthlyPaymentData2();

            if (monthlyPaymentData != null) {
                return new ResponseEntity<>(monthlyPaymentData, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("No Data Found", HttpStatus.NOT_FOUND);
            }

        } catch (Exception e) {
            logger.error("Failed to fetch monthly payment data", e);
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/api/card-transactions")
    public ResponseEntity<String> fetchTransactionsByCard(@RequestBody Map<String, Object> payload) {
        try {
            String cardCode = (String) payload.get("cardCode");
            String cardNumber = (String) payload.get("cardNumber");

            System.out.println("카드사별 거래내역조회 컨트롤러 들어옴");
            String transactionsData = cardCompanyAPIService.fetchTransactionsByCard(cardCode, cardNumber);

            if (transactionsData != null) {
                return new ResponseEntity<>(transactionsData, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("No Transactions Found", HttpStatus.NOT_FOUND);
            }

        } catch (Exception e) {
            logger.error("Failed to fetch transactions by card", e);
            return new ResponseEntity<>("Internal Server Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



}
