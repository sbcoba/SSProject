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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.CommonCodeService;
import com.service.EmpService;
import com.vo.EmpInfo;

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

}
