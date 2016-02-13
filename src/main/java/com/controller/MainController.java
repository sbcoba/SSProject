package com.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.EmpService;
import com.service.MainService;

@Controller
public class MainController {

	@Resource
    MainService mainService;
	
    @RequestMapping(value = "/content/{menuId}/{act}")
    public String main(@PathVariable("menuId") String menuId, @PathVariable("act") String act, HttpServletRequest request, HttpSession session, Model model) throws Exception {
        return "MAIN/" + menuId + "/" + act;
    }

    @RequestMapping(value = "/loginForm")
    public String loginForm(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
        return "/loginForm";
    }
    
    @ResponseBody
    @RequestMapping(value = "/com/api/selectizeOptions", method = RequestMethod.GET)
    public List<Map<String, String>> getOptions(@RequestParam("cdTp") String cdTp) {
    	return mainService.getOptions(cdTp);
    }
}
