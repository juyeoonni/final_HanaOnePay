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
}
