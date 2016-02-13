package com.mapper;

import java.util.List;

import com.vo.FixMvInfo;
import com.vo.FixStInfo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface FixMvMapper {
	List<FixMvInfo> getPage();
	List<FixStInfo> getTempPage();
	void insert(FixMvInfo vo);
	void update(FixMvInfo vo);
	void delete(FixMvInfo vo);
}