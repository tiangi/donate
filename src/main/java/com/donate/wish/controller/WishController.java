package com.donate.wish.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.donate.common.RestfulApiResponse;
import com.donate.controller.BaseController;
import com.donate.wish.entity.Wish;
import com.donate.wish.service.IWishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Leo
 * @since 2020-12-30
 */
@Controller
@RequestMapping("/wish")
public class WishController extends BaseController {
    @Autowired
    private IWishService wishService;

    @GetMapping("/mine")
    public String getMyWish(HttpServletRequest request, Model model) {
        String userId = getLogonUserId(request);
        Wish wish = new Wish();
        wish.setUserId(userId);
        List<Wish> list = wishService.list(new QueryWrapper<>(wish).orderByDesc("create_time"));
        model.addAttribute("wishes", list);
        model.addAttribute("user", getLogonUser(request));
        return "my_wish";
    }

    @GetMapping("/make")
    public String makeWish(HttpServletRequest request, Model model) {
        model.addAttribute("user", getLogonUser(request));
        return "make_wish";
    }

    @ResponseBody
    @PostMapping("/create")
    public Object save(HttpServletRequest request, Model model, Wish wish) {
        wishService.save(wish);
        return RestfulApiResponse.buildSuccessResponse(null);
    }

    @GetMapping("/detail")
    public String getWish(HttpServletRequest request, Model model, String id) {
        model.addAttribute("user", getLogonUser(request));
        Wish wish = wishService.getById(id);
        model.addAttribute("wish", wish);
        return "wish_detail";
    }


}
