package com.itwillbs.revue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginController {

	@RequestMapping("/login")
    public String login() {
        return "login/login";  
    }
	
	@RequestMapping("/idfound")
    public String idfound() {
        return "login/idFound";  
    }
	
	@RequestMapping("/pwfound")
    public String passfound() {
        return "login/passFound"; 
	}
	
	@RequestMapping("/register")
    public String register() {
        return "login/register";  
    }
	
}
