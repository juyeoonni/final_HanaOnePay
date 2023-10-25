package com.kopo.finalhanaonepayproject.shop.controller;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayAccountDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.service.HanaOnePayService;
import com.kopo.finalhanaonepayproject.shop.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    private final HanaOnePayService hanaOnePayService;

    @Autowired
    public ShopController(ShopService shopService, HanaOnePayService hanaOnePayService) {
        this.shopService = shopService;
        this.hanaOnePayService = hanaOnePayService;
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

    @GetMapping("/shop/buyItem")
    public ModelAndView buyItem(HttpServletRequest request,
                                @RequestParam("productName") String productName,
                                @RequestParam("productPrice") int productPrice,
                                @RequestParam("productDataJSON") String productDataJSON) {

        try {
            productName = URLDecoder.decode(productName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

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

        int hanaMoney = shopService.selectHanaMoney(identityNumber);
        System.out.println("User's Hana Money: " + hanaMoney);

        List<HanaOnePayAccountDTO> accountInfos = hanaOnePayService.getHanaAccountDetailsByIdentity(identityNumber);
        System.out.println("하나계좌 조회 성공!");

        ModelAndView mav = new ModelAndView();
        mav.addObject("hanaOnePayCardList", hanaOnePayCardList);
        mav.addObject("productName", productName);
        mav.addObject("productPrice", productPrice);
        mav.addObject("hanaMoney", hanaMoney);
        mav.addObject("productDataJSON", productDataJSON);
        mav.addObject("accountInfos", accountInfos);
        mav.setViewName("shop/buyItem");

        return mav;
    }

    @PostMapping("/shop/deductPoint")
    public ResponseEntity<String> deductPoint(@RequestParam("identityNumber") String identityNumber,
                                              @RequestParam("usedPoint") int usedPoint) {
        shopService.deductHanaMoney(identityNumber, usedPoint);
        return ResponseEntity.ok("HanaMoney deducted successfully!");
    }

    @PostMapping("/shop/calculateFinalPrice")
    public ResponseEntity<Integer> calculateFinalPrice(@RequestParam("productPrice") int productPrice,
                                                       @RequestParam("usedPoint") int usedPoint) {
        int finalPrice = productPrice - usedPoint;
        return ResponseEntity.ok(finalPrice);
    }

}
