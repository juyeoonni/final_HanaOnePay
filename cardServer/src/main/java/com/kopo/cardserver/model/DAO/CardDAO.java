package com.kopo.cardserver.model.DAO;


import com.kopo.cardserver.model.DTO.CardDTO;
import com.kopo.cardserver.model.DTO.PendingPaymentDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;


@Mapper
public interface CardDAO {
    List<CardDTO> getCustomerCards(String identityNumber, String tableCode);

    // 결제를 위한 카드 유효성 검사 메서드
    // 체크카드
    String getCardTypeByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);

    String getCardStatusByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);

    BigDecimal getAccountBalanceByCardNumber(@Param("cardNumber") String cardNumber, @Param("tableCode") String tableCode);

    void updateAccountBalanceByCardNumber(@Param("cardNumber") String cardNumber, @Param("tableCode") String tableCode, @Param("amount") BigDecimal amount);

    // 신용카드
    BigDecimal getCreditCardLimitByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode);

    void updateCreditCardLimitByCardNumberAndIdentityNumber(@Param("cardNumber") String cardNumber, @Param("identityNumber") String identityNumber, @Param("tableCode") String tableCode, @Param("amount") BigDecimal amount);

    void insertPendingPayment(@Param("cardNumber") String cardNumber, @Param("payAmount") BigDecimal payAmount, @Param("withdrawalDate") String withdrawalDate, @Param("payStatus") String payStatus, @Param("tableCode") String tableCode);

    //미결제 금액을 조회
    List<PendingPaymentDTO> getPendingPaymentsByDate(@Param("tableCode") String tableCode, @Param("withdrawalDate") String withdrawalDate);

    //  payStatus를 업데이트하는 메서드
    void updatePayStatusToApproval(@Param("tableCode") String tableCode, @Param("pendingId") String pendingId);

}


