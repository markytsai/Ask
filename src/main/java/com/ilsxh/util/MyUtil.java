package com.ilsxh.util;

import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FileUtils;

import java.io.*;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    private <T> T stringToBean(String str, Class<T> clazz) {
        if (str == null || str.length() <= 0 || clazz == null) {
            return null;
        }
        if (clazz == int.class || clazz == Integer.class) {
            return (T) Integer.valueOf(str);
        } else if (clazz == String.class) {
            return (T) str;
        } else if (clazz == long.class || clazz == Long.class) {
            return (T) Long.valueOf(str);
        } else {
            return JSON.toJavaObject(JSON.parseObject(str), clazz);
        }
    }

    private <T> String beanToString(T value) {
        if (value == null) {
            return null;
        }
        Class<?> clazz = value.getClass();
        if (clazz == int.class || clazz == Integer.class) {
            return "" + value;
        } else if (clazz == String.class) {
            return (String) value;
        } else if (clazz == long.class || clazz == Long.class) {
            return "" + value;
        } else {
            return JSON.toJSONString(value);
        }
    }


    public static final String AVATAR_BASE_DIR = "E:\\IdeaProjects\\Ask\\src\\main\\webapp\\images\\userAvatar\\";

    /**
     * 需要建立全局异常捕捉器
     *
     * @param file
     * @param avatarUrl
     * @throws IOException
     */
    public static void saveToLocal(byte[] file, String avatarUrl) throws IOException {

        FileUtils.writeByteArrayToFile(new File(avatarUrl), file);

    }

    /**
     * 对问题详情进行修改，转换上传图片的URL到七牛云上
     * @param questionContent
     * @return
     */
    public static String modifyQuestionContent(String questionContent, String questionTitle) {
        List<String> imgSrc = new ArrayList<>();
        Matcher matcher = Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(questionContent);

        try {
            while (matcher.find()) {
                imgSrc.add(matcher.group(1));
            }

            for (int i = 0; i < imgSrc.size(); i++) {
                String remoteFileName = "questionTitle-" + questionTitle + "-No." + (i + 1) + ".jpeg";
                QiniuyunUtil.upload(Base64.getDecoder().decode(imgSrc.get(i).substring(imgSrc.get(i).indexOf(',') + 1)), remoteFileName);
                questionContent = questionContent.replace(imgSrc.get(i), "http://pknhrkp8l.bkt.clouddn.com/" + remoteFileName);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return questionContent;
    }

    public static String modifAnswerContent(String answerContent) {
        List<String> imgSrc = new ArrayList<>();
        Matcher matcher = Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(answerContent);

        try {
            while (matcher.find()) {
                imgSrc.add(matcher.group(1));
            }

            for (int i = 0; i < imgSrc.size(); i++) {
                String remoteFileName = "answerContent-No." + (i + 1) + ".jpeg";
                QiniuyunUtil.upload(Base64.getDecoder().decode(imgSrc.get(i).substring(imgSrc.get(i).indexOf(',') + 1)), remoteFileName);
                answerContent = answerContent.replace(imgSrc.get(i), "http://pknhrkp8l.bkt.clouddn.com/" + remoteFileName);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return answerContent;
    }

}
