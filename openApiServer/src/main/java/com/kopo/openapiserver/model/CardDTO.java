package com.kopo.openapiserver.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
@Getter
@Setter
public class CardDTO {
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
