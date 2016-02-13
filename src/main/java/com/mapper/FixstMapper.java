package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.FixstInfo;
import com.vo.PagingPram;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FixstMapper {

    void insert(FixstInfo vo);
    void update(FixstInfo vo);
	void delete(String f_SEQ);
    String createF_SEQ();
	List<FixstInfo> getPage(PagingPram pagingPram);
	int getTotPage();
	FixstInfo getFixInfo(String f_SEQ);
	List<FixstInfo> getPagej();
	
	/*    void insert(FixstInfo vo);
    String createF_SEQ();
	List<FixstInfo> getPage(@Param(value = "currPage") int currPage, @Param(value = "pageSize") int pageSize);
	int getTotPage(@Param(value = "pageSize") int pageSize);*/
	
}
