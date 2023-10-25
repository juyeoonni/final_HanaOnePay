package com.kopo.finalhanaonepayproject.javaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSenderImpl javaMailSender;

    @Override
    public void sendSimpleMessage(String to, String title, String message) {
        SimpleMailMessage emailInfo = new SimpleMailMessage();
        emailInfo.setTo(to);
        emailInfo.setSubject(title);
        emailInfo.setText(message);
        javaMailSender.send(emailInfo);
    }

    @Override
    public void sendEmailWithAttachment(String to, String title, String message, String attachmentPath) {
        try {
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

            helper.setTo(to);
            helper.setSubject(title);
            helper.setText(message);

            ClassPathResource resource = new ClassPathResource(attachmentPath);
            helper.addAttachment(resource.getFilename(), resource);

            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

