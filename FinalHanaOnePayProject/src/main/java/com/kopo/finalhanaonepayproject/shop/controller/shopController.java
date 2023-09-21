package com.kopo.finalhanaonepayproject.shop.controller;

import com.kopo.finalhanaonepayproject.customer.service.CustomerService;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.shop.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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

    @GetMapping("/shop/shopItem1")
    public String shopItem1() {
        return "shop/shopItem1";
    }

    @GetMapping("/shop/shopItem2")
    public String shopItem2() {
        return "shop/shopItem2";
    }

    //    세션에서 고객 주민번호 받아서 고객 주민번호를 기반으로 고객이 갖고 있는 페이카드 조회
    @GetMapping("/shop/buyItem")
    public ModelAndView buyItem(HttpServletRequest request,
                                @RequestParam("productName") String productName,
                                @RequestParam("productPrice") int productPrice,
                                @RequestParam("productDataJSON") String productDataJSON) {

        // productName 디코딩
        try {
            productName = URLDecoder.decode(productName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            // 적절한 오류 처리를 여기에 추가할 수 있습니다.
        }

        // 콘솔에 JSON 문자열 출력
        System.out.println("Received JSON: " + productDataJSON);

        HttpSession session = request.getSession();
        String identityNumber = (String) session.getAttribute("identityNumber");
        List<HanaOnePayCardDTO> hanaOnePayCardList = shopService.selectINOfPayCard(identityNumber);

        session.setAttribute("productDataJSON", productDataJSON);
        session.setAttribute("productName", productName);
        session.setAttribute("productPrice", productPrice);

        System.out.println("productName: " + productName);
        System.out.println("productPrice: " + productPrice);

        System.out.println("Setting productDataJSON in session: " + productDataJSON);

        ModelAndView mav = new ModelAndView();
        mav.addObject("hanaOnePayCardList", hanaOnePayCardList);
        mav.addObject("productName", productName);
        mav.addObject("productPrice", productPrice);
        mav.addObject("productDataJSON", productDataJSON);
        mav.setViewName("shop/buyItem");

        return mav;
    }



}
