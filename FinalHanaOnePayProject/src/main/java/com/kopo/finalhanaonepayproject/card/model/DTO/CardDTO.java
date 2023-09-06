package com.kopo.finalhanaonepayproject.card.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CardDTO {
    private String cardNumber;      // 카드번호
    private String cardId;          // 카드id
    private String cardName;        // 카드명
    private String accNumber;       // 계좌번호
    private String bankCode;        // 은행코드
    private String validityPeriod;  // 유효기간
    private String joinDate;        // 발급일자
    private String cardStatus;      // 카드상태
    private String cardImg;         // 카드이미지
    
    public CardDTO() {

    }

}
