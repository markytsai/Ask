package com.ilsxh.service;

import com.ilsxh.dao.NotificateDao;
import com.ilsxh.dao.SearchDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class SearchService {

    private SearchDao searchDao;
    private UserService userService;
    private QuestionService questionService;
    private UserHelperService userHelperService;
    private NotificateDao notificateDao;

    @Autowired
    public SearchService(SearchDao searchDao, UserService userService, QuestionService questionService,
                         UserHelperService userHelperService, NotificateDao notificateDao) {
        this.searchDao = searchDao;
        this.userService = userService;
        this.questionService = questionService;
        this.userHelperService = userHelperService;
        this.notificateDao = notificateDao;
    }

    /**
     * 全局搜索，三种类型：问题，回答，话题名称
     *
     * @param type
     * @param keyword
     * @param model
     * @param request
     * @return
     */
    public String globalSearch(String type, String keyword, Integer pageNo, Model model, HttpServletRequest request) {

        int pageSize = 20;
        if ("question".equals(type)) {
            this.getCommonData(request, keyword, model);
            List<Question> searchQuestionList = searchDao.globalSearchQuestion(keyword, (pageNo - 1) * pageSize);
            for (Question question : searchQuestionList) {
                question.setUser(userService.getUserByUserId(question.getUserId()));
            }
            Integer searchQuestionTotal = searchDao.getSearchQuestionTotal(keyword);
            Page<Question> page = new Page<>(pageNo, pageSize, searchQuestionTotal, searchQuestionList);
            model.addAttribute("page", page);
            return "search/search-question";
        } else if ("user".equals(type)) {
            this.getCommonData(request, keyword, model);
            List<User> searchUserList = searchDao.globalSearchUser(keyword, (pageNo - 1) * pageSize);
            Integer searchUserTotal = searchDao.getSearchUserTotal(keyword);
            Page<User> page = new Page<>(pageNo, pageSize, searchUserTotal, searchUserList);
            model.addAttribute("page", page);

            return "search/search-user";
        } else {
            this.getCommonData(request, keyword, model);
            List<Answer> searchAnswerList = searchDao.globalSearchAnswer(keyword, (pageNo - 1) * pageSize);
            for (Answer answer : searchAnswerList) {
                answer.setUser(userService.getUserByUserId(answer.getAnswerUserId()));
                answer.setQuestion(userService.getQuestionById(answer.getQuestionId()));
            }

            Integer searchAnswerTotal = searchDao.getSearchUserTotal(keyword);
            Page<Answer> page = new Page<>(pageNo, pageSize, searchAnswerTotal, searchAnswerList);
            model.addAttribute("page", page);
            return "search/search-answer";
        }
    }

    /**
     * 获取问题的一些公共信息，包括热点数据
     *
     * @param request
     * @param keyword
     * @param model
     */
    public void getCommonData(HttpServletRequest request, String keyword, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);

        model.addAttribute("isLoginUser", "true");
        model.addAttribute("user", userService.getUserByUserId(localUserId));

        // 这里获取消息未读个数
        Integer unreadMessageCount = notificateDao.getUnreadMessageCount(localUserId);
        model.addAttribute("unreadMessageCount", unreadMessageCount);

        questionService.getCommonHotData(model);

        if (keyword != null) {
            model.addAttribute("keyword", keyword);
        }
    }
}
