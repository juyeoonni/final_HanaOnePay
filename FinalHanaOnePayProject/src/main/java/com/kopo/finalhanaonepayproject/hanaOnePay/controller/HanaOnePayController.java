package com.kopo.finalhanaonepayproject.hanaOnePay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HanaOnePayController {

    @GetMapping("/hanaOnePay/payCardList")
    public String payCardList() {
        return "hanaOnePay/payCardList";
    }
}
