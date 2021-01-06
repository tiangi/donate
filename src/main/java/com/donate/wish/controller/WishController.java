package com.donate.wish.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.donate.common.RestfulApiResponse;
import com.donate.controller.BaseController;
import com.donate.sys.entity.User;
import com.donate.wish.entity.DonateRecord;
import com.donate.wish.entity.Wish;
import com.donate.wish.service.IDonateRecordService;
import com.donate.wish.service.IWishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private IDonateRecordService donateRecordService;

    @GetMapping("/mine")
    public String getMyWish(HttpServletRequest request, Model model) {
        String userId = getLogonUserId(request);
        Wish wish = new Wish();
        wish.setUserId(userId);
        List<Wish> list = wishService.list(new QueryWrapper<>(wish).orderByDesc("create_time"));
        model.addAttribute("wishes", list);
        model.addAttribute("user", getLogonUser(request));
        Map<String, String> category_map = new HashMap<>();
        category_map.put("1", "生日");
        category_map.put("2", "节日");
        category_map.put("3", "纪念日");
        category_map.put("4", "重要的人");
        category_map.put("5", "其他");
        model.addAttribute("categoryMap", category_map);
        return "my_wish";
    }

    @GetMapping("/make")
    public String makeWish(HttpServletRequest request, Model model, Long id) {
        if (id != null) {
            model.addAttribute("wish", wishService.getById(id));
        }
        model.addAttribute("user", getLogonUser(request));
        return "make_wish";
    }

    @ResponseBody
    @PostMapping("/create")
    public Object save(HttpServletRequest request, Model model, Wish wish) {
        wish.setCreateTime(LocalDateTime.now());
        wishService.saveOrUpdate(wish);
        return RestfulApiResponse.buildSuccessResponse(null);
    }

    @GetMapping("/detail")
    public String getWish(HttpServletRequest request, Model model, Long id) {
        User user = getLogonUser(request);
        model.addAttribute("user", user);
        Wish wish = wishService.getById(id);
        model.addAttribute("wish", wish);

        DonateRecord record = new DonateRecord();
        record.setWishId(id);
        QueryWrapper wrapper = new QueryWrapper(record);
        wrapper.orderByDesc("create_time");
        List<DonateRecord> records =donateRecordService.list(wrapper);
        model.addAttribute("records", records);

        Map<String, String> categoryMap = new HashMap<>();
        categoryMap.put("1", "生日");
        categoryMap.put("2", "节日");
        categoryMap.put("3", "纪念日");
        categoryMap.put("4", "重要的人");
        categoryMap.put("5", "其他");
        model.addAttribute("categoryMap", categoryMap);

        Map<String, String> relationMap = new HashMap<>();
        relationMap.put("1", "朋友");
        relationMap.put("2", "家人");
        relationMap.put("3", "重要的人");
        relationMap.put("4", "素人");
        relationMap.put("5", "其他");
        model.addAttribute("relationMap", relationMap);

        //判断是否仍然需要捐赠
        BigDecimal sum = donateRecordService.getWishAmountSum(id);
        if (sum == null) {
            sum = BigDecimal.ZERO;
        }
        if (wish.getGiftPrice().subtract(sum).doubleValue() <=0 || (user!=null && user.getUserId().equals(wish.getUserId()))) {
            model.addAttribute("showDonateBut", false);
        } else {
            model.addAttribute("showDonateBut", true);
        }
        model.addAttribute("left", wish.getGiftPrice().subtract(sum));
        model.addAttribute("sum", sum);
        model.addAttribute("progress", sum.divide(wish.getGiftPrice(), 4).multiply(BigDecimal.valueOf(100)));
        return "wish_detail";
    }

}
