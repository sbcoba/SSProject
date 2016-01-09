package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vo.CommonCode;

@Controller
public class CommonCodeController {

    @RequestMapping(value = "/api/001000000/page", method = RequestMethod.GET)
    public void api001000000page(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        System.out.println("test...");
    }

    @RequestMapping(value = "/api/001000000/insert", method = RequestMethod.GET)
    @ResponseBody
    public void api001000000insert(@Valid CommonCode vo, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        System.out.println("test...");
    }
}
