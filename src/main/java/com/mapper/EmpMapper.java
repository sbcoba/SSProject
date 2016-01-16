package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.EmpInfo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmpMapper {
    void insert(EmpInfo vo);
    String createEmpNo();
	List<EmpInfo> getPage(@Param(value = "currPage") int currPage, @Param(value = "pageSize") int pageSize);
	int getTotPage(@Param(value = "pageSize") int pageSize);
}