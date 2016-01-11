package com.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.mapper.MainMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class MainService extends EgovAbstractServiceImpl {

    @Resource
    MainMapper mainMapper;
    
	public List<Map<String, String>> getOptions(String cdTp) {
		return mainMapper.getOptions(cdTp);
	}
    
}