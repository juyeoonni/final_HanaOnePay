package com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayAccountDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayTransDTO;
import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayhanaCardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HanaOnePayDAO {

    List<HanaOnePayAccountDTO> getHanaAccountDetailsByIdentity(String identityNumber);
    List<HanaOnePayCardDTO> getHanaCardDetailsByIdentity(String identityNumber);

    List<HanaOnePayhanaCardDTO> getOnlyHanaCardDetailsByIdentity(String identityNumber);

    // 하나 대표카드
    List<HanaOnePayhanaCardDTO> getMainHanaCardByIdentity(String identityNumber);

    List<HanaOnePayCardDTO> getRegisteredCards(String identityNumber);

    void insertCard(HanaOnePayCardDTO card);

    List<HanaOnePayCardDTO> getAllCards();


    // 이번달 하나카드 거래내역 조회
    List<HanaOnePayTransDTO> getThisMonthTransData(String cardNumber);

    // 이번달 사용금액
    int getThisMonthTotalAmount(String cardNumber);

}
