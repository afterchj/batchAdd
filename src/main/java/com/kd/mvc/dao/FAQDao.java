package com.kd.mvc.dao;

import com.kd.mvc.entity.FAQ;

import java.util.List;
import java.util.Map;

/**
 * Created by hongjian.chen on 2018/4/26.
 */
public interface FAQDao {
    void insertBatch(List<FAQ> list);
    List<FAQ> selectByKey(Map map);
    List<String> getAllKey();
}
