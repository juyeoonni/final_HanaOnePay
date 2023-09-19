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
    @PostMapping("/api/linkedAccount")
    public ResponseEntity<List<String>> fetchLinkedAccounts(@RequestBody Map<String, String> payload) {
        try {
            String identityNumber = payload.get("identityNumber");

            // 실제 카드사 API에서 연동된 계좌 정보를 가져옵니다.
            List<String> linkedAccounts = cardCompanyAPIService.fetchLinkedAccounts(identityNumber);

            if (linkedAccounts != null && !linkedAccounts.isEmpty()) {
                return new ResponseEntity<>(linkedAccounts, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            logger.error("Failed to fetch linked accounts", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
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

}
