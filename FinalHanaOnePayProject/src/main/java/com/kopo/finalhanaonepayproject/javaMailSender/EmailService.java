package com.kopo.finalhanaonepayproject.javaMailSender;

public interface EmailService {

    void sendSimpleMessage(String to, String title, String message);
    void sendEmailWithAttachment(String to, String title, String message, String attachmentPath);
}
