package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.service.CollectionService;
import com.ilsxh.service.UserHelperService;
import com.ilsxh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * @author Tsaizhenya
 */
@Controller
@RequestMapping
public class CollectionController {

    private CollectionService collectionService;
    private UserHelperService userHelperService;

    @Autowired
    public CollectionController(CollectionService collectionService, UserHelperService userHelperService) {
        this.collectionService = collectionService;
        this.userHelperService = userHelperService;
    }

    /**
     * 个人主页，收藏tab
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/userHome/collection/{userId}")
    public String userHomeCollection(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo, HttpServletRequest request, Model model) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        // 获取回答列表
        Page<Answer> page = collectionService.getAnswerCollectionByUserId(userId, pageNo);
        map.put("page", page);
        map.put("type", "collection");
        model.addAllAttributes(map);

        return "user/userHome-collection";
    }

}
