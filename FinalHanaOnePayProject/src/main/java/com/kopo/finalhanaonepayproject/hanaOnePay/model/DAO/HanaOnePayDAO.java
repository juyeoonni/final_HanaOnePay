package com.kopo.finalhanaonepayproject.hanaOnePay.model.DAO;

import com.kopo.finalhanaonepayproject.hanaOnePay.model.DTO.HanaOnePayCardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HanaOnePayDAO {
    void insertCard(HanaOnePayCardDTO card);

}
