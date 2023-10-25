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
    public String accountData(HttpSession session, HttpServletRequest request) {

        System.out.println("계좌조회 컨트롤러 들어옴");
        System.out.println("Session ID in OpenAPIController: " + request.getSession().getId());

        String identityNumber = (String) session.getAttribute("identityNumber");

        if (identityNumber == null) {
            System.out.println("세션에 주민등록번호 정보가 없습니다.");
            return "error1";
        }

        System.out.println("identityNumber: " + identityNumber);

        return openAPIService.fetchAccountDataFromAPI(identityNumber);
    }



    // 카드 조회 요청
    @PostMapping("/api/card-data")
    public String cardData(HttpSession session, HttpServletRequest request, @RequestBody Map<String, List<String>> cardData) {
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

    // 카드 결제 승인 요청
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

    // 계좌 결제 승인 요청
    @PostMapping("/api/payRequest/account")
    public ResponseEntity<String> executeAccountPayment(HttpSession session, HttpServletRequest request, @RequestBody Map<String, String> paymentData) {
        String accountNumber = paymentData.get("accountNumber");
        String productName = paymentData.get("productName");
        String productPrice = paymentData.get("productPrice");
        String identityNumber = paymentData.get("identityNumber");

        System.out.println("계좌 결제 컨트롤러 들어옴");

        String response = openAPIService.executeAccountPayment(identityNumber, accountNumber, productName, productPrice);

        if (response != null) {
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Payment Failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/api/payments-by-month")
    public ModelAndView getPaymentsByMonth(@RequestParam("month") String month) {
        ModelAndView modelAndView = new ModelAndView();

        String response = openAPIService.fetchPaymentsByMonthFromAPI(month);
        String response2 = openAPIService.fetchPaymentsByMonthFromAPI2();
        System.out.println("response2:" + response2);

        if (response != null) {
            modelAndView.addObject("response", response);
            modelAndView.addObject("response2", response2);
            modelAndView.setViewName("hanaOnePay/payReport");
        } else {
            modelAndView.addObject("message", "Failed to fetch payments by month");
            modelAndView.setViewName("errorPage");
        }

        return modelAndView;
    }

    // 월별 업종별 소비 분포 조회
    @GetMapping("/api/payments-by-month2")
    public String getPaymentsByMonth2(@RequestParam String month) {
        String response = openAPIService.fetchPaymentsByMonthFromAPI(month);
        System.out.println("화살표로 월 전환 성공");
        return response;
    }

}
