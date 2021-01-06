package com.donate.wish.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author Leo
 * @since 2021-01-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("t_donate_record")
public class DonateRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private Long wishId;

    /**
     * 与许愿人关系
     */
    private String relationship;

    /**
     * 捐赠者姓名
     */
    private String name;

    /**
     * 金额
     */
    private Double amount;

    private LocalDateTime createTime;


}
