package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonCodeController {

    @RequestMapping(value = "/api/001000000/page", method = RequestMethod.GET)
    public void api001000000page(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        System.out.println("test...");
    }
}
