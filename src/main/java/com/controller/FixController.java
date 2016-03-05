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

import com.service.FixService;
import com.vo.FixInfo;
import com.vo.Page;
import com.vo.PagingPram;
import com.vo.SuccessReturn;

@Controller
public class FixController {
	
	@Resource
    FixService fixService;
	
    @RequestMapping(value = "/api/002000000/insert", method = RequestMethod.POST)
    public void api002000000insert(@Valid FixInfo vo, BindingResult result) {
    	
    	String newF_SEQ = fixService.createFixNo();
    	System.out.println(vo.getF_SEQ());
   		vo.setF_SEQ(newF_SEQ);
    	System.out.println(vo.getF_SEQ());
    	System.out.println(vo);
    	fixService.insert(vo);
    }	

    @RequestMapping(value = "/api/002000000/update", method = RequestMethod.POST)
    public void api002000000update(@Valid FixInfo vo, BindingResult result) {
    	fixService.update(vo);	
    }
    @ResponseBody
    @RequestMapping(value = "/api/002000000/delete", method = RequestMethod.POST)
    public SuccessReturn api002000000delete(@Param(value="f_SEQ") String f_SEQ) {
    	fixService.delete(f_SEQ);
    	//이유는 모르겠으나 resposeBody를 안붙이면 페이지 not found오류가 남.
    	//insert, update와 다르게 비동기식으로 동작할때 이런현상이 일어남. 삭제는 됨.
    	//어차피 저장하면 성공메세지나 오류메세지 뿌려주기 위해서 객체 하나 만듬(SuccessReturn)
    	return new SuccessReturn();
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/002000000/page", method = RequestMethod.GET)
    public Page<FixInfo> api002000000page(PagingPram pagingPram, HttpServletRequest request) {
    	pagingPram.setCondition(request);
    	return fixService.getPage(pagingPram);
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/002000001/page", method = RequestMethod.GET)
    public void api002000001page(PagingPram pagingPram, HttpServletRequest request) {
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/002000000/getFixInfo", method = RequestMethod.GET)
    public FixInfo api002000000getFixInfo(@Param(value="f_SEQ") String f_SEQ) {
    	   	FixInfo fix = fixService.getFixInfo(f_SEQ);    	
    	return fix;
    }
        
/*    @ResponseBody
    @RequestMapping(value = "/api/002000000/page")
    public HashMap<String, Object> api002000000page(@RequestParam("currPage") int currPage, @RequestParam("pageSize") int pageSize) {
    	
    	HashMap<String, Object> fm = new HashMap<String, Object>();
    	fm.put("items", fixService.getPage(currPage, pageSize));
    	fm.put("currPage", currPage);
    	fm.put("totalPages", fixService.getTotPage(pageSize));
    	System.out.println(fm);
    	return fm;	
    	
    }*/
    
    
}
