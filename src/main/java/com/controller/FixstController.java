package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.FixstService;
import com.vo.FixstInfo;
import com.vo.Page;
import com.vo.PagingPram;
import com.vo.SuccessReturn;

@Controller
public class FixstController {
	
	@Resource
    FixstService FixstService;
	
    @RequestMapping(value = "/api/004000000/insert", method = RequestMethod.POST)
    public void api004000000insert(@Valid FixstInfo vo, BindingResult result) {
    	
    	String newF_SEQ = FixstService.createFixNo();    	
    	System.out.println(vo.getF_SEQ());
   		vo.setF_SEQ(newF_SEQ);    	
    	System.out.println(vo.getF_SEQ());
    	System.out.println(vo);
    	FixstService.insert(vo);		    	
    }	

    @RequestMapping(value = "/api/004000000/update", method = RequestMethod.POST)
    public void api004000000update(@Valid FixstInfo vo, BindingResult result) {
    	FixstService.update(vo);	
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/004000000/delete", method = RequestMethod.POST)
    public SuccessReturn api004000000delete(@Param(value="f_SEQ") String f_SEQ) {
    	FixstService.delete(f_SEQ);
    	//이유는 모르겠으나 resposeBody를 안붙이면 페이지 not found오류가 남.
    	//insert, update와 다르게 비동기식으로 동작할때 이런현상이 일어남. 삭제는 됨.
    	//어차피 저장하면 성공메세지나 오류메세지 뿌려주기 위해서 객체 하나 만듬(SuccessReturn)
    	return new SuccessReturn();
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/004000000/page", method = RequestMethod.GET)
    public Page<FixstInfo> api004000000page(PagingPram pagingPram, HttpServletRequest request) {
    	pagingPram.setCondition(request);
    	return FixstService.getPage(pagingPram);    	
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/004000000/getFixInfo", method = RequestMethod.GET)
    public FixstInfo api004000000getFixInfo(@Param(value="f_SEQ") String f_SEQ) {
    	   	FixstInfo fix = FixstService.getFixstInfo(f_SEQ);    	
    	return fix;
    }    
    
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/api/004000000/url", method=RequestMethod.POST, consumes="application/json")
    public @ResponseBody void getTestMap(@RequestBody Map<String, Object> param) throws Exception{

    	List<FixstInfo> page_list = FixstService.getPagej();    	   	
    	List<Object>  page_al     = new ArrayList<Object>();    	    	
    	
    	JSONObject jsonObject = new JSONObject();
    	@SuppressWarnings("unused")
		JSONArray jsonArray = new JSONArray();
    	    	
    	//for(FixstInfo fm : page_list) {
    	for(FixstInfo fm : page_list) {
    		page_al.add(fm.getF_SEQ());
    		page_al.add(fm.getF_NM());
    		page_al.add(fm.getF_KIND());
    		page_al.add(fm.getF_UNIT());
    		page_al.add(fm.getF_YEAR());    	
    		
    		JSONObject obj = new JSONObject();
    		
    		obj.put("F_SEQ", fm.getF_SEQ());
    		obj.put("F_NM", fm.getF_NM());
    		obj.put("F_KIND", fm.getF_KIND());
    		obj.put("F_UNIT", fm.getF_UNIT());
    		obj.put("F_YEAR", fm.getF_YEAR());   		    		
    	
    		jsonArray.add(obj);    		
    		System.out.println(fm.getF_NM());    		
    	
    	}
    	
    	jsonObject.put("rows", jsonArray);    	
    	System.out.print(jsonObject);
    	
    	//String data = jsonObject.toString();
    	//System.out.print(data);
   	
    	    	
    	
    	//for(FixstInfo fstm : page_list)   {
    	//	page_al.add(page_list.)
    	//}
    	
    	//JSONObject jsonObject = new JSONObject();
    	//JSONArray jsonArray = new JSONArray();
    	//jsonArray =  (JSONArray) page_list;
    	//jsonObject.put("resultList", jsonArray);
    	//System.out.println(jsonArray);      
    	
    	//JSONObject  jobj = FixstService.getPagej();
    	//System.out.println(jobj);  
    
    	//JSONArray jsonArray = new JSONArray(); 
    	//JSONArray.fromObject( list );      	
    	//JSONObject  jobj =(JSONObject) FixstService.getPagej();    	
    	//System.out.println(jsonArray);    	
    	//System.out.println(jsonArray);    	
    	//return jsonArray;
    	}
    
/*  spring에서 JSON.stringify로 만든 배열을 Map으로 받기.  Programing   

      Jsp. ->
      var params = {'test1'   : test1, 'test2'   : test, ....};
      $.ajax({
      url: '/url.do', 
      type: 'POST',
      data: JSON.stringify(params),  
      dataType: 'json', 
      timeout: 2000, 
      async:false, 
      contentType: "application/json", 
      errorMsg: "데이터 조회시 오류발생.",
      success:function(jsonObj){
      console.log(jsonObj); 
      }
      });

    controller. ->
    @RequestMapping(value="url.do",method=RequestMethod.POST, consumes="application/json")
    public @ResponseBody JSONObject getTestMap(@RequestBody Map<String, Object> param) throws Exception{
    JSONObject  jobj =  testService.getTestList(param);
    return jobj;
    }

    @ResponseBody
    @RequestMapping(value = "/api/004000000/page")
    public HashMap<String, Object> api004000000page(@RequestParam("currPage") int currPage, @RequestParam("pageSize") int pageSize) {
    	
    	HashMap<String, Object> fm = new HashMap<String, Object>();
    	fm.put("items", FixstService.getPage(currPage, pageSize));
    	fm.put("currPage", currPage);
    	fm.put("totalPages", FixstService.getTotPage(pageSize));
    	System.out.println(fm);
    	return fm;	
    	
    }*/
    
    
}
