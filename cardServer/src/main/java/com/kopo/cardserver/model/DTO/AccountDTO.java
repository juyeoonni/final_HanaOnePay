package com.kopo.cardserver.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AccountDTO {
    private String accNumber;
    private String identityNumber;
    private String accName;
    private String accNickName;
    private String accPassword;
    private String accStatus;
    private String accBalance;
    private String accOpenDate;
}
