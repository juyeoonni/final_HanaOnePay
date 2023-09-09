package com.kopo.finalhanaonepayproject.card.model.DAO;

import com.kopo.finalhanaonepayproject.card.model.DTO.CardDTO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CardDAO {

    public List<CardDTO> selectCardList();

    public CardDTO selectCardDetailByCardNumber(@Param("cardNumber")String cardNumber);

    // DAO interface에 추가
    public List<CardDTO> selectCardByBankCode(List<String> modifiedBankCodes);

}
