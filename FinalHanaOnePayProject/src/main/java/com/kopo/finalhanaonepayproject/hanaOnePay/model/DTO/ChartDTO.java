package com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
@Getter
@Setter
public class ChartDTO {
    private String businessCode;    // 상호명
    private int payAmount;          // 결제금액
}