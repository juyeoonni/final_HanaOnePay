package com.kopo.finalhanaonepayproject.controller;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayTransDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayhanaCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import com.kopo.finalhanaonepayproject.shop.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Home {

    @Autowired
    private HanaOnePayService hanaOnePayService;

    @Autowired
    private ShopService shopService;

    @GetMapping({"/", "/home"})
    public ModelAndView doHome(HttpSession session){
        ModelAndView mav = new ModelAndView("/home");

        String identityNumber = (String) session.getAttribute("identityNumber");

        int hanaMoney = shopService.selectHanaMoney(identityNumber);
        System.out.println("User's Hana Money: " + hanaMoney);

        List<HanaOnePayhanaCardDTO> cardInfos = hanaOnePayService.getMainHanaCardByIdentity(identityNumber);
        //주민번호로 고객의 카드정보를 가져온다.
        System.out.println("하나 대표 카드 조회 성공!");

        Map<String, List<HanaOnePayTransDTO>> thisMonthTransData = hanaOnePayService.getThisMonthTransData(identityNumber);
        System.out.println("이번달 하나카드 거래내역 조회 성공!");

        // Map을 생성하여 카드 번호별 이번달 사용 금액을 저장합니다.
        Map<String, Integer> thisMonthTotalAmounts = new HashMap<>();

        for (String cardNumber : thisMonthTransData.keySet()) {
            int thisMonthTotalAmount = hanaOnePayService.getThisMonthTotalAmount(cardNumber);
            thisMonthTotalAmounts.put(cardNumber, thisMonthTotalAmount);
        }

        // 하나카드 중 신용카드 조회
        List<HanaOnePayhanaCardDTO> creditCardList = new ArrayList<>();
        List<HanaOnePayhanaCardDTO> creditCards = hanaOnePayService.getHanaCreditCardByIdentity(identityNumber);
        System.out.println("creditCards: " + creditCards);

        // totalSpentAmount를 초기화
        BigDecimal totalSpentAmount = BigDecimal.ZERO;

        // creditCards 비어있지 않을 때만 카드를 추가
        if (!creditCards.isEmpty()) {
            HanaOnePayhanaCardDTO selectedCreditCard = creditCards.get(0);
            creditCardList.add(selectedCreditCard);

            //신용카드의 전월 1일부터 말일까지의 거래내역에서 금액합산
            totalSpentAmount = hanaOnePayService.calculateTotalSpentAmountForPreviousMonth(selectedCreditCard.getCardNumber());
            System.out.println("Total Spent Amount for Previous Month: " + totalSpentAmount);
        }

        mav.addObject("cardInfos", cardInfos);
        mav.addObject("thisMonthTransData", thisMonthTransData);
        mav.addObject("thisMonthTotalAmounts", thisMonthTotalAmounts);
        mav.addObject("creditCards", creditCards);
        mav.addObject("totalSpentAmount", totalSpentAmount);
        mav.addObject("hanaMoney", hanaMoney);

        return mav;
    }


    @RequestMapping(value = "/logout")
    public ModelAndView deleteGuest(HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println(id);
        ModelAndView mav = new ModelAndView();
        session.invalidate();
        mav.addObject("msg", "로그아웃 성공");
        mav.addObject("loc", "/home");
        mav.setViewName("message");
        return mav;}
}


