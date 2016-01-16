package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.EmpMapper;
import com.vo.EmpInfo;
import com.vo.Page;
import com.vo.PagingPram;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class EmpService extends EgovAbstractServiceImpl {

    @Resource
    EmpMapper empMapper;

    public void insert(EmpInfo vo) {
    	empMapper.insert(vo);
    }
    public String createEmpNo() {
    	return empMapper.createEmpNo();
    }
	public Page<EmpInfo> getPage(PagingPram pagingPram) {
		Page<EmpInfo> page = new Page<EmpInfo>();
		List<EmpInfo> list = empMapper.getPage(pagingPram);
		
		int count = empMapper.getTotPage();
		
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
		return empMapper.getTotPage();
	}
}