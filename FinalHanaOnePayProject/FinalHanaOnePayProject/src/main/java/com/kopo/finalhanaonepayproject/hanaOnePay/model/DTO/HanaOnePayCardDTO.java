package com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class HanaOnePayCardDTO {

    private String cardNumber;
    private String identityNumber;
    private String accNumber;
    private String cardName;
    private String validityPeriod;
    private String cardStatus;
    private String cvc;
    private String joinDate;
    private String cardCode;
    private String cardTypeCode;
    private int limit;

    // 기본생성자
    public HanaOnePayCardDTO() {
    }
}
