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

import com.service.FixMvService;
import com.vo.Dhtmlx;
import com.vo.FixMvInfo;

@Controller
public class FixMvController {

	@Resource
	FixMvService fixMvService;

    @ResponseBody
    @RequestMapping(value = "/api/005000000/page", method = RequestMethod.GET)
    public Dhtmlx api005000000page(HttpServletRequest request) {
    	return fixMvService.getPage();
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/005000001/page", method = RequestMethod.GET)
    public Dhtmlx api005000001page(HttpServletRequest request) {
    	return fixMvService.getTempPage();
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/005000000/dhtmlx", method = RequestMethod.POST)
    public String api005000000dhtmlx(HttpServletRequest request) {
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
    	
    	FixMvInfo vo = new FixMvInfo();
    	
    	vo.setFjSeq(cond.get("c1"));
		vo.setfSeq(cond.get("c2"));
		vo.setFbPutDt(cond.get("c3"));
		vo.setFbDept(cond.get("c4"));
		vo.setFbSeqSt(Integer.parseInt(cond.get("c5").equals("") ? "0" : cond.get("c5")));
		vo.setFbSeqEd(Integer.parseInt(cond.get("c6").equals("") ? "0" : cond.get("c6")));
		vo.setFbCnt(Integer.parseInt(cond.get("c7").equals("") ? "0" : cond.get("c7")));
		vo.seteNo(cond.get("c8"));
		vo.setFbLoc1(cond.get("c10"));
		vo.setFbLoc3(cond.get("c11"));
		vo.setFbLoc4(cond.get("c12"));
		vo.setFbRpCnt(Integer.parseInt(cond.get("c13").equals("") ? "0" : cond.get("c13")));
		vo.setFbRtCnt(Integer.parseInt(cond.get("c14").equals("") ? "0" : cond.get("c14")));
		vo.setFbMvCnt(Integer.parseInt(cond.get("c15").equals("") ? "0" : cond.get("c15")));
		
    	System.out.println(cond);
    	System.out.println(vo.toString());
    	String msg = "";
    	try{
	    	if(cond.get("!nativeeditor_status").equals("inserted"))
	    	{
	    		fixMvService.insert(vo);
	    	}
	    	else if(cond.get("!nativeeditor_status").equals("updated"))
	    	{
	    		fixMvService.update(vo);
	    	}
	    	else if(cond.get("!nativeeditor_status").equals("deleted"))
	    	{
	    		fixMvService.delete(vo);
	    	}		
	    	msg = "{\"status\":\"ok\"}";
    	} catch (Exception e) {
    		msg = "{\"action\":\"error\", \"rid\":\""+cond.get("gr_id")+"\"}";
	    }
    	
    	return msg;
    }
}
