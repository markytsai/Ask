package com.ilsxh.service;

import com.alibaba.fastjson.JSON;
import com.ilsxh.redis.KeyPrefix;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @author Tsaizhenya
 */
@Service
public class RedisService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 获取单个对象
     */
    public <T> T get(KeyPrefix prefix, String key, Class<T> clazz) {
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        String str = stringRedisTemplate.opsForValue().get(realKey);
        T t = stringToBean(str, clazz);
        return t;
    }

    /**
     * 设置单个对象
     */
    public <T> boolean set(KeyPrefix prefix, String key, T value) {
        String str = beanToString(value);
        if (str == null || str.length() <= 0) {
            return false;
        }
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        int seconds = prefix.expireSeconds();
        if (seconds <= 0) {
            stringRedisTemplate.opsForValue().set(realKey, str);
        } else {
            stringRedisTemplate.opsForValue().set(realKey, str, seconds, TimeUnit.SECONDS);
        }
        return true;
    }

    /**
     * 设置列表
     *
     * @param prefix
     * @param key
     * @param list
     * @param <T>
     * @return
     */
    public <T> boolean setList(KeyPrefix prefix, String key, List<T> list) {
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        int seconds = prefix.expireSeconds();
        if (seconds <= 0) {
            stringRedisTemplate.opsForValue().set(realKey, JSON.toJSONString(list));
        } else {
            stringRedisTemplate.opsForValue().set(realKey, JSON.toJSONString(list), seconds, TimeUnit.SECONDS);
        }
        return true;
    }

    /**
     * 获取缓存中的列表
     *
     * @param prefix
     * @param key
     * @param clazz
     * @return
     */
    public <T> List<T> getList(KeyPrefix prefix, String key, Class<T> clazz) {
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        String ret = stringRedisTemplate.opsForValue().get(realKey);
        return JSON.parseArray(ret, clazz);
    }

    /**
     * 判断key是否存在
     */
    public <T> boolean exists(KeyPrefix prefix, String key) {
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        return stringRedisTemplate.opsForValue().get(realKey) != null;
    }

    /**
     * 删除
     */
    public boolean delete(KeyPrefix prefix, String key) {
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        stringRedisTemplate.delete(realKey);
        return true;
    }

    /**
     * 增加值
     */
    public <T> Long incr(KeyPrefix prefix, String key) {
        //生成真正的key
        String realKey = prefix.getPrefix() + key;
        return stringRedisTemplate.opsForValue().increment(realKey);
    }

    /**
     * 减少值
     */
    public <T> Long decr(KeyPrefix prefix, String key) {
        String realKey = prefix.getPrefix() + key;
        return stringRedisTemplate.opsForValue().decrement(realKey);
    }

    public boolean delete(KeyPrefix prefix) {
        if (prefix == null) {
            return false;
        }

        String pattern = String.format(prefix + "*");
        Set<String> keySet = redisTemplate.keys(pattern);
        redisTemplate.delete(keySet);
        return true;
    }


    public static <T> String beanToString(T value) {
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

    public static <T> T stringToBean(String str, Class<T> clazz) {
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

}
