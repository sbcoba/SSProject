package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.FixstMapper;
import com.vo.FixstInfo;
import com.vo.Page;
import com.vo.PagingPram;

@Service
public class FixstService {
	
    @Resource
    FixstMapper FixstMapper;

    public void insert(FixstInfo vo) {
    	FixstMapper.insert(vo);
    }
	public void update(FixstInfo vo) {
		FixstMapper.update(vo);
	}
	public void delete(String f_SEQ) {
		FixstMapper.delete(f_SEQ);
		
	}
	
    public String createFixNo() {
    	return FixstMapper.createF_SEQ();
    }
    
	public Page<FixstInfo> getPage(PagingPram pagingPram) {
		Page<FixstInfo> page = new Page<FixstInfo>();
		List<FixstInfo> list = FixstMapper.getPage(pagingPram);
		
		int count = FixstMapper.getTotPage();
		
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
	
	public List<FixstInfo> getPagej() {		
		return FixstMapper.getPagej();
	}
		
	public int getTotPage() {
		return FixstMapper.getTotPage();
	}
	public FixstInfo getFixstInfo(String f_SEQ) {
		return FixstMapper.getFixInfo(f_SEQ);
	}
		
//  public void insert(FixstInfo vo) {
//	FixstMapper.insert(vo);
//}
//public String createFixNo() {
//	return FixstMapper.createF_SEQ();
//}
//public List<FixstInfo> getPage(int currPage, int pageSize) {
//	return FixstMapper.getPage(currPage, pageSize);
//}
//public int getTotPage(int pageSize) {
//	return FixstMapper.getTotPage(pageSize);
//}
}
