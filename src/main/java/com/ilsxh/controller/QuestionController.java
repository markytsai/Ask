package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.service.*;
import com.ilsxh.util.Response;
import java.util.*;
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
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/following")
    public String getFollowingQuestionsByUserId(HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);

        List<Question> questionList = questionService.getFollowingQuestionByUserId(userId);
        model.addAttribute("questionList", questionList);

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
        List<Question> questionList = questionService.getRecommendedQuestionByUserId();
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
        questionService.getQuestionDetail(userId, questionId, model);
        questionService.getCommonHotData(model);
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
    public Response followQuestion(@PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);

        String hasUserFollowQuestion = questionService.hasUserFollowQuestion(localUserId, questionId);

        if (hasUserFollowQuestion != null && hasUserFollowQuestion == "true") {
            questionService.unfollowQuestion(localUserId, questionId);
        } else {
            questionService.followQuestion(localUserId, questionId);
        }

        return new Response(1, "关注问题成功", "");
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
    public Response submitAnswer(@RequestParam("answerContent") String answerContent, @PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        Answer answer = questionService.submitAnswer(answerContent, questionId, localUserId);
        return new Response(1, "已成功提交你的回答", answer.getAnswerId());
    }


    /**
     * 更新回答
     * @param answerContent
     * @param answerId
     * @param questionId
     * @param request
     * @return
     */
    @RequestMapping("/updateAnswer/{questionId}")
    @ResponseBody
    public Response updateAnswer(@RequestParam("answerContent") String answerContent, @RequestParam("answerId") Integer answerId, @PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        questionService.updateAnswer(localUserId, answerId, answerContent, questionId);
        return new Response(1, "", "");
    }

    /**
     * 此处链接不应该跳转，bug to fix
     *
     * @param answerId
     * @param request
     */
    @RequestMapping("/deleteAnswer/{answerId}")
    @ResponseBody
    public Response deleteAnswer(@PathVariable("answerId") String answerId, HttpServletRequest request) {
        questionService.deleteAnswer(answerId);
        return new Response(1, "", "");
    }

    /**
     * 提问题
     *
     * @param questionTitle
     * @param questionContent
     */
    @RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
    @ResponseBody
    public Response askQuestion(@RequestParam String questionTitle, @RequestParam String questionContent, @RequestParam String topicString, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);

        Question raisedQuestion = questionService.addQuestion(questionTitle, questionContent, topicString, userId);
        return new Response(1, "问题发布成功", raisedQuestion.getQuestionId());
    }

    /**
     * 提问键入文字，实时获取相关问题并显示，供用户选择
     * @param partialWord
     * @return
     */
    @RequestMapping("/getProbablyRelativeQestions/{partialWord}")
    @ResponseBody
    public Response getProbablyRelativeQestions(@PathVariable String partialWord) {
        List<Question> questionList = questionService.getProbablyRelativeQestions(partialWord);
        return new Response(1, "已经存在相关问题", questionList);
    }


    /**
     * 获取更多热门问题，然后跳转到更多的
     *
     * @return
     */
    @RequestMapping("/moreHotQuestion")
    public String getMoreHotQuestion(HttpServletRequest request, Model model) {
        searchService.getCommonData(request, "", model);

        List<Question> questionList = questionService.getRecommendedQuestionByUserId();
        model.addAttribute("questionList", questionList);
        return "hotQuestionDetail";
    }


}



