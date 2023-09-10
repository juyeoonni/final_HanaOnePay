package com.kopo.finalhanaonepayproject.hanaOnePay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
        } catch (Exception e) {
            // 예외 처리 로직
            e.printStackTrace();
        }

        return "hanaOnePay/payCardList";
    }
}
