package com.xinxing;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@MapperScan("com.xinxing.*.mapper")
public class XinXingApplication {

    public static void main(String[] args) {
        SpringApplication.run(XinXingApplication.class, args);
        System.out.println("新星启动成功!!");
    }
}
