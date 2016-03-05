package com.controller;

import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.FixStService;
import com.vo.Dhtmlx;
import com.vo.FixStInfo;

@Controller
public class FixStController {

	@Resource
	FixStService fixStService;

    @ResponseBody
    @RequestMapping(value = "/api/004000000/page", method = RequestMethod.GET)
    public Dhtmlx api004000000page(HttpServletRequest request) {
    	return fixStService.getPage();
    }
        
    @ResponseBody
    @RequestMapping(value = "/api/004000001/page", method = RequestMethod.GET)
    public Dhtmlx api004000001page(HttpServletRequest request) {
    	return fixStService.getTempPage();
    }
    
        @ResponseBody
    @RequestMapping(value = "/api/004000000/dhxfseq", method = RequestMethod.GET)
    public Dhtmlx api004000000dhxfseq(HttpServletRequest request) {
    	return fixStService.getFixPage();
    }    
    
    @ResponseBody
    @RequestMapping(value = "/api/004000000/dhtmlx", method = RequestMethod.POST)
    public String api004000000dhtmlx(HttpServletRequest request) {
    	/**
    	 * 1. 한글깨짐현상 (해결)
    	 * 2. act 완료 여부 확인 후 화면 새로 고침(grid reload)
    	 * 3. 처분,반납,이동 수치 nvl 0으로 보내도 안뿌려지는 현상
    	 * 4. 좀더 진보된 구조 알아보기
    	 */
    	Map<String, String> cond = new HashMap<String, String>();
    	
    	@SuppressWarnings("rawtypes")
    	Enumeration paramNames = request.getParameterNames();
    	while(paramNames.hasMoreElements()){
			String name = (String) paramNames.nextElement();
			cond.put(name,  request.getParameter(name));
		}   	
    	    	
    	FixStInfo vo = new FixStInfo();
    	
    	vo.setFjSeq(cond.get("c1"));
		vo.setfSeq(cond.get("c2"));
		vo.setFjGetDt(cond.get("c3"));
		vo.setFjPutDt(cond.get("c4"));	
		vo.setFjMdNo(cond.get("c5"));
		vo.setFjMkNo(cond.get("c6"));		
		vo.setFjSize(cond.get("c7"));
		vo.setFjMkCom(cond.get("c8"));
		vo.setFjBuyItem(cond.get("c9"));					
		vo.setFjUse(cond.get("c10"));
		vo.setFjCnt(Integer.parseInt(cond.get("c11").equals("") ? "0" : cond.get("c11")));
		vo.setFjUnitAmt(Integer.parseInt(cond.get("c12").equals("") ? "0" : cond.get("c12")));	
		vo.setFjTotAmt(Integer.parseInt(cond.get("c13").equals("") ? "0" : cond.get("c13")));			
		vo.setFjSeqSt(Integer.parseInt(cond.get("c14").equals("") ? "0" : cond.get("c14")));	
		vo.setFjSeqEd(Integer.parseInt(cond.get("c15").equals("") ? "0" : cond.get("c15")));	
		vo.setRemark(cond.get("c16"));
		
    	System.out.println(cond);
    	System.out.println(vo.toString());
    	
    	String msg = "";
    	try{
	    	if(cond.get("!nativeeditor_status").equals("inserted"))
	    	{	  	  		        	
	        	fixStService.insert(vo);	        	
	    	}
	    	else if(cond.get("!nativeeditor_status").equals("updated"))
	    	{
	    		fixStService.update(vo);
	    	}
	    	else if(cond.get("!nativeeditor_status").equals("deleted"))
	    	{
	    		fixStService.delete(vo);
	    	}		
	    	msg = "{\"status\":\"ok\"}";
    	} catch (Exception e) {
    		msg = "{\"action\":\"error\", \"rid\":\""+cond.get("gr_id")+"\"}";
	    }    	
    	return msg;
    }
}
