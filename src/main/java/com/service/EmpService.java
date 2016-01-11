package com.service;

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
}