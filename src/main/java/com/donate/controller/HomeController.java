package com.donate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 *
 * </p>
 *
 * @author lei.zang
 * @date 2020-12-29 16:18
 */
@Controller
public class HomeController {

    @GetMapping("/index")
    public String home(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("index.");
        return "index";
    }
}
