package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.EmpMapper;
import com.vo.Dhtmlx;
import com.vo.DhtmlxSub;
import com.vo.EmpInfo;
import com.vo.FixMvInfo;
import com.vo.Page;
import com.vo.PagingPram;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class EmpService extends EgovAbstractServiceImpl {

    @Resource
    EmpMapper empMapper;

    public void insert(EmpInfo vo) {
    	empMapper.insert(vo);
    }
	public void update(EmpInfo vo) {
		empMapper.update(vo);
	}
	public void delete(String eNo) {
		empMapper.delete(eNo);
		
	}
    public String createEmpNo() {
    	return empMapper.createEmpNo();
    }
	public Page<EmpInfo> getPage(PagingPram pagingPram) {
		Page<EmpInfo> page = new Page<EmpInfo>();
		List<EmpInfo> list = empMapper.getPage(pagingPram);
		
		int count = empMapper.getTotPage();
		
		if(count < pagingPram.getLimit())
		{
			pagingPram.setLimit(count);
		}
		
		page.setItems(list);
		page.setTotalPages((int)Math.ceil(count/(double)pagingPram.getLimit()));
		page.setCurrPage(pagingPram.getPage());
		page.setCount(count);

		return page;
	}
	public int getTotPage() {
		return empMapper.getTotPage();
	}
	public EmpInfo getEmpInfo(String eNo) {
		return empMapper.getEmpInfo(eNo);
	}
	public Dhtmlx dhxEmp() {
		Dhtmlx dhtmlx = new Dhtmlx();
		List<EmpInfo> fList = empMapper.dhxEmp();
		List<DhtmlxSub> dList = new ArrayList<DhtmlxSub>();
		int i = 0;
		
		for(EmpInfo fm : fList)
		{
			DhtmlxSub dhtmlxSub = new DhtmlxSub();
			List<Object> al     = new ArrayList<Object>();
			
			dhtmlxSub.setId(String.valueOf(i++));
			
			al.add(fm.geteNo());
			al.add(fm.geteNm());
			al.add(fm.getePosi());
			al.add(fm.geteInDt());
			al.add(fm.geteOutDt());
			dhtmlxSub.setData(al); 
			
			dList.add(dhtmlxSub);
		}
		dhtmlx.setRows(dList);
		

		return dhtmlx;
	}
}