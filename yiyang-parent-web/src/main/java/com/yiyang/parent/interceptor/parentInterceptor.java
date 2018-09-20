package com.yiyang.parent.interceptor;

import com.yiyang.common.utils.CookieUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class parentInterceptor implements HandlerInterceptor {
    @Value("${COOKIE_TOKEN_KEY}")
    private String COOKIE_TOKEN_KEY;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
//        String token = CookieUtils.getCookieValue(request, COOKIE_TOKEN_KEY);
//        if (StringUtils.isBlank(token)) {
//            //取当前请求的url
//            String url = request.getRequestURL().toString();
//            // b)没有token，需要跳转到登录页面。
//            response.sendRedirect(SSO_LOGIN_URL + "?redirectUrl=" + url);
//            //拦截
//            return false;
//        }
       return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
