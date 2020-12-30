package com.donate.sys.controller;


import com.donate.common.RestfulApiResponse;
import com.donate.controller.BaseController;
import com.donate.sys.entity.User;
import com.donate.sys.service.IUserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Leo
 * @since 2020-12-30
 */
@RestController
@RequestMapping("/sys/user")
public class UserController extends BaseController {

    @Autowired
    private IUserService userService;

    @PostMapping("/create")
    public Object save(HttpServletRequest request, User user) {
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        userService.save(user);
        request.getSession().setAttribute("userId", user.getUserId());
        return RestfulApiResponse.buildSuccessResponse(null);
    }
}
