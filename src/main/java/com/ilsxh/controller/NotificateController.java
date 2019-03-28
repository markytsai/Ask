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
import java.util.Optional;

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
    public String userNotification(HttpServletRequest request, Model model,
                                   @RequestParam(value = "periodNo", defaultValue = "0") Integer periodNo,
                                   @RequestParam(value = "type", defaultValue = "0") Integer type) {
        String userId = userHelperService.getUserIdFromRedis(request);
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);

        // 首先要获取所有message的数量
        int totalMessageNum = notificateService.getTotalMessagNum(userId, 2, type);
        model.addAttribute("hiddenTotalCount", totalMessageNum);

        List<Day> dayList = notificateService.getNotifications(userId, periodNo, 2, type);
        int totalCount = 0;
        for (Day day : dayList) {
            totalCount += day.getTotalCountInDay();
        }
        model.addAttribute("hiddenCurrCount", totalCount);
        model.addAttribute("dayList", dayList);

        model.addAttribute("type", "2-" + type);

        return "notification/user-notification";
    }

    /**
     * @param request
     * @param model
     * @param periodNo
     * @param type     消息类型，默认为0，表示所有类型的消息；1. 问题 2.回答  3.评论 4.关注 5.点赞
     * @return sdf
     */
    @RequestMapping("/notification/sys")
    public String sysNotification(HttpServletRequest request, Model model,
                                  @RequestParam(value = "periodNo", defaultValue = "0") Integer periodNo,
                                  @RequestParam(value = "type", defaultValue = "0") Integer type) {
        String userId = userHelperService.getUserIdFromRedis(request);
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);

        // 首先要获取所有message的数量
        int totalMessageNum = notificateService.getTotalMessagNum(userId, 1, type);
        model.addAttribute("hiddenTotalCount", totalMessageNum);

        List<Day> dayList = notificateService.getNotifications(userId, periodNo, 1, type);

        int totalCount = 0;
        for (Day day : dayList) {
            totalCount += day.getTotalCountInDay();
        }
        model.addAttribute("hiddenCurrCount", totalCount);

        model.addAttribute("dayList", dayList);
        model.addAttribute("type", "1-" + type);
        return "notification/sys-notification";
    }

    @RequestMapping(value = "/loadMore", method = RequestMethod.GET)
    @ResponseBody
    public BaseResponse loadSysMore(HttpServletRequest request, Model model,
                                    @RequestParam(value = "periodNo") Integer periodNo,
                                    @RequestParam(value = "type") Integer type,
                                    @RequestParam(value = "mode") Integer mode) {
        String userId = userHelperService.getUserIdFromRedis(request);
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);

        List<Day> dayList = notificateService.getNotifications(userId, periodNo, mode, type);
        int totalCount = 0;
        for (Day day : dayList) {
            totalCount += day.getTotalCountInDay();
        }
        model.addAttribute("hiddenCurrCount", totalCount);

        return new BaseResponse("1", totalCount + "", dayList);
    }
}
