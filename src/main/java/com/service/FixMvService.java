package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.FixMvMapper;
import com.vo.Dhtmlx;
import com.vo.DhtmlxSub;
import com.vo.FixMvInfo;
import com.vo.FixStInfo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class FixMvService extends EgovAbstractServiceImpl {
	
	@Resource
    FixMvMapper fixMvMapper;
	
	public void insert(FixMvInfo vo) {
		fixMvMapper.insert(vo);
    }
	public void update(FixMvInfo vo) {
		fixMvMapper.update(vo);
	}
	public void delete(FixMvInfo vo) {
		fixMvMapper.delete(vo);
	}
	
	public Dhtmlx getPage() {
		Dhtmlx dhtmlx = new Dhtmlx();
		List<FixMvInfo> fList = fixMvMapper.getPage();
		List<DhtmlxSub> dList = new ArrayList<DhtmlxSub>();
		int i = 0;
		
		for(FixMvInfo fm : fList)
		{
			DhtmlxSub dhtmlxSub = new DhtmlxSub();
			List<Object> al     = new ArrayList<Object>();
			
			dhtmlxSub.setId(String.valueOf(i++));
			
			al.add("");
			al.add(fm.getFjSeq());
			al.add(fm.getfSeq());
			al.add(fm.getFbPutDt());
			al.add(fm.getFbDept());
			al.add(fm.getFbSeqSt());
			al.add(fm.getFbSeqEd());
			al.add(fm.getFbCnt());
			al.add(fm.geteNo());
			al.add(fm.geteNm());
			al.add(fm.getFbLoc1());
			al.add(fm.getFbLoc3());
			al.add(fm.getFbLoc4());
			al.add(fm.getFbRpCnt());
			al.add(fm.getFbRtCnt());
			al.add(fm.getFbMvCnt());
			dhtmlxSub.setData(al); 
			
			dList.add(dhtmlxSub);
		}
		dhtmlx.setRows(dList);
		

		return dhtmlx;
	}
	
	public Dhtmlx getTempPage() {
		Dhtmlx dhtmlx = new Dhtmlx();
		List<FixStInfo> fList = fixMvMapper.getTempPage();
		List<DhtmlxSub> dList = new ArrayList<DhtmlxSub>();
		int i = 0;
		
		for(FixStInfo fm : fList)
		{
			DhtmlxSub dhtmlxSub = new DhtmlxSub();
			List<Object> al     = new ArrayList<Object>();
			
			dhtmlxSub.setId(String.valueOf(i++));
			
			al.add(fm.getFjSeq());
			al.add(fm.getfSeq());
			al.add(fm.getFjBuyItem());
			al.add(fm.getFjSize());
			al.add(fm.getFjUse());
			al.add(fm.getFjMkCom());
			al.add(fm.getFjCnt());
			al.add(fm.getFjSeqSt());
			al.add(fm.getFjSeqEd());
			dhtmlxSub.setData(al); 
			
			dList.add(dhtmlxSub);
		}
		dhtmlx.setRows(dList);
		

		return dhtmlx;
	}
}
