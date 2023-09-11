package com.kopo.finalhanaonepayproject.shop.service;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.shop.model.DAO.ShopDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopService {

    @Autowired
    ShopDAO shopDAO;

    public List<HanaOnePayCardDTO> selectINOfPayCard(String identityNumber) {
        return shopDAO.selectINOfPayCard(identityNumber);
    }

}
