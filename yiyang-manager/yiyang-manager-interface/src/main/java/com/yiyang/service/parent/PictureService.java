package com.yiyang.service.parent;

import com.yiyang.common.utils.PictureResult;

public interface PictureService {
    public PictureResult uploadFile(byte[] bytes, String name);
}
