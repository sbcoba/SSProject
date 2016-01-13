package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.EmpInfo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface EmpMapper {
    void insert(EmpInfo vo);
    String createEmpNo();
	List<EmpInfo> getPage();
}