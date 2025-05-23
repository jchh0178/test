package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {

    @GetMapping("/main")
    public String main() {
        return "main/main"; // → /WEB-INF/views/main/main.jsp
    }
}
