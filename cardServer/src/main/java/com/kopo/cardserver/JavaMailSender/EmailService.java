package com.kopo.cardserver.JavaMailSender;

public interface EmailService {

    void sendSimpleMessage(String to, String title, String message);

}