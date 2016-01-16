package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.FixMapper;

import com.vo.FixInfo;

@Service
public class FixService {
	
    @Resource
    FixMapper FixMapper;

    public void insert(FixInfo vo) {
    	FixMapper.insert(vo);
    }
    public String createFixNo() {
    	return FixMapper.createF_SEQ();
    }
	public List<FixInfo> getPage(int currPage, int pageSize) {
		return FixMapper.getPage(currPage, pageSize);
	}
	public int getTotPage(int pageSize) {
		return FixMapper.getTotPage(pageSize);
	}
}
