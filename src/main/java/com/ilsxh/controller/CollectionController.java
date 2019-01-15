package com.ilsxh.controller;

import com.ilsxh.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping
public class CollectionController {

    private CollectionService collectionService;

    @Autowired
    public CollectionController(CollectionService collectionService) {
        this.collectionService = collectionService;
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
    public String userHomeCollection(@PathVariable String userId, HttpServletRequest request, Model model) {
        // 获取回答列表
        Map<String, Object> map = collectionService.getAnswerCollectionByUserId(userId, request);
        model.addAllAttributes(map);

        return "user/userHome-collection";
    }

}
