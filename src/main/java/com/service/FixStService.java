package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.FixstMapper;
import com.vo.Dhtmlx;
import com.vo.DhtmlxSub;
import com.vo.FixInfo;
import com.vo.FixStInfo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class FixStService extends EgovAbstractServiceImpl {
	
	@Resource
    FixstMapper FixstMapper;
	
	public void insert(FixStInfo vo) {
		System.out.println(vo);
		FixstMapper.insert(vo);
    }
	public void update(FixStInfo vo) {
		
		FixstMapper.update(vo);
	}
	public void delete(FixStInfo vo) {
		FixstMapper.delete(vo);
	}
	
    public String createFJSEQ() {
    	return FixstMapper.createFJSEQ();
    }
    
    public String createFSEQ() {
    	return FixstMapper.createFSEQ();
    }
    
	public Dhtmlx getPage() {
		Dhtmlx dhtmlx = new Dhtmlx();
		List<FixStInfo> fList = FixstMapper.getPage();
		List<DhtmlxSub> dList = new ArrayList<DhtmlxSub>();
		int i = 0;
		
		for(FixStInfo fm : fList)
		{
			DhtmlxSub dhtmlxSub = new DhtmlxSub();
			List<Object> al     = new ArrayList<Object>();			
			dhtmlxSub.setId(String.valueOf(i++));
					
			al.add("");
			al.add(fm.getFjSeq());
			al.add(fm.getfSeq());
			al.add(fm.getFjGetDt());
			al.add(fm.getFjPutDt());
			al.add(fm.getFjMdNo());
			al.add(fm.getFjMkNo());
			al.add(fm.getFjSize());
			al.add(fm.getFjMkCom());
			al.add(fm.getFjBuyItem());
			al.add(fm.getFjUse());
			al.add(fm.getFjCnt());
			al.add(fm.getFjUnitAmt());
			al.add(fm.getFjTotAmt());
			al.add(fm.getFjSeqSt());			
			al.add(fm.getRemark());			
			al.add(fm.getInsertDt());
			al.add(fm.getInsertEmp());					
			al.add(fm.getModifyDt());
			al.add(fm.getModifyEmp());				
			dhtmlxSub.setData(al); 			
			dList.add(dhtmlxSub);
		}
		dhtmlx.setRows(dList);
		return dhtmlx;
	}
	
	public Dhtmlx getTempPage() {
		Dhtmlx dhtmlx = new Dhtmlx();
		List<FixStInfo> fList = FixstMapper.getTempPage();
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
	
	public Dhtmlx getFixPage() {
		Dhtmlx dhtmlx = new Dhtmlx();
		List<FixInfo> fList = FixstMapper.getFixPage();
		List<DhtmlxSub> dList = new ArrayList<DhtmlxSub>();
		int i = 0;
		
		for(FixInfo fm : fList)
		{
			DhtmlxSub dhtmlxSub = new DhtmlxSub();
			List<Object> al     = new ArrayList<Object>();
			
			dhtmlxSub.setId(String.valueOf(i++));
			
			al.add(fm.getF_SEQ());
			al.add(fm.getF_NM());
			al.add(fm.getF_KIND());
			al.add(fm.getF_UNIT());
			al.add(fm.getF_YEAR());			
					
			dhtmlxSub.setData(al); 			
			dList.add(dhtmlxSub);		
		}
		dhtmlx.setRows(dList);
		

		return dhtmlx;
	}
	
}
