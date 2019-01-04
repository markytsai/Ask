package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.service.HotService;
import com.ilsxh.service.SearchService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private UserService userService;

    @Autowired
    private SearchService searchService;

    @Autowired
    private HotService hotService;

    /**
     * 搜索包含关键词的问题
     * @param keyword
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/search/question/{keyword}", method = RequestMethod.GET)
    public String globlalSearchQuestion(@PathVariable("keyword") String keyword, HttpServletRequest request, Model model) {

        getCommonData(request, keyword, model);

        List<Question> searchQuestionList = searchService.globalSearchQuestion(keyword);

        for (Question question : searchQuestionList) {
            question.setUser(userService.getUserByUserId(question.getUserId()));
        }

        model.addAttribute("searchQuestionList", searchQuestionList);

        return "search/search-question";

    }

    /**
     * 搜索包含关键词的用户
     * @param keyword
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/search/user/{keyword}", method = RequestMethod.GET)
    public String globlalSearchUser(@PathVariable("keyword") String keyword, HttpServletRequest request, Model model) {

        getCommonData(request, keyword, model);

        List<User> searchUserList = searchService.globalSearchUser(keyword);

        model.addAttribute("searchUserList", searchUserList);

        return "search/search-user";

    }

    /**
     * 搜索包含关键词的回答
     * @param keyword
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/search/answer/{keyword}", method = RequestMethod.GET)
    public String globlalSearchAnswer(@PathVariable("keyword") String keyword, HttpServletRequest request, Model model) {

        getCommonData(request, keyword, model);
        List<Answer> searchAnswerList = searchService.globalSearchAnswer(keyword);
        for (Answer answer : searchAnswerList) {
            answer.setUser(userService.getUserByUserId(answer.getAnswerUserId()));
            answer.setQuestion(userService.getQuestionById(answer.getQuestionId()));
        }
        model.addAttribute("searchAnswerList", searchAnswerList);
        return "search/search-answer";

    }

    public void getCommonData(HttpServletRequest request, String keyword, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);

        model.addAttribute("isLoginUser", "true");
        model.addAttribute("user", userService.getUserByUserId(localUserId));


        model.addAttribute("hotQuestions", hotService.getHotQuestion());
        model.addAttribute("hotUsers", hotService.getHotUsers());
        model.addAttribute("hotTopics", hotService.getHotTopic());
        model.addAttribute("newestQuestions", hotService.getNewestRaisedQuestion());

        model.addAttribute("keyword", keyword);
    }
}
