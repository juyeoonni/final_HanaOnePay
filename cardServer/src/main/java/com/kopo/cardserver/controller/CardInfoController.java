package com.kopo.cardserver.controller;

import com.kopo.cardserver.model.DTO.CardDTO;
import com.kopo.cardserver.model.DTO.CustomerDTO;
import com.kopo.cardserver.service.CardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class CardInfoController {

    @Autowired
    private CardService cardService;

    @PostMapping("/card-data")
    public ResponseEntity<List<CardDTO>> getCards(@RequestBody Map<String, Object> requestData) {
        System.out.println("1");
        String identityNumber = (String) requestData.get("identityNumber");
        List<String> selectedCards = (List<String>) requestData.get("selectedCards");

        List<CardDTO> cards = cardService.getCustomerCards(identityNumber, selectedCards);
        return ResponseEntity.ok(cards);
    }
}




