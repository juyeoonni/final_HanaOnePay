package com.kopo.finalhanaonepayproject.customer.controller;


import com.kopo.finalhanaonepayproject.customer.model.DTO.CustomerDTO;
import com.kopo.finalhanaonepayproject.customer.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @Autowired
    ServletContext context;

    @GetMapping("/selectAllCustomer")
    public String selectAllCustomer(HttpServletRequest request) {
        List<CustomerDTO> list = customerService.selectAllCustomerList();

        for (CustomerDTO customer : list) {
            System.out.println(customer.getCustomerId());
            System.out.println(customer.getPassword());
            System.out.println(customer.getStatus());
            System.out.println(customer.getName());
            System.out.println(customer.getIdentityNumber());
            System.out.println(customer.getPhoneNumber());
            System.out.println(customer.getEmail());
            System.out.println(customer.getAddress());
            System.out.println(customer.getJoinDate());

            request.setAttribute("list", list);
        }

        return "customer/selectAllCustomer";
    }

    @GetMapping("/customer_login")
    public String customer_login() {
        return "customer/customer_login";
    }

    @GetMapping("/customer_join")
    public String customer_join() {
        return "customer/customer_join";
    }

    @GetMapping("/customer_myHana")
    public String customer_myHana() {
        return "customer/customer_myHana";
    }

    @PostMapping("/login-logic")
    public ResponseEntity<String> loginLogic(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
        CustomerDTO loginMember = customerService.login(loginData);
        HttpSession session = request.getSession();
        if (loginMember != null) {
            session.setAttribute("name", loginMember.getName());
            session.setAttribute("id", loginMember.getCustomerId());
            session.setAttribute("identityNumber", loginMember.getIdentityNumber());

            // Set data in application scope
           // context.setAttribute("identityNumber", loginMember.getIdentityNumber());

            // Debug: Session attributes
            System.out.println("Session ID in CustomerController: " + request.getSession().getId());

            // 콘솔에 세션에 저장된 값 출력
            System.out.println("세션에 저장된 이름: " + session.getAttribute("name"));
            System.out.println("세션에 저장된 ID: " + session.getAttribute("id"));
            System.out.println("세션에 저장된 주민등록번호: " + session.getAttribute("identityNumber"));

            return ResponseEntity.ok("로그인 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }


//    @RequestMapping(value = "/logout")
//    public ModelAndView deleteGuest(HttpSession session) {
//        String id = (String) session.getAttribute("id");
//        System.out.println(id);
//        ModelAndView mav = new ModelAndView();
//        session.invalidate();
//        mav.addObject("msg", "로그아웃 성공");
//        mav.addObject("loc", "../home");
//        mav.setViewName("message");
//        return mav;
//    }

    // @RequestMapping은 클라이언트의 요청 URL을 어떤 메서드가 처리할지를 맵핑하는 어노테이션
    // /customer_myPage라는 URL로 요청오면 myPage 메서드 실행
    // ModelAndView: Spring에서 데이터와 뷰를 동시에 설정할 수 있는 객체(즉, 컨트롤러에서 데이터를 설정하고 어떤 뷰(jsp)를 사용해서 응답할지 정할 수 있음

    @RequestMapping("/customer_myPage")
    public ModelAndView myPage(HttpSession session) {
        String id = (String) session.getAttribute("id");
        CustomerDTO customerInfo = customerService.selectIdOfCustomer(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("customer", customerInfo);
        mav.setViewName("customer/customer_myPage");
        return mav;
    }


    @RequestMapping("/customer_update")
    public ModelAndView customerUpdate(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        CustomerDTO customerInfo = customerService.selectIdOfCustomer(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("customer", customerInfo);
        mav.setViewName("customer/customer_update");
        return mav;

    }

    // 고객 정보 수정 ajax 요청 처리
    @PostMapping("/updateCustomer")
    @ResponseBody
    public String updateCustomer(@RequestBody CustomerDTO customer) {
        try {
            System.out.println("Received customerId: " + customer.getCustomerId());
            CustomerDTO updateCustomer = customerService.selectIdOfCustomer(customer.getCustomerId());
            updateCustomer.setPassword(customer.getPassword());
            updateCustomer.setName(customer.getName());
            updateCustomer.setPhoneNumber(customer.getPhoneNumber());
            updateCustomer.setEmail(customer.getEmail());
            updateCustomer.setAddress(customer.getAddress());

            customerService.updateCustomer(updateCustomer);
            return "고객 정보 수정 성공";
        } catch (Exception e) {
            e.printStackTrace();
            return "고객 정보 수정 실패";
        }
    }

}

