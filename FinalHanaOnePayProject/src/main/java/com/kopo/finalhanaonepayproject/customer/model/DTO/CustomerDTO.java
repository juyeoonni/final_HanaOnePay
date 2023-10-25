package com.kopo.finalhanaonepayproject.customer.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CustomerDTO {
    private String identityNumber;
    private String customerId;
    private String password;
    private String status;
    private String name;
    private String phoneNumber;
    private String email;
    private String address;
    private String joinDate;
    private int payPw;

    public CustomerDTO() {
    }
}
