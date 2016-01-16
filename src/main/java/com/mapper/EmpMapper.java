package com.mapper;

import java.util.List;

import com.vo.EmpInfo;
import com.vo.PagingPram;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface EmpMapper {
    void insert(EmpInfo vo);
    String createEmpNo();
	List<EmpInfo> getPage(PagingPram pagingPram);
	int getTotPage();
}