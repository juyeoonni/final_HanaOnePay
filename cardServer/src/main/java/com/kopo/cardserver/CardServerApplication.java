package com.kopo.cardserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class CardServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CardServerApplication.class, args);
    }

}
