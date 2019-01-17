package com.ilsxh.util;

import java.util.Map;

public class MapUtils {

    public static Boolean getBoolean(Map map, String key) {
        return (Boolean) map.get(key);
    }
}
