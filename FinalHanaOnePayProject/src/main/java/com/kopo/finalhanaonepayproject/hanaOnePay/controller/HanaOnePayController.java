package com.kopo.finalhanaonepayproject.hanaOnePay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalhanaonepayproject.api.service.OpenAPIService;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.*;
import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import com.kopo.finalhanaonepayproject.shop.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class HanaOnePayController {

    @Autowired
    private HanaOnePayService hanaOnePayService;
    @Autowired
    private OpenAPIService openAPIService;
    private ShopService shopService;

    @PostMapping("/hanaOnePay/payCardList")
    public String payCardList(HttpServletRequest request) {
        String selectedCards = request.getParameter("selectedCards");

        HttpSession session = request.getSession();
        session.setAttribute("selectedCards", selectedCards);

        String identityNumber = (String) session.getAttribute("identityNumber");
        System.out.println("페이등록 하려는 선택카드들: " + selectedCards);
        System.out.println("페이등록 하려는 고객 주민번호: " + identityNumber);
        System.out.println("페이카드 등록 직전임~");

        try {
            hanaOnePayService.insertSelectedCards(selectedCards, identityNumber); // 주민번호 추가
            System.out.println("페이카드 등록 성공!");

            List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
            request.setAttribute("allCards", allCards); // 모든 카드 정보를 request에 추가
            System.out.println("페이카드 조회 성공!");
        } catch (Exception e) {
            // 예외 처리 로직
            e.printStackTrace();
        }

        return "hanaOnePay/payCardList";
    }

    @GetMapping("/hanaOnePay/payManage")
    public String payManage(HttpServletRequest request) {
        try {
            List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
            request.setAttribute("hanaOnePayCardList", allCards); // 모든 카드 정보를 request에 추가
            System.out.println("페이카드 조회 성공!");
        } catch (Exception e) {
            // 예외 처리 로직
            e.printStackTrace();
        }
        return "/hanaOnePay/payManage";
    }


    @GetMapping("/hanaOnePay/addPayCard")
    public String addPayCard() {
        // 로직 추가 (예: 카드 추가 페이지에 필요한 데이터를 Model을 통해 전달)
        return "hanaOnePay/addPayCard";
    }


    @RequestMapping("/hanaOnePay/payRequest")
    public ModelAndView processQR(@RequestParam("qrData") String qrData, HttpSession session, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();

        String identityNumber = (String) session.getAttribute("identityNumber");
        List<HanaOnePayCardDTO> cardInfos = hanaOnePayService.getHanaCardDetailsByIdentity(identityNumber);

        System.out.println("결제 페이지 하나카드 조회 성공!");
        modelAndView.addObject("cardInfos", cardInfos);

        // QR 코드 데이터 처리 로직
        // 예: QR 데이터를 사용하여 결제 요청을 처리하고 결과 페이지로 이동
        modelAndView.setViewName("hanaOnePay/payRequest"); // 예를 들어 paymentResult.jsp로 결과 페이지를 보여준다고 가정
        modelAndView.addObject("qrData", qrData); // jsp에서 qrData 사용 가능

        try {
            List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
            modelAndView.addObject("allCards", allCards);

            // JSON 데이터 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(qrData);
            String productName = jsonNode.get("productName").asText();
            String productPrice = jsonNode.get("productPrice").asText();

//            // 모델에 productName과 productPrice를 추가하여 jsp에서 사용할 수 있도록 합니다.
//            modelAndView.addObject("productName", productName);
//            modelAndView.addObject("productPrice", productPrice);

            // QR 코드 스캔 결과를 세션에 저장
//            HttpSession session = request.getSession();
            session.setAttribute("productName", productName);
            session.setAttribute("productPrice", productPrice);

            session.setAttribute("qrData", qrData);
            //request.setAttribute("hanaOnePayCardList", allCards); // 모든 카드 정보를 request에 추가
            System.out.println("페이카드 조회 성공!");
        } catch (Exception e) {
            // 예외 처리 로직
            e.printStackTrace();
        }

        return modelAndView;
    }

    @GetMapping("/hanaOnePay/payRequestSuccess")
    public String payRequestSuccess(Model model) {
        // 현재 시간을 가져옵니다.
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        // 현재 시간을 모델에 추가하여 JSP 페이지로 전달합니다.
        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestSuccess"; // 결제 성공을 알리는 JSP 페이지를 반환합니다.
    }

    @GetMapping("/hanaOnePay/payRequestFail")
    public String payRequestFail(Model model) {
        // 현재 시간을 가져옵니다.
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

//        String identityNumber = ...; // 적절한 방법으로 값을 가져옵니다.
//        int usedPoint = ...; // 적절한 방법으로 값을 가져옵니다.
//        shopService.deductHanaMoney(identityNumber, usedPoint);

        // 현재 시간을 모델에 추가하여 JSP 페이지로 전달합니다.
        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestFail"; // 결제 성공을 알리는 JSP 페이지를 반환합니다.
    }


    @GetMapping("/hanaOnePay/selectPayCard")
    public ModelAndView selectPayCard() {
        ModelAndView modelAndView = new ModelAndView();

        // QR 코드 데이터 처리 로직
        // 예: QR 데이터를 사용하여 결제 요청을 처리하고 결과 페이지로 이동
        modelAndView.setViewName("hanaOnePay/selectPayCard"); // 예를 들어 paymentResult.jsp로 결과 페이지를 보여준다고 가정

        try {
            List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
            modelAndView.addObject("allCards", allCards);

            System.out.println("페이카드 조회 성공!");
        } catch (Exception e) {
            // 예외 처리 로직
            e.printStackTrace();
        }

        return modelAndView;
    }

    @GetMapping("/hanaOnePay/selectHanaPayCard")
    public ModelAndView selectHanaPayCard(HttpSession session) {
        ModelAndView mav = new ModelAndView("hanaOnePay/selectHanaPayCard");

        String identityNumber = (String) session.getAttribute("identityNumber");

        List<HanaOnePayCardDTO> cardInfos = hanaOnePayService.getHanaCardDetailsByIdentity(identityNumber);

        System.out.println("하나카드 조회 성공!");
        mav.addObject("cardInfos", cardInfos);

        return mav;
    }

    @GetMapping("/hanaOnePay/selectPayAccount")
    public String selectPayAccount() {
        return "hanaOnePay/selectPayAccount";
    }

    @GetMapping("/hanaOnePay/selectHanaPayAccount")
    public ModelAndView selectHanaPayAccount(HttpSession session) {
        ModelAndView mav = new ModelAndView("hanaOnePay/selectHanaPayAccount");

        String identityNumber = (String) session.getAttribute("identityNumber");

        List<HanaOnePayAccountDTO> accountInfos = hanaOnePayService.getHanaAccountDetailsByIdentity(identityNumber);
        System.out.println("하나계좌 조회 성공!");
        mav.addObject("accountInfos", accountInfos);

        return mav;
    }

    @GetMapping("/hanaOnePay/payHistory")
    public String payHistory() {
        return "hanaOnePay/payHistory";
    }

    @GetMapping("/hanaOnePay/payReport")
    public String payReport() {
        return "hanaOnePay/payReport";
    }

    // 타사카드거래내역
    @GetMapping("/hanaOnePay/selectCardTransList")
    public ModelAndView selectCardTransList(
            @RequestParam(value = "cardCode", required = false) String cardCode,
            @RequestParam(value = "cardNumber", required = false) String cardNumber,
            @RequestParam(value = "cardName", required = false) String cardName) {

        ModelAndView modelAndView = new ModelAndView();

        try {
            if (cardCode == null) {
                System.out.println("null");
            } else {
                System.out.println("null 아님");
            }
            if (cardNumber == null) {
                System.out.println("null");
            } else {
                System.out.println("null 아님");
            }
            System.out.println("cardCode: " + cardCode);
            System.out.println("cardNumber: " + cardNumber);
            System.out.println("cardNam: " + cardName);

            if (cardCode.length() != 0 && cardNumber.length() != 0) {
                // 특정 카드의 거래내역 조회 서비스 호출
                List<HanaOnePayTransDTO> transactions = openAPIService.fetchTransactionsByCard(cardCode, cardNumber);
                List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
                modelAndView.addObject("allCards", allCards);
                modelAndView.addObject("transactions", transactions);
                modelAndView.addObject("selectedCardName", cardName);
                modelAndView.addObject("selectedCardNumber", cardNumber);

                modelAndView.setViewName("hanaOnePay/selectCardTransList");
            } else {
                System.out.println("else문 들어옴");
                try {
                    if ("6894-3339-3359-1029".equals(cardNumber) || "1903-3930-5959-1233".equals(cardNumber)) {
                        System.out.println("if문 들어옴");
                        // 자은행 계좌 거래내역 조회 로직 호출
                        List<HanaOnePayTransDTO> transactions = hanaOnePayService.hanaTransactionsByCard(cardNumber);
                        System.out.println("transaction.size(): " + transactions.size());
                        List<HanaOnePayhanaCardDTO> allHanaCards = hanaOnePayService.getMainHanaCardByIdentity("980602-2000000");
                        for (HanaOnePayTransDTO transaction : transactions) {
                            System.out.println("transaction: " + transaction);
                            modelAndView.addObject("selectedCardName", cardName);
                            modelAndView.addObject("selectedCardNumber", cardNumber);
                        }

                        modelAndView.addObject("transactions", transactions);
                        modelAndView.addObject("allHanaCards", allHanaCards);
                        modelAndView.setViewName("hanaOnePay/selectHanaCardTransList");
                    }// 여기서 else 구문을 닫아줘야 합니다
                    else {
                        System.out.println("else문 들어옴");
                    }
                } catch (Exception e) {
                    System.out.println("else문 안의 catch문 들어옴");
                    e.printStackTrace();
                }
            }
            System.out.println("거래내역 조회 성공!");
        } catch (Exception e) {
            System.out.println("오류");
            // 예외 처리 로직
            e.printStackTrace();
        }
        return modelAndView;
    }

    //  계좌 거래내역
    @GetMapping("/hanaOnePay/selectAccountTransList")
    public ModelAndView selectAccountTransList(
            @RequestParam(value = "accNumber", required = false) String accNumber)
            {
        ModelAndView modelAndView = new ModelAndView();

        try {
            if (accNumber == null) {
                System.out.println("null");
            } else {
                System.out.println("null 아님");
            }
            System.out.println("accNumber: " + accNumber);
            String bankCode = "";
            if(accNumber.contains("1002")){
                bankCode = "woori";
            }else if(accNumber.contains("110")){
                bankCode = "shinhan";
            } else if (accNumber.contains("04")) {
                bankCode = "kb";
            }
            System.out.println("bankCode: " + bankCode);
            //타은행
            if (!bankCode.equals("")) {
                // 특정 카드의 거래내역 조회 서비스 호출
                List<HanaOnePayAccTransDTO> transactions = openAPIService.fetchTransactionsByAccount(bankCode, accNumber);
                modelAndView.addObject("transactions", transactions);
                modelAndView.addObject("selectedCardNumber", accNumber);

                modelAndView.setViewName("hanaOnePay/selectAccountTransList");
                //하나은행
            } else {
                System.out.println("else문 들어옴");
                try {
                    if ("412-910717533-07".equals(accNumber) || "321-977345113-07".equals(accNumber)) {
                        System.out.println("if문 들어옴");
                        // 자은행 계좌 거래내역 조회 로직 호출
                        List<HanaOnePayAccTransDTO> transactions = hanaOnePayService.hanaTransactionsByAccount(accNumber);
                        System.out.println("transaction.size(): " + transactions.size());
                        for (HanaOnePayAccTransDTO transaction : transactions) {
                            System.out.println("transaction: " + transaction);

                        }
                        //모델에 담아놓고 왜 js로 가?
                        //바로 jsp로 갈 수 있잖아

                        modelAndView.addObject("transactions", transactions);
                        modelAndView.setViewName("hanaOnePay/selectAccountTransList");
                    }// 여기서 else 구문을 닫아줘야 합니다
                    else {
                        System.out.println("else문 들어옴");
                    }
                } catch (Exception e) {
                    System.out.println("else문 안의 catch문 들어옴");
                    e.printStackTrace();
                }
            }
            System.out.println("거래내역 조회 성공!");
        } catch (Exception e) {
            System.out.println("오류");
            // 예외 처리 로직
            e.printStackTrace();
        }
        return modelAndView;
    }

    @GetMapping("/hanaOnePay/payTendencyTest")
    public String payTendencyTest() {
        return "hanaOnePay/payTendencyTest";
    }

    @GetMapping("/hanaOnePay/payTendencyTestResult")
    public ModelAndView payTendencyTestResult() {
        List<String> businessCodes = Arrays.asList("1000", "5500");
        List<CardItemDTO> cardList = hanaOnePayService.getCardsByBusinessCodes(businessCodes);

        ModelAndView mav = new ModelAndView("hanaOnePay/payTendencyTestResult");
        mav.addObject("cards", cardList);

        return mav;
    }

    @GetMapping("/hanaOnePay/emailTemplate")
    public String emailTemplate() {
        return "hanaOnePay/emailTemplate";
    }


    @GetMapping("/hanaOnePay/cardTerms")
    public String cardTerms() {
        return "hanaOnePay/cardTerms";
    }

    @GetMapping("/hanaOnePay/payRequestSuccessPC")
    public String payRequestSuccessPC(Model model) {

        // 현재 시간을 가져옵니다.
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        // 현재 시간을 모델에 추가하여 JSP 페이지로 전달합니다.
        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestSuccessPC"; // 결제 성공을 알리는 JSP 페이지를 반환합니다.
    }

    // 하나카드 결제 로직
    @PostMapping("/hanaOnePay/card-payRequest")
    public ResponseEntity<String> hanaCardPayment(@RequestBody Map<String, Object> requestData) {
        String activeCard = (String) requestData.get("activeCard");
        String activeCardCode = (String) requestData.get("activeCardCode");
        BigDecimal productPrice = new BigDecimal((String) requestData.get("productPrice"));
        String identityNumber = (String) requestData.get("identityNumber");

        String result = hanaOnePayService.hanaCardPaymentProcess(activeCard, activeCardCode, identityNumber, productPrice);

        return ResponseEntity.ok(result);
    }

    // 신용카드 한도초과로 결제 실패시
    @GetMapping("/hanaOnePay/payRequestFailforLimit")
    public String payRequestFailforLimit(Model model) {
        // 현재 시간을 가져옵니다.
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        // 현재 시간을 모델에 추가하여 JSP 페이지로 전달합니다.
        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestFailforLimit"; // 결제 성공을 알리는 JSP 페이지를 반환합니다.
    }

    // 체크카드 잔액부족으로 결제 실패시
    @GetMapping("/hanaOnePay/payRequestFailforBalance")
    public String payRequestFailforBalance(Model model) {
        // 현재 시간을 가져옵니다.
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        // 현재 시간을 모델에 추가하여 JSP 페이지로 전달합니다.
        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestFailforBalance"; // 결제 성공을 알리는 JSP 페이지를 반환합니다.
    }


}
