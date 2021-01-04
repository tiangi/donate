package com.donate.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.donate.sys.entity.User;
import com.donate.sys.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *
 * </p>
 *
 * @author lei.zang
 * @date 2020-12-30 15:16
 */
public class BaseController {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    protected IUserService userService;

    protected User getLogonUser(HttpServletRequest request) {
        String userId = (String) request.getSession().getAttribute("userId");
        if (userId != null) {
            User user = new User();
            user.setUserId(userId);
            return userService.getOne(new QueryWrapper(user));
        }
        return null;
    }

    protected String getLogonUserId(HttpServletRequest request) {
        return (String) request.getSession().getAttribute("userId");
    }

}
