package com.donate.wish.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDate;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author Leo
 * @since 2020-12-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("t_wish")
public class Wish implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    @TableField("user_Id")
    private String userId;

    private String giftName;

    private BigDecimal giftPrice;

    private String giftDesc;

    private String giftPicture;

    private String giftUrl;

    private String reason;

    /**
     * 1:生日，2:节日，3:纪念日，4:重要的人，5：其他
     */
    private String category;

    private LocalDateTime createTime;

    /**
     * 实现时间
     */
    private LocalDate endDate;


}
