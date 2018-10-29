package com.yiyang.parent.interceptor;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.TAuthority;
import com.yiyang.pojo.TUser;
import com.yiyang.service.parent.ParentData;
import com.yiyang.service.parent.ParentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class parentInterceptor implements HandlerInterceptor {
    @Value("${COOKIE_TOKEN_KEY}")
    private String COOKIE_TOKEN_KEY;
    @Autowired
    private ParentData parentData;
    @Autowired
    private JedisClient jedisClient;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        boolean flag=false;
        String token = CookieUtils.getCookieValue(request, COOKIE_TOKEN_KEY);
        if (StringUtils.isBlank(token)) {
            //取当前请求的url
//            String url = request.getRequestURL().toString();
            // b)没有token，需要跳转到登录页面。
            response.sendRedirect("http://localhost:8088/");
            //拦截
            return flag;
        }
        else {
            String json = jedisClient.get("USER_INFO" + ":" + token);
            TUser tUser = JsonUtils.jsonToPojo(json, TUser.class);
            StringBuffer url = request.getRequestURL();
            String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
            List<TAuthority> list = parentData.getAuthorityByUser(tUser.getUsername());
            for (TAuthority tAuthority:list) {
                if(tAuthority.getAuthorityCon().equals(tempContextUrl))
                {
                    flag=true;
                }
            }
        }

        return flag;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
