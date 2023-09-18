package com.kopo.cardserver.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class PendingPaymentDTO {
    private String pendingId;
    private String cardNumber;
    private String payAmount;
    private String withdrawalDate;
    private String payStatus;
}
