package com.donate.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.donate.common.RestfulApiResponse;
import com.donate.sys.entity.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 *
 * </p>
 *
 * @author lei.zang
 * @date 2020-12-29 16:18
 */
@Controller
public class HomeController extends BaseController {

    @GetMapping("/index")
    public String home(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("user", getLogonUser(request));
        return "index";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/logon")
    @ResponseBody
    public Object logon(HttpServletRequest request,String userId, String password) {
        User user = new User();
        user.setUserId(userId);
        user.setPassword(DigestUtils.md5Hex(password));
        user = userService.getOne(new QueryWrapper<>(user));
        if (user != null) {
            request.getSession().setAttribute("userId", userId);
            return RestfulApiResponse.buildSuccessResponse(null);
        }
        return RestfulApiResponse.buildFailResponse("-1", "登录失败。");
    }

    @GetMapping("/logon_page")
    public String goLogon(){
        return "logon";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("userID");
        return "index";
    }
}