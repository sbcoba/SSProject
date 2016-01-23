package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.FixMapper;
import com.vo.FixInfo;
import com.vo.Page;
import com.vo.PagingPram;

@Service
public class FixService {
	
    @Resource
    FixMapper FixMapper;

    public void insert(FixInfo vo) {
    	FixMapper.insert(vo);
    }
	public void update(FixInfo vo) {
		FixMapper.update(vo);
	}
	public void delete(String f_SEQ) {
		FixMapper.delete(f_SEQ);
		
	}
    public String createFixNo() {
    	return FixMapper.createF_SEQ();
    }
	public Page<FixInfo> getPage(PagingPram pagingPram) {
		Page<FixInfo> page = new Page<FixInfo>();
		List<FixInfo> list = FixMapper.getPage(pagingPram);
		
		int count = FixMapper.getTotPage();
		
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
	public int getTotPage() {
		return FixMapper.getTotPage();
	}
	public FixInfo getFixInfo(String f_SEQ) {
		return FixMapper.getFixInfo(f_SEQ);
	}
		
//  public void insert(FixInfo vo) {
//	FixMapper.insert(vo);
//}
//public String createFixNo() {
//	return FixMapper.createF_SEQ();
//}
//public List<FixInfo> getPage(int currPage, int pageSize) {
//	return FixMapper.getPage(currPage, pageSize);
//}
//public int getTotPage(int pageSize) {
//	return FixMapper.getTotPage(pageSize);
//}
}
