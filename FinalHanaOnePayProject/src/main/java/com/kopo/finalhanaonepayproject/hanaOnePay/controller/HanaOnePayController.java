package com.kopo.finalhanaonepayproject.hanaOnePay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalhanaonepayproject.api.service.OpenAPIService;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.*;
import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import com.kopo.finalhanaonepayproject.naverSMS.SmsService;
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
    @Autowired
    private SmsService smsService;
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
            e.printStackTrace();
        }
        return "/hanaOnePay/payManage";
    }


    @GetMapping("/hanaOnePay/addPayCard")
    public String addPayCard() {
        return "hanaOnePay/addPayCard";
    }


    @RequestMapping("/hanaOnePay/payRequest")
    public ModelAndView processQR(@RequestParam("qrData") String qrData, HttpSession session, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();

        String identityNumber = (String) session.getAttribute("identityNumber");
        List<HanaOnePayCardDTO> cardInfos = hanaOnePayService.getHanaCardDetailsByIdentity(identityNumber);

        System.out.println("결제 페이지 하나카드 조회 성공!");
        modelAndView.addObject("cardInfos", cardInfos);

        modelAndView.setViewName("hanaOnePay/payRequest");
        modelAndView.addObject("qrData", qrData);

        try {
            List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
            modelAndView.addObject("allCards", allCards);

            // JSON 데이터 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(qrData);
            String productName = jsonNode.get("productName").asText();
            String productPrice = jsonNode.get("productPrice").asText();

            session.setAttribute("productName", productName);
            session.setAttribute("productPrice", productPrice);

            session.setAttribute("qrData", qrData);
            System.out.println("페이카드 조회 성공!");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return modelAndView;
    }

    @GetMapping("/hanaOnePay/payRequestSuccess")
    public String payRequestSuccess(Model model) {
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestSuccess";
    }

    @GetMapping("/hanaOnePay/payRequestFail")
    public String payRequestFail(Model model) {
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestFail";
    }


    @GetMapping("/hanaOnePay/selectPayCard")
    public ModelAndView selectPayCard() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("hanaOnePay/selectPayCard");

        try {
            List<HanaOnePayCardDTO> allCards = hanaOnePayService.getAllCards();
            modelAndView.addObject("allCards", allCards);

            System.out.println("페이카드 조회 성공!");
        } catch (Exception e) {
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

    @GetMapping("/hanaOnePay/event")
    public String event() {
        return "hanaOnePay/event";
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
                    }
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

        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestSuccessPC";
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

        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestFailforLimit";
    }

    // 체크카드 잔액부족으로 결제 실패시
    @GetMapping("/hanaOnePay/payRequestFailforBalance")
    public String payRequestFailforBalance(Model model) {
        String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        model.addAttribute("time", currentTime);

        return "hanaOnePay/payRequestFailforBalance";
    }

    @PostMapping("/hanaOnePay/sms")
    public void sendAuthMessage() throws Exception {
        String recipientPhoneNumber = "01032649073";
        String content = "[하나원페이] 정하나 고객님께서 신청하신 마이데이터 지갑연동 동의가 신규 등록 되었습니다.";
        smsService.sendSms(recipientPhoneNumber, content);
    }
}
