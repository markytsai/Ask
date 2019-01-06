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

    @Autowired
    private SearchDao searchDao;

    @Autowired
    private UserService userService;

    @Autowired
    private HotService hotService;

    public List<Question> globalSearchQuestion(String queryKeyWord) {
        return searchDao.globalSearchQuestion(queryKeyWord);
    }

    public List<User> globalSearchUser(String queryKeyWord) {
        return searchDao.globalSearchUser(queryKeyWord);
    }


    public List<Answer> globalSearchAnswer(String queryKeyWord) {
        return searchDao.globalSearchAnswer(queryKeyWord);
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
