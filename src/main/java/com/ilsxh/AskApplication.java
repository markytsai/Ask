package com.ilsxh;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ilsxh.dao")
public class AskApplication {

    public static void main(String[] args) {
        SpringApplication.run(AskApplication.class, args);
    }

}
