package com.yiyang.parent.controller;

import com.yiyang.common.utils.PictureResult;
import com.yiyang.pojo.TParent;
import com.yiyang.pojo.TUserInfo;
import com.yiyang.service.parent.ParentService;
import com.yiyang.service.parent.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
@Controller
public class PictureController {
    @Autowired
    private PictureService pictureService;
    @Autowired
    private ParentService parentService;
    @RequestMapping("/parent/upload")
    @ResponseBody()
    public PictureResult uploda(MultipartFile uploadFile){
        try {
            byte[] bytes = uploadFile.getBytes();
            String name = uploadFile.getOriginalFilename();
            PictureResult pictureResult = pictureService.uploadFile(bytes,name);
            TUserInfo tUserInfo=new TUserInfo();
            tUserInfo.setInfoUser("szszwjk");
            tUserInfo.setInfoImg(pictureResult.getUrl());
            parentService.updateImg(tUserInfo);
            return pictureResult;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
