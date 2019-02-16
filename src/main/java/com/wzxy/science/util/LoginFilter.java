package com.wzxy.science.util;

import com.wzxy.science.action.BaseAction;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/FilterStation")
public class LoginFilter extends BaseAction implements Filter {
    private FilterConfig filterConfig;
    public LoginFilter() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session=((HttpServletRequest)request).getSession();
        response.setCharacterEncoding("gb2312");
        String password=(String) session.getAttribute("password");
        System.out.println("password"+password);
        String exceptPage = filterConfig.getInitParameter("exceptPage");
        if(null != exceptPage && !"".equals(exceptPage.trim())) {
            String[] exceptPages = exceptPage.split(";");
            for (String except : exceptPages) {
                if(((HttpServletRequest) request).getRequestURI().indexOf(except) != -1) {
                    chain.doFilter(request, response);
                    return;
                }

            }
        }
        if(password==null){
            PrintWriter out=response.getWriter();
            out.print("<script>alert('请登录！');location.href='../weixin/MemberLogin.jsp'</script>");

        }
        else{
// pass the request along the filter chain
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
