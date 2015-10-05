package servlets;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by elyor on 10/6/2015.
 */
public class BaseFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
    }

    @Override
    public void destroy() {
    }

}
