package org.handsome.base;

import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;

public class BaseService {

    @Resource //自动注入sqlSessionTemplate
    public SqlSessionTemplate sqlSessionTemplate;
}

