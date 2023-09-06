package com.kopo.finalhanaonepayproject.api.controller;

import com.kopo.finalhanaonepayproject.api.service.OpenAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*")
public class OpenAPIController {
    private final OpenAPIService openAPIService;

    @Autowired
    public OpenAPIController(OpenAPIService openAPIService) {
        this.openAPIService = openAPIService;
    }

    @PostMapping("/api/card-data")
    public String cardData(HttpSession session, HttpServletRequest request, @RequestBody Map<String, List<String>> cardData) {
        // 여기서 "cards"로 키 값을 변경했습니다.
        List<String> selectedCards = cardData.get("cards");

        System.out.println("들어옴");
        System.out.println("Session ID in OpenAPIController: " + request.getSession().getId());

        String identityNumber = (String) session.getAttribute("identityNumber");

        if (identityNumber == null) {
            System.out.println("세션에 주민등록번호 정보가 없습니다.");
            return "error1";
        }

        System.out.println("identityNumber: " + identityNumber);
        System.out.println("Selected Cards: " + selectedCards.toString());

        if (selectedCards == null || selectedCards.isEmpty()) {
            System.out.println("카드 정보가 전달되지 않았습니다.");
            return "errorCardInfoMissing";
        }

        return openAPIService.fetchCardDataFromAPI(identityNumber, selectedCards);
    }
}
