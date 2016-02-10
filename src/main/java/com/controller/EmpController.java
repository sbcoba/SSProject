package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.EmpService;
import com.vo.Dhtmlx;
import com.vo.EmpInfo;
import com.vo.Page;
import com.vo.PagingPram;
import com.vo.SuccessReturn;

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
    @RequestMapping(value = "/api/003000000/update", method = RequestMethod.POST)
    public void api003000000update(@Valid EmpInfo vo, BindingResult result) {
    	empService.update(vo);	
    }
    @ResponseBody
    @RequestMapping(value = "/api/003000000/delete", method = RequestMethod.POST)
    public SuccessReturn api003000000delete(@Param(value="eNo") String eNo) {
    	empService.delete(eNo);
    	//이유는 모르겠으나 resposeBody를 안붙이면 페이지 not found오류가 남.
    	//insert, update와 다르게 비동기식으로 동작할때 이런현상이 일어남. 삭제는 됨.
    	//어차피 저장하면 성공메세지나 오류메세지 뿌려주기 위해서 객체 하나 만듬(SuccessReturn)
    	return new SuccessReturn();
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/003000000/page", method = RequestMethod.GET)
    public Page<EmpInfo> api003000000page(PagingPram pagingPram, HttpServletRequest request) {
    	pagingPram.setCondition(request);
    	return empService.getPage(pagingPram);
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/003000000/getEmpInfo", method = RequestMethod.GET)
    public EmpInfo api003000000getEmpInfo(@Param(value="eNo") String eNo) {
    	EmpInfo emp = empService.getEmpInfo(eNo);
    	return emp;
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/003000000/dhxEmp", method = RequestMethod.GET)
    public Dhtmlx api003000000dhxEmp(HttpServletRequest request) {
    	return empService.dhxEmp();
    }

}
