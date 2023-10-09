package com.kopo.cardserver.JavaMailSender;

import lombok.Data;

@Data
public class EmailDTO {
    private String to;
    private String title;
    private String message;

    @Override
    public String toString() {
        return "Email{" +
                "to='" + to + '\'' +
                ", title='" + title + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
