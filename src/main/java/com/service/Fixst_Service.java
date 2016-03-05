package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.Fixst_Mapper;
import com.vo.Fixst_Info;
import com.vo.Page;
import com.vo.PagingPram;

@Service
public class Fixst_Service {
	
    @Resource
    Fixst_Mapper Fixst_Mapper;

    public void insert(Fixst_Info vo) {
    	Fixst_Mapper.insert(vo);
    }
	public void update(Fixst_Info vo) {
		Fixst_Mapper.update(vo);
	}
	public void delete(String f_SEQ) {
		Fixst_Mapper.delete(f_SEQ);
	}
	
    public String createFixNo() {
    	return Fixst_Mapper.createF_SEQ();
    }
    
	public Page<Fixst_Info> getPage(PagingPram pagingPram) {
		Page<Fixst_Info> page = new Page<Fixst_Info>();
		
		List<Fixst_Info> list = Fixst_Mapper.getPage(pagingPram);
		
		int count = Fixst_Mapper.getTotPage();
		
		if(count < pagingPram.getLimit())
		{
			pagingPram.setLimit(count);
		}
		
		page.setItems(list);
		page.setTotalPages((int)Math.ceil(count/(double)pagingPram.getLimit()));
		page.setCurrPage(pagingPram.getPage());
		page.setCount(count);
		return page;
	}	
	
	public List<Fixst_Info> getPagej() {		
		return Fixst_Mapper.getPagej();
	}
		
	public int getTotPage() {
		return Fixst_Mapper.getTotPage();
	}
	public Fixst_Info getFixstInfo(String f_SEQ) {
		return Fixst_Mapper.getFixst_Info(f_SEQ);
	}
		
	
	
	
	
//  public void insert(FixstInfo vo) {
//	Fixst_Mapper.insert(vo);
//}
//public String createFixNo() {
//	return Fixst_Mapper.createF_SEQ();
//}
//public List<FixstInfo> getPage(int currPage, int pageSize) {
//	return Fixst_Mapper.getPage(currPage, pageSize);
//}
//public int getTotPage(int pageSize) {
//	return Fixst_Mapper.getTotPage(pageSize);
//}
}
