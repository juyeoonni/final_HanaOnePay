package com.kopo.cardserver.model.DAO;


import com.kopo.cardserver.model.DTO.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;


@Mapper
public interface CardDAO {

    List<AccountDTO> getCustomerAccounts(String identityNumber, String tableCode);
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

    // 계좌 결제 (계좌번호에 대한 잔액 조회)
    BigDecimal getAccountBalanceByAccountNumber(@Param("accountNumber") String accountNumber, @Param("table") String table);

    // 계좌 결제 (계좌 결제 후 잔액 차감)
    void updateAccountBalanceByAccountNumber(@Param("accountNumber") String accountNumber, @Param("amount") BigDecimal amount, @Param("table") String table);

    // 계좌 결제 인서트 (결제 후 거래내역 인서트)
    //void insertAccPaymentLog(AccPaymentLogDTO accPaymentLog, String table);
    void insertAccPaymentLog(@Param("accountNumber") AccPaymentLogDTO accPaymentLog, @Param("table") String table);

    // 카드 결제 인서트
    void insertCardPaymentLog(@Param("cardNumber") String cardNumber,
                              @Param("payAmount") BigDecimal payAmount,
                              @Param("tableCode") String tableCode);

    List<ChartDTO> getWooriCardPaymentsByMonth(int month);

    List<ChartDTO> getWooriAccountPaymentsByMonth(int month);

    List<ChartDTO> getShinhanCardPaymentsByMonth(int month);

    List<ChartDTO> getShinhanAccountPaymentsByMonth(int month);

    List<ChartDTO> getKBCardPaymentsByMonth(int month);

    List<ChartDTO> getKBAccountPaymentsByMonth(int month);

    List<MonthTransDTO> getAllOrgTranDatabyMonth();

    List<HanaOnePayTransDTO> selectTransactionsByCard(String cardCode, String cardNumber);

    // 각 은행의 신용카드 리스트를 가져오는 메서드
    List<CreditCardDTO> getCustomerCreditCards(String tableCode);

    // 카드 번호와 전월의 사용 금액을 조회
    BigDecimal calculateTotalSpentAmountForPreviousMonth(@Param("cardNumber") String cardNumber, @Param("tableCode") String tableCode);

    void deductAmountFromLinkedAccount(@Param("cardNumber") String cardNumber, @Param("totalSpentAmount") BigDecimal totalSpentAmount, @Param("tableCode") String tableCode);
}


