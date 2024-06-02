package filter;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import dao.PostList;

@WebFilter("/post/post.jsp")
public class ViewPoint implements Filter {
    @Override
    public void init(FilterConfig config) throws ServletException {
        System.out.println("ViewPoint filter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        if (request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;

            // URL에서 파라미터 가져오기
            String postIdParam = httpRequest.getParameter("postId");
            PostList postlist = new PostList();
            try {
				postlist.increaseView(postIdParam);
				System.out.println("viewpoint + 1 (postId : " + postIdParam +")");
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        // 필터 체인의 다음 필터로 요청과 응답을 전달
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("ViewPoint filter destroyed");
    }
}