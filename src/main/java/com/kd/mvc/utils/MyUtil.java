package com.kd.mvc.utils;

import org.junit.Test;

/**
 * Created by hongjian.chen on 2018/4/26.
 */
public class MyUtil {
    @Test
    public void test() {
        String str = "奖励 下载 应用 广告";
        String[] strArray = str.split(" ");
        for (String s : strArray) {
            System.out.println("str=" + s);
        }
    }
}
