package com.kopo.cardserver.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Data
@Getter
@Setter
public class AccPaymentLogDTO {
    private String payId;
    private String accNumber;
    private String payDate;
    private BigDecimal payAmount;
    private String businessCode;
    private String businessMall;
    private String payStatus;
    private String payType;
}
