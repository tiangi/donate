package com.donate.wish.service.impl;

import com.donate.wish.entity.DonateRecord;
import com.donate.wish.mapper.DonateRecordMapper;
import com.donate.wish.service.IDonateRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Leo
 * @since 2021-01-06
 */
@Service
public class DonateRecordServiceImpl extends ServiceImpl<DonateRecordMapper, DonateRecord> implements IDonateRecordService {

    @Override
    public BigDecimal getWishAmountSum(Long wishId) {
        return getBaseMapper().queryDonateAmountSum(wishId);
    }
}
