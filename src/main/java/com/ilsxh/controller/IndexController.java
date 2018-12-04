package com.ilsxh.controller;

import com.ilsxh.entity.User;
import com.ilsxh.service.IndexService;
import com.ilsxh.service.UserService;
import com.ilsxh.util.MyConstant;
import com.ilsxh.util.QiniuyunUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * 关于用户设置，详情的控制器
 */

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private IndexService indexService;

    /**
     * 跳转到用户信息设置页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/setting")
    public String setting(HttpServletRequest request, Model model) {
        String userId = userService.getUserIdFromRedis(request);
        User user = indexService.getProfileInfo(userId);
        model.addAttribute("user", user);
        return "editProfile";
    }

    /**
     * 用户信息修改控制器
     *
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/editProfile")
    public String editProfile(User user, HttpServletRequest request) {
        String userId = userService.getUserIdFromRedis(request);
        user.setUserId(userId);

        indexService.updateProfile(user);
        return "redirect:/profile/" + userId;
    }

    /**
     * 更新登陆密码
     *
     * @param password
     * @param newpassword
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/updatePassword")
    public String updatePassword(String password, String newpassword, HttpServletRequest request, Model model) {
        String userId = userService.getUserIdFromRedis(request);
        Map<String, String> map = indexService.updatePassword(userId, password, newpassword);
        if (map.get("error") != null) {
            model.addAttribute("error", map.get("error"));
            return "forward:/setting";
        }
        return "redirect:/logout";

    }

    @RequestMapping("/updateAvatarUrl")
    public String updateAvatarUrl(MultipartFile paramName, HttpServletRequest request) throws IOException {
        String userId = userService.getUserIdFromRedis(request);

        // 包含原始文件名的字符串
        String fi = paramName.getOriginalFilename();
        // 提取文件拓展名
        String fileNameExtension = fi.substring(fi.indexOf("."), fi.length());
        // 生成云端的真实文件名
        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;
        QiniuyunUtil.upload(paramName.getBytes(), remoteFileName);
        // 返回图片的URL地址
        String avatarUrl = MyConstant.QINIU_IMAGE_URL + remoteFileName;

        indexService.updateAvatarUrl(userId, avatarUrl);
        return "redirect:/profile/" + userId;
    }
}
