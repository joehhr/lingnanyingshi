package com.controller;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.YonghuEntity;
import com.entity.view.YonghuView;
import com.service.YonghuService;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController//声明这是一个控制器
@RequestMapping("/myTest")//声明这个控制访问的路径
public class MyTestController {
    @Autowired
    private YonghuService yonghuService;

    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R a(){
        //返回一个泛型 只要是包装类都行
        EntityWrapper<YonghuEntity> ew = new EntityWrapper<YonghuEntity>();
        //查询的工具类 利用此工具类 可以进行很多的条件搜索 和复杂的连表查询

        //return yonghuService.selectListView(ew);
        //调用服务类yonghuService的一个方法selectListView(ew)
        //查询所有的数据 并对数据进行返回

        return R.ok().put("data", yonghuService.selectListView(ew));
        //无参构造方法 code状态码 默认传 0; code:0 的返回包装类
        //再put一个data来自数据库传出来的值
    }
}
