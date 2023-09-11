package com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HanaOnePayDAO {

    List<HanaOnePayCardDTO> getRegisteredCards(String identityNumber);

    void insertCard(HanaOnePayCardDTO card);

    List<HanaOnePayCardDTO> getAllCards();


}
