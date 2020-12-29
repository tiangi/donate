package com.donate;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.donate.mapper")
public class DonateApplication {

    public static void main(String[] args) {
        SpringApplication.run(DonateApplication.class, args);
    }

}
