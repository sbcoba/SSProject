package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.EmpService;
import com.vo.EmpInfo;
import com.vo.Page;
import com.vo.PagingPram;

@Controller
public class EmpController {

	@Resource
    EmpService empService;
	
    @RequestMapping(value = "/api/003000000/insert", method = RequestMethod.POST)
    public void api003000000insert(@Valid EmpInfo vo, BindingResult result) {
    	
    	String newEmpNo = empService.createEmpNo();
    	if(vo.geteId().isEmpty())
    	{
    		vo.seteId(newEmpNo);
    	}
    	vo.setePw("0000");
    	empService.insert(vo);	
   }
    
    @ResponseBody
    @RequestMapping(value = "/api/003000000/page", method = RequestMethod.GET)
    public Page<EmpInfo> api003000000page(PagingPram pagingPram, HttpServletRequest request) {
    	pagingPram.setCondition(request);
    	return empService.getPage(pagingPram);
    }

}
