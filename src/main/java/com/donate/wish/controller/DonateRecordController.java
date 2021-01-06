package com.donate.wish.controller;


import com.donate.common.RestfulApiResponse;
import com.donate.controller.BaseController;
import com.donate.wish.entity.DonateRecord;
import com.donate.wish.entity.Wish;
import com.donate.wish.service.IDonateRecordService;
import com.donate.wish.service.IWishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Leo
 * @since 2021-01-06
 */
@Controller
@RequestMapping("/donate")
public class DonateRecordController extends BaseController {

    @Autowired
    private IDonateRecordService donateRecordService;
    @Autowired
    private IWishService wishService;

    @GetMapping("/go")
    public String goDonate(Long wishId, Model model){
        Wish wish = wishService.getById(wishId);
        model.addAttribute("wish", wish);
        BigDecimal sum = donateRecordService.getWishAmountSum(wishId);
        if (sum == null) {
            sum = new BigDecimal(0);
        }
        model.addAttribute("leftMoney", (wish.getGiftPrice().subtract(sum)));
        return "donate";
    }

    @ResponseBody
    @PostMapping("/add")
    public Object donate(HttpServletRequest request, Model model, DonateRecord record) {
        record.setCreateTime(LocalDateTime.now());
        donateRecordService.save(record);
        return RestfulApiResponse.buildSuccessResponse(null);
    }
}
