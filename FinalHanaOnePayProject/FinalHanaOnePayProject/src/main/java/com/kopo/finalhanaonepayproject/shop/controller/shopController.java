package com.kopo.finalhanaonepayproject.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class shopController {

    @GetMapping("/shop/shopMain")
    public String showShopMain() {
        return "shop/shopMain";
    }

    @GetMapping("/shop/shopItem")
    public String shopItem() {
        return "shop/shopItem";
    }
}
