package com.mapper;

import java.util.List;

import com.vo.FixInfo;
import com.vo.FixStInfo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface FixstMapper {
	
	List<FixStInfo> getPage();
	List<FixStInfo> getTempPage();
	List<FixInfo> getFixPage();
	String createFJSEQ();
	String createFSEQ();	
	void insert(FixStInfo vo);
	void update(FixStInfo vo);
	void delete(FixStInfo vo);
	
}