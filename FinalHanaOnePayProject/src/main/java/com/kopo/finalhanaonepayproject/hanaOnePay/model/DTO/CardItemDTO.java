package com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CardItemDTO {
    private String cardName;
    private String cardTypeCode;
    private String cardDesc;
    private int annualFee;
}
