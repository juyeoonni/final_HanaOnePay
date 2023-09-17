package com.kopo.finalhanaonepayproject.hanaOnePay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class HanaOnePayController {

    @Autowired
    private HanaOnePayService hanaOnePayService;

    @PostMapping ("/hanaOnePay/payCardList")
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
    public ModelAndView processQR(@RequestParam("qrData") String qrData, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();

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
            HttpSession session = request.getSession();
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


}
