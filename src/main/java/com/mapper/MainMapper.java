package com.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainMapper {
    List<Map<String, String>> getOptions(String cdTp);
}