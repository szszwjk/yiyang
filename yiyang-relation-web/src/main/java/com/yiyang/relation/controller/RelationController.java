package com.yiyang.relation.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;
import com.yiyang.service.parent.ParentService;
import com.yiyang.service.relation.RelationService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class RelationController {
    @Autowired
    private RelationService relationService;
    @Autowired
    private ParentService parentService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/")
    public String relationIndex(Model model, HttpServletRequest request)

    {
        setAuthorityAndUsername(model,request);
        List<TCommunity> community = parentService.getCommunity();
        TRelative result = relationService.getRelativeInfo("szszwjkqr");
        model.addAttribute("item",result);
        model.addAttribute("item1",JsonUtils.objectToJson(result));
        model.addAttribute("list", JsonUtils.objectToJson(community));
        return "relationindex";
    }
    @RequestMapping("/relation/parentcustody")
    public String parentcustody(Model model, HttpServletRequest request)

    {
        setAuthorityAndUsername(model,request);
        return "parentcustody";
    }
    @RequestMapping("/relation/locationmap")
    public String locationmap(Model model, HttpServletRequest request)

    {
        setAuthorityAndUsername(model,request);
        return "locationmap";
    }
    @RequestMapping("/relation/saverelationinfo")
    @ResponseBody
    public YiyangResult getRelativeInfo(TRelative tRelative)
    {
        System.out.println(tRelative);
        tRelative.setrUser("szszwjkqr");
        tRelative.gettUserInfo().setInfoUser("szszwjkqr");
        YiyangResult yiyangResult = relationService.updateRelativeInfo(tRelative);
        return yiyangResult;
    }
    @RequestMapping("/relation/getparentinfo")
    @ResponseBody
    public YiyangPageResult getParentinfo(Integer page, Integer rows, TUserInfo tUserInfo)
    {
        tUserInfo.setInfoUser("szszwjkqr");
        YiyangPageResult result = relationService.getParentInfo(page, rows, tUserInfo);
        return result;
    }
    @RequestMapping("/relation/addrelation")
    @ResponseBody
    public YiyangResult addRelation(RelationParentKey relationParentKey)
    {
        relationParentKey.setrUser("szszwjkqr");
        System.out.println(relationParentKey.getrUser());
        YiyangResult yiyangResult = relationService.addRelationParentKey(relationParentKey);
        return yiyangResult;
    }
    @RequestMapping("/relation/parentinfo")
    public String parentInfo(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        List<ParentInfo> list = relationService.getParentInfo("szszwjkqr");
        model.addAttribute("list",list);
        model.addAttribute("listjson",JsonUtils.objectToJson(list));
        return "parentinfo";
    }
    @RequestMapping("/relation/preremind")
    @ResponseBody
    public YiyangPageResult getPreremind(Integer page, Integer rows, TUserInfo tUserInfo)
    {
        tUserInfo.setInfoUser("szszwjkqr");
        YiyangPageResult result = relationService.getAllUserParentInfo(page, rows, tUserInfo);

        return result;
    }
    @RequestMapping("/relation/getlocation")
    @ResponseBody
    public String getlocation(RelationParentKey relationParentKey)
    {
        relationParentKey.setrUser("szszwjkqr");
        List<TLocalinfo> location = relationService.getLocation(relationParentKey);
        if(location.size()!=0)
        {
            String str="";
            for (int i=0;i<location.size();i++)
            {
                str+=location.get(i).getlLocalx()+","+location.get(i).getlLocaly()+",";
            }

            str = str.substring(0,str.length() - 1);
            System.out.println(str);
            return str;
        }
        return "";
    }
    @RequestMapping("/relation/getsuggest")
    @ResponseBody
    public YiyangPageResult getSuggest(Integer page, Integer rows,TDsuggest tDsuggest)
    {
        tDsuggest.setDsDuser("szszwjkqr");
        YiyangPageResult suggest = relationService.getSuggest(page, rows, tDsuggest);
        return suggest;
    }
    public void setAuthorityAndUsername(Model model, HttpServletRequest request)
    {
        String cookie_token_key = CookieUtils.getCookieValue(request, "COOKIE_TOKEN_KEY");
        String json = jedisClient.get("USER_INFO" + ":" + cookie_token_key);
        TUser tUser = JsonUtils.jsonToPojo(json, TUser.class);
        List<UserAuthorityKey> list = adminService.getUserAuthorityKeyByUser(tUser.getUsername());
        model.addAttribute("username",tUser.getUsername());
        model.addAttribute("authorityjson",JsonUtils.objectToJson(list));
    }

}
