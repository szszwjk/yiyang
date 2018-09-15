package com.yiyang.service.parent;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.pojo.TPreservice;
import com.yiyang.pojo.TServiceitem;

import java.util.List;

public interface ParentService {
    public YiyangPageResult getTserviceItem(int page, int rows);
}
