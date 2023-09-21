package com.kopo.openapiserver.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CardCompanyAPIService {
    private final RestTemplate restTemplate;
    private static final Logger logger = LoggerFactory.getLogger(CardCompanyAPIService.class);

    public CardCompanyAPIService() {
        this.restTemplate = new RestTemplate();
    }

    // 계좌조회 서비스
    public String fetchAccountData(String identityNumber) {
        URI uri = URI.create("http://localhost:8081/api/account-data");

        Map<String, Object> payload = new HashMap<>();
        payload.put("identityNumber", identityNumber);

        ResponseEntity<String> response = restTemplate.postForEntity(uri, payload, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Account Data: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch account data. Status code: {}", response.getStatusCode());
            return null;
        }
    }




    public String fetchCardData(String identityNumber, List<String> selectedCards) {
        // 카드사 API에 요청을 보내고 응답을 처리하는 로직
        //URI uri = URI.create("http://3.36.156.150:8080/api/card-data"); // 실제 카드사 API URL
        URI uri = URI.create("http://52.79.68.69:8081/api/card-data"); // 실제 카드사 API URL

        // POST 방식으로 보낼 요청 데이터 구성
        Map<String, Object> payload = new HashMap<>();
        payload.put("identityNumber", identityNumber);
        payload.put("selectedCards", selectedCards);

        ResponseEntity<String> response = restTemplate.postForEntity(uri, payload, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Card Data: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch card data. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    // OpenAPIService에 추가
    public String sendPaymentRequestToCardCompany(String activeCard, String activeCardCode, String productName, String productPrice, String identityNumber) {
        URI uri = URI.create("http://localhost:8081/api/payRequest"); // 카드사의 실제 결제 API URL을 설정해야 합니다.

        Map<String, Object> payload = new HashMap<>();
        payload.put("activeCard", activeCard);
        payload.put("activeCardCode", activeCardCode);
        payload.put("productName", productName);
        payload.put("productPrice", productPrice);
        payload.put("identityNumber", identityNumber);

        ResponseEntity<String> response = restTemplate.postForEntity(uri, payload, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Payment processed: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to process payment. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    public String sendAccountPaymentRequestToCardCompany(String accountNumber, String productName, String productPrice, String identityNumber) {
        URI uri = URI.create("http://localhost:8081/api/payRequest/account");

        Map<String, Object> payload = new HashMap<>();
        payload.put("accountNumber", accountNumber);
        payload.put("productName", productName);
        payload.put("productPrice", productPrice);
        payload.put("identityNumber", identityNumber);

        ResponseEntity<String> response = restTemplate.postForEntity(uri, payload, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Account Payment processed: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to process  Account payment. Status code: {}", response.getStatusCode());
            return null;
        }
    }
}
