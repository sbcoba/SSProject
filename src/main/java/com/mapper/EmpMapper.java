package com.mapper;

import com.vo.EmpInfo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface EmpMapper {
    void insert(EmpInfo vo);
    String createEmpNo();
}