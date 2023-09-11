package com.kopo.finalhanaonepayproject.shop.model.DAO;

import com.kopo.finalhanaonepayproject.customer.model.DTO.CustomerDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopDAO {

    public List<HanaOnePayCardDTO> selectINOfPayCard(String IdentityNumber);

}
