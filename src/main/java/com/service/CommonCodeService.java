package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.ss.formula.functions.Code;
import org.springframework.stereotype.Service;

import com.mapper.CommonCodeMapper;
import com.vo.CommonCode;
import com.vo.Page;
import com.vo.PagingPram;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class CommonCodeService extends EgovAbstractServiceImpl {

    @Resource
    CommonCodeMapper commonCodeMapper;

    public void insert(CommonCode vo) {
        commonCodeMapper.insert(vo);
    }

    public Page<CommonCode> getPage(PagingPram pagingParam) {
        Page<CommonCode> page = new Page<CommonCode>();
        List<CommonCode> list = commonCodeMapper.getPage(pagingParam);

        int count = commonCodeMapper.getTotPage();

        if (count < pagingParam.getLimit()) {
            pagingParam.setLimit(count);
        }

        page.setItems(list);
        page.setTotalPages((int) Math.ceil(count / (double) pagingParam.getLimit())); //limit = 6
        page.setCurrPage(pagingParam.getPage());
        page.setCount(count);

        return page;
    }

    public int getTotPage() {
        return commonCodeMapper.getTotPage();
    }
}