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
import org.springframework.util.PatternMatchUtils;

@WebFilter(filterName = "AdminFilter", urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    private static final String[] whitelist = {};
//    private static final String[] whitelist = {"/admin/user/*", "/admin/inquiry/*"};

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
        String requestURI = request.getRequestURI();

        if (!isLoginCheckPath(requestURI)) {
            filterChain.doFilter(request, response);
        } else {
            boolean isNotLogin = (session == null || session.getAttribute("admin_email") == null);
            if (isNotLogin) {
                session.setAttribute("URL", request.getRequestURI());
                response.sendRedirect("/adminLogin/loginForm");
            } else {
                filterChain.doFilter(request, response);
            }
        }
    }

    private boolean isLoginCheckPath(String requestURI) {
        return !PatternMatchUtils.simpleMatch(whitelist, requestURI);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
