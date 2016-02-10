package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.EmpInfo;
import com.vo.FixMvInfo;
import com.vo.PagingPram;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmpMapper {
    void insert(EmpInfo vo);
    void update(EmpInfo vo);
	void delete(String eNo);
    String createEmpNo();
	List<EmpInfo> getPage(PagingPram pagingPram);
	int getTotPage();
	EmpInfo getEmpInfo(String eNo);
	List<EmpInfo> dhxEmp();
}