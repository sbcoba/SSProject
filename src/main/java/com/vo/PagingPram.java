package com.vo;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PagingPram {
	private int page;
	private int limit;
	private int start;
	private int end;
	private Map<String, String> cond = new HashMap<String, String>();
	
	public void setCondition(HttpServletRequest request)
	{
		@SuppressWarnings("rawtypes")
		Enumeration paramNames = request.getParameterNames();
		
		while(paramNames.hasMoreElements()){
			String name = (String) paramNames.nextElement();
			if(!name.equals("page") && !name.equals("limit"))
			{
				cond.put(name,  request.getParameter(name));
			}
		}
		setLimit(limit == 0 ? 20 : limit);
		setStart((page-1) * limit + 1);
		setEnd(page*limit);
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public Map<String, String> getCond()
	{
		return cond;
	}
	
	
	
	
	
	
	
	
	
	
	
}
