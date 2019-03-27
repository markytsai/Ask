package com.ilsxh.controller;

import com.ilsxh.entity.Day;
import com.ilsxh.entity.Message;
import com.ilsxh.entity.User;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.NotificateService;
import com.ilsxh.service.UserHelperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Tsaizhenya
 */
@Controller
public class NotificateController {

    @Autowired
    private UserHelperService userHelperService;

    @Autowired
    private NotificateService notificateService;

    @RequestMapping("/notification/user")
    public String userNotification(HttpServletRequest request, @RequestParam(value = "periodNo", defaultValue = "0") Integer periodNo, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);
        List<Day> dayList = notificateService.getNotifications(userId, periodNo, 2);
        model.addAttribute("dayList", dayList);

        return "notification/user-notification";
    }

    @RequestMapping("/notification/sys")
    public String sysNotification(HttpServletRequest request, @RequestParam(value = "periodNo", defaultValue = "0") Integer periodNo, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);

        List<Day> dayList = notificateService.getNotifications(userId, periodNo, 1);
        model.addAttribute("dayList", dayList);

        return "notification/sys-notification";
    }

    @RequestMapping(value = "/loadMore/sys", method = RequestMethod.GET)
    @ResponseBody
    public BaseResponse loadSysMore(HttpServletRequest request, @RequestParam(value = "periodNo") Integer periodNo, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);

        List<Day> dayList = notificateService.getNotifications(userId, periodNo, 1);

        return new BaseResponse("1", "", dayList);
    }
}
