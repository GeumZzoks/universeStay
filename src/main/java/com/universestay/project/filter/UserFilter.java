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
@WebFilter(filterName = "UserFilter", urlPatterns = {"/user/myPage/*"})
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
        // TODO: 삭제 예정
//        System.out.println("Filter - request.getHeader(\"referer\") = " + request.getHeader(
//                "referer")); // http://localhost:8080/
//        System.out.println("Filter - request.getRequestURL() = "
//                + request.getRequestURL()); // http://localhost:8080/board/list
//        System.out.println("Filter - request.getRequestURI() = "
//                + request.getRequestURI()); // /board/board1.jsp(컨텍스트 패스추가)
//        System.out.println(
//                "Filter - request.getServletPath() = " + request.getServletPath()); // /board1.jsp
//        System.out.println();

        boolean isNotLogin = (session == null || session.getAttribute("user_email") == null);
        if (isNotLogin) {
            session.setAttribute("URL", request.getRequestURI());
            response.sendRedirect("/");
        } else {
            filterChain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
