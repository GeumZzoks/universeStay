package com.universestay.project.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// TODO : 이후 화면 만들어질때 urlPatterns 추가 필요 (유저 접근 권한 필요한 곳들 경로 통일 필요 Ex. "/user/myPage/info")
@WebFilter(filterName = "UserFilter", urlPatterns = {"/user/myPage/*", "/room/book/*"})
public class UserFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        // 세션이 없거나 조회 되지 않는다면
        boolean isNotLogin = (session == null || session.getAttribute("user_email") == null);
        if (isNotLogin) {
            session.setAttribute("URL", request.getRequestURI());

            respone.sendRedirect("/user/loginForm");
          
        } else {
            filterChain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
