package com.kopo.cardserver.model.DAO;


import com.kopo.cardserver.model.DTO.CardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface CardDAO {
    List<CardDTO> getCustomerCards(String identityNumber, String tableCode);
}

