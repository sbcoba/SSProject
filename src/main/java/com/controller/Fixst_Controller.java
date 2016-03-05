package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.Fixst_Service;
import com.vo.Fixst_Info;
import com.vo.Page;
import com.vo.PagingPram;
import com.vo.SuccessReturn;

//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;

@Controller
public class Fixst_Controller {
	

	@Resource
    Fixst_Service fixst_Service;
	
    @RequestMapping(value = "/api/002000002/insert", method = RequestMethod.POST)
    public void api002000002insert(@Valid Fixst_Info vo, BindingResult result) {
    	
    	String newF_SEQ = fixst_Service.createFixNo();    	
    	System.out.println(vo.getF_SEQ());
   		vo.setF_SEQ(newF_SEQ);    	
    	System.out.println(vo.getF_SEQ());
    	System.out.println(vo);
    	
    	fixst_Service.insert(vo);		    	
    }	

    @RequestMapping(value = "/api/002000002/update", method = RequestMethod.POST)
    public void api002000002update(@Valid Fixst_Info vo, BindingResult result) {
    	fixst_Service.update(vo);	
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/002000002/delete", method = RequestMethod.POST)
    public SuccessReturn api002000002delete(@Param(value="f_SEQ") String f_SEQ) {
    	fixst_Service.delete(f_SEQ);
    	//이유는 모르겠으나 resposeBody를 안붙이면 페이지 not found오류가 남.
    	//insert, update와 다르게 비동기식으로 동작할때 이런현상이 일어남. 삭제는 됨.
    	//어차피 저장하면 성공메세지나 오류메세지 뿌려주기 위해서 객체 하나 만듬(SuccessReturn)
    	return new SuccessReturn();
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/002000002/page", method = RequestMethod.GET)
    public Page<Fixst_Info> api002000002page(PagingPram pagingPram, HttpServletRequest request) {
    	pagingPram.setCondition(request);
    	return fixst_Service.getPage(pagingPram);    	
    }
    
    @ResponseBody
    @RequestMapping(value = "/api/002000002/getFixInfo", method = RequestMethod.GET)
    public Fixst_Info api002000002getFixInfo(@Param(value="f_SEQ") String f_SEQ) {
    	   	Fixst_Info fix = fixst_Service.getFixstInfo(f_SEQ);    	
    	return fix;
    }    
    
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/api/002000002/url", method=RequestMethod.POST, consumes="application/json")
    public @ResponseBody void getTestMap(@RequestBody Map<String, Object> param) throws Exception{

    	List<Fixst_Info> page_list = fixst_Service.getPagej();    	   	
    	List<Object>  page_al     = new ArrayList<Object>();    	    	
    	
  //  	JSONObject jsonObject = new JSONObject();
 //   	@SuppressWarnings("unused")
	//	JSONArray jsonArray = new JSONArray();
    	    	
    	//for(Fixst_Info fm : page_list) {
    	for(Fixst_Info fm : page_list) {
    		page_al.add(fm.getF_SEQ());
    		page_al.add(fm.getF_NM());
    		page_al.add(fm.getF_KIND());
    		page_al.add(fm.getF_UNIT());
    		page_al.add(fm.getF_YEAR());    	
    		
  //  		JSONObject obj = new JSONObject();
    		
    	/*	obj.put("F_SEQ", fm.getF_SEQ());
    		obj.put("F_NM", fm.getF_NM());
    		obj.put("F_KIND", fm.getF_KIND());
    		obj.put("F_UNIT", fm.getF_UNIT());
    		obj.put("F_YEAR", fm.getF_YEAR());   		    		
    	
    		jsonArray.add(obj);    		
    		System.out.println(fm.getF_NM());    		
    	*/
    	}
    	
    //	jsonObject.put("rows", jsonArray);    	
   // 	System.out.print(jsonObject);	
    	
    	}
    	
  //  	jsonObject.put("rows", jsonArray);    	
   // 	System.out.print(jsonObject);
    	
    	//String data = jsonObject.toString();
    	//System.out.print(data);
   	
    	    	
    	
    	//for(Fixst_Info fstm : page_list)   {
    	//	page_al.add(page_list.)
    	//}
    	
    	//JSONObject jsonObject = new JSONObject();
    	//JSONArray jsonArray = new JSONArray();
    	//jsonArray =  (JSONArray) page_list;
    	//jsonObject.put("resultList", jsonArray);
    	//System.out.println(jsonArray);      
    	
    	//JSONObject  jobj = fixst_Service.getPagej();
    	//System.out.println(jobj);  
    
    	//JSONArray jsonArray = new JSONArray(); 
    	//JSONArray.fromObject( list );      	
    	//JSONObject  jobj =(JSONObject) fixst_Service.getPagej();    	
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
    @RequestMapping(value = "/api/002000002/page")
    public HashMap<String, Object> api002000002page(@RequestParam("currPage") int currPage, @RequestParam("pageSize") int pageSize) {
    	
    	HashMap<String, Object> fm = new HashMap<String, Object>();
    	fm.put("items", fixst_Service.getPage(currPage, pageSize));
    	fm.put("currPage", currPage);
    	fm.put("totalPages", fixst_Service.getTotPage(pageSize));
    	System.out.println(fm);
    	return fm;	
    	
    }*/
    
    

