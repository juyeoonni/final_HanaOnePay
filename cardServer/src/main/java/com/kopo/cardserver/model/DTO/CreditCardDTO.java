package com.kopo.cardserver.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CreditCardDTO {
    private String cardNumber;
    private String accNumber;
    private String cardName;
    private String validityPeriod;
    private String cardStatus;
    private String cvc;
    private String joinDate;
    private String cardCode;
    private String cardTypeCode;
    private int limit;
}
