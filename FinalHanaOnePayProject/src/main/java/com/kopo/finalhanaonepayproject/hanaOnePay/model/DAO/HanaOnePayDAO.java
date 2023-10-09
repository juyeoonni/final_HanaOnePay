package com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Mapper
public interface HanaOnePayDAO {

    List<HanaOnePayAccountDTO> getHanaAccountDetailsByIdentity(String identityNumber);
    List<HanaOnePayCardDTO> getHanaCardDetailsByIdentity(String identityNumber);

    List<HanaOnePayhanaCardDTO> getOnlyHanaCardDetailsByIdentity(String identityNumber);

    // 하나 대표카드
    List<HanaOnePayhanaCardDTO> getMainHanaCardByIdentity(String identityNumber);

    // 하나 신용카드
    List<HanaOnePayhanaCardDTO> getHanaCreditCardByIdentity(String identityNumber);

    // 신용카드의 전월 1일부터 말일까지의 거래내역에서 금액합산
    BigDecimal getLastMonthTotalAmount(String cardNumber);

    List<HanaOnePayCardDTO> getRegisteredCards(String identityNumber);

    void insertCard(HanaOnePayCardDTO card);

    List<HanaOnePayCardDTO> getAllCards();


    // 이번달 하나카드 거래내역 조회
    List<HanaOnePayTransDTO> getThisMonthTransData(String cardNumber);

    // 이번달 사용금액
    int getThisMonthTotalAmount(String cardNumber);

    List<CardItemDTO> getCardsByBusinessCodes(List<String> businessCodes);


    // 여기서부터 하나카드 결제
    String getCardTypeByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);
    String getCardStatusByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);
    BigDecimal getAccountBalanceByCardNumber(@Param("cardNumber") String cardNumber, @Param("tableCode") String tableCode);

    void updateAccountBalanceByCardNumber(@Param("cardNumber") String cardNumber, @Param("tableCode") String tableCode, @Param("amount") BigDecimal amount);

    // 신용카드
    BigDecimal getCreditCardLimitByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);

    void updateCreditCardLimitByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode, @Param("amount") BigDecimal amount);

    // 카드 결제 인서트
    void insertCardPaymentLog(@Param("cardNumber") String cardNumber,
                              @Param("payAmount") BigDecimal payAmount,
                              @Param("tableCode") String tableCode);
}
