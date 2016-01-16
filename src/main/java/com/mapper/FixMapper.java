package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.FixInfo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FixMapper {
    void insert(FixInfo vo);
    String createF_SEQ();
	List<FixInfo> getPage(@Param(value = "currPage") int currPage, @Param(value = "pageSize") int pageSize);
	int getTotPage(@Param(value = "pageSize") int pageSize);
	
}
