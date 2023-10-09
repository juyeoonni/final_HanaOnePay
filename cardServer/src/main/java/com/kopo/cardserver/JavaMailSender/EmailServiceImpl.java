package com.kopo.cardserver.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSenderImpl javaMailSender;

    public void sendSimpleMessage(String to, String title, String message){
        SimpleMailMessage emailInfo = new SimpleMailMessage();
        emailInfo.setTo(to);
        emailInfo.setSubject(title);
        emailInfo.setText(message);
        javaMailSender.send(emailInfo);
    }
}
