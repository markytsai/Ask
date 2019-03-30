package com.ilsxh.controller;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.exception.CustomException;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.*;

import java.util.*;

import com.ilsxh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class QuestionController {

    private QuestionService questionService;
    private SearchService searchService;
    private UserHelperService userHelperService;

    @Autowired
    public QuestionController(QuestionService questionService, SearchService searchService, UserHelperService userHelperService) {
        this.questionService = questionService;
        this.searchService = searchService;
        this.userHelperService = userHelperService;
    }

    /**
     * 获取用户关注列表，并返回到关注列表页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/following")
    public String getFollowingQuestionsByUserId(@RequestParam(value = "page", defaultValue = "1") Integer pageNo, HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);

        int pageSize = 30;
        List<Question> questionList = questionService.getFollowingQuestionByUserId(userId, (pageNo - 1) * pageSize, pageSize);
        int totalCount = questionService.getTotalQuestionNum(userId);

        Page<Question> page = new Page<>(pageNo, pageSize, totalCount, questionList);

        model.addAttribute("page", page);

        questionService.getCommonHotData(model);

        return "index-following";
    }

    /**
     * 推荐问题接口
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/recommend")
    public String getRecommendQuestionsByUserId(HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);
        List<Question> questionList = questionService.getRecommendedQuestionByUserId(userId);
        model.addAttribute("recommendQuestionList", questionList);
        questionService.getCommonHotData(model);
        return "index-recommend";
    }

    /**
     * 问题详情页面
     *
     * @param questionId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/question/{questionId}")
    public String QuestionDetail(@PathVariable("questionId") Integer questionId, HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        model = questionService.getQuestionDetail(userId, questionId, model);
        questionService.getCommonHotData(model);

        model.addAttribute("currentUrl", "/question/" + questionId);
        return "questionDetail";
    }

    /**
     * 关注问题页面
     *
     * @param questionId
     * @param request
     */
    @RequestMapping("/followQuestion/{questionId}")
    @ResponseBody
    public BaseResponse followQuestion(@PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);

        String hasUserFollowQuestion = questionService.hasUserFollowQuestion(localUserId, questionId);

        Integer effectRow = 0;
        if (hasUserFollowQuestion != null && hasUserFollowQuestion == "true") {
            effectRow = questionService.unfollowQuestion(localUserId, questionId);
            if (effectRow != null && effectRow == 1) {
                return new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功取消关注问题", "");
            }
        } else {
            effectRow = questionService.followQuestion(localUserId, questionId);
            if (effectRow != null && effectRow == 1) {
                return new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功关注问题", "");
            }
        }
        return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "操作失败", "");
    }

    /**
     * 回答提交
     *
     * @param answerContent
     * @param questionId
     * @param request
     */
    @RequestMapping("/submitAnswer/{questionId}")
    @ResponseBody
    public BaseResponse submitAnswer(@RequestParam("answerContent") String answerContent, @PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        Answer answer = questionService.submitAnswer(answerContent, questionId, localUserId);
        if (answer != null) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "已成功提交你的回答", answer.getAnswerId());
        } else {
            return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "未能成功提交你的回答", 0);
        }
    }


    /**
     * 更新回答
     *
     * @param answerContent
     * @param answerId
     * @param questionId
     * @param request
     * @return
     */
    @RequestMapping("/updateAnswer/{questionId}")
    @ResponseBody
    public BaseResponse updateAnswer(@RequestParam("answerContent") String answerContent, @RequestParam("answerId") Integer answerId, @PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        Integer effectRow = 0;
        effectRow = questionService.updateAnswer(localUserId, answerId, answerContent, questionId);
        if (effectRow != null && effectRow == 1) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "已成功更新你的回答", effectRow);
        } else {
            return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "未能更新你的回答", 0);
        }
    }

    /**
     * 此处链接不应该跳转，bug to fix
     *
     * @param answerId
     * @param request
     */
    @RequestMapping("/deleteAnswer/{answerId}")
    @ResponseBody
    public BaseResponse deleteAnswer(@PathVariable("answerId") String answerId, HttpServletRequest request) {
        Integer effectRow = 0;
        effectRow = questionService.deleteAnswer(answerId);
        if (effectRow != null && effectRow == 1) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "已成功删除你的回答", effectRow);
        } else {
            return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "未能删除你的回答", 0);
        }
    }

    /**
     * 提问题
     *
     * @param questionTitle
     * @param questionContent
     */
    @RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse askQuestion(@RequestParam String questionTitle, @RequestParam String questionContent, @RequestParam String topicString, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);

        Question raisedQuestion = questionService.addQuestion(questionTitle, questionContent, topicString, userId);
        if (raisedQuestion != null) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "问题发布成功", raisedQuestion.getQuestionId());
        } else {
            return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "问题发布失败", raisedQuestion.getQuestionId());
        }
    }

    /**
     * 提问键入文字，实时获取相关问题并显示，供用户选择
     *
     * @param partialWord
     * @return
     */
    @RequestMapping("/getProbablyRelativeQestions/{partialWord}")
    @ResponseBody
    public BaseResponse getProbablyRelativeQestions(@PathVariable String partialWord) {
        List<Question> questionList = questionService.getProbablyRelativeQestions(partialWord);
        if (questionList != null) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "问题发布成功", questionList);
        } else {
            return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "获取相关问题失败", "");
        }
    }


    /**
     * 获取更多热门问题，然后跳转到更多的
     *
     * @return
     */
    @RequestMapping("/moreHotQuestion")
    public String getMoreHotQuestion(HttpServletRequest request, Model model) {
        searchService.getCommonData(request, "", model);
        String userId = userHelperService.getUserIdFromRedis(request);
        List<Question> questionList = questionService.getRecommendedQuestionByUserId(userId);
        model.addAttribute("questionList", questionList);

        model.addAttribute("currentUrl", "/moreHotQuestion");
        return "hotQuestionDetail";
    }


}



