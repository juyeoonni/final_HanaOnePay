package com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class HanaOnePayAccountDTO {
    private String accNumber;
    private String identityNumber;
    private String accName;
    private String accNickName;
    private int accPassword;
    private String accStatus;
    private int accBalance;
    private String accOpenDate;

}
