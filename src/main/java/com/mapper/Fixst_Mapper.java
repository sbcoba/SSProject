package com.mapper;

import java.util.List;
import java.util.Map;

import com.vo.FixStInfo;
import com.vo.Fixst_Info;
import com.vo.PagingPram;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface Fixst_Mapper {
	
    void insert(Fixst_Info vo);
    void update(Fixst_Info vo);
	void delete(String f_SEQ);
    String createFJ_SEQ();
    String createF_SEQ();
	List<Fixst_Info> getPage(PagingPram pagingPram);
	int getTotPage();
	Fixst_Info getFixst_Info(String f_SEQ);
	List<Fixst_Info> getPagej();
	
	/*    void insert(Fixst_Info vo);
    String createF_SEQ();
	List<Fixst_Info> getPage(@Param(value = "currPage") int currPage, @Param(value = "pageSize") int pageSize);
	int getTotPage(@Param(value = "pageSize") int pageSize);*/
	
}
