package com.controller;

import javax.annotation.Resource;
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

import com.service.CommonCodeService;
import com.vo.CommonCode;
import com.vo.Page;
import com.vo.PagingPram;

@Controller
public class CommonCodeController {

    @Resource
    CommonCodeService commonCodeService;

    @RequestMapping(value = "/api/001000000/insert")
    public void api001000000insert(@Valid CommonCode vo, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        commonCodeService.insert(vo);
    }
    
    @RequestMapping(value = "/api/001000000/page", method = RequestMethod.GET)
    @ResponseBody
    public Page<CommonCode> api001000000page(PagingPram pagingParam, HttpServletRequest request) {
        pagingParam.setCondition(request); // {page=1, limit=10, _=1452952204387}
        return commonCodeService.getPage(pagingParam);
    }
}
