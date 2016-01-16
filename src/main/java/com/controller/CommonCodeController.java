package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.CommonCodeService;
import com.vo.CommonCode;

@Controller
public class CommonCodeController {

    @Resource
    CommonCodeService commonCodeService;

    @RequestMapping(value = "/api/001000000/page")
    @ResponseBody
    public Map<String, List<CommonCode>> api001000000page(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        Map<String, List<CommonCode>> map = new HashMap<String, List<CommonCode>>();
        List<CommonCode> list = commonCodeService.page();
        map.put("items", list); //무조건 items...왜...

        return map;
    }

    @RequestMapping(value = "/api/001000000/insert")
    public void api001000000insert(@Valid CommonCode vo, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        commonCodeService.insert(vo);
    }
}
