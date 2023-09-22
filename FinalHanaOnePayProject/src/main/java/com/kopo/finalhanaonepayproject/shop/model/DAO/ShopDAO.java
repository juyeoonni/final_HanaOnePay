package com.kopo.finalhanaonepayproject.shop.model.DAO;

import com.kopo.finalhanaonepayproject.customer.model.DTO.CustomerDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopDAO {

    public List<HanaOnePayCardDTO> selectINOfPayCard(String IdentityNumber);

    // 하나머니 조회
    int selectHanaMoney(String identityNumber);

    // 하나머니 차감 후 업데이트
    void updateHanaMoney(String identityNumber, int usedPoint);


}
