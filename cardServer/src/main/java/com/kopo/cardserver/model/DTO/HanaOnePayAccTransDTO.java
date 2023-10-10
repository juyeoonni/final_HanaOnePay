package com.kopo.cardserver.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class HanaOnePayAccTransDTO {
    private String payId;
    private String accNumber;
    private String payDate;
    private int payAmount;
    private String businessCode;
    private String businessMall;
    private String payStatus;
    private String payType;
}
