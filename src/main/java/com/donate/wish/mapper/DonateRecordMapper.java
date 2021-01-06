package com.donate.wish.mapper;

import com.donate.wish.entity.DonateRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.math.BigDecimal;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Leo
 * @since 2021-01-06
 */
public interface DonateRecordMapper extends BaseMapper<DonateRecord> {

    BigDecimal queryDonateAmountSum(Long wishId);
}
