package com.ilsxh.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

public class MyUtil {

    public static String md5(String plainText) {
        byte[] secretBytes = null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("没有md5这个算法！");
        }

        // 16进制数字
        String md5code = new BigInteger(1, secretBytes).toString(16);
        // 如果生成数字未满32位，需要前面补0
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        return md5code;
    }

    /**
     * 格式化日期
     *
     * @param date
     * @return
     */
    public static String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    /**
     * 产生随机码
     *
     * @return
     */
    public static String createRandomCode() {
        return new Date().getTime() + UUID.randomUUID().toString().replace("-", "");
    }

    public static List<Integer> StringSetToIntegerList(Set<String> set) {
        List<Integer> list = new ArrayList<>();
        for (String s : set) {
            list.add(Integer.parseInt(s));
        }
        return list;
    }


//    private <T> T stringToBean(String str, Class<T> clazz) {
//        if (str == null || str.length() <= 0 || clazz == null) {
//            return null;
//        }
//        if (clazz == int.class || clazz == Integer.class) {
//            return (T) Integer.valueOf(str);
//        } else if (clazz == String.class) {
//            return (T) str;
//        } else if (clazz == long.class || clazz == Long.class) {
//            return (T) Long.valueOf(str);
//        } else {
//            return JSON.toJavaObject(JSON.parseObject(str), clazz);
//        }
//    }
//
//    private <T> String beanToString(T value) {
//        if (value == null) {
//            return null;
//        }
//        Class<?> clazz = value.getClass();
//        if (clazz == int.class || clazz == Integer.class) {
//            return "" + value;
//        } else if (clazz == String.class) {
//            return (String) value;
//        } else if (clazz == long.class || clazz == Long.class) {
//            return "" + value;
//        } else {
//            return JSON.toJSONString(value);
//        }
//    }
//

}
