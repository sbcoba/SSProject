package com.mapper;

import java.util.List;

import com.vo.CommonCode;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CommonCodeMapper {
    void insert(CommonCode vo);

    List<CommonCode> page();

}
