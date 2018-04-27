package com.kd.mvc.utils;

import java.util.*;

/**
 * Created by jove on 2016/8/30.
 */
public class StateChangeTable {
    private static Map<String, Map<String, Set<String>>> table = new HashMap<>();

    public static Set<String> getOps(String state, String code) {
        if (!table.containsKey(state)) {
            return new HashSet<>(0);
        }
        if (!table.get(state).containsKey(code)) {
            return new HashSet<>(0);
        }
        return table.get(state).get(code);
    }

    static {
        Map<String, Set<String>> codeMap = new HashMap<>();
        Set<String> states = new LinkedHashSet<>();
        table.put("FILE_UPLOAD", codeMap);
        codeMap.put("000", states);
        states.add("verify_success");
        states.add("task_completed");

        states = new LinkedHashSet<>();
        codeMap.put("001", states);
        states.add("task_start");

        states = new LinkedHashSet<>();
        codeMap.put("601", states);
        states.add("verify_fail");

        states = new LinkedHashSet<>();
        codeMap.put("602", states);
        states.add("black_list");


        codeMap = new HashMap<>();
        states = new LinkedHashSet<>();
        table.put("BLACK_LIST", codeMap);
        codeMap.put("001", states);
        states.add("task_ready");

        states = new LinkedHashSet<>();
        codeMap.put("601", states);
        states.add("file_upload");
        states.add("verify_fail");

        states = new LinkedHashSet<>();
        codeMap.put("000", states);
        states.add("file_upload");
        states.add("verify_success");
        states.add("task_completed");

        codeMap = new HashMap<>();
        states = new LinkedHashSet<>();
        table.put("VERIFY_SUCCESS", codeMap);
        codeMap.put("000", states);
        states.add("task_completed");
    }
}
