package com.donate;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.donate.entity.PageConf;
import com.donate.mappper.PageConfMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class DemoApplicationTests {

    @Autowired
    private PageConfMapper confMapper;

    @Test
    void testPageConfMapper() {
        PageConf pageConf = new PageConf();
        List<PageConf> list = confMapper.selectList(new QueryWrapper<>(pageConf));
        System.out.println(list.size());
        list.stream().forEach(p -> System.out.println(p));
    }

}
