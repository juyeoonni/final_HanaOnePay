package com.kopo.finalhanaonepayproject.api.controller;

import com.kopo.finalhanaonepayproject.api.service.OpenAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

    // 계좌 조회 요청
    @PostMapping("/api/account-data")
    public String accountData(HttpSession session, HttpServletRequest request, @RequestBody Map<String, List<String>> accountData) {
        List<String> selectedAccounts = accountData.get("accounts");

        System.out.println("계좌조회 컨트롤러 들어옴");
        System.out.println("Session ID in OpenAPIController: " + request.getSession().getId());

        String identityNumber = (String) session.getAttribute("identityNumber");

        if (identityNumber == null) {
            System.out.println("세션에 주민등록번호 정보가 없습니다.");
            return "error1";
        }

        System.out.println("identityNumber: " + identityNumber);
        System.out.println("Selected Cards: " + selectedAccounts.toString());

        if (selectedAccounts == null || selectedAccounts.isEmpty()) {
            System.out.println("카드 정보가 전달되지 않았습니다.");
            return "errorCardInfoMissing";
        }

        return openAPIService.fetchAccountDataFromAPI(identityNumber, selectedAccounts);
    }


    // 카드 조회 요청
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

//    // 결제 승인 요청
//    @PostMapping("/api/payRequest")
//    public String executePayment(HttpSession session, HttpServletRequest request, @RequestBody Map<String, String> paymentData) {
//        String activeCard = paymentData.get("activeCard");
//        String productName = paymentData.get("productName");
//        String productPrice = paymentData.get("productPrice");
//        String identityNumber = paymentData.get("identityNumber");
//
//        System.out.println("결제 컨트롤러 들어옴");
//        System.out.println("결제카드정보: " + paymentData.get("activeCard"));
//
//        // 위의 값을 사용하여 결제 처리를 수행할 수 있습니다.
//        // 예제에서는 OpenAPIService를 호출하는 부분을 작성해봤습니다.
//        return openAPIService.executePayment(identityNumber, activeCard, productName, productPrice);
//    }

    // 결제 승인 요청
    @PostMapping("/api/payRequest")
    public ResponseEntity<String> executePayment(HttpSession session, HttpServletRequest request, @RequestBody Map<String, String> paymentData) {
        String activeCard = paymentData.get("activeCard");
        String activeCardCode = paymentData.get("activeCardCode");
        String productName = paymentData.get("productName");
        String productPrice = paymentData.get("productPrice");
        String identityNumber = paymentData.get("identityNumber");

        System.out.println("결제 컨트롤러 들어옴");
        System.out.println("결제카드정보: " + paymentData.get("activeCard"));

        String response = openAPIService.executePayment(identityNumber, activeCard, activeCardCode, productName, productPrice);

        if (response != null) {
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Payment Failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
