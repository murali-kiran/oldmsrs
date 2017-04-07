package com.mrs.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mrs.user.model.User;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@RequestMapping(method = RequestMethod.GET, value = "/createUser")
    public String createUser(Model model) {
        model.addAttribute("user", new User());
        return "index";
    }
}
