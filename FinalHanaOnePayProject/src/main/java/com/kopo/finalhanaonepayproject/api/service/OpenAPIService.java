package com.kopo.finalhanaonepayproject.api.service;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayAccTransDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayTransDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OpenAPIService {
    private final RestTemplate restTemplate;

    private static final Logger logger = LoggerFactory.getLogger(OpenAPIService.class);

    public OpenAPIService() {
        this.restTemplate = new RestTemplate();
    }

    // 계좌조회 서비스
    public String fetchAccountDataFromAPI(String identityNumber) {
        System.out.println("서비스까지 들어오는거 확인");

        Map<String, Object> body = new HashMap<>();
        body.put("identityNumber", identityNumber);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        ResponseEntity<String> response = restTemplate.postForEntity("http://3.34.185.18:8080/api/account-data", entity, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Response: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch account data. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    // 카드 조회 서비스
    public String fetchCardDataFromAPI(String identityNumber, List<String> selectedCards) {
        System.out.println("서비스까지 들어오는거 확인");

        // POST 요청에 보낼 데이터 설정
        Map<String, Object> body = new HashMap<>();
        body.put("identityNumber", identityNumber);
        body.put("selectedCards", selectedCards);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // HttpEntity 객체 생성
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        // POST 요청 보내기
        ResponseEntity<String> response = restTemplate.postForEntity("http://3.34.185.18:8080/api/card-data", entity, String.class);

        // 응답 처리
        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Response: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch card data. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    // 간편 카드 결제 서비스
    public String executePayment(String identityNumber, String activeCard, String activeCardCode, String productName, String productPrice) {

        Map<String, Object> body = new HashMap<>();
        body.put("identityNumber", identityNumber);
        body.put("activeCard", activeCard);
        body.put("activeCardCode", activeCardCode);
        body.put("productName", productName);
        body.put("productPrice", productPrice);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        System.out.println("결제 서비스까지 들어오는거 확인");

        ResponseEntity<String> response = restTemplate.postForEntity("http://3.34.185.18:8080/api/payRequest", entity, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Payment Result: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to execute payment. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    // 간편 계좌 결제 서비스
    public String executeAccountPayment(String identityNumber,  String accountNumber, String productName, String productPrice) {

        Map<String, Object> body = new HashMap<>();
        body.put("identityNumber", identityNumber);
        body.put("accountNumber", accountNumber);
        body.put("productName", productName);
        body.put("productPrice", productPrice);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        System.out.println("계좌 결제 서비스까지 들어오는거 확인");

        ResponseEntity<String> response = restTemplate.postForEntity("http://3.34.185.18:8080/api/payRequest/account", entity, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Account Payment Result: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to execute payment. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    public String fetchPaymentsByMonthFromAPI(String month) {
        System.out.println("월별 결제 내역 조회 서비스까지 들어오는거 확인");

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl("http://3.34.185.18:8080/api/monthly-payment-data")
                .queryParam("month", month);

        URI uri = builder.build().encode().toUri();

        ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Response for Monthly Payments: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch monthly payments. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    // 월별 결제 내역 조회 서비스
    public String fetchPaymentsByMonthFromAPI2() {
        System.out.println("월별 결제 내역 조회 서비스까지 들어오는거 확인");

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl("http://3.34.185.18:8080/api/monthly-payment-data2");

        URI uri = builder.build().encode().toUri();

        ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Response for Monthly Payments: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch monthly payments. Status code: {}", response.getStatusCode());
            return null;
        }
    }

    // 특정 카드의 거래내역 조회 서비스
    public List<HanaOnePayTransDTO> fetchTransactionsByCard(String cardCode, String cardNumber) {
        System.out.println("특정 카드의 거래내역 조회 서비스 요청 시작");

        // URL 설정
        String url = "http://3.34.185.18:8080/api/card-transactions";

        // POST 요청에 보낼 데이터 설정
        Map<String, Object> payload = new HashMap<>();
        payload.put("cardCode", cardCode);
        payload.put("cardNumber", cardNumber);

        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(payload);

        ResponseEntity<List<HanaOnePayTransDTO>> response = restTemplate.exchange(
                url,
                HttpMethod.POST,
                requestEntity,
                new ParameterizedTypeReference<List<HanaOnePayTransDTO>>() {});

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Transactions Response: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch transactions. Status code: {}", response.getStatusCode());
            return Collections.emptyList();
        }
    }

    // 특정 계좌의 거래내역 조회 서비스
    public List<HanaOnePayAccTransDTO> fetchTransactionsByAccount(String cardCode, String accNumber) {
        System.out.println("특정 계좌의 거래내역 조회 서비스 요청 시작");

        // URL 설정
        String url = "http://3.34.185.18:8080/api/account-transactions";

        // POST 요청에 보낼 데이터 설정
        Map<String, Object> payload = new HashMap<>();
        payload.put("cardCode", cardCode);
        payload.put("accNumber", accNumber);

        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(payload);

        ResponseEntity<List<HanaOnePayAccTransDTO>> response = restTemplate.exchange(
                url,
                HttpMethod.POST,
                requestEntity,
                new ParameterizedTypeReference<List<HanaOnePayAccTransDTO>>() {});

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Received Transactions Response: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to fetch transactions. Status code: {}", response.getStatusCode());
            return Collections.emptyList();
        }
    }

}
