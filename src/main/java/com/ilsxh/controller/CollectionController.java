package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.service.CollectionService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class CollectionController {

    @Autowired
    private UserService userService;

    @Autowired
    private CollectionService collectionService;

    @RequestMapping("/userHome/collection/{userId}")
    public String userHomeCollection(@PathVariable String userId, HttpServletRequest request, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取回答列表
        List<Answer> answerCollectionList = collectionService.getAnswerCollectionByUserId(userId);
        map.put("answerCollectionList", answerCollectionList);
        model.addAllAttributes(map);

        return "user/userHome-collection";
    }

}
