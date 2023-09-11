package com.kopo.finalhanaonepayproject.shop.controller;

import com.kopo.finalhanaonepayproject.customer.service.CustomerService;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.shop.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShopController {

    private final ShopService shopService;

    @Autowired
    public ShopController(ShopService shopService) {
        this.shopService = shopService;
    }


    @GetMapping("/shop/shopMain")
    public String showShopMain() {
        return "shop/shopMain";
    }

    @GetMapping("/shop/shopItem")
    public String shopItem() {
        return "shop/shopItem";
    }

//    세션에서 고객 주민번호 받아서 고객 주민번호를 기반으로 고객이 갖고 있는 페이카드 조회
    @GetMapping("/shop/buyItem")
    public ModelAndView buyItem(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String identityNumber = (String) session.getAttribute("identityNumber");
        List<HanaOnePayCardDTO> hanaOnePayCardList = shopService.selectINOfPayCard(identityNumber);
        ModelAndView mav = new ModelAndView();
        mav.addObject("hanaOnePayCardList", hanaOnePayCardList);
        mav.setViewName("shop/buyItem");
        return mav;
    }
}
