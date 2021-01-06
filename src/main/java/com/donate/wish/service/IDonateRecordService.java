package com.donate.wish.service;

import com.donate.wish.entity.DonateRecord;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Leo
 * @since 2021-01-06
 */
public interface IDonateRecordService extends IService<DonateRecord> {
    BigDecimal getWishAmountSum(Long wishId);
}
