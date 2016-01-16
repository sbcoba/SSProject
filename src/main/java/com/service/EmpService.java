package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.EmpMapper;
import com.vo.EmpInfo;

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
	public List<EmpInfo> getPage(int currPage, int pageSize) {
		return empMapper.getPage(currPage, pageSize);
	}
	public int getTotPage(int pageSize) {
		return empMapper.getTotPage(pageSize);
	}
}