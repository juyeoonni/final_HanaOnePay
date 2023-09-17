package com.kopo.cardserver.model.DAO;


import com.kopo.cardserver.model.DTO.CardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;


@Mapper
public interface CardDAO {
    List<CardDTO> getCustomerCards(String identityNumber, String tableCode);

    // 결제를 위한 카드 유효성 검사 메서드
    String getCardTypeByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);

    String getCardStatusByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);

    BigDecimal getAccountBalanceByCardNumber(@Param("cardNumber") String cardNumber, @Param("tableCode") String tableCode);
}

