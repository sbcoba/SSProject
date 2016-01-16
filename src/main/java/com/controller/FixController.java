package com.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.FixService;
import com.vo.FixInfo;

@Controller
public class FixController {
	
/*	@Resource
    EmpService empService;
    @RequestMapping(value = "/api/002000000/insert", method = RequestMethod.POST)
    public void api002000000insert(@Valid EmpInfo vo, BindingResult result) {
    	
    	String newEmpNo = empService.createEmpNo();
    	if(vo.geteId().isEmpty())
    	{
    		vo.seteId(newEmpNo);
    	}
    	vo.setePw("0000");
    	empService.insert(vo);	
    	
    	*}
    	*    	*/	  
		@Resource
    FixService fixService;
    @RequestMapping(value = "/api/002000000/insert", method = RequestMethod.POST)
    public void api002000000insert(@Valid FixInfo vo, BindingResult result) {
    	
    	String newF_SEQ = fixService.createFixNo();
    	
    	System.out.println(vo.getF_SEQ());
    	
//    	if(vo.getF_SEQ().isEmpty())
//    	{
    		vo.setF_SEQ(newF_SEQ);
//    	}
    	
    	System.out.println(vo.getF_SEQ());
    	System.out.println(vo);
    	fixService.insert(vo);		
    	
    }
	
    @ResponseBody
    @RequestMapping(value = "/api/002000000/page")
    public HashMap<String, Object> api002000000page(@RequestParam("currPage") int currPage, @RequestParam("pageSize") int pageSize) {
    	
/*    	HashMap<String, Object> hm = new HashMap<String, Object>();
    	hm.put("items", empService.getPage(currPage, pageSize));
    	hm.put("currPage", currPage);
    	hm.put("totalPages", empService.getTotPage(pageSize));;
    	
    	return hm;*/
    	    	
    	HashMap<String, Object> fm = new HashMap<String, Object>();
    	fm.put("items", fixService.getPage(currPage, pageSize));
    	fm.put("currPage", currPage);
    	fm.put("totalPages", fixService.getTotPage(pageSize));
    	System.out.println(fm);
    	return fm;	
    	
    }
}
