package com.donate.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author Leo
 * @date 2020-11-17 16:37
 */
@Data
@ToString
@TableName(value = "t_bc_pageconf")
public class PageConf {

    /**
     * 页面显示配置记录ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long pageConfId;

    /**
     * 页面（1预约提货情况统计）
     */
    private Long pageName;

    /**
     * 配置人ID
     */
    private String confUserId;

    /**
     * 配置人名称
     */
    private String confUserName;

    /**
     * 配置人时间
     */
    private Date confDate;

}

