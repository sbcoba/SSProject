package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value = "/content/{menuId}/{act}", method = RequestMethod.GET)
    public String main(@PathVariable("menuId") String menuId, @PathVariable("act") String act, HttpServletRequest request, HttpSession session, Model model) throws Exception {
        return "MAIN/" + menuId + "/" + act;
    }
}
