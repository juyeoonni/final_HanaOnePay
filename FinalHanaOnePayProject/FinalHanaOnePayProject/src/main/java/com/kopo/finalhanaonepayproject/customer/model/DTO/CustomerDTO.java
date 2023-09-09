package com.kopo.finalhanaonepayproject.customer.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CustomerDTO {
    private String customerId;
    private String password;
    private String status;
    private String name;
    private String identityNumber;
    private String phoneNumber;
    private String email;
    private String address;
    private String joinDate;


    // 기본생성자
    public CustomerDTO() {
    }
}
