package com.kopo.openapiserver.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
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

    public String fetchCardData(String identityNumber, List<String> selectedCards) {
        // 카드사 API에 요청을 보내고 응답을 처리하는 로직
        URI uri = URI.create("http://3.36.156.150:8080/api/card-data"); // 실제 카드사 API URL

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
}
