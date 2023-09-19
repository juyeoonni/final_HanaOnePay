package com.kopo.finalhanaonepayproject.api.service;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.client.RestTemplate;



@Service
public class OpenAPIService {
    private final RestTemplate restTemplate; // 이 부분을 클래스 멤버 변수로 선언합니다.

    private static final Logger logger = LoggerFactory.getLogger(OpenAPIService.class);

    public OpenAPIService() {
        this.restTemplate = new RestTemplate(); // 생성자에서 초기화합니다.
    }

    // 계좌조회 서비스
    public String fetchAccountDataFromAPI(String identityNumber, List<String> selectedAccounts) {
        Map<String, Object> body = new HashMap<>();
        body.put("identityNumber", identityNumber);
        body.put("selectedAccounts", selectedAccounts);

        // ... [기타 코드는 동일]

        ResponseEntity<String> response = restTemplate.postForEntity("http://[OPENAPI_SERVER_URL]/api/account-data", entity, String.class);

        // ... [응답 처리 코드]
    }






    public String fetchCardDataFromAPI(String identityNumber, List<String> selectedCards) {
        System.out.println("서비스까지 들어오는거 확인");

        // POST 요청에 보낼 데이터 설정
        Map<String, Object> body = new HashMap<>();
        body.put("identityNumber", identityNumber);
        body.put("selectedCards", selectedCards);

        // HttpHeaders 객체 생성 및 Content-Type 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // HttpEntity 객체 생성
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        // POST 요청 보내기
        //ResponseEntity<String> response = restTemplate.postForEntity("http://43.201.67.24:8080/api/card-data", entity, String.class);
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

    public String executePayment(String identityNumber, String activeCard, String activeCardCode, String productName, String productPrice) {
        // 위의 값을 사용하여 외부 서버로 결제 요청을 보낼 수 있습니다.
        // 예제 코드는 이전에 작성한 fetchCardDataFromAPI를 기반으로 작성되었습니다.

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

        ResponseEntity<String> response = restTemplate.postForEntity("http://localhost:8082/api/payRequest", entity, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            logger.info("Payment Result: {}", response.getBody());
            return response.getBody();
        } else {
            logger.error("Failed to execute payment. Status code: {}", response.getStatusCode());
            return null;
        }
    }
}
