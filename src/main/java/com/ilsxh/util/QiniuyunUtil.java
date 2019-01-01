package com.ilsxh.util;

import com.qiniu.common.Zone;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import com.qiniu.http.Response;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Service
public class QiniuyunUtil {
    // 设置好账号的ACCESS_KEY和SECRET_KEY
    private static String ACCESS_KEY = MyConstant.QINIU_ACCESS_KEY;
    private static String SECRET_KEY = MyConstant.QINIU_SECRET_KEY;
    // 要上传的空间
    private static String BUCKET_NAME = MyConstant.QINIU_BUCKET_NAME;
    // 密钥配置
    private static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

    private static Configuration configuration = new Configuration(Zone.zone2());
    // 创建上传对象
    private static UploadManager uploadManager = new UploadManager(configuration);

    // 简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public static String getUpToken() {
        return auth.uploadToken(BUCKET_NAME);
    }

    public static void upload(byte[] localData, String remoteFileName) throws IOException {
        Response res = uploadManager.put(localData, remoteFileName, getUpToken());
        // 打印返回的信息
        System.out.println(res.bodyString());
    }

    public static void uploadAvatar(MultipartFile avatar, String key) throws Exception {
        upload(avatar.getBytes(), key);
    }
}
