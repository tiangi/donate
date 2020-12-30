package com.donate.wish.service.impl;

import com.donate.wish.entity.Wish;
import com.donate.wish.mapper.WishMapper;
import com.donate.wish.service.IWishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Leo
 * @since 2020-12-30
 */
@Service
public class WishServiceImpl extends ServiceImpl<WishMapper, Wish> implements IWishService {

}
