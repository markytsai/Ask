package com.ilsxh.service;

import com.ilsxh.dao.SearchDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class SearchService {

    private SearchDao searchDao;
    private UserService userService;
    private QuestionService questionService;
    private UserHelperService userHelperService;

    @Autowired
    public SearchService(SearchDao searchDao, UserService userService, QuestionService questionService, UserHelperService userHelperService) {
        this.searchDao = searchDao;
        this.userService = userService;
        this.questionService = questionService;
        this.userHelperService = userHelperService;
    }

    /**
     * 全局搜索，三种类型：问题，回答，话题名称
     * @param type
     * @param keyword
     * @param model
     * @param request
     * @return
     */
    public String globalSearch(String type, String keyword, Model model, HttpServletRequest request) {

        if ("question".equals(type)) {
            this.getCommonData(request, keyword, model);
            List<Question> searchQuestionList = searchDao.globalSearchQuestion(keyword);
            for (Question question : searchQuestionList) {
                question.setUser(userService.getUserByUserId(question.getUserId()));
            }
            model.addAttribute("searchQuestionList", searchQuestionList);
            return "search/search-question";
        } else if ("user".equals(type)) {
            this.getCommonData(request, keyword, model);
            List<User> searchUserList = searchDao.globalSearchUser(keyword);
            model.addAttribute("searchUserList", searchUserList);
            return "search/search-user";
        } else {
            this.getCommonData(request, keyword, model);
            List<Answer> searchAnswerList = searchDao.globalSearchAnswer(keyword);
            for (Answer answer : searchAnswerList) {
                answer.setUser(userService.getUserByUserId(answer.getAnswerUserId()));
                answer.setQuestion(userService.getQuestionById(answer.getQuestionId()));
            }
            model.addAttribute("searchAnswerList", searchAnswerList);
            return "search/search-answer";
        }
    }

    /**
     * 获取问题的一些公共信息，包括热点数据
     * @param request
     * @param keyword
     * @param model
     */
    public void getCommonData(HttpServletRequest request, String keyword, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);

        model.addAttribute("isLoginUser", "true");
        model.addAttribute("user", userService.getUserByUserId(localUserId));

        questionService.getCommonHotData(model);

        if (keyword != null) {
            model.addAttribute("keyword", keyword);
        }
    }
}
