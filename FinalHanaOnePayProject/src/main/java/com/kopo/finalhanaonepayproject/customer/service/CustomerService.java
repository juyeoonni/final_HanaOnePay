package com.kopo.finalhanaonepayproject.customer.service;


import com.kopo.finalhanaonepayproject.customer.model.DAO.CustomerDAO;
import com.kopo.finalhanaonepayproject.customer.model.DTO.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerService {
    @Autowired
    CustomerDAO customerDAO;

    public List<CustomerDTO> selectAllCustomerList(){
        return customerDAO.selectAllCustomerList();
    }
    public CustomerDTO login(HashMap<String, String> loginData) {
        return customerDAO.login(loginData);
    }

    public CustomerDTO selectIdOfCustomer(String id){
        return customerDAO.selectIdOfCustomer(id);
    }

    public void updateCustomer(CustomerDTO customer) {
        customerDAO.updateCustomer(customer);
    }
}

